import 'package:flutter/material.dart';

class CommunicateField extends StatelessWidget {
  static const String id = "Communicate-Field-Screen";

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
            Text("Communication"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCommunicationInfo(),
              SizedBox(height: 20),
              _buildNotesInput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommunicationInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Effective Communication in the Workplace",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Communication plays a vital role in a successful workplace. Here are some key points:",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 5),
        _buildCommunicationPoint("1. Clear and Concise Messaging"),
        _buildCommunicationPoint("2. Active Listening"),
        _buildCommunicationPoint("3. Open and Honest Communication"),
        _buildCommunicationPoint("4. Use of Technology for Communication"),
        _buildCommunicationPoint("5. Feedback and Recognition"),
        SizedBox(height: 10),
        Text(
          "Effective communication fosters collaboration and ensures that everyone is on the same page. It helps in resolving conflicts and promoting a positive work environment.",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildCommunicationPoint(String point) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 18,
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              point,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Notes and Comments",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          maxLines: 5,
          decoration: InputDecoration(
            hintText: "Enter your notes or comments here...",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
