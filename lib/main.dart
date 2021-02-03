import 'package:flutter/material.dart';
import './usertask.dart';

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
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        UserTask(),
      ])),
    );
  }
}
