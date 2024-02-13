import 'package:flutter/material.dart';
import 'package:phrms/ExitManagement.dart';

class ExitDetails extends StatelessWidget {
  static const String id = "Exit-Field-Details";

  final ExitItem? item;

  ExitDetails([this.item]);

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
