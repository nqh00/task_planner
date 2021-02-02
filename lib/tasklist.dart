import 'package:flutter/material.dart';
import './task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  TaskList(this.tasks);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: tasks.map((tsk) {
          return Row(
            children: <Widget>[
              Card(
                child: Text('${tsk.check}'),
              ),
              Column(children: <Widget>[
                Text('${tsk.title}'),
                Text('${tsk.note}'),
              ]),
            ],
          );
        }).toList(),
      ),
    );
  }
}
