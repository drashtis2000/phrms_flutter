import 'package:flutter/material.dart';

class ResourceAllocationField extends StatefulWidget {
  static const String id = "Resource-Allocation-Field";

  @override
  _ResourceAllocationFieldState createState() => _ResourceAllocationFieldState();
}

class _ResourceAllocationFieldState extends State<ResourceAllocationField> {
  TextEditingController resourceController = TextEditingController();
  TextEditingController projectController = TextEditingController();

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
            Text("Resource Allocation"),
          ],
        )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Text(
                "Resource Allocation Form",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: resourceController,
                decoration: InputDecoration(labelText: "Resource Name"),
              ),
              TextFormField(
                controller: projectController,
                decoration: InputDecoration(labelText: "Project Name"),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  // Implement logic to allocate the specified resource to the project
                  String resourceName = resourceController.text;
                  String projectName = projectController.text;
                  // Perform resource allocation and provide user feedback.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("$resourceName allocated to $projectName."),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text("Allocate Resource"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
