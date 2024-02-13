import 'package:flutter/material.dart';

class BenefitsFieldPage extends StatelessWidget {
  static const String id = "BenefitsFieldPage";

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
              Text("Health Benefits"),
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Add fields related to health benefits
              TextFormField(
                decoration: InputDecoration(labelText: "Health Insurance Plan"),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "Coverage Details"),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "Premiums"),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "Co-pays and Deductibles"),
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
