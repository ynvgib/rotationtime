import 'package:finallyicanlearn/logic/calculatehdchart.dart';
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
  final TextEditingController _controllerType = TextEditingController(),
      _controllerAuthority = TextEditingController(),
      _controllerStrategy = TextEditingController(),
      _controllerTime = TextEditingController(),
      //_controllerDate = TextEditingController(),
      _controllerTimePick = TextEditingController(),
      _controllerDatePick = TextEditingController();

  String _formattedDate = '', _formattedTime = '';
  final String _title = subtitlesEN[3];


  DateTime _now = DateTime.now(),
      _designTime = DateTime.now(),
      _selectedDate = DateTime.now();

  TimeOfDay _selectedtime = const TimeOfDay(hour: 0, minute: 0);

  List<Hexagram> _planetsdesignList = [],
      _planetsnowList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.blueGrey,
        actions: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              },
              child: const Text('Fetch Time'),
              style: ElevatedButton.styleFrom(primary: Colors.black)),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: TextField(
                textAlign: TextAlign.center,
                readOnly: true,
                decoration: const InputDecoration.collapsed(hintText: 'Time'),
                controller: _controllerTime,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black)),
          ),
          SizedBox(
            height: 100,
            child: TextField(
                textAlign: TextAlign.center,
                readOnly: true,
                decoration: const InputDecoration.collapsed(hintText: 'X'),
                controller: _controllerType,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Colors.blue)),
          ),
          SizedBox(
            height: 100,
            child: TextField(
                textAlign: TextAlign.center,
                readOnly: true,
                decoration: const InputDecoration.collapsed(hintText: 'I'),
                controller: _controllerAuthority,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Colors.green)),
          ),
          SizedBox(
            height: 100,
            child: TextField(
                textAlign: TextAlign.center,
                readOnly: true,
                decoration: const InputDecoration.collapsed(hintText: 'O'),
                controller: _controllerStrategy,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Colors.yellow)),
          ),
          const SizedBox(
            height: 100,
            child: Text('X I O :: I don\'t know',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Fetch Time'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 150,
            child: TextField(
                readOnly: true,
                decoration:
                    const InputDecoration.collapsed(hintText: '07:30'),
                textAlign: TextAlign.center,
                controller: _controllerTimePick,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () async {
              _selectedtime = await TimeServices.selectTime(context);
              setState(() {
                _controllerTimePick.text = _selectedtime.format(context);
              });
            },
            child: const Text('Set Time'),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: 150,
            child: TextField(
                readOnly: true,
                decoration:
                    const InputDecoration.collapsed(hintText: '2022-02-19'),
                textAlign: TextAlign.center,
                controller: _controllerDatePick,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () async {
              _selectedDate = await TimeServices.selectDate(context);
              setState(() {
                _controllerDatePick.text =
                    "${_selectedDate.toLocal()}".split(' ')[0];
              });
            },
            child: const Text('Set Date'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.normal)),
          ),
          Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(3.0),
              color: Colors.black),
          ElevatedButton(
            onPressed: () async {
              // _selectedDate by user pick
              _now = _selectedDate.applied(_selectedtime);

              _planetsnowList = await AstrologyServices.getCurrentData(_now);

              _designTime = await AstrologyServices.getDesignTime(_now);
              _planetsdesignList =
                  await AstrologyServices.getCurrentData(_designTime);



              List<String> _hdbasicdata = HDServices.getHDBasicData(
                  _planetsnowList, _planetsdesignList);

              //print("HD basic data");
              //print(_hdbasicdata);

              //_planetsList = _planetsnowList;

              _controlHDData(_hdbasicdata);

              //_now = _now.toUtc();

              _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
              _formattedTime = DateFormat.Hms().format(_now);
              _controllerTime.text = _formattedTime + ' ' + _formattedDate;
              //_controllerDate.text = _formattedDate;

              setState(() {
                Navigator.of(context).pop();
              });
            },
            child: const Text('1) Fetch Your Time',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal)),
            style: ElevatedButton.styleFrom(primary: Colors.yellow),
          ),
          Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(3.0),
              color: Colors.black),
          ElevatedButton(
              onPressed: () async {
                _now = DateTime.now();

                _planetsnowList =
                    await AstrologyServices.getCurrentData(_now);

                _designTime = await AstrologyServices.getDesignTime(_now);
                _planetsdesignList =
                    await AstrologyServices.getCurrentData(_designTime);

                List<String> _hdbasicdata = HDServices.getHDBasicData(
                    _planetsnowList, _planetsdesignList);

                //print("HD basic data");
                //print(_hdbasicdata);

                //_planetsList = _planetsnowList;

                _controlHDData(_hdbasicdata);

                //_now = _now.toUtc();

                _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
                _formattedTime = DateFormat.Hms().format(_now);
                _controllerTime.text = _formattedTime + ' ' + _formattedDate;
                //_controllerDate.text = _formattedDate;

                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: const Text('2) Get Now Instead'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal))),
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

  void _controlHDData(List<String> _hdbasicdata) {
    _controllerType.text = _hdbasicdata[0];
    _controllerAuthority.text = _hdbasicdata[1];
    _controllerStrategy.text = _hdbasicdata[2];
  }
}
