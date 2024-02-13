import 'package:flutter/material.dart';
import 'package:phrms/CompanyPoliciesPage.dart';
import 'package:phrms/LegalDocumentsPage.dart';

class DocumentationField extends StatefulWidget {
  static const String id = "DocumentationField";

  @override
  _DocumentationFieldState createState() => _DocumentationFieldState();
}

class _DocumentationFieldState extends State<DocumentationField> {
  // Add your state variables and logic for managing employee records here

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
            Text("Employee Records"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage Employee Records',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildEmployeeRecordList(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, CompanyPoliciesPage.id);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Company Policies'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, LegalDocumentsPage.id);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Legal Documents'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeRecordList() {
    // Implement a list view of employee records here
    // You can use Flutter widgets like ListView.builder to display a list of records.
    // Example: ListTile, Card, etc.

    return Container(
      // Customize the employee record list UI here
    );
  }
}
