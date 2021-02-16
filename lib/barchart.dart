import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String weekDate;
  final double progress;
  final int total;

  Bar({@required this.weekDate, @required this.progress, @required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 5), // A blank of space
      FittedBox(
        child: Text(
          total == 0 ? '0%' : (progress / total).toStringAsFixed(0) + '\%',
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
          ),
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
                  color: Theme.of(context).primaryColorDark,
                  width: 2,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ), // An empty bar chart
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: total == 0 ? 0 : progress / (100 * total),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ), // A percentage bar chart that stack over previous widget
          ])), // A bar chart contain empty bar and percentage bar
      SizedBox(height: 5), // A blank of space
      Text(
        weekDate,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColorDark,
        ),
      ), // A letter of date
      SizedBox(height: 5), // A blank of space
    ]);
  }
}
