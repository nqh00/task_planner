import 'package:flutter/material.dart';
import './task.dart';
import './barchart.dart';

class Chart extends StatelessWidget {
  final List<Task> recentTasks;

  Chart(this.recentTasks);

  // This getter method group all the tasks
  // Then return a map with week date and the correspond task
  List<Map<String, Object>> get groupedTaskValue {
    List<double> progress = [0, 0, 0, 0, 0, 0, 0];
    List<int> total = [0, 0, 0, 0, 0, 0, 0];

    for (Task tsk in recentTasks) {
      for (int i = 0; i < 7; i++) {
        if (tsk.date.weekday == (i + 1)) {
          progress[i] += tsk.progress;
          total[i]++;
        }
      }
    }
    return [
      {'day': 'Mon', 'progress': progress[0], 'total': total[0]},
      {'day': 'Tues', 'progress': progress[1], 'total': total[1]},
      {'day': 'Wed', 'progress': progress[2], 'total': total[2]},
      {'day': 'Thu', 'progress': progress[3], 'total': total[3]},
      {'day': 'Fri', 'progress': progress[4], 'total': total[4]},
      {'day': 'Sat', 'progress': progress[5], 'total': total[5]},
      {'day': 'Sun', 'progress': progress[6], 'total': total[6]}
    ];
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
