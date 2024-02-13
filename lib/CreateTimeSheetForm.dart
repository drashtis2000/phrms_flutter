import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class DailyTimeSheet {
  final String date;
  String? hoursWorked;

  DailyTimeSheet({
    required this.date,
    this.hoursWorked,
  });
}

class CreateTimeSheetForm extends StatefulWidget {
  static const String id = "CreateTimeSheetForm";

  final Function(List<Map<String, dynamic>>, dynamic) onNewTimeSheetData;
  final Function(DateTime) onDeleteTimeSheetData;
  final String selectedWeek;
  final DateTime selectedDate;// Add selectedDate parameter
  final List<String> statusOptions = ['Pending', 'Approved', 'Rejected'];
  CreateTimeSheetForm({
    required this.onNewTimeSheetData,
    required this.onDeleteTimeSheetData,
    required this.selectedWeek,
    required this.selectedDate, // Initialize it in the constructor
    required List<Map<String, dynamic>> timeSheetData,
  });
  @override
  _CreateTimeSheetFormState createState() => _CreateTimeSheetFormState();
}

class _CreateTimeSheetFormState extends State<CreateTimeSheetForm> {
  final TextEditingController placementController = TextEditingController();
  final TextEditingController selectedDateRangeController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  String? placementError;
  String? commentError;
  DateTime _defaultStartDate = DateTime.now();
  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  String selectedStatus = 'Pending';

  List<Map<String, dynamic>> dailyTimeSheetData = [];

  List<Map<String, dynamic>> newData = [];

  @override
  void initState() {
    super.initState();
    _defaultStartDate = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    _selectedStartDate = _defaultStartDate;
    _selectedEndDate = _defaultStartDate.add(Duration(days: 6));
    selectedDateRangeController.text = _formatDateRange(_selectedStartDate!, _selectedEndDate!);
    selectedStatus = 'Pending';
  }

  String _formatDateRange(DateTime startDate, DateTime endDate) {
    return DateFormat('MM/dd/yyyy').format(startDate) + ' to ' + DateFormat('MM/dd/yyyy').format(endDate);
  }

  Future<void> openDateRangePicker() async {
    final DateTime monday = _focusedDay.subtract(Duration(days: _focusedDay.weekday - 1));
    final DateTime sunday = monday.add(Duration(days: 6));
    final DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialDateRange: DateTimeRange(start: monday, end: sunday),
    );

    if (pickedDateRange != null) {
      final String formattedStartDate = DateFormat('MM/dd/yyyy').format(pickedDateRange.start);
      final String formattedEndDate = DateFormat('MM/dd/yyyy').format(pickedDateRange.end);
      final String dateRange = '$formattedStartDate to $formattedEndDate';

      selectedDateRangeController.text = dateRange;

      setState(() {
        _selectedStartDate = pickedDateRange.start;
        _selectedEndDate = pickedDateRange.end;
        _focusedDay = pickedDateRange.start;
        _calendarFormat = CalendarFormat.week;
      });
    }
  }

  Future<void> _saveTimeSheetToFirestore() async {
    // Step 1: Get User Inputs
    final String placement = placementController.text;
    final String comment = commentController.text;

    // Step 2: Generate Date Range
    final List<DateTime> dateRange = [];
    DateTime currentDate = _selectedStartDate!;
    while (currentDate.isBefore(_selectedEndDate!.add(Duration(days: 1)))) {
      dateRange.add(currentDate);
      currentDate = currentDate.add(Duration(days: 1));
    }

    // Step 3: Calculate weekStartDate
    final DateTime weekStartDate = _selectedStartDate!.subtract(Duration(days: _selectedStartDate!.weekday - 1));

    // Step 4: Check if a time sheet with the same weekStartDate exists in Firestore
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('timesheets')
        .where('weekStartDate', isEqualTo: DateFormat('MM/dd/yyyy').format(weekStartDate))
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Step 5: Update the existing time sheet entry
      final DocumentSnapshot docSnapshot = querySnapshot.docs.first;
      final Map<String, dynamic> existingData = docSnapshot.data() as Map<String, dynamic>;

      // Update placement, comment, or any other fields as needed
      existingData['placement'] = placement;
      existingData['comment'] = comment;

      // Update dailyTimeSheets for the specific date range
      dateRange.forEach((date) {
        final String formattedDate = DateFormat('MM/dd/yyyy').format(date);
        existingData['dailyTimeSheets'][formattedDate] = {
          'date': formattedDate,
          'hoursWorked': '', // You can set this to an empty string initially
        };
      });

      try {
        await docSnapshot.reference.update(existingData);
        print('Time sheet entry updated successfully');
      } catch (e) {
        print('Error updating time sheet entry: $e');
      }
    } else {
      // Step 6: Create a new time sheet entry
      final Map<String, dynamic> newTimeSheet = {
        'placement': placement,
        'comment': comment,
        'startDate': DateFormat('MM/dd/yyyy').format(_selectedStartDate!),
        'endDate': DateFormat('MM/dd/yyyy').format(_selectedEndDate!),
        'status': 'Pending',
        'weekStartDate': DateFormat('MM/dd/yyyy').format(weekStartDate),
        'dailyTimeSheets': {},
      };

      // Create dailyTimeSheets entries for the specific date range
      dateRange.forEach((date) {
        final String formattedDate = DateFormat('MM/dd/yyyy').format(date);
        String defaultHours = '00:00';
        if (date.weekday >= DateTime.monday && date.weekday <= DateTime.friday) {
          defaultHours = '08:00'; // Default to 08:00 for Mon to Fri
        }
        newTimeSheet['dailyTimeSheets'][formattedDate] = {
          'date': formattedDate,
          'hoursWorked': '08:00', // You can set this to an empty string initially
        };
      });

      try {
        await FirebaseFirestore.instance.collection('timesheets').add(newTimeSheet);
        print('New time sheet entry created successfully');
      } catch (e) {
        print('Error creating new time sheet entry: $e');
      }
    }
    // Step 7: Update State
    // You can update the state as needed to reflect the changes.

    // Optionally, you can return the new data to the parent widget
    DateTime selectedDate = _selectedStartDate ?? DateTime.now();

    final newData = dateRange.map((date) {
      final String formattedDate = DateFormat('MM/dd/yyyy').format(date);
      return {
        'date': formattedDate,
        'hoursWorked': '08:00', // You can set this to an empty string initially
      };
    }).toList();

    // Update the state to reflect the new data
    setState(() {
      this.newData = newData;
    });
    widget.onNewTimeSheetData(newData, selectedDate);

    // Clear the form
    placementController.clear();
    commentController.clear();
    selectedDateRangeController.clear();
  }

  Future<void> showDeleteConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this entry?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteTimeSheetEntry(); // Call the function to delete the entry
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteTimeSheetEntry() async {
    // Replace 'timesheets' with your Firestore collection name
    final collectionName = 'timesheets';
    final weekStartDate = DateFormat('MM/dd/yyyy').format(_selectedStartDate!);

    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(weekStartDate) // Specify the document ID for the week you want to delete
          .delete();

      // Handle the deletion of the entry and update the UI or state as needed

      // Notify the parent widget that the entry has been deleted
      widget.onDeleteTimeSheetData(_selectedStartDate!);

      // Clear the form
      placementController.clear();
      commentController.clear();
      selectedDateRangeController.clear();

      print('Time sheet entry deleted successfully');
    } catch (e) {
      print('Error deleting time sheet entry: $e');
    }
  }


  void clearErrors() {
    setState(() {
      placementError = null;
    });
  }

  bool validateForm() {
    bool isValid = true;
    if (placementController.text.isEmpty) {
      setState(() {
        placementError = 'Placement is required';
      });
      isValid = false;
    }
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          children: [
            Image.asset(
              'assets/images/microsoftteamsimage.png',
              width: 40,
            ),
            SizedBox(width: 10),
            Text("Create Time Sheet"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: placementController,
                decoration: InputDecoration(labelText: 'Placement'),
                onChanged: (_) => clearErrors(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Placement is required';
                  }
                  return null;
                },
              ),
              if (placementError != null)
                Text(
                  placementError!,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 16.0),
              Text(
                'Select Dates',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Status'),
                value: selectedStatus, // Create a String variable for selectedStatus
                items: widget.statusOptions.map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value!; // Update the selectedStatus variable
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  openDateRangePicker();
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedDateRangeController.text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TableCalendar(
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2101, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return _selectedStartDate != null &&
                      _selectedEndDate != null &&
                      day.isAfter(_selectedStartDate!.subtract(Duration(days: 1))) &&
                      day.isBefore(_selectedEndDate!.add(Duration(days: 1)));
                },
                onDaySelected: (selectedDate, focusedDate) {
                  setState(() {
                    _focusedDay = focusedDate;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextFormField(
                  controller: commentController,
                  decoration: InputDecoration(
                    hintText: 'Add a comment',
                    contentPadding: EdgeInsets.all(8.0),
                    border: InputBorder.none,
                  ),
                  maxLines: 5,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (validateForm()) {
                    await _saveTimeSheetToFirestore();
                    Navigator.pop(context, {
                      'newData': newData,
                      'selectedWeekStartDate': _selectedStartDate,
                      'selectedWeekEndDate': _selectedEndDate,
                    });
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  showDeleteConfirmationDialog();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Delete'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
