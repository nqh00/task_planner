import 'package:flutter/material.dart';
import './task.dart';
import './tasklist.dart';
import './newtask.dart';

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

class MyHomePage extends StatefulWidget {
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _tasks = [
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
        NewTask(),
        TaskList(_tasks),
      ])),
    );
  }
}
