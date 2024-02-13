import 'package:flutter/material.dart';

class TimeSheet {
  final String id;
  final String userId;
  final String placement;
  final DateTime startDate;
  final DateTime endDate;
  final String status;

  TimeSheet({
    required this.id,
    required this.userId,
    required this.placement,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}
