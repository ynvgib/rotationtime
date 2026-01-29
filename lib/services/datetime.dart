import 'dart:convert';

import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:flutter/material.dart';

class TimeServices {
  static Future<DateTime> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    DateTime? pickedDate = DateTime.now();

    pickedDate = await showDatePicker(
        locale: const Locale("he"),
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1781),
        lastDate: DateTime(2222));

    if (pickedDate == null) {
      selectedDate = DateTime.now();
    } else {
      selectedDate = pickedDate;
    }
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

    if (newTime == null) {
      selectedtime = TimeOfDay.now();
    } else {
      selectedtime = newTime!;
    }

    return selectedtime;
  }
}

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}

Future<CityTime> readJsonCityTime() async {
  var data = json.decode(json.encode('assets/json/cityMap'));
  //List<dynamic> data = json.decode(json.encode('assets/json/cityMap.json'));
  //List<CityTime> ct = data.map((json) => CityTime.fromJson(json)).toList();
  CityTime ct = CityTime.fromJson(jsonDecode(data));
  // print(ct.city);
  return ct;
}
