import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Name your task'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Tell us more'),
        ),
        RaisedButton(child: Text('ADD'), onPressed: () {}),
      ]),
    );
  }
}
