import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'CreateTimeSheetForm.dart'; // Import your CreateTimeSheetForm.dart file
import 'package:intl/intl.dart';

class TimeSheetScreen extends StatefulWidget {
  static const String id = "TimeSheetScreen";

  @override
  _TimeSheetScreenState createState() => _TimeSheetScreenState();
}

class _TimeSheetScreenState extends State<TimeSheetScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedWeek = "";
  Map<String, List<Map<String, dynamic>>> groupedTimeSheetData = {};
  DateTime? selectedDateFromForm;

  TextEditingController monHoursController = TextEditingController(text: '08:00');
  TextEditingController tueHoursController = TextEditingController(text: '08:00');
  TextEditingController wedHoursController = TextEditingController(text: '08:00');
  TextEditingController thuHoursController = TextEditingController(text: '08:00');
  TextEditingController friHoursController = TextEditingController(text: '08:00');
  TextEditingController satHoursController = TextEditingController(text: '00:00');
  TextEditingController sunHoursController = TextEditingController(text: '00:00');

  FocusNode monHoursFocus = FocusNode();
  FocusNode tueHoursFocus = FocusNode();
  FocusNode wedHoursFocus = FocusNode();
  FocusNode thuHoursFocus = FocusNode();
  FocusNode friHoursFocus = FocusNode();
  FocusNode satHoursFocus = FocusNode();
  FocusNode sunHoursFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    fetchData(); // Load data when the widget initializes
    _tabController = TabController(length: 3, vsync: this); // Initialize the TabController with 2 tabs (approved and rejected).

    monHoursController.text = '08:00';
    tueHoursController.text = '08:00';
    wedHoursController.text = '08:00';
    thuHoursController.text = '08:00';
    friHoursController.text = '08:00';
    satHoursController.text = '00:00';
    sunHoursController.text = '00:00';
  }

  void dispose() {
    _tabController.dispose(); // Dispose of the TabController.
    super.dispose();
  }

  void _handleNewTimeSheetData(
      List<Map<String, dynamic>> newData, DateTime selectedDate, String selectedWeek) {
    final weekStartDate = newData.first['weekStartDate'];
    setState(() {
      groupedTimeSheetData[weekStartDate] = newData;
    });

    fetchData();
    Navigator.of(context).pop({
      'newData': newData,
      'selectedWeekStartDate': selectedDate,
      'selectedWeekEndDate': newData.last['weekStartDate'],
    });
  }

  void _handleDeleteTimeSheetData(DateTime selectedDate) {
  final weekStartDate = DateFormat('MM/dd/yyyy').format(selectedDate);
  final timeSheetDataForWeek = groupedTimeSheetData[selectedWeek];

  if (timeSheetDataForWeek != null) {
  // Filter out the entry to delete
  final updatedTimeSheetData = timeSheetDataForWeek
      .where((entry) => entry['startDate'] != weekStartDate)
      .toList();

  // Update Firestore (You need to implement this part)

  // Update the state to reflect the changes
  setState(() {
  groupedTimeSheetData[selectedWeek] = updatedTimeSheetData;
  });
  }
  }


  Future<void> fetchData() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance.collection('timesheets').get();
      final fetchedTimeSheets = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'id': doc.id,
          'startDate': data['startDate'],
          'endDate': data['endDate'],
          'Mon': data['Mon'] ?? '0',
          'Tue': data['Tue'] ?? '0',
          'Wed': data['Wed'] ?? '0',
          'Thu': data['Thu'] ?? '0',
          'Fri': data['Fri'] ?? '0',
          'Sat': data['Sat'] ?? '0',
          'Sun': data['Sun'] ?? '0',
          'Total Hours Per Term': calculateTotalHoursPerTerm(data),
          'weekStartDate': data['weekStartDate'],
        };
      }).toList();

      setState(() {
        groupedTimeSheetData = groupTimeSheetData(fetchedTimeSheets);
      });
    } catch (e) {
      print('Error fetching time sheets: $e');
    }
  }

  int calculateTotalHoursPerTerm(Map<String, dynamic> data) {
    int totalHours = 0;
    totalHours += int.tryParse(data['Mon'] ?? '0') ?? 0;
    totalHours += int.tryParse(data['Tue'] ?? '0') ?? 0;
    totalHours += int.tryParse(data['Wed'] ?? '0') ?? 0;
    totalHours += int.tryParse(data['Thu'] ?? '0') ?? 0;
    totalHours += int.tryParse(data['Fri'] ?? '0') ?? 0;
    return totalHours;
  }

  Map<String, List<Map<String, dynamic>>> groupTimeSheetData(List<Map<String, dynamic>> data) {
    final Map<String, List<Map<String, dynamic>>> groupedData = {};
    for (final timeSheet in data) {
      final weekStartDate = timeSheet['weekStartDate'];
      if (!groupedData.containsKey(weekStartDate)) {
        groupedData[weekStartDate] = [];
      }
      groupedData[weekStartDate]!.add(timeSheet);
    }
    return groupedData;
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
            Text("Time Sheets"),
          ],
        ),
        bottom: TabBar(
          controller: _tabController, // Use the TabController here.
          tabs: [
            Tab(text: 'Approved'), // Create a tab for approved data.
            Tab(text: 'Rejected'), // Create a tab for rejected data.
            Tab(text: 'Submitted'), // Create a tab for submitted data.
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Use the same TabController here.
        children: [
          if (_tabController.index == 0) // Show approved data when the first tab is selected.
            Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('timesheets')
                      .where('status', isEqualTo: 'Approved') // Query for approved time sheets
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator(); // Loading indicator
                    }
                    final approvedTimeSheets = snapshot.data?.docs ?? [];
                    // Display approved time sheets here
                    return ApprovedTimeSheetWidget(approvedTimeSheets); // Create a widget to display approved data
                  },
                ),
              ],
            ),

          // Tab for Rejected Data
          if (_tabController.index == 1) // Show rejected data when the second tab is selected.
            Column(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('timesheets')
                      .where('status', isEqualTo: 'Rejected') // Query for rejected time sheets
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator(); // Loading indicator
                    }
                    final rejectedTimeSheets = snapshot.data?.docs ?? [];
                    // Display rejected time sheets here
                    return RejectedTimeSheetWidget(rejectedTimeSheets); // Create a widget to display rejected data
                  },
                ),
              ],
            ),

          // Tab for Submitted Data
          if (_tabController.index == 2) // Show submitted data when the second tab is selected.
            Column(
              children: [
                // Your UI for displaying submitted time sheet data goes here.
              ],
            ),
          Column(
            children: [
              // Add a dropdown to select the week
              DropdownButton<String>(
                value: selectedDateFromForm != null
                    ? DateFormat('MM/dd/yyyy').format(selectedDateFromForm!)
                    : selectedWeek,
                items: groupedTimeSheetData.keys.map((weekStartDate) {
                  return DropdownMenuItem<String>(
                    value: weekStartDate,
                    child: Text(weekStartDate),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedWeek = newValue ?? "";
                  });
                },
              ),
              if (selectedWeek.isNotEmpty && groupedTimeSheetData[selectedWeek] != null)
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        dataRowHeight: 40,
                        columns: [
                          DataColumn(label: Text('Week')),
                          DataColumn(label: Text('Hours')),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(
                              Text(
                                  'Mon (${DateFormat('MM/dd/yyyy').format(getDateForDayOfWeek(selectedWeek, DateTime.monday))})'),
                            ),
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  // Replace the Text widget with a TextFormField when tapped
                                  setState(() {
                                    FocusScope.of(context).requestFocus(monHoursFocus);
                                    monHoursController.text = '08:00'; // Clear the default value
                                  });
                                },
                                child: TextFormField(
                                  focusNode: monHoursFocus,
                                  controller: monHoursController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '08:00', // Provide a hint for the input format
                                    border: InputBorder.none, // Remove underline
                                  ),
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        monHoursController.text = '08:00';
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(
                              Text(
                                  'Tue (${DateFormat('MM/dd/yyyy').format(getDateForDayOfWeek(selectedWeek, DateTime.tuesday))})'),
                            ),
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  // Replace the Text widget with a TextFormField when tapped
                                  setState(() {
                                    FocusScope.of(context).requestFocus(tueHoursFocus);
                                    tueHoursController.text = '08:00'; // Clear the default value
                                  });
                                },
                                child: TextFormField(
                                  focusNode: tueHoursFocus,
                                  controller: tueHoursController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '08:00', // Provide a hint for the input format
                                    border: InputBorder.none, // Remove underline
                                  ),
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        tueHoursController.text = '08:00';
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(
                              Text(
                                  'Wed (${DateFormat('MM/dd/yyyy').format(getDateForDayOfWeek(selectedWeek, DateTime.wednesday))})'),
                            ),
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  // Replace the Text widget with a TextFormField when tapped
                                  setState(() {
                                    FocusScope.of(context).requestFocus(wedHoursFocus);
                                    wedHoursController.text = '08:00'; // Clear the default value
                                  });
                                },
                                child: TextFormField(
                                  focusNode: wedHoursFocus,
                                  controller: wedHoursController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '08:00', // Provide a hint for the input format
                                    border: InputBorder.none, // Remove underline
                                  ),
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        wedHoursController.text = '08:00';
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(
                              Text(
                                  'Thu (${DateFormat('MM/dd/yyyy').format(getDateForDayOfWeek(selectedWeek, DateTime.thursday))})'),
                            ),
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  // Replace the Text widget with a TextFormField when tapped
                                  setState(() {
                                    FocusScope.of(context).requestFocus(thuHoursFocus);
                                    thuHoursController.text = '08:00'; // Clear the default value
                                  });
                                },
                                child: TextFormField(
                                  focusNode: thuHoursFocus,
                                  controller: thuHoursController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '08:00', // Provide a hint for the input format
                                    border: InputBorder.none, // Remove underline
                                  ),
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        thuHoursController.text = '08:00';
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(
                              Text(
                                  'Fri (${DateFormat('MM/dd/yyyy').format(getDateForDayOfWeek(selectedWeek, DateTime.friday))})'),
                            ),
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  // Replace the Text widget with a TextFormField when tapped
                                  setState(() {
                                    FocusScope.of(context).requestFocus(friHoursFocus);
                                    friHoursController.text = '08:00'; // Clear the default value
                                  });
                                },
                                child: TextFormField(
                                  focusNode: friHoursFocus,
                                  controller: friHoursController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '08:00', // Provide a hint for the input format
                                    border: InputBorder.none, // Remove underline
                                  ),
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        friHoursController.text = '08:00';
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(
                              Text(
                                  'Sat (${DateFormat('MM/dd/yyyy').format(getDateForDayOfWeek(selectedWeek, DateTime.saturday))})'),
                            ),
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  // Replace the Text widget with a TextFormField when tapped
                                  setState(() {
                                    FocusScope.of(context).requestFocus(satHoursFocus);
                                    satHoursController.text = '00:00'; // Clear the default value
                                  });
                                },
                                child: TextFormField(
                                  focusNode: satHoursFocus,
                                  controller: satHoursController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '00:00', // Provide a hint for the input format
                                    border: InputBorder.none, // Remove underline
                                  ),
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        satHoursController.text = '00:00';
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(
                              Text(
                                  'Sun (${DateFormat('MM/dd/yyyy').format(getDateForDayOfWeek(selectedWeek, DateTime.sunday))})'),
                            ),
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  // Replace the Text widget with a TextFormField when tapped
                                  setState(() {
                                    FocusScope.of(context).requestFocus(sunHoursFocus);
                                    sunHoursController.text = '00:00'; // Clear the default value
                                  });
                                },
                                child: TextFormField(
                                  focusNode: sunHoursFocus,
                                  controller: sunHoursController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '00:00', // Provide a hint for the input format
                                    border: InputBorder.none, // Remove underline
                                  ),
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      setState(() {
                                        sunHoursController.text = '00:00';
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('Total Hours Per Term')),
                            DataCell(
                              Text(calculateTotalHoursForWeek(selectedWeek)),
                            ),
                          ]),
                        ],
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTimeSheetData = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateTimeSheetForm(
                onNewTimeSheetData: (newData, selectedDate) {
                  _handleNewTimeSheetData(newData, selectedDate, selectedWeek);
                },
                selectedWeek: selectedWeek,
                selectedDate: DateTime.now(), // Pass the selected date here or replace it with the actual selected date
                timeSheetData: groupedTimeSheetData[selectedWeek] ?? [], onDeleteTimeSheetData: (DateTime ) {  },
              ),
            ),
          );
          if (newTimeSheetData != null) {
            // Handle the new time sheet data returned from the form
            final selectedWeekStartDate = newTimeSheetData['selectedWeekStartDate'];
            final selectedWeekEndDate = newTimeSheetData['selectedWeekEndDate'];
            // Update the selected week start date and end date.
            // Then, you can call fetchData() to update the data for the new week.
            setState(() {
              selectedDateFromForm = selectedWeekStartDate;
            });
            fetchData(); // Call fetchData() to update data for the new week.
          }
          _tabController.animateTo(2);
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }


  DateTime getDateForDayOfWeek(String selectedWeek, int dayOfWeek) {
    final startWeekDate = DateFormat('MM/dd/yyyy').parse(selectedWeek);
    final daysUntilTarget = dayOfWeek - startWeekDate.weekday;
    return startWeekDate.add(Duration(days: daysUntilTarget));
  }

  String calculateTotalHoursForWeekday(String weekStartDate, int dayOfWeek) {
    final timeSheetData = groupedTimeSheetData[weekStartDate];
    if (timeSheetData != null) {
      if (dayOfWeek >= DateTime.monday && dayOfWeek <= DateTime.friday) {
        return '08:00'; // Set 8 hours for Monday to Friday
      } else {
        int totalHours = 0;
        for (final data in timeSheetData) {
          final hours = data[getDayOfWeekString(dayOfWeek)];
          if (hours != null && hours.isNotEmpty) {
            totalHours += int.tryParse(hours) ?? 0;
          }
        }
        return totalHours.toString();
      }
    }
    return '0';
  }

  String calculateTotalHoursForWeek(String weekStartDate) {
    final timeSheetData = groupedTimeSheetData[weekStartDate];
    if (timeSheetData != null) {
      int totalMinutes = 0;
      for (final data in timeSheetData) {
        for (int dayOfWeek = DateTime.monday; dayOfWeek <= DateTime.sunday; dayOfWeek++) {
          final hours = dayOfWeek >= DateTime.monday && dayOfWeek <= DateTime.friday
              ? '08:00' // Set 8 hours for Monday to Friday
              : data[getDayOfWeekString(dayOfWeek)];
          if (hours != null && hours.isNotEmpty) {
            final parts = hours.split(':');
            final hoursInMinutes = int.tryParse(parts[0]) ?? 0;
            final minutes = int.tryParse(parts[1]) ?? 0;
            totalMinutes += (hoursInMinutes * 60) + minutes;
          }
        }
      }
      final hours = totalMinutes ~/ 60; // Calculate total hours (integer division)
      final minutes = totalMinutes % 60; // Calculate remaining minutes
      return '$hours:${minutes.toString().padLeft(2, '0')}'; // Format the total hours as HH:MM
    }
    return '00:00'; // Return 0 hours and 0 minutes by default
  }

  String getDayOfWeekString(int dayOfWeek) {
    switch (dayOfWeek) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      default:
        return '';
    }
  }
}

class ApprovedTimeSheetWidget extends StatelessWidget {
  final List<QueryDocumentSnapshot> approvedTimeSheets;

  ApprovedTimeSheetWidget(this.approvedTimeSheets);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: approvedTimeSheets.length,
        itemBuilder: (context, index) {
          final timeSheet = approvedTimeSheets[index].data() as Map<String, dynamic>;
          return Card(
            child: ListTile(
              title: Text('Week Start Date: ${timeSheet['weekStartDate']}'),
              subtitle: Text('Total Hours: ${calculateTotalHours(timeSheet)}'),
            ),
          );
        },
      ),
    );
  }

  String calculateTotalHours(Map<String, dynamic> timeSheet) {
    int totalHours = 0;
    totalHours += int.tryParse(timeSheet['Mon'] ?? '0') ?? 0;
    totalHours += int.tryParse(timeSheet['Tue'] ?? '0') ?? 0;
    totalHours += int.tryParse(timeSheet['Wed'] ?? '0') ?? 0;
    totalHours += int.tryParse(timeSheet['Thu'] ?? '0') ?? 0;
    totalHours += int.tryParse(timeSheet['Fri'] ?? '0') ?? 0;
    return '$totalHours hours';
  }
}

class RejectedTimeSheetWidget extends StatelessWidget {
  final List<QueryDocumentSnapshot> rejectedTimeSheets;

  RejectedTimeSheetWidget(this.rejectedTimeSheets);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: rejectedTimeSheets.length,
        itemBuilder: (context, index) {
          final timeSheet = rejectedTimeSheets[index].data() as Map<String, dynamic>;
          return Card(
            child: ListTile(
              title: Text('Week Start Date: ${timeSheet['weekStartDate']}'),
              subtitle: Text('Total Hours: ${calculateTotalHours(timeSheet)}'),
            ),
          );
        },
      ),
    );
  }

  String calculateTotalHours(Map<String, dynamic> timeSheet) {
    int totalHours = 0;
    totalHours += int.tryParse(timeSheet['Mon'] ?? '0') ?? 0;
    totalHours += int.tryParse(timeSheet['Tue'] ?? '0') ?? 0;
    totalHours += int.tryParse(timeSheet['Wed'] ?? '0') ?? 0;
    totalHours += int.tryParse(timeSheet['Thu'] ?? '0') ?? 0;
    totalHours += int.tryParse(timeSheet['Fri'] ?? '0') ?? 0;
    return '$totalHours hours';
  }
}
