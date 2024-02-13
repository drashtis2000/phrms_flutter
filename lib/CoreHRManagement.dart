import 'package:flutter/material.dart';
import 'package:phrms/DocumentationField.dart';
import 'package:phrms/ESignatureField.dart';
import 'package:phrms/MachineAssignmentField.dart';
import 'package:phrms/ManagerApprovalField.dart';
import 'package:phrms/OnBoardingField.dart';
import 'package:phrms/ProjectAssignmentField.dart';
import 'package:phrms/RecruitingField.dart';

class CoreHRItem {
  final String title;
  final String identifier;

  CoreHRItem(this.title, this.identifier);
}

List<CoreHRItem> corehrItems = [
  CoreHRItem("Recruiting", "recruiting"),
  CoreHRItem("OnBoarding", "onBoarding"),
  CoreHRItem("Documentation", "documentation"),
  CoreHRItem("E - signature", "e_signature"),
  CoreHRItem("Manager Approval", "manager_approval"),
  CoreHRItem("Machine Assignment", "machine_assignment"),
  CoreHRItem("Project Assignment", "project_assignment"),
];

class CoreHRManagement extends StatelessWidget {
  static const String id = "Core-HR-Management-Screen";

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
              Text("Core HR Management"),
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
                  title: "Recruiting",
                  description: "Description of Recruiting...",
                  identifier: "recruiting",
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "OnBoarding",
                  description: "Description of OnBoarding...",
                  identifier: "onboarding",
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Documentation",
                  description: "Description of Documentation...",
                  identifier: "documentation",
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "E - signature",
                  description: "Description of E - signature...",
                  identifier: "e-signature",
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Manager Approval",
                  description: "Description of Manager Approval...",
                  identifier: "manager_approval",
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Machine Assignment",
                  description: "Description of Machine Assignment...",
                  identifier: "machine_assignment",
                ),
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Project Assignment",
                  description: "Description of Project Assignment...",
                  identifier: "project_assignment",
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
        if (identifier == "recruiting") {
          Navigator.pushNamed(context, RecruitingField.id);
        } else if (identifier == "onboarding"){
          Navigator.pushNamed(context, OnBoardingField.id);
        } else if (identifier == "documentation"){
          Navigator.pushNamed(context, DocumentationField.id);
        } else if (identifier == "e-signature"){
          Navigator.pushNamed(context, ESignatureField.id);
        } else if (identifier == "manager_approval"){
          Navigator.pushNamed(context, ManagerApprovalField.id);
        } else if (identifier == "machine_assignment"){
          Navigator.pushNamed(context, MachineAssignmentField.id);
        } else if (identifier == "project_assignment"){
          Navigator.pushNamed(context, ProjectAssignmentField.id);
        }
        else {
          // Handle other sub-modules' navigation
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
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
            SizedBox(height: 5),
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
