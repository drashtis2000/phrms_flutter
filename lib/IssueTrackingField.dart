import 'package:flutter/material.dart';

class IssueTrackingField extends StatelessWidget {
  static const String id = "Issue-Tracking-Field";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Issue Tracking"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              "Issue Tracking Form",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(labelText: "Issue Title"),
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(labelText: "Description"),
            ),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(
                  value: "High",
                  child: Text("High Priority"),
                ),
                DropdownMenuItem(
                  value: "Medium",
                  child: Text("Medium Priority"),
                ),
                DropdownMenuItem(
                  value: "Low",
                  child: Text("Low Priority"),
                ),
              ],
              onChanged: (String? value) {
                // Handle priority selection
              },
              decoration: InputDecoration(labelText: "Priority"),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement logic to submit the issue report
                // You can send the data to a server or store it locally as needed.
                // Provide user feedback after submission.
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
