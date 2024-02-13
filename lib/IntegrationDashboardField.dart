import 'package:flutter/material.dart';

class IntegrationDashboardField extends StatelessWidget {
  static const String id = "Integration-Dashboard-Field";

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
            Text("Integration Dashboard"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              "Integration Status Dashboard",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            _buildTable(), // Call the function to build the table
          ],
        ),
      ),
    );
  }

  Widget _buildTable() {
    // Example data for the table
    List<Map<String, dynamic>> tableData = [
      {"Name": "Integration 1", "Status": "Success"},
      {"Name": "Integration 2", "Status": "Failure"},
      {"Name": "Integration 3", "Status": "Success"},
      {"Name": "Integration 4", "Status": "Pending"},
    ];

    return DataTable(
      columns: <DataColumn>[
        DataColumn(label: Text('Integration Name')),
        DataColumn(label: Text('Status')),
      ],
      rows: tableData
          .map(
            (data) => DataRow(
          cells: <DataCell>[
            DataCell(Text(data['Name'])),
            DataCell(Text(data['Status'])),
          ],
        ),
      )
          .toList(),
    );
  }
}
