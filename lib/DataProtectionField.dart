import 'package:flutter/material.dart';

class DataProtectionField extends StatelessWidget {
  static const String id = "Data-Protection-Field-Screen";

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
            Text("Data Protection"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDataProtectionInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataProtectionInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Data Protection Guidelines",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "To ensure the protection of sensitive data during employee departures, please follow these guidelines:",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        _buildDataProtectionItem(
          "1. Data Backup:",
          "Make sure all relevant data is backed up securely before the employee's departure.",
        ),
        _buildDataProtectionItem(
          "2. Account Deactivation:",
          "Promptly deactivate access to company systems and accounts.",
        ),
        _buildDataProtectionItem(
          "3. Password Changes:",
          "Change passwords for shared accounts and revoke access to personal accounts.",
        ),
        _buildDataProtectionItem(
          "4. Confidential Data:",
          "Identify and secure any confidential or proprietary data the employee had access to.",
        ),
        _buildDataProtectionItem(
          "5. Compliance:",
          "Ensure that the data protection process complies with applicable laws and regulations.",
        ),
        // Add more data protection guidelines as needed
      ],
    );
  }

  Widget _buildDataProtectionItem(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(description),
        SizedBox(height: 10),
      ],
    );
  }
}
