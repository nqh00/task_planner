import 'package:flutter/material.dart';
import './task.dart';

class Chart extends StatelessWidget {
  final List<Task> recentTasks;

  Chart(this.recentTasks);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: recentTasks.map((tsk) {
          return Row(children: <Widget>[
            Card(
              child: Text(
                '$recentTasks',
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }
}
