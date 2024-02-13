import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminTimesheetApprovalPage extends StatelessWidget {
  static const String id = "AdminTimesheetApprovalPage";

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
            Text("Admin TimeSheet Approval"),
          ],
        ),
      ),
      body: TimesheetList(),
    );
  }
}

class TimesheetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('timesheets').where('status', isEqualTo: 'Pending').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print('Connection state: Waiting');
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          print('No data or empty');
          return Center(child: Text('No pending timesheets available.'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final timesheet = snapshot.data!.docs[index];
            return TimesheetItemWidget(timesheet: timesheet);
          },
        );
      },
    );
  }
}

class TimesheetItemWidget extends StatelessWidget {
  final DocumentSnapshot timesheet;

  TimesheetItemWidget({required this.timesheet});

  @override
  Widget build(BuildContext context) {
    final data = timesheet.data() as Map<String, dynamic>?;
    if (data == null) {
      // Handle the case where 'data' is null
      return Container(); // Or any other widget
    }

    final placement = data['placement'] as String?;
    final weekStartDate = data['weekStartDate'] as String?;

    if (placement == null || weekStartDate == null) {
      // Handle the case where 'placement' or 'weekStartDate' is null
      return Container(); // Or any other widget
    }

    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(data['placement']),
        subtitle: Text('Week starting on: ${data['weekStartDate']}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Approve logic here
                await timesheet.reference.update({'status': 'Approved'});
              },
              child: Text('Approve'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () async {
                // Reject logic here
                await timesheet.reference.update({'status': 'Rejected'});
              },
              child: Text('Reject'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AdminTimesheetApprovalPage(),
  ));
}

