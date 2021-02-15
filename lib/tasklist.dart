import 'package:flutter/material.dart';
import './task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function checkTaskController;
  final Function deleteTaskController;
  TaskList(this.tasks, this.checkTaskController, this.deleteTaskController);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      child: tasks.isEmpty
          ? Container(
              child: Text(
                'No tasks available.',
                textAlign: TextAlign.center,
              ), // Display when theres no tasks
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: IconButton(
                      icon: (tasks[index].progress == 100)
                          ? Icon(
                              Icons.check_box_rounded,
                              color: Theme.of(context).shadowColor,
                            )
                          : Icon(
                              Icons.check_box_outline_blank_rounded,
                              color: Theme.of(context).shadowColor,
                            ),
                      onPressed: () => checkTaskController(tasks[index].id),
                    ), // Checkbox button
                    title: Text(
                      '${tasks[index].title}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ), // Task title
                    subtitle: Text(
                      '${tasks[index].note}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontStyle: FontStyle.italic,
                      ),
                    ), // Task note
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTaskController(tasks[index].id),
                    ),
                  ), // Delete button
                  elevation: 5,
                );
              },
              itemCount: tasks.length,
            ),
    );
  }
}
