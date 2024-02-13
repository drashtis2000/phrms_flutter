import 'package:flutter/material.dart';

class ProjectAssignmentField extends StatelessWidget {
  static const String id = "ProjectAssignmentField";

  // Sample list of projects (replace with your data)
  final List<Project> projects = [
    Project('Project A', 'Description of Project A', 'In Progress'),
    Project('Project B', 'Description of Project B', 'Completed'),
    Project('Project C', 'Description of Project C', 'In Progress'),
    // Add more projects as needed
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
            Text("Project Assignment"),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 2.0,
              child: ListTile(
                title: Text(project.name),
                subtitle: Text(project.description),
                trailing: Text(project.status),
                onTap: () {
                  // Handle tapping on a project (e.g., navigate to project details)
                  // You can create a separate ProjectDetails page for displaying project details.
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class Project {
  final String name;
  final String description;
  final String status;

  Project(this.name, this.description, this.status);
}

void main() {
  runApp(MaterialApp(
    home: ProjectAssignmentField(),
  ));
}
