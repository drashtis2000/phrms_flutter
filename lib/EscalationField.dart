import 'package:flutter/material.dart';

class EscalationField extends StatelessWidget {
  static const String id = "Escalation-Field";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Escalation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              "Escalation Form",
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
            DropdownButtonFormField<String>(
              items: ["Low", "Medium", "High"]
                  .map((priority) => DropdownMenuItem<String>(
                value: priority,
                child: Text(priority),
              ))
                  .toList(),
              decoration: InputDecoration(labelText: "Priority"),
              onChanged: (selectedPriority) {
                // Handle priority selection
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement logic to submit the escalation
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
