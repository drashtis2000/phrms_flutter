import 'package:flutter/material.dart';

class InterviewQuestionnairesPage extends StatelessWidget {
  static const String id = "Interview-Questionnaires-Page";

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
            Text("Interviewing Questionnaires"),
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
                decoration: InputDecoration(labelText: 'Questionnaire Title'),
                // Add controller and validation logic
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implement logic to save questionnaire
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Save Questionnaire'),
              ),

              // Display existing questionnaires
              // You can use a ListView.builder to list questionnaires

              // Add more UI elements for managing questionnaires
            ],
          ),
          ),
        ),
      );
  }
}
