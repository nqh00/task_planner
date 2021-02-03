import 'package:flutter/material.dart';
import './task.dart';
import './tasklist.dart';
import './newtask.dart';

class UserTask extends StatefulWidget {
  @override
  _UserTaskState createState() => _UserTaskState();
}

class _UserTaskState extends State<UserTask> {
  final List<Task> _tasks = [];

  // This method add new task into the task list
  void _addNewTask(String title, String note) {
    final _newtsk = Task(
        title: title,
        note: note,
        check: false,
        date: DateTime.now()); // Instantiate new task with default properties

    setState(() {
      _tasks.add(_newtsk);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[NewTask(_addNewTask), TaskList(_tasks)]);
  }
}
