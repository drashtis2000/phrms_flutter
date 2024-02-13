import 'package:flutter/material.dart';

class LeaveApprovalsPage extends StatelessWidget {
  static const String id = "LeaveApprovalsPage";

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
            Text("Leave Approvals"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Leave Approvals",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Add UI elements related to leave approvals
            _buildLeaveApprovalList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaveApprovalList(BuildContext context) {
    // Replace this with the logic to fetch and display a list of leave approval requests.
    // Each request should include details such as employee name, leave type, dates, and an approval button.

    // Example of a single leave approval request widget:
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text("MJM America - Vacation Leave"),
        subtitle: Text("Dates: 2023-09-10 to 2023-09-15"),
        trailing: ElevatedButton(
          onPressed: () {
            // Implement code to approve the leave request
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          child: Text("Approve"),
        ),
      ),
    );
  }
}
