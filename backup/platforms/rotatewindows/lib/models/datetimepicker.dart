import 'dart:async';

import 'package:flutter/material.dart';

class RotateDateTime extends StatefulWidget {
  const RotateDateTime({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RotateDateTimeState();
}

class _RotateDateTimeState extends State<RotateDateTime> {

  DateTime selectedDate = DateTime.now();
  TimeOfDay _selectedtime = const TimeOfDay(hour: 0, minute: 0);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              onPressed: () {
                  showDialog(
                      context: context,
                    builder: (BuildContext context) => _buildPopupDialog(context),
                  );},
              child: const Text('Select Date and Time'),
            );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Choose Date and Time'),
      content: new Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(_selectedtime.format(context)),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text('Select Time'),
            ),
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1781),
        lastDate: DateTime(2222));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  Future<void> _selectTime(BuildContext context) async {

    final TimeOfDay? _newTime = await showTimePicker(
        context: context,
        initialTime: _selectedtime);
    if (_newTime != null) {
      setState(() {
        _selectedtime = _newTime;
      });
    }
    else
    {
      Exception ('null time');
    }
  }
}


