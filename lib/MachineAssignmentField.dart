import 'package:flutter/material.dart';
import 'package:phrms/ReportingPage.dart';

class MachineAssignmentField extends StatelessWidget {
  static const String id = "MachineAssignmentField";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/microsoftteamsimage.png',
              width: 40,
            ),
            SizedBox(width: 10),
            Text("Machine Assignment"),
          ],
        ),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle adding new machine assignment
              // You can open a dialog or navigate to another page for adding assignments.
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Machine Assignment',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: _buildMachineAssignmentList(),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Application Tracking page
                Navigator.pushNamed(context, ReportingField.id);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Reporting'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMachineAssignmentList() {
    // Replace this with your actual machine assignment list
    List<MachineAssignmentItem> machineAssignments = getMachineAssignments();

    if (machineAssignments.isEmpty) {
      return Center(
        child: Text("No machine assignments available."),
      );
    }

    return ListView.builder(
      itemCount: machineAssignments.length,
      itemBuilder: (BuildContext context, int index) {
        MachineAssignmentItem machine = machineAssignments[index];

        return ListTile(
          title: Text(machine.name),
          subtitle: Text('Assigned to: ${machine.assignedTo}'),
          trailing: Text(machine.status),
          onTap: () {
            // Handle tapping on a machine assignment (e.g., navigate to details)
          },
        );
      },
    );
  }

  List<MachineAssignmentItem> getMachineAssignments() {
    // Replace this with your actual machine assignment data
    return [
      MachineAssignmentItem('Laptop', 'Drashti Satvara', 'Assigned'),
      MachineAssignmentItem('Desktop', 'MjM America', 'Assigned'),
      MachineAssignmentItem('Printer', 'PHRMS', 'Available'),
      // Add more machine assignments as needed
    ];
  }
}

class MachineAssignmentItem {
  final String name;
  final String assignedTo;
  final String status;

  MachineAssignmentItem(this.name, this.assignedTo, this.status);
}

void main() {
  runApp(MaterialApp(
    home: MachineAssignmentField(),
  ));
}
