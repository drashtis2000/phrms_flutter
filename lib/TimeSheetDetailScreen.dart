import 'package:flutter/material.dart';
import 'TimeSheet.dart';


class TimeSheetDetailScreen extends StatelessWidget {
  final TimeSheet timeSheet;

  TimeSheetDetailScreen({required this.timeSheet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Sheet Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Placement: ${timeSheet.placement}'),
            Text('Start Date: ${timeSheet.startDate}'),
            Text('Start Date: ${timeSheet.endDate}'),
            Text('Start Date: ${timeSheet.status}'),
            // Add more details here
          ],
        ),
      ),
    );
  }
}
