import 'package:flutter/foundation.dart';

class Task {
  final String title;
  String note;
  final bool check;
  DateTime date;
  Task(
      {@required this.title,
      @required this.check,
      @required this.date,
      this.note});
}
