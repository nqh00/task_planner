import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  final Function _taskController;
  NewTask(this._taskController);
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();
  DateTime _pickedDate;
  double _currentSliderProgress = 0;

  // This method submit the input and store the values in NewTask Object
  void submitted() {
    final String titleInput = _titleController.text;
    final String noteInput = _noteController.text;

    if (titleInput.isEmpty) return;

    widget._taskController(titleInput, noteInput, _currentSliderProgress,
        _pickedDate); // user widget to access private class State

    Navigator.of(context).pop(); // Close keyboard after submitted input
  }

  // This method show Date Picker on the screen
  void _openDatePicker() {
    showDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now(),
            context: context)
        .then((future) {
      if (future == null) return;

      setState(() {
        _pickedDate = future;
      });
    }); // then() will not be waited for user input date
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(children: <Widget>[
          Container(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name your task',
              ),
              controller: _titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitted,
            ),
            padding: EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
              bottom: 15,
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tell us more',
              ),
              controller: _noteController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitted,
            ),
            padding: EdgeInsets.all(15),
          ),
          Container(
            child: Slider(
              value: _currentSliderProgress,
              min: 0,
              max: 100,
              divisions: 100,
              label: 'Progress: ${_currentSliderProgress.round()}',
              onChanged: (progress) => setState(() {
                _currentSliderProgress = progress;
              }),
            ),
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
          ),
          Row(
            children: <Widget>[
              Card(
                child: Text(
                  (_pickedDate == null)
                      ? 'No date chosen.'
                      : '${_pickedDate.day} / ${_pickedDate.month} / ${_pickedDate.year}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 15,
                  ),
                ),
              ),
              FlatButton(
                child: Text('Choose date.'),
                textColor: Theme.of(context).primaryColorDark,
                onPressed: _openDatePicker,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          RaisedButton(
            child: Text('ADD'),
            color: Theme.of(context).primaryColorDark,
            textColor: Theme.of(context).primaryColorLight,
            onPressed: submitted,
          ),
        ]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
      ),
      padding: EdgeInsets.all(5),
      // margin: EdgeInsets.all(2),
    );
  }
}
