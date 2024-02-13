import 'package:flutter/material.dart';

class ApprovalWorkflows extends StatelessWidget {
  static const String id = "Approval-Workflows-Screen";

  // Sample list of approval workflows (replace with your actual data)
  final List<ApprovalWorkflow> approvalWorkflows = [
    ApprovalWorkflow("Workflow 1", "Department A"),
    ApprovalWorkflow("Workflow 2", "Department B"),
    // Add more approval workflows as needed
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
            Text("Approval Workflows"),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "List of Approval Workflows",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: approvalWorkflows.length,
                itemBuilder: (context, index) {
                  final workflow = approvalWorkflows[index];
                  return _buildApprovalWorkflowCard(context, workflow);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApprovalWorkflowCard(BuildContext context, ApprovalWorkflow workflow) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          _viewWorkflowDetails(context, workflow);
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                workflow.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text("Department: ${workflow.department}"),
            ],
          ),
        ),
      ),
    );
  }

  void _viewWorkflowDetails(BuildContext context, ApprovalWorkflow workflow) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Workflow Details"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Workflow Name: ${workflow.name}"),
              Text("Department: ${workflow.department}"),
              // Add more details as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}

class ApprovalWorkflow {
  final String name;
  final String department;

  ApprovalWorkflow(this.name, this.department);
}
