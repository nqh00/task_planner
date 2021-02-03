import 'package:flutter/material.dart';
import './task.dart';
import './barchart.dart';

class Chart extends StatelessWidget {
  final List<Task> recentTasks;

  Chart(this.recentTasks);

  // This getter method group all the tasks
  // Then return a map with week date and the correspond task
  List<Map<String, Object>> get groupedTaskValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double progress = 0;

      for (int i = 0; i < recentTasks.length; i++) {
        if (recentTasks[i].date.weekday == weekDay.weekday) {
          progress += recentTasks[i].progress;
        }
      }

      return {
        'day': '${weekDay.weekday}',
        'progress': progress,
        'total': recentTasks.length
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: groupedTaskValue.map((taskValue) {
          return Bar(
              weekDate: taskValue['day'],
              progress: taskValue['progress'],
              total: taskValue['total']);
        }).toList(),
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}
