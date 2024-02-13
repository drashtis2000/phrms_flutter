import 'package:flutter/material.dart';
import 'package:phrms/NotificationPage.dart';

class ManagerApprovalField extends StatefulWidget {
  static const String id = "ManagerApprovalField";

  @override
  _ManagerApprovalFieldState createState() => _ManagerApprovalFieldState();
}

class LegalApproval {
  final String documentName;
  final String status;

  LegalApproval(this.documentName, this.status);
}

class _ManagerApprovalFieldState extends State<ManagerApprovalField> {
  // Sample list of legal approvals (you can replace this with your data)
  List<LegalApproval> legalApprovals = [
    LegalApproval('Contract 1', 'Pending'),
    LegalApproval('Contract 2', 'Approved'),
    LegalApproval('Contract 3', 'Rejected'),
  ];

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
            SizedBox(width: 10),
            Text("Manager Approval"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manager Approval',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: legalApprovals.length,
                itemBuilder: (BuildContext context, int index) {
                  LegalApproval approval = legalApprovals[index];
                  return _buildApprovalCard(approval);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, NotificationsPage.id);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Notifications'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApprovalCard(LegalApproval approval) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(approval.documentName),
        subtitle: Text('Status: ${approval.status}'),
        trailing: PopupMenuButton<String>(
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'approve',
              child: Text('Approve'),
            ),
            PopupMenuItem(
              value: 'reject',
              child: Text('Reject'),
            ),
          ],
          onSelected: (value) {
            // Handle approval or rejection based on the selected option
            if (value == 'approve') {
              // Implement approval logic
            } else if (value == 'reject') {
              // Implement rejection logic
            }
          },
        ),
      ),
    );
  }
}
