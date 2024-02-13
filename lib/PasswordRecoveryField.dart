import 'package:flutter/material.dart';

class PasswordRecoveryField extends StatelessWidget {
  static const String id = "Password-Recovery-Field-Screen";

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
            Text("Password Recovery"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildPasswordRecoveryInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordRecoveryInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password Recovery Process",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "In case an employee forgets their password or is unable to access their accounts, follow this password recovery process:",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        _buildPasswordRecoveryStep(
          "1. Contact IT Support:",
          "The employee should contact the IT support team or helpdesk immediately.",
        ),
        _buildPasswordRecoveryStep(
          "2. Identity Verification:",
          "IT support will verify the employee's identity to ensure the request is legitimate.",
        ),
        _buildPasswordRecoveryStep(
          "3. Password Reset:",
          "Upon verification, IT support will reset the employee's password and provide temporary access.",
        ),
        _buildPasswordRecoveryStep(
          "4. Security Measures:",
          "Ensure the employee sets a new secure password upon regaining access.",
        ),
        _buildPasswordRecoveryStep(
          "5. Documentation:",
          "Document the incident and password reset process for auditing purposes.",
        ),
      ],
    );
  }

  Widget _buildPasswordRecoveryStep(String title, String description) {
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
