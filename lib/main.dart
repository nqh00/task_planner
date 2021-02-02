import 'package:flutter/material.dart';
import './task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Task> tasks = [
    Task(title: 'Name of your task', note: 'Detail of your task', check: false),
  ];
  // This widget is the home page of this application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TASK PLANNER'),
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Card(
          child: Container(
            child: Text('CHART', textAlign: TextAlign.center),
          ),
        ),
        Card(
          child: Column(children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Name your task'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Tell us more'),
            ),
            RaisedButton(child: Text('ADD'), onPressed: () {}),
          ]),
        ),
        Card(
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
        ),
      ])),
    );
  }
}
