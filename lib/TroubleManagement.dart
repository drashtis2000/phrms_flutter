import 'package:flutter/material.dart';
import 'package:phrms/EscalationField.dart';
import 'package:phrms/IncidentReportsField.dart';
import 'package:phrms/IssueTrackingField.dart';
import 'package:phrms/ResolutionLogsField.dart';

class TroubleItem {
  final String title;
  final String identifier;

  TroubleItem(this.title, this.identifier);
}

List<TroubleItem> troubleItems = [
  TroubleItem("Incident Reports", "incident_reports"),
  TroubleItem("Issue Tracking", "issue_tracking"),
  TroubleItem("Resolution Logs", "resolution_logs"),
  TroubleItem("Escalation", "escalation"),
];

class TroubleManagement extends StatelessWidget {
  static const String id = "Trouble-Management-Screen";

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
            Text("Trouble Management"),
          ],
        ),
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
                  title: "Incident Reports",
                  description: "Description of Incident Reports...",
                  identifier: "incident_reports",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Issue Tracking",
                  description: "Description of Issue Tracking...",
                  identifier: "issue_tracking",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Resolution Logs",
                  description: "Description of Resolution Logs...",
                  identifier: "resolution_logs",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Escalation",
                  description: "Description of Escalation...",
                  identifier: "escalation",
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
        if (identifier == "incident_reports") {
          Navigator.pushNamed(context, IncidentReportsField.id);
        } else if (identifier == "issue_tracking") {
          Navigator.pushNamed(context, IssueTrackingField.id);
        } else if (identifier == "resolution_logs") {
          Navigator.pushNamed(context, ResolutionLogsField.id);
        } else if (identifier == "escalation") {
          Navigator.pushNamed(context, EscalationField.id);
        } else {
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

