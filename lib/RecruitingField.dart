import 'package:flutter/material.dart';
import 'package:phrms/BackgroundChecksPage.dart';
import 'package:phrms/CommunicationPageR.dart';

import 'ApplicationTrackingPage.dart';

class RecruitingField extends StatefulWidget {
  static const String id = "RecruitingField";

  @override
  _RecruitingState createState() => _RecruitingState();
}

class _RecruitingState extends State<RecruitingField> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _jobDescriptionController = TextEditingController();
  final TextEditingController _qualificationsController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

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
              Text("Recruiting"),
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _jobTitleController,
                decoration: InputDecoration(labelText: 'Job Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a job title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jobDescriptionController,
                decoration: InputDecoration(labelText: 'Job Description'),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a job description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _qualificationsController,
                decoration: InputDecoration(labelText: 'Qualifications'),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter qualifications';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, you can save the job posting data here
                    final jobTitle = _jobTitleController.text;
                    final jobDescription = _jobDescriptionController.text;
                    final qualifications = _qualificationsController.text;
                    final location = _locationController.text;

                    // You can now save this data or send it to your backend system
                    // Implement your logic here
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Post Job'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Application Tracking page
                  Navigator.pushNamed(context, ApplicationTrackingPage.id);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Application Tracking'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Application Tracking page
                  Navigator.pushNamed(context, BackgroundChecksPage.id);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Background Checks'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Application Tracking page
                  Navigator.pushNamed(context, CommunicationPageR.id);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('Communication'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
