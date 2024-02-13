import 'package:flutter/material.dart';

class RiskAssessmentField extends StatefulWidget {
  static const String id = "Risk-Assessment-Field-Screen";

  @override
  _RiskAssessmentFieldState createState() => _RiskAssessmentFieldState();
}

class _RiskAssessmentFieldState extends State<RiskAssessmentField> {
  // Add necessary variables and controllers for risk assessment
  TextEditingController riskTitleController = TextEditingController();
  TextEditingController riskDescriptionController = TextEditingController();
  // Add more controllers and variables as needed

  @override
  void dispose() {
    // Dispose of controllers when not needed
    riskTitleController.dispose();
    riskDescriptionController.dispose();
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
            Text("Risk Assessment"),
          ],
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildRiskForm(),
              SizedBox(height: 20),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRiskForm() {
    return Column(
      children: [
        TextField(
          controller: riskTitleController,
          decoration: InputDecoration(labelText: "Risk Title"),
        ),
        TextField(
          controller: riskDescriptionController,
          decoration: InputDecoration(labelText: "Risk Description"),
        ),
        // Add more input fields for risk assessment as needed
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement logic to save the risk assessment
        _saveRiskAssessment();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      child: Text("Save"),
    );
  }

  void _saveRiskAssessment() {
    // Implement the logic to save the risk assessment here
    final riskTitle = riskTitleController.text;
    final riskDescription = riskDescriptionController.text;

    // You can now use 'riskTitle' and 'riskDescription' to save the assessment.

    // Optionally, you can show a confirmation dialog or navigate back to the previous screen.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Risk Assessment Saved"),
          content: Text("The risk assessment has been successfully saved."),
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