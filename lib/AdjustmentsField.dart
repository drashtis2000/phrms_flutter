import 'package:flutter/material.dart';

class AdjustmentsField extends StatelessWidget {
  static const String id = "AdjustmentsField";

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
            Text("Salary Adjustments"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Salary Adjustments",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Add UI elements related to salary adjustments
            _buildSalaryAdjustmentForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSalaryAdjustmentForm(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Adjust Salary",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: "Employee Name"),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "New Salary Amount"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement code to submit the salary adjustment
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
