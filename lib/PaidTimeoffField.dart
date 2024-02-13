import 'package:flutter/material.dart';

class PaidTimeoffField extends StatelessWidget {
  static const String id = "PaidTimeoffField";

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
            Text("Paid Time Off"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Add fields related to Paid Time Off
              TextFormField(
                decoration: InputDecoration(labelText: "Leave Type"),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "Start Date"),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "End Date"),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "Reason"),
                maxLines: 4, // Allowing multiple lines for the reason
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement code to submit the Paid Time Off request
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text("Submit Request"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
