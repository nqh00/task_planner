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
                elevation: 5,
              ),
              Container(
                child: Column(children: <Widget>[
                  Text(
                    '${tsk.title}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  Text(
                    '${tsk.note}',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ]),
                padding: EdgeInsets.all(20),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          );
        }).toList(),
      ),
    );
  }
}
