import 'package:flutter/material.dart';

class PersonalDetailsField extends StatelessWidget {
  static const String id = "PersonalDetailsField";

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
              Text("Personal Details"),
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Add your fields for Personal Details here
            // Example:
            TextField(
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Date of Birth"),
            ),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}
