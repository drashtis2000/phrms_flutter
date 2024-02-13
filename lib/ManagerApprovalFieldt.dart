import 'package:flutter/material.dart';

class ManagerApprovalFieldt extends StatelessWidget {
  static const String id = "ManagerApprovalFieldt";

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
            Text("Leave Request"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Leave Request Form",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Employee Information
              TextFormField(
                decoration: InputDecoration(labelText: "Employee Name"),
              ),
              SizedBox(height: 10),
              // Leave Type
              TextFormField(
                decoration: InputDecoration(labelText: "Leave Type"),
              ),
              SizedBox(height: 10),
              // Leave Dates
              TextFormField(
                decoration: InputDecoration(labelText: "Leave Dates"),
              ),
              SizedBox(height: 10),
              // Comments
              TextFormField(
                decoration: InputDecoration(labelText: "Comments"),
                maxLines: 3, // Multiline text input for comments
              ),
              SizedBox(height: 20),
              // Approval Button
              ElevatedButton(
                onPressed: () {
                  // Implement approval logic here
                  // You can send the approval status to the backend or update the request status
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: Text("Approve"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
