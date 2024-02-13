import 'package:flutter/material.dart';
import 'package:phrms/InterviewingField.dart';
import 'package:phrms/MakingOfferField.dart';
import 'package:phrms/ApprovalWorkflows.dart';
import 'CandidateIdentifyingField.dart';

class RecruitmentItem {
  final String title;
  final String identifier;

  
  RecruitmentItem(this.title, this.identifier);
}

List<RecruitmentItem> recruitmentItems = [
  RecruitmentItem("Candidate Identifying", "candidate_identifying"),
  RecruitmentItem("Interviewing", "interviewing"),
  RecruitmentItem("Making an Offer", "making_offer"),
  RecruitmentItem("Management Approval", "management_approval"),
];

class RecruitmentManagement extends StatelessWidget {
  static const String id = "Recruitment-Management-Screen";
  final String userRole;
  const RecruitmentManagement({Key? key, required this.userRole}) : super(key: key);

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
              Text("Recruitment Management"),
            ],
          )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Candidate Identifying",
                  description: "Description of Candidate Identifying...",
                  identifier: "candidate_identifying",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Interviewing",
                  description: "Description of Interviewing...",
                  identifier: "interviewing",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Making an Offer",
                  description: "Description of Making an Offer...",
                  identifier: "Making_Offer",
                ),
                SizedBox(height: 30.0),
                _buildFieldBox(
                  context,
                  title: "Management Approval",
                  description: "Description of Management Approval...",
                  identifier: "Management_Approval",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFieldBox(BuildContext context,
      {required String title, required String description, String? identifier,}) {
    return GestureDetector(
      onTap: () {
        if (identifier == "candidate_identifying") {
          Navigator.pushNamed(context, CandidateIdentifyingField.id);
        } else if (identifier == "interviewing") {
          Navigator.pushNamed(context, InterviewingField.id);
        } else if (identifier == "Making_Offer") {
          Navigator.pushNamed(context, MakingOfferField.id);
        } else if (identifier == "Management_Approval") {
          Navigator.pushNamed(context, ApprovalWorkflows.id);
        }
        else {
          // Handle other sub-modules' navigation
        }
      },
      child: Container(
        padding: EdgeInsets.all(21.0),
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
