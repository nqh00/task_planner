import 'package:flutter/material.dart';
import './task.dart';
import './newtask.dart';
import './tasklist.dart';
import './chart.dart';

void main() => runApp(MyApp());

// This is the main application widget
class MyApp extends StatelessWidget {
  // This widget is the root of your application
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

// This is the stateful widget that the main application instantiates
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// This is the private State class that goes with MyStatefulWidget
class _MyHomePageState extends State<MyHomePage> {
  final List<Task> _tasks = [];

  // This method add new task into the task list
  void _addNewTask(String title, String note, double progress, DateTime date) {
    final _newtsk = Task(
        id: DateTime.now().toString(),
        title: title,
        note: note,
        progress: progress,
        check: false,
        date: date == null
            ? DateTime.now()
            : date); // Instantiate new task with default properties

    setState(() {
      _tasks.add(_newtsk);
    });
  }

  // This method passes a private method to NewTask
  void _startAddNewTask(BuildContext context) => showModalBottomSheet(
        builder: (_) => NewTask(_addNewTask),
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
      );

  // This method set the task progress to hundred percent or reset progress
  void _checkedTask(String id) {
    setState(() {
      for (Task tsk in _tasks) {
        if (tsk.id == id) {
          (tsk.progress == 100) ? tsk.progress = 0 : tsk.progress = 100;
        }
      }
    });
  }

  // This method delete element of tasks with correspond id which is timestamp
  void _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((tsk) => tsk.id == id);
    });
  }

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
      body: Column(
        children: <Widget>[
          Chart(_tasks),
          TaskList(_tasks, _checkedTask, _deleteTask),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTask(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
