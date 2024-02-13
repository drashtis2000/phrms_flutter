import 'package:flutter/material.dart';
import 'package:phrms/AdjustmentsField.dart';
import 'package:phrms/BenefitsField.dart';
import 'package:phrms/LeaveApprovalsPage.dart';
import 'package:phrms/PaystubsField.dart';

class PayrollItem {
  final String title;
  final String identifier;

  PayrollItem(this.title, this.identifier);
}

List<PayrollItem> payrollItems = [
  PayrollItem("Paystubs", "paystubs"),
  PayrollItem("Benefits", "benefits"),
  PayrollItem("Adjustments", "adjustments"),
  PayrollItem("Manager Approval", "manager_approval"),
];

class PayrollManagement extends StatelessWidget {
  static const String id = "Payroll-Management-Screen";
  final String userRole;
  const PayrollManagement({Key? key, required this.userRole}) : super(key: key);

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
              Text("Payroll Management"),
            ],
          )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Paystubs",
                  description: "Description of Paystubs...",
                  identifier: "paystubs",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Benefits",
                  description: "Description of Benefits...",
                  identifier: "benefits",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Adjustments",
                  description: "Description of Adjustments...",
                  identifier: "adjustments",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Manager Approval",
                  description: "Description of Manager Approval...",
                  identifier: "manager_approval",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldBox(BuildContext context, {required String title, required String description, required String identifier}) {
    return GestureDetector(
      onTap: () {
        if (identifier == "paystubs") {
          Navigator.pushNamed(context, PaystubsField.id);
        } else if (identifier == "benefits") {
          Navigator.pushNamed(context, BenefitsField.id);
        } else if (identifier == "adjustments") {
          Navigator.pushNamed(context, AdjustmentsField.id);
        } else if (identifier == "manager_approval") {
          Navigator.pushNamed(context, LeaveApprovalsPage.id);
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
