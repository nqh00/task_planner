import 'package:flutter/foundation.dart';

class Task {
  final String title;
  final String note;
  final bool check;
  final double progress;
  final DateTime date;

  Task({
    @required this.title,
    @required this.note,
    @required this.check,
    @required this.progress,
    @required this.date,
  });
}
