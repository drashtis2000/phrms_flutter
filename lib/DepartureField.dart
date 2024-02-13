import 'package:flutter/material.dart';

class DepartureField extends StatefulWidget {
  static const String id = "Departure-Field-Screen";

  @override
  _DepartureFieldState createState() => _DepartureFieldState();
}

class _DepartureFieldState extends State<DepartureField> {
  // Add necessary variables and controllers for capturing departure reasons
  TextEditingController departureReasonController = TextEditingController();
  // Add more controllers and variables as needed

  @override
  void dispose() {
    // Dispose of controllers when not needed
    departureReasonController.dispose();
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
            Text("Reason for Departure"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDepartureReasonForm(),
              SizedBox(height: 20),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDepartureReasonForm() {
    return Column(
      children: [
        TextField(
          controller: departureReasonController,
          decoration: InputDecoration(
            labelText: "Departure Reason",
            hintText: "Specify the reason for your departure...",
          ),
          maxLines: 5, // Allow multiple lines for detailed explanations
        ),
        // Add more input fields for capturing departure reasons as needed
      ],
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement logic to submit departure reasons
        _submitDepartureReasons();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      child: Text("Submit Reasons"),
    );
  }

  void _submitDepartureReasons() {
    // Implement the logic to submit departure reasons here
    final departureReasons = departureReasonController.text;

    // You can now use 'departureReasons' to process and store the reasons.

    // Optionally, you can show a confirmation dialog or navigate back to the previous screen.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Reasons Submitted"),
          content: Text("Thank you for specifying your departure reasons."),
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
