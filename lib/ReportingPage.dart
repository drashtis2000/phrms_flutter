import 'package:flutter/material.dart';

class ReportingField extends StatelessWidget {
  static const String id = "ReportingField";

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
            Text("Notifications"),
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reporting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildReportingOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildReportingOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text("Generate Employee Report"),
          leading: Icon(Icons.person),
          onTap: () {
            // Implement logic to generate an employee report
          },
        ),
        ListTile(
          title: Text("Generate Machine Assignment Report"),
          leading: Icon(Icons.computer),
          onTap: () {
            // Implement logic to generate a machine assignment report
          },
        ),
        ListTile(
          title: Text("Generate Policy Compliance Report"),
          leading: Icon(Icons.library_books),
          onTap: () {
            // Implement logic to generate a policy compliance report
          },
        ),
        // Add more reporting options as needed
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ReportingField(),
  ));
}
