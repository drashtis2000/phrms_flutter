import 'package:flutter/material.dart';
import 'package:phrms/ClearanceChecklistField.dart';
import 'package:phrms/CommunicateField.dart';
import 'package:phrms/DataProtectionField.dart';
import 'package:phrms/DepartureField.dart';
import 'package:phrms/ExitDocumentationField.dart';
import 'package:phrms/ExitInterviewField.dart';
import 'package:phrms/PasswordRecoveryField.dart';

class ExitItem {
  final String title;
  final String identifier;

  ExitItem(this.title, this.identifier);
}

List<ExitItem> exitItems = [
  ExitItem("Exit Interview", "exit_interview"),
  ExitItem("Feedback", "feedback"),
  ExitItem("Access Revoke", "access_revoke"),
  ExitItem("Asset Recovery", "asset_recovery"),
  ExitItem("Employment Termination", "employment_termination"),
  ExitItem("Exit Clearance", "exit_clearance"),
  ExitItem("Employee Release", "employee_release"),
];

class ExitManagement extends StatelessWidget {
  static const String id = "Exit-Management-Screen";

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
              Text("Exit Management"),
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
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Exit Interview",
                  description: "Description of Exit Interview...",
                  identifier: 'exit_interview',
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Feedback",
                  description: "Description of Feedback...",
                  identifier: 'feedback',
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Access Revoke",
                  description: "Description of Access Revoke...",
                  identifier: 'access_revoke',
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Asset Recovery",
                  description: "Description of Asset Recovery...",
                  identifier: 'asset_recovery',
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Employment Termination",
                  description: "Description of Employment Termination...",
                  identifier: 'employment_termination',
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Exit Clearance",
                  description: "Description of Exit Clearance...",
                  identifier: 'exit_clearance',
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Employee Release",
                  description: "Description of Employee Release...",
                  identifier: 'employee_release',
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
        if (identifier == "exit_interview") {
          Navigator.pushNamed(context, ExitInterviewField.id);
        } else if (identifier == "feedback"){
          Navigator.pushNamed(context, DepartureField.id);
        } else if (identifier == "access_revoke"){
          Navigator.pushNamed(context, DataProtectionField.id);
        } else if (identifier == "asset_recovery"){
          Navigator.pushNamed(context, PasswordRecoveryField.id);
        } else if (identifier == "employment_termination"){
          Navigator.pushNamed(context, CommunicateField.id);
        } else if (identifier == "exit_clearance"){
          Navigator.pushNamed(context, ClearanceChecklistField.id);
        } else if (identifier == "employee_release"){
          Navigator.pushNamed(context, ExitDocumentationField.id);
        }
        else {
          // Handle other sub-modules' navigation
        }
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
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
