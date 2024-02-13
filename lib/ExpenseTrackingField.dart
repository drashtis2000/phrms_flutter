import 'package:flutter/material.dart';

class ExpenseTrackingField extends StatelessWidget {
  static const String id = "Expense-Tracking-Field";

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
            Text("Expense Tracking"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Expense Tracking Page",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: "Expense Category"),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: "Expense Amount"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: "Expense Date"),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement code to save the entered expense
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text("Save Expense"),
            ),
          ],
        ),
      ),
    );
  }
}
