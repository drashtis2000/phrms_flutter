import 'package:flutter/material.dart';

class IncidentReportsField extends StatelessWidget {
  static const String id = "Incident-Reports-Field";

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
            Text("Incident Reports"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              "Incident Report Form",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(labelText: "Date of Incident"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Location of Incident"),
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(labelText: "Description of Incident"),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement logic to submit the incident report
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
