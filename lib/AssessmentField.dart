import 'package:flutter/material.dart';

class AssessmentField extends StatefulWidget {
  static const String id = "AssessmentField";

  @override
  _AssessmentFieldState createState() => _AssessmentFieldState();
}

class _AssessmentFieldState extends State<AssessmentField> {
  // Define a list of competencies and their initial ratings
  List<Competency> competencies = [
    Competency(name: "Communication Skills", rating: 4),
    Competency(name: "Problem Solving", rating: 3),
    Competency(name: "Teamwork", rating: 5),
    // Add more competencies as needed
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
            Text("Competency Assessment"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: competencies.length,
          itemBuilder: (context, index) {
            final competency = competencies[index];
            return _buildCompetencyItem(competency);
          },
        ),
      ),
    );
  }

  Widget _buildCompetencyItem(Competency competency) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            competency.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Rating: ${competency.rating}",
            style: TextStyle(fontSize: 16),
          ),
          // Implement a rating scale widget here (e.g., Slider or RadioButtons)
          // Update the competency.rating based on user input
        ],
      ),
    );
  }
}

class Competency {
  final String name;
  int rating;

  Competency({required this.name, required this.rating});
}
