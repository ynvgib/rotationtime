import 'dart:async';

import 'package:flutter/material.dart';

class RotateDateTime extends StatefulWidget {
  const RotateDateTime({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateDateTimeState();
  }
}

class _RotateDateTimeState extends State<RotateDateTime> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1781),
        lastDate: DateTime(2202));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  TimeOfDay _selectedtime = const TimeOfDay(hour: 0, minute: 0);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Date and Time'),
      ),
      body: Center(
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
    );
  }
}