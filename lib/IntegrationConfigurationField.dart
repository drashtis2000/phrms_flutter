import 'package:flutter/material.dart';

class IntegrationConfigurationField extends StatelessWidget {
  static const String id = "Integration-Configuration-Field";

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
            Text("Integration Configuration"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              "Integration Configuration Form",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(labelText: "Integration Name"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "API Endpoint"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Authentication Key"),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement logic to save integration configuration
                // You can send the data to a server or store it locally as needed.
                // Provide user feedback after configuration.
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text("Save Configuration"),
            ),
          ],
        ),
      ),
    );
  }
}
