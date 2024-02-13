import 'package:flutter/material.dart';

class IntegrationLogsField extends StatefulWidget {
  static const String id = "Integration-Logs-Field";

  @override
  _IntegrationLogsFieldState createState() => _IntegrationLogsFieldState();
}

class IntegrationLog {
  final String timestamp;
  final String message;
  final String status;

  IntegrationLog(this.timestamp, this.message, this.status);
}

List<IntegrationLog> integrationLogs = [
  IntegrationLog("2023-09-01 10:30 AM", "Integration successful", "Success"),
  IntegrationLog("2023-09-02 02:45 PM", "Integration failed", "Failed"),
  // Add more log entries here
];

class _IntegrationLogsFieldState extends State<IntegrationLogsField> {
  String filterStatus = "All"; // Default filter status

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
            Text("Integration Logs"),
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
              "Integration Logs",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            _buildFilterDropdown(),
            SizedBox(height: 20.0),
            _buildLogList(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Filter by Status:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          value: filterStatus,
          onChanged: (String? newValue) {
            setState(() {
              filterStatus = newValue!;
            });
          },
          items: <String>['All', 'Success', 'Failed', 'In Progress']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLogList() {
    List<IntegrationLog> filteredLogs = integrationLogs;
    if (filterStatus != 'All') {
      filteredLogs = integrationLogs
          .where((log) => log.status == filterStatus)
          .toList();
    }

    return Expanded(
      child: ListView.builder(
        itemCount: filteredLogs.length,
        itemBuilder: (BuildContext context, int index) {
          IntegrationLog log = filteredLogs[index];
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text(log.timestamp),
              subtitle: Text(log.message),
              trailing: Chip(
                label: Text(log.status),
                backgroundColor: _getStatusColor(log.status),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Success":
        return Colors.green;
      case "Failed":
        return Colors.red;
      case "In Progress":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

