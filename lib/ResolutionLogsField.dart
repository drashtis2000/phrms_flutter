import 'package:flutter/material.dart';

class ResolutionLogsField extends StatelessWidget {
  static const String id = "Resolution-Logs-Field";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Resolution Logs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              "Resolution Logs",
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
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(labelText: "Resolution Details"),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement logic to submit the resolution log
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
