import 'package:flutter/material.dart';

class IncidentManagementField extends StatefulWidget {
  static const String id = "Incident-Management-Field-Screen";

  @override
  _IncidentManagementFieldState createState() =>
      _IncidentManagementFieldState();
}

class _IncidentManagementFieldState extends State<IncidentManagementField> {
  // Add necessary variables and controllers for incident management
  TextEditingController incidentTitleController = TextEditingController();
  TextEditingController incidentDescriptionController = TextEditingController();
  // Add more controllers and variables as needed

  @override
  void dispose() {
    // Dispose of controllers when not needed
    incidentTitleController.dispose();
    incidentDescriptionController.dispose();
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
            Text("Incident Management"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildIncidentForm(),
              SizedBox(height: 20),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIncidentForm() {
    return Column(
      children: [
        TextField(
          controller: incidentTitleController,
          decoration: InputDecoration(labelText: "Incident Title"),
        ),
        TextField(
          controller: incidentDescriptionController,
          decoration: InputDecoration(labelText: "Incident Description"),
        ),
        // Add more input fields for incident management as needed
      ],
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement logic to save the incident
        _saveIncident();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
      child: Text("Save"),
    );
  }

  void _saveIncident() {
    // Implement the logic to save the incident here
    final incidentTitle = incidentTitleController.text;
    final incidentDescription = incidentDescriptionController.text;

    // You can now use 'incidentTitle' and 'incidentDescription' to save the incident.

    // Optionally, you can show a confirmation dialog or navigate back to the previous screen.
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Incident Saved"),
          content: Text("The incident has been successfully saved."),
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
