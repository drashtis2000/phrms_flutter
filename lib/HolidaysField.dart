import 'package:flutter/material.dart';

class HolidaysField extends StatelessWidget {
  static const String id = "HolidaysField";

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
            SizedBox(width: 10), // Replace with the desired width
            Text("Holiday Calendar"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Display the month and year
              Text(
                "September 2023",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // Calendar grid
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, // 7 columns for the days of the week
                ),
                itemBuilder: (context, index) {
                  // Generate calendar cells here
                  return _buildCalendarCell(index, daysInMonth: 30); // Change daysInMonth to the actual number of days
                },
                itemCount: 30, // Change this to the actual number of days in the month
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build a calendar cell
  Widget _buildCalendarCell(int index, {required int daysInMonth}) {
    // You can customize the content of each calendar cell here
    if (index < daysInMonth) {
      // Display day of the month
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          "${index + 1}", // Day of the month
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      // Empty cell for days beyond the end of the month
      return Container();
    }
  }
}
