import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  static const String id = "FeedbackPage";

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  // Add your state variables and logic for feedback and improvement here

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
            Text("Feedback and Improvement"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Feedback Matters!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Share your thoughts and ideas for continuous improvement.',
            ),
            SizedBox(height: 16.0),
            _buildFeedbackForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackForm() {
    // Implement a feedback form here, including text fields for feedback,
    // rating options, and a submit button.
    // You can use Flutter Form widgets to create the form.
    // Example: TextFormField, Radio, ElevatedButton, etc.

    return Container(
      // Customize the feedback form UI here
    );
  }
}
