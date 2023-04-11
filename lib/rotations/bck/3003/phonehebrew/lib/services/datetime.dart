import 'package:flutter/material.dart';

class TimeServices {
  static Future<DateTime> selectDate(BuildContext context) async {
    DateTime _selectedDate = DateTime.now();
    DateTime? _pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1781),
        lastDate: DateTime(2222));
    _selectedDate = _pickedDate!;
    return _selectedDate;
  }

  static Future<TimeOfDay> selectTime(BuildContext context) async {
    TimeOfDay _selectedtime = TimeOfDay.now();
    final TimeOfDay? _newTime = await showTimePicker(
        context: context,
        initialTime: _selectedtime);
    _selectedtime = _newTime!;
    return _selectedtime;
  }

}
extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}