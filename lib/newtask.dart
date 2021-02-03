import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  final Function taskController;

  NewTask(this.taskController);

  // This method submit the input and store the values in NewTask Object
  void submitted(BuildContext context) {
    final String titleInput = titleController.text;
    final String noteInput = noteController.text;

    if (titleInput.isEmpty) return;

    taskController(titleInput, noteInput);

    Navigator.of(context).pop(); // Close keyboard after submitted input
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Name your task'),
          controller: titleController,
          keyboardType: TextInputType.text,
          onSubmitted: (_) => submitted(context),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Tell us more'),
          controller: noteController,
          keyboardType: TextInputType.text,
          onSubmitted: (_) => submitted(context),
        ),
        RaisedButton(
          child: Text('ADD'),
          onPressed: () => submitted(context),
        ),
      ]),
    );
  }
}
