import 'package:flutter/material.dart';

class InterviewOutcomePage extends StatelessWidget {
  static const String id = "Interview-Outcome-Page";

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
            Text("Interview Outcome"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Candidate Name'),
                // Add controller and validation logic
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Outcome'),
                // Add controller and validation logic
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implement logic to record interview outcome
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Record Outcome'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
