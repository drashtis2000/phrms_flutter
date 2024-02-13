import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'CommunicationPage.dart';
import 'ResumeSubmissionPage.dart';
import 'SearchFilterPage.dart';

class CandidateIdentifyingField extends StatelessWidget {
  static const String id = "Candidate-Identifying-Field";

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _submitJobPosting(BuildContext context) {
    final jobData = {
      'title': _titleController.text,
      'description': _descriptionController.text,
      // ... add more fields ...
    };

    FirebaseFirestore.instance.collection('jobPostings').add(jobData);

    _titleController.clear();
    _descriptionController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Job Posted Successfully')),
    );
  }

  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
  }


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
            Text("Candidate Identifying"),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Job Title'),
                  controller: _titleController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  controller: _descriptionController,
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    // Submit job posting form
                    _submitJobPosting(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text('Post Job'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle resume/CV submission
                    Navigator.pushNamed(context, ResumeSubmissionPage.id);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text('Submit Resume/CV'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchFilterPage.id);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text('Search and Filter'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CommunicationPage.id);
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
      ),
    );
  }
}
