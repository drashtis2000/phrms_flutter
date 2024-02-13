import 'package:flutter/material.dart';

class BudgetManagementField extends StatelessWidget {
  static const String id = "Budget-Management-Field";

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
            Text("Budget Management"),
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
              "Budget Management Page",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: "Budget Category"),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: "Budget Amount"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement code to manage budgets
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text("Manage Budget"),
            ),
          ],
        ),
      ),
    );
  }
}
