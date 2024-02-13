import 'package:flutter/material.dart';
import 'package:phrms/ResourceAllocationField.dart';
import 'package:phrms/ResourceTrackingField.dart';
import 'package:phrms/ResourceRequestsField.dart';
import 'package:phrms/ResourceInventoryField.dart';

class ResourceItem {
  final String title;
  final String identifier;

  ResourceItem(this.title, this.identifier);
}

List<ResourceItem> resourceItems = [
  ResourceItem("Resource Allocation", "resource_allocation"),
  ResourceItem("Resource Tracking", "resource_tracking"),
  ResourceItem("Resource Requests", "resource_requests"),
  ResourceItem("Resource Inventory", "resource_inventory"),
];

class ResourceManagement extends StatelessWidget {
  static const String id = "Resource-Management-Screen";

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
            Text("Resource Management"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10.0),
                _buildFieldBox(
                  context,
                  title: "Resource Allocation",
                  description: "Description of Resource Allocation...",
                  identifier: "resource_allocation",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Resource Tracking",
                  description: "Description of Resource Tracking...",
                  identifier: "resource_tracking",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Resource Requests",
                  description: "Description of Resource Requests...",
                  identifier: "resource_requests",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Resource Inventory",
                  description: "Description of Resource Inventory...",
                  identifier: "resource_inventory",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldBox(BuildContext context, {required String title, required String description, required String identifier}) {
    return GestureDetector(
      onTap: () {
        if (identifier == "resource_allocation") {
          Navigator.pushNamed(context, ResourceAllocationField.id);
        } else if (identifier == "resource_tracking") {
          Navigator.pushNamed(context, ResourceTrackingField.id);
        } else if (identifier == "resource_requests") {
          Navigator.pushNamed(context, ResourceRequestsField.id);
        } else if (identifier == "resource_inventory") {
          Navigator.pushNamed(context, ResourceInventoryField.id);
        } else {
          // Handle other resource management sub-modules' navigation
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

