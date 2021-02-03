import 'package:flutter/foundation.dart';

class Task {
  final String title;
  final String note;
  final bool check;
  final DateTime date;
  Task(
      {@required this.title,
      @required this.check,
      @required this.date,
      this.note});
}
