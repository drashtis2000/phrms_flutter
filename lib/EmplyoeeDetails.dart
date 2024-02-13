import 'package:flutter/material.dart';
import 'package:phrms/EmplyoeeManagement.dart';

class EmplyoeeDetails extends StatelessWidget {
  static const String id = "Emplyoee-Field-Details";

  final EmplyoeeItem? item;

  EmplyoeeDetails([this.item]);

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
