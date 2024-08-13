import 'package:flutter/material.dart';

class TimeServices {
  static Future<DateTime> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
        locale: const Locale("he"),
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1781),
        lastDate: DateTime(2222));
    selectedDate = pickedDate!;
    return selectedDate;
  }

  static Future<TimeOfDay> selectTime(BuildContext context) async {
    TimeOfDay selectedtime = TimeOfDay.now();
    final TimeOfDay? newTime = await showTimePicker(
      helpText: 'זמן לבחור',
      cancelText: 'ביטול',
        confirmText: 'אישור',
        hourLabelText: 'שעות',
        minuteLabelText: 'דקות',
        context: context,
        initialTime: selectedtime);
    selectedtime = newTime!;
    return selectedtime;
  }

}
extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}