import 'package:flutter/material.dart';

class FeedbackField extends StatefulWidget {
  static const String id = "FeedbackField";

  @override
  _FeedbackFieldState createState() => _FeedbackFieldState();
}

class _FeedbackFieldState extends State<FeedbackField> {
  final TextEditingController _feedbackController = TextEditingController();
  String _selectedCategory = 'Performance'; // Add categories for feedback types

  // List of feedback categories (customize as needed)
  final List<String> _feedbackCategories = [
    'Performance',
    'Teamwork',
    'Communication',
    'Project',
    // Add more categories as needed
  ];

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
            SizedBox(width: 10),
            Text("Feedback Collection"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButtonFormField<String>(
              hint: Text('Select Feedback Category'),
              value: _selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: _feedbackCategories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _feedbackController,
              decoration: InputDecoration(
                labelText: 'Feedback',
                border: OutlineInputBorder(),
              ),
              maxLines: 4, // Adjust as needed
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement code to save the feedback
                final String feedback = _feedbackController.text;
                final String category = _selectedCategory;

                // You can now process and save the feedback as needed

                // Clear the input fields after submission
                _feedbackController.clear();
                setState(() {
                  _selectedCategory = '';
                });
                // Show a confirmation message or navigate to a different page
                // based on your requirements.
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}
