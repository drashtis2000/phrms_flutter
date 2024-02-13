import 'package:flutter/material.dart';

class RoleReportingField extends StatelessWidget {
  static const String id = "RoleReportingField";

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
            Text("Job Roles and Titles"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Add fields related to job roles and titles
              TextFormField(
                decoration: InputDecoration(labelText: "Job Role Title"),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "Job Description"),
                maxLines: 4, // Allowing multiple lines for description
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement code to save the entered information
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
