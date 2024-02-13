import 'package:flutter/material.dart';

import 'DataMappingField.dart';
import 'IntegrationConfigurationField.dart';
import 'IntegrationDashboardField.dart';
import 'IntegrationLogsField.dart';
import 'IntegrationTestingField.dart';

class IntegrationItem {
  final String title;
  final String identifier;

  IntegrationItem(this.title, this.identifier);
}

List<IntegrationItem> integrationItems = [
  IntegrationItem("Integration Configuration", "integration_configuration"),
  IntegrationItem("Data Mapping", "data_mapping"),
  IntegrationItem("Integration Logs", "integration_logs"),
  IntegrationItem("Integration Testing", "integration_testing"),
  IntegrationItem("Integration Status Dashboard", "integration_dashboard"),
];

class IntegrationManagement extends StatelessWidget {
  static const String id = "Integration-Management-Screen";

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
            Text("Integration Management"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _buildIntegrationItems(context),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildIntegrationItems(BuildContext context) {
    List<Widget> widgets = [];
    for (var item in integrationItems) {
      widgets.add(_buildFieldBox(
        context,
        title: item.title,
        description: "Description of ${item.title}...",
        identifier: item.identifier,
      ));
      widgets.add(SizedBox(height: 30.0));
    }
    return widgets;
  }

  Widget _buildFieldBox(BuildContext context,
      {required String title, required String description, required String identifier}) {
    return GestureDetector(
      onTap: () {
        if (identifier == "integration_configuration") {
           Navigator.pushNamed(context, IntegrationConfigurationField.id);
        } else if (identifier == "data_mapping") {
           Navigator.pushNamed(context, DataMappingField.id);
        } else if (identifier == "integration_logs") {
           Navigator.pushNamed(context, IntegrationLogsField.id);
        } else if (identifier == "integration_testing") {
           Navigator.pushNamed(context, IntegrationTestingField.id);
        } else if (identifier == "integration_dashboard") {
           Navigator.pushNamed(context, IntegrationDashboardField.id);
        } else {
          // Handle other sub-modules' navigation
        }
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
