import 'package:flutter/material.dart';

class FeedbackCollectionPage extends StatelessWidget {
  static const String id = "Feedback-Collection-Page";

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
            Text("Feedback Collection"),
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
                decoration: InputDecoration(labelText: 'Feedback Title'),
                // Add controller and validation logic
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Feedback Description'),
                // Add controller and validation logic
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implement logic to save feedback
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
