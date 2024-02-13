import 'package:flutter/material.dart';
import 'package:phrms/AppraisalField.dart';
import 'package:phrms/AppreciationField.dart';
import 'package:phrms/AssessmentField.dart';
import 'package:phrms/EvaluationField.dart';
import 'package:phrms/FeedbackField.dart';
import 'package:phrms/RatingField.dart';

class PerformanceItem {
  final String title;
  final String identifier;

  PerformanceItem(this.title, this.identifier);
}

List<PerformanceItem> performanceItems = [
  PerformanceItem("Evaluation", "evaluation"),
  PerformanceItem("Assessment", "assessment"),
  PerformanceItem("Rating", "rating"),
  PerformanceItem("Feedback", "feedback"),
  PerformanceItem("Appreciation", "appreciation"),
  PerformanceItem("Appraisal", "appraisal"),
];

class PerformanceManagement extends StatelessWidget {
  static const String id = "Performance-Management-Screen";

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
              Text("Performance Management"),
            ],
          )
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
                  title: "Evaluation",
                  description: "Description of Evaluation...",
                  identifier: "evaluation",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Assessment",
                  description: "Description of Assessment...",
                  identifier: "assessment",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Rating",
                  description: "Description of Rating...",
                  identifier: "rating",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Feedback",
                  description: "Description of Feedback...",
                  identifier: "feedback",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Appreciation",
                  description: "Description of Appreciation...",
                  identifier: "appreciation",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Appraisal  ",
                  description: "Description of Appraisal...",
                  identifier: "appraisal",
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
        if (identifier == "evaluation") {
          Navigator.pushNamed(context, EvaluationField.id);
        } else if (identifier == "assessment") {
          Navigator.pushNamed(context, AssessmentField.id);
        } else if (identifier == "rating") {
          Navigator.pushNamed(context, RatingField.id);
        } else if (identifier == "feedback") {
          Navigator.pushNamed(context, FeedbackField.id);
        } else if (identifier == "appreciation") {
          Navigator.pushNamed(context, AppreciationField.id);
        } else if (identifier == "appraisal") {
          Navigator.pushNamed(context, AppraisalField.id);
        }
        else {
          // Handle other sub-modules' navigation
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
