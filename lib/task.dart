import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String title;
  final String note;
  bool check;
  double progress;
  DateTime date;

  Task({
    @required this.id,
    @required this.title,
    @required this.note,
    @required this.check,
    @required this.progress,
    @required this.date,
  });
}
