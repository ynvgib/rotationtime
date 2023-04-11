import 'dart:async';

import 'package:finallyicanlearn/logic/calculatehdchart.dart';
import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/services/datetime.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RotateSimpleHD extends StatefulWidget {
  const RotateSimpleHD({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSimpleHDState();
  }
}

class _RotateSimpleHDState extends State<RotateSimpleHD> {
  List<String> _centers = [];
  List<String> _RotationSentence = ['מורכב','פשוט','לנשום','לשתוק'];
  //List<String> _selfreminderSentence = ['First Choose Time','Then Return Here','For the Reminder'];

  final TextEditingController _controllerType = TextEditingController(),
      _controllerAuthority = TextEditingController(),
      _controllerStrategy = TextEditingController(),
      _controllerSentence = TextEditingController(),
      _controllerFinalLine = TextEditingController(),
      _controllerTime = TextEditingController(),
      _controllerTimePick = TextEditingController(),
      _controllerDatePick = TextEditingController();

  final List<Color> _colorCodes = <Color>[
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.red,
  ];

  String _formattedDate = '', _formattedTime = '';
  final String _title = subtitlesEN[2];

  DateTime _now = DateTime.now(),
      _designTime = DateTime.now(),
      _selectedDate = DateTime.now();

  TimeOfDay _selectedtime = const TimeOfDay(hour: 0, minute: 0);

  List<Hexagram> _planetsdesignList = [Hexagram(line: 1)],
      _planetsnowList = [Hexagram(line: 1)];

  List<HDChannel> _hdchannelsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          _title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
        ),
        leading: TextButton(
          child: const Text(
            'X',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 80,
            child: TextField(
                textAlign: TextAlign.center,
                readOnly: true,
                decoration: const InputDecoration.collapsed(hintText: 'XIO'),
                controller: _controllerSentence,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.black)),
          ),
          SizedBox(
            height: 80,
            child: TextField(
                textAlign: TextAlign.center,
                readOnly: true,
                decoration: const InputDecoration.collapsed(hintText: 'X'),
                controller: _controllerType,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.blue)),
          ),
          SizedBox(
            height: 80,
            child: TextField(
                textAlign: TextAlign.center,
                readOnly: true,
                decoration: const InputDecoration.collapsed(hintText: 'I'),
                controller: _controllerAuthority,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.green)),
          ),
          SizedBox(
            height: 80,
            child: TextField(
                textAlign: TextAlign.center,
                readOnly: true,
                decoration: const InputDecoration.collapsed(hintText: 'O'),
                controller: _controllerStrategy,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.yellow)),
          ),
          SizedBox(
            height: 80,
            child: TextField(
                textAlign: TextAlign.center,
                readOnly: true,
                decoration:
                    const InputDecoration.collapsed(hintText: 'I don\'t know'),
                controller: _controllerFinalLine,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.red)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildRotationPopUp(context),
                    );
                  },
                  child: const Text('לא יודעת',
                      style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(primary: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildRotationPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('שבי על דלעת',style: const TextStyle(fontSize: 30, color: Colors.orange)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
              height: 300,
              width: 400,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _RotationSentence.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        decoration: BoxDecoration(
                            color: _colorCodes[index],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[500]!,
                                  offset: const Offset(4, 4),
                                  blurRadius: 5,
                                  spreadRadius: 1),
                              const BoxShadow(
                                  color: Colors.blueGrey,
                                  offset: Offset(-4, -4),
                                  blurRadius: 5,
                                  spreadRadius: 1),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _RotationSentence[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 35),
                          ),
                        ),
                      ),
                    );
                  })),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Close',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
