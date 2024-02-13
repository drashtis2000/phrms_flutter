import 'package:flutter/material.dart';

class AppraisalField extends StatelessWidget {
  static const String id = "AppraisalField";

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
            Text("Assessment Performance"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Employee Information
              TextFormField(
                decoration: InputDecoration(labelText: "Employee Name"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Employee ID"),
              ),
              // Performance Criteria
              Text(
                "Performance Criteria",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text("Quality of Work"),
                value: false, // Add your logic to manage checkbox state
                onChanged: (bool? value) {
                  // Handle checkbox change
                },
              ),
              CheckboxListTile(
                title: Text("Communication Skills"),
                value: false, // Add your logic to manage checkbox state
                onChanged: (bool? value) {
                  // Handle checkbox change
                },
              ),
              // Performance Rating
              DropdownButtonFormField(
                items: ["Excellent", "Good", "Average", "Below Average"]
                    .map((String rating) {
                  return DropdownMenuItem(
                    value: rating,
                    child: Text(rating),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: "Performance Rating"),
                onChanged: (String? value) {
                  // Handle dropdown value change
                },
              ),
              // Comments and Feedback
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Comments and Feedback",
                  hintText: "Enter comments and feedback here",
                ),
                maxLines: 4,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement code to save the assessment
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
