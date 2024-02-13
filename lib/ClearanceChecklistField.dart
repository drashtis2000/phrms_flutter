import 'package:flutter/material.dart';

class ClearanceChecklistField extends StatelessWidget {
  static const String id = "Clearance-Checklist-Field-Screen";

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
            Text("Clearance Checklist"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildChecklistItem("Return company laptop", true),
              _buildChecklistItem("Settle outstanding reimbursements", false),
              _buildChecklistItem("Hand over access card", true),
              _buildChecklistItem("Submit pending expense reports", false),
              _buildChecklistItem("Return office keys", false),
              _buildChecklistItem("Complete exit interview", true),
              // Add more checklist items here
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChecklistItem(String task, bool isCompleted) {
    return ListTile(
      leading: isCompleted
          ? Icon(Icons.check_circle, color: Colors.green)
          : Icon(Icons.circle, color: Colors.red),
      title: Text(task),
    );
  }
}
