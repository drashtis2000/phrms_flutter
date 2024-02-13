import 'package:flutter/material.dart';
import 'package:phrms/FeedbackCollectionPage.dart';
import 'package:phrms/InterviewOutcomePage.dart';
import 'package:phrms/InterviewQuestionnairesPage.dart';

class InterviewingField extends StatelessWidget {
  static const String id = "Interviewing-Field";

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
            Text("Interviewing"),
          ],
        ),
      ),
      body: InterviewingWidget(), // Add the InterviewingWidget here
    );
  }
}

class InterviewingWidget extends StatefulWidget {
  @override
  _InterviewingWidgetState createState() => _InterviewingWidgetState();
}

class _InterviewingWidgetState extends State<InterviewingWidget> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _interviewerController = TextEditingController();

  String _interviewResult = "";

  void _scheduleInterview() {
    // Implement your logic to schedule the interview
    String date = _dateController.text;
    String time = _timeController.text;
    String interviewer = _interviewerController.text;

    _saveInterviewDetails(date, time, interviewer);

    // ... add logic to save the interview details and notify stakeholders ...
    _notifyStakeholders(date, time, interviewer);

    setState(() {
      _interviewResult = "Interview scheduled for the $date , at $time , with $interviewer .";
    });
  }

  void _saveInterviewDetails(String date, String time, String interviewer) {
    // Implement logic to save interview details to a database
    // For example, you can use Firestore, SQLite, or any other storage solution
  }

  void _notifyStakeholders(String date, String time, String interviewer) {
    // Implement logic to notify stakeholders (e.g., interviewers, candidates, HR)
    // You can use email, push notifications, or any preferred communication method
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Interview Date'),
            ),
            TextFormField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Interview Time'),
            ),
            TextFormField(
              controller: _interviewerController,
              decoration: InputDecoration(labelText: 'Interviewer Name'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _scheduleInterview,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Schedule Interview'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, InterviewQuestionnairesPage.id);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Interview Questionnaires'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, FeedbackCollectionPage.id);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Feedback Collection'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, InterviewOutcomePage.id);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Interview Outcome'),
            ),
            SizedBox(height: 20),
            Text(_interviewResult),
          ],
        ),
      ),
    );
  }
}
