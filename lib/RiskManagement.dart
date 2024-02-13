import 'package:flutter/material.dart';
import 'package:phrms/IncidentManagementField.dart';
import 'package:phrms/RiskAssessmentField.dart';
import 'package:phrms/RiskMitigationField.dart';

class RiskItem {
  final String title;
  final String identifier;

  RiskItem(this.title, this.identifier);
}

List<RiskItem> riskItems = [
  RiskItem("Risk Assessment", "risk_assessment"),
  RiskItem("Risk Mitigation", "risk_mitigation"),
  RiskItem("Incident Management", "incident_management"),
  // Add more risk management sub-modules as needed
];

class RiskManagement extends StatelessWidget {
  static const String id = "Risk-Management-Screen";

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
            Text("Risk Management"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _buildRiskItems(context),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildRiskItems(BuildContext context) {
    return riskItems.map((item) {
      return Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: _buildFieldBox(
          context,
          title: item.title,
          description: "Description of ${item.title}...",
          identifier: item.identifier,
        ),
      );
    }).toList();
  }

  Widget _buildFieldBox(BuildContext context, {required String title, required String description, required String identifier}) {
    return GestureDetector(
      onTap: () {
        if (identifier == "risk_assessment") {
          Navigator.pushNamed(context, RiskAssessmentField.id);
        } else if (identifier == "risk_mitigation") {
          Navigator.pushNamed(context, RiskMitigationField.id);
        } else if (identifier == "incident_management") {
          Navigator.pushNamed(context, IncidentManagementField.id);
        }  else {
          // Handle other user management sub-modules' navigation
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
