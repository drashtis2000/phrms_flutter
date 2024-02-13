import 'package:flutter/material.dart';

class WorkAuthorizationField extends StatelessWidget {
  static const String id = "WorkAuthorizationField";

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
              Text("Work Authorization"),
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Legal Authorization Status"),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "Work Visa or Permit Details (if applicable)"),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "Visa Expiration Date (if applicable)"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement code to save the entered information
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
