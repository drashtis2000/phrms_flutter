import 'package:flutter/material.dart';

class ApplicationTrackingPage extends StatefulWidget {
  static const String id = "ApplicationTrackingPage";

  @override
  _ApplicationTrackingPageState createState() => _ApplicationTrackingPageState();
}

class _ApplicationTrackingPageState extends State<ApplicationTrackingPage> {
  // You can add your state variables and logic for application tracking here

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
              Text("Application Tracking"),
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Job Applications',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // You can add a list of job applications here
            // You can display each application with details like applicant name, job title, status, etc.
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement navigation or actions for adding new job applications
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
