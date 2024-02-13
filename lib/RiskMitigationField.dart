import 'package:flutter/material.dart';

class RiskMitigationField extends StatefulWidget {
  static const String id = "Risk-Mitigation-Field-Screen";

  @override
  _RiskMitigationFieldState createState() => _RiskMitigationFieldState();
}

class _RiskMitigationFieldState extends State<RiskMitigationField> {
  // Add necessary variables and controllers for risk mitigation
  TextEditingController mitigationTitleController = TextEditingController();
  TextEditingController mitigationDescriptionController = TextEditingController();
  // Add more controllers and variables as needed

  @override
  void dispose() {
    // Dispose of controllers when not needed
    mitigationTitleController.dispose();
    mitigationDescriptionController.dispose();
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
              Text("Risk Mitigation"),
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMitigationForm(),
              SizedBox(height: 20),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMitigationForm() {
    return Column(
      children: [
        TextField(
          controller: mitigationTitleController,
          decoration: InputDecoration(labelText: "Mitigation Title"),
        ),
        TextField(
          controller: mitigationDescriptionController,
          decoration: InputDecoration(labelText: "Mitigation Description"),
        ),
        // Add more input fields for risk mitigation as needed
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement logic to save the risk mitigation
        _saveRiskMitigation();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      child: Text("Save"),
    );
  }

  void _saveRiskMitigation() {
    // Implement the logic to save the risk mitigation here
    final mitigationTitle = mitigationTitleController.text;
    final mitigationDescription = mitigationDescriptionController.text;

    // You can now use 'mitigationTitle' and 'mitigationDescription' to save the mitigation.

    // Optionally, you can show a confirmation dialog or navigate back to the previous screen.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Risk Mitigation Saved"),
          content: Text("The risk mitigation has been successfully saved."),
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
