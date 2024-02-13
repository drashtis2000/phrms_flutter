import 'package:flutter/material.dart';
import 'package:phrms/HolidaysField.dart';
import 'package:phrms/LossofPayField.dart';
import 'package:phrms/ManagerApprovalFieldt.dart';
import 'package:phrms/PaidTimeoffField.dart';
import 'package:phrms/TimeSheetScreen.dart';

class TimeItem {
  final String title;
  final String identifier;

  TimeItem(this.title, this.identifier);
}

List<TimeItem> recruitmentItems = [
  TimeItem("Time Sheet", "time_sheets"),
  TimeItem("Paid Time Off", "paid_time_off"),
  TimeItem("Loss of Pay", "loss_of_pay"),
  TimeItem("Holidays", "holidays"),
  TimeItem("Manager Approval", "manager_approval"),
];

class TimeManagement extends StatelessWidget {
  static const String id = "Time-Management-Screen";
  final String userRole;
  const TimeManagement({Key? key, required this.userRole}) : super(key: key);

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
              Text("Time Management"),
            ],
          )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Time Sheet",
                  description: "Description of Time Sheets...",
                  identifier: "time_sheets"
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Paid Time Off",
                  description: "Description of Paid Time Off...",
                  identifier: 'paid_time_off',
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Loss of Pay",
                  description: "Description of Loss of Pay...",
                  identifier: 'loss_of_pay',
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Holidays",
                  description: "Description of Holidays...",
                  identifier: 'holidays',
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Manager Approval",
                  description: "Description of Manager Approval...",
                  identifier: 'manager_approval',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldBox(BuildContext context, {required String title, required String description, required String identifier }) {
    return GestureDetector(
      onTap: () {
        if (identifier == "time_sheets") {
          Navigator.pushNamed(context, TimeSheetScreen.id);
        } else if (identifier == "paid_time_off") {
          Navigator.pushNamed(context, PaidTimeoffField.id);
        } else if (identifier == "loss_of_pay") {
          Navigator.pushNamed(context, LossofPayField.id);
        } else if (identifier == "holidays") {
          Navigator.pushNamed(context, HolidaysField.id);
        } else if (identifier == "manager_approval") {
          Navigator.pushNamed(context, ManagerApprovalFieldt.id);
        }
        else {
          // Handle other sub-modules' navigation
        }
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
