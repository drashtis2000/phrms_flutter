import 'package:flutter/material.dart';
import 'package:phrms/BenefitsFieldPage.dart';
import 'package:phrms/CompensationField.dart';
import 'package:phrms/EmergencyContactField.dart';
import 'package:phrms/InsuranceField.dart';
import 'package:phrms/PersonalDetailsField.dart';
import 'package:phrms/RoleReportingField.dart';
import 'package:phrms/WorkAuthorizationField.dart';
import 'package:phrms/WorksiteAllocationField.dart';

class EmplyoeeItem {
  final String title;
  final String identifier;

  EmplyoeeItem(this.title, this.identifier);
}

List<EmplyoeeItem> emplyoeeItems = [
  EmplyoeeItem("Personal Details", "personal_details"),
  EmplyoeeItem("Work Authorization", "work_authorization"),
  EmplyoeeItem("Compensation", "compensation"),
  EmplyoeeItem("Benefits", "benefits"),
  EmplyoeeItem("Insurance", "insurance"),
  EmplyoeeItem("Worksite Allocation", "worksite_allocation"),
  EmplyoeeItem("Emergency Contact", "emergency_contact"),
  EmplyoeeItem("Role & Reporting", "role_&_Reporting"),
];

class EmplyoeeManagement extends StatelessWidget {
  static const String id = "Emplyoee-Management-Screen";

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
              Text("Emplyoee Management"),
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
                SizedBox(height: 5.0),
                _buildFieldBox(
                  context,
                  title: "Personal Details",
                  description: "Description of Personal Details...",
                  identifier: "personal_details",
                ),
                SizedBox(height: 5.0),
                _buildFieldBox(
                  context,
                  title: "Work Authorization",
                  description: "Description of Work Authorization...",
                  identifier: "work_authorization",
                ),
                SizedBox(height: 5.0),
                _buildFieldBox(
                  context,
                  title: "Compensation",
                  description: "Description of Compensation...",
                  identifier: 'compensation',
                ),
                SizedBox(height: 5.0),
                _buildFieldBox(
                  context,
                  title: "Benefits",
                  description: "Description of Benefits...",
                  identifier: 'benefits',
                ),
                SizedBox(height: 5.0),
                _buildFieldBox(
                  context,
                  title: "Worksite Allocation",
                  description: "Description of Worksite Allocation...",
                  identifier: 'worksite_allocation',
                ),
                SizedBox(height: 5.0),
                _buildFieldBox(
                  context,
                  title: "Insurance",
                  description: "Description of Insurance...",
                  identifier: 'insurance',
                ),
                SizedBox(height: 5.0),
                _buildFieldBox(
                  context,
                  title: "Emergency Contact",
                  description: "Description of Emergency Contact...",
                  identifier: 'emergency_contact',
                ),
                SizedBox(height: 5.0),
                _buildFieldBox(
                  context,
                  title: "Role & Reporting",
                  description: "Description of Role & Reporting...",
                  identifier: 'role_&_reporting',
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
        if (identifier == "personal_details") {
          Navigator.pushNamed(context, PersonalDetailsField.id);
        } else if (identifier == "work_authorization"){
          Navigator.pushNamed(context, WorkAuthorizationField.id);
        } else if (identifier == "compensation"){
          Navigator.pushNamed(context, CompensationField.id);
        } else if (identifier == "benefits"){
          Navigator.pushNamed(context, BenefitsFieldPage.id);
        } else if (identifier == "worksite_allocation"){
          Navigator.pushNamed(context, WorksiteAllocationField.id);
        } else if (identifier == "insurance"){
          Navigator.pushNamed(context, InsuranceField.id);
        } else if (identifier == "emergency_contact"){
          Navigator.pushNamed(context, EmergencyContactField.id);
        } else if (identifier == "role_&_reporting"){
          Navigator.pushNamed(context, RoleReportingField.id);
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
