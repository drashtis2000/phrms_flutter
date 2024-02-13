import 'package:flutter/material.dart';

class CompensationField extends StatelessWidget {
  static const String id = "CompensationField";

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
              Text("Salary Details"),
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
                decoration: InputDecoration(labelText: "Base Salary"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "Salary Grade or Level"),
              ),
              SizedBox(height: 10),
              // Add more fields as needed for compensation details
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
