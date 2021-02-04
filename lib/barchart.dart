import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String weekDate;
  final double progress;
  final int total;

  Bar({@required this.weekDate, @required this.progress, @required this.total});

  // This method calculate the different percentage value of the progress
  double diff(double progress, int totalTask) {
    return (total == 0) ? 0 : (progress / (100 * total));
  }

  // This method return date with correspond letter
  String date(String weekdate) {
    switch (weekdate) {
      case '1':
        return 'Mon';
        break;
      case '2':
        return 'Tues';
        break;
      case '3':
        return 'Wed';
        break;
      case '4':
        return 'Thu';
        break;
      case '5':
        return 'Fri';
        break;
      case '6':
        return 'Sat';
        break;
      case '7':
        return 'Sun';
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 5), // A blank of space
      FittedBox(
        child: Text(
          (diff(progress, total) * 100).toStringAsFixed(0) + '\%',
        ),
      ), // A box widget displaying progress' percentage
      SizedBox(height: 5), // A blank of space
      Container(
          height: 100,
          width: 40,
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ), // An empty bar chart
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: diff(progress, total),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ), // A percentage bar chart that stack over previous widget
          ])), // A bar chart contain empty bar and percentage bar
      SizedBox(height: 5), // A blank of space
      Text(date(weekDate)), // A letter of date
      SizedBox(height: 5), // A blank of space
    ]);
  }
}
