import 'package:flutter/material.dart';
import './task.dart';
import './newtask.dart';
import './tasklist.dart';
import './chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _tasks = [];

  // This method extract the recently added task from the task list.
  // The range is within 7 days from now.
  List<Task> get _recentTasks {
    return _tasks.where((tsk) {
      return tsk.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  // This method add new task into the task list
  void _addNewTask(String title, String note) {
    final _newtsk = Task(
        title: title,
        note: note,
        progress: 0,
        check: false,
        date: DateTime.now()); // Instantiate new task with default properties

    setState(() {
      _tasks.add(_newtsk);
    });
  }

  // This method passes a private method to NewTask
  void _startAddNewTask(BuildContext context) => showModalBottomSheet(
      builder: (_) => NewTask(_addNewTask), context: context);

  // This widget is the home page of this application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TASK PLANNER'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTask(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(_recentTasks),
            TaskList(_tasks),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTask(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
