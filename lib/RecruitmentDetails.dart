import 'package:flutter/material.dart';
import 'RecruitmentManagement.dart';

class RecruitmentDetails extends StatelessWidget {
  static const String id = "Recruitment-Field-Details";

  final RecruitmentItem? item;

  RecruitmentDetails([this.item]);

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
            Text(item!.title),
          ],
        ),
      ),
      body: Center(
        child: Text("Details for ${item?.title}"),
      ),
    );
  }
}
