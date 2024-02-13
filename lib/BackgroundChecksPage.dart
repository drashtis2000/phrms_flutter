import 'package:flutter/material.dart';

class BackgroundChecksPage extends StatefulWidget {
  static const String id = "BackgroundChecksPage";

  @override
  _BackgroundChecksPageState createState() => _BackgroundChecksPageState();
}

class _BackgroundChecksPageState extends State<BackgroundChecksPage> {
  // Add your state variables and logic for background checks here

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
              Text("Background Checks"),
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Background Checks List',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // You can add a list of background checks here
            // Display each background check with details like applicant name, status, etc.
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement navigation or actions for adding new background checks
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
