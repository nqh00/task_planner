import 'package:flutter/material.dart';
import './task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  TaskList(this.tasks);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      child: tasks.isEmpty
          ? Container(
              child: Text(
                'No tasks available.',
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Card(
                        child: Icon(
                          Icons.check_box_outline_blank_rounded,
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(children: <Widget>[
                          Text(
                            '${tasks[index].title}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${tasks[index].note}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                );
              },
              itemCount: tasks.length,
            ),
    );
  }
}
