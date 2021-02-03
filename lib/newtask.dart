import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  final Function taskController;

  NewTask(this.taskController);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Name your task'),
          controller: titleController,
          keyboardType: TextInputType.text,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Tell us more'),
          controller: noteController,
          keyboardType: TextInputType.text,
        ),
        RaisedButton(
          child: Text('ADD'),
          onPressed: () {taskController(titleController.text, noteController.text);},
        ),
      ]),
    );
  }
}
