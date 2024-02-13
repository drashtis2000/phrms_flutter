import 'package:flutter/material.dart';

class CompanyPoliciesPage extends StatelessWidget {
  static const String id = "CompanyPoliciesPage";

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
            Text("Company Policies"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Company Policies',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildPolicyItem("Equal Opportunity Policy", "Our commitment to equal employment opportunities."),
            _buildPolicyItem("Code of Conduct", "Guidelines for expected behavior within the company."),
            _buildPolicyItem("Safety Procedures", "Safety guidelines for all employees."),
            // Add more policy items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildPolicyItem(String title, String description) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
