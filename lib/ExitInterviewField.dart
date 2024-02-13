import 'package:flutter/material.dart';

class ExitInterviewField extends StatefulWidget {
  static const String id = "Exit-Interview-Field-Screen";

  @override
  _ExitInterviewFieldState createState() => _ExitInterviewFieldState();
}

class _ExitInterviewFieldState extends State<ExitInterviewField> {
  // Add necessary variables and controllers for feedback gathering
  TextEditingController feedbackController = TextEditingController();
  // Add more controllers and variables as needed

  @override
  void dispose() {
    // Dispose of controllers when not needed
    feedbackController.dispose();
    super.dispose();
  }

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
            Text("Gather Feedback"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildFeedbackForm(),
              SizedBox(height: 20),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackForm() {
    return Column(
      children: [
        TextField(
          controller: feedbackController,
          decoration: InputDecoration(
            labelText: "Feedback",
            hintText: "Provide feedback about your experience...",
          ),
          maxLines: 5, // Allow multiple lines of feedback
        ),
        // Add more input fields for feedback gathering as needed
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement logic to submit feedback
        _submitFeedback();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      child: Text("Submit Feedback"),
    );
  }

  void _submitFeedback() {
    // Implement the logic to submit feedback here
    final feedback = feedbackController.text;

    // You can now use 'feedback' to process and store the feedback.

    // Optionally, you can show a confirmation dialog or navigate back to the previous screen.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Feedback Submitted"),
          content: Text("Thank you for providing feedback."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
