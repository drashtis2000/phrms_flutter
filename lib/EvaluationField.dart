import 'package:flutter/material.dart';

class EvaluationField extends StatelessWidget {
  static const String id = "EvaluationField";

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
            Text("Employee Reviews"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Employee Performance Reviews",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Add UI elements related to employee performance reviews
              _buildReviewForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewForm() {
    // Replace this with the UI elements and form fields related to performance reviews.
    // Include fields for employee name, review date, performance criteria, comments, and ratings.

    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: "Employee Name"),
        ),
        // Add more form fields and UI elements here
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Implement code to save the performance review
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          child: Text("Save Review"),
        ),
      ],
    );
  }
}
