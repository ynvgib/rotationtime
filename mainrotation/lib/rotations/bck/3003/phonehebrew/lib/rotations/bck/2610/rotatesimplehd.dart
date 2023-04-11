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
  List<String> _fearSentence = [];
  List<String> _selfreminderSentence = ['First Choose Time','Then Return Here','For the Reminder'];

  final TextEditingController _controllerType = TextEditingController(),
      _controllerAuthority = TextEditingController(),
      _controllerStrategy = TextEditingController(),
      _controllerSentence = TextEditingController(),
      _controllerFinalLine = TextEditingController(),
      _controllerTime = TextEditingController(),
      _controllerTimePick = TextEditingController(),
      _controllerDatePick = TextEditingController();

  final List<int> _colorCodes = <int>[
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900
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
        actions: [
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildTimePopupDialog(context),
                );
              },
              child: const Text(
                'Time',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)))),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildSelfReminderPopUp(context),
                );
              },
              child: const Text(
                'Reminder',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)))),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
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
                decoration: const InputDecoration.collapsed(hintText: 'I don\'t know'),
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
                          _buildFearsPopUp(context),
                    );
                  },
                  child: const Text('Fears', style: TextStyle (color: Colors.black)),
                  style: ElevatedButton.styleFrom(primary: Colors.white)),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildProfilePopUp(context),
                    );
                  },
                  child: const Text('Profile'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue)),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildCentersPopUp(context),
                    );
                  },
                  child: const Text('Centers'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue)),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildChannelsPopUp(context),
                    );
                  },
                  child: const Text('Channels'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue)),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildEmptyChartPopUp(context),
                    );
                  },
                  child: const Text('Human Design'),
                  style: ElevatedButton.styleFrom(primary: Colors.black)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTimePopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Time'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 150,
            child: TextField(
                readOnly: true,
                decoration: const InputDecoration.collapsed(hintText: '07:30'),
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

              _hdchannelsList =
                  HDServices.getHDChannels(_planetsnowList, _planetsdesignList);
              _centers = HDServices.getHDDefinedCenters(_hdchannelsList);
              _fearSentence = HDServices.getHDDefinedFears(_centers);
              _selfreminderSentence = HDServices.getSelfReminder();

              _controlHDData(_hdbasicdata);

              _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
              _formattedTime = DateFormat.Hms().format(_now);
              _controllerTime.text = _formattedTime + ' ' + _formattedDate;

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

                _planetsnowList = await AstrologyServices.getCurrentData(_now);

                _designTime = await AstrologyServices.getDesignTime(_now);
                _planetsdesignList =
                    await AstrologyServices.getCurrentData(_designTime);

                List<String> _hdbasicdata = HDServices.getHDBasicData(
                    _planetsnowList, _planetsdesignList);

                _controlHDData(_hdbasicdata);

                _hdchannelsList = HDServices.getHDChannels(
                    _planetsnowList, _planetsdesignList);
                _centers = HDServices.getHDDefinedCenters(_hdchannelsList);
                _fearSentence = HDServices.getHDDefinedFears(_centers);
                _selfreminderSentence = HDServices.getSelfReminder();

                _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
                _formattedTime = DateFormat.Hms().format(_now);
                _controllerTime.text = _formattedTime + ' ' + _formattedDate;

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

  Widget _buildCentersPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Centers'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
              height: 400,
              width: 300,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _centers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[_colorCodes[index]],
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
                            _centers[index],
                            style: const TextStyle(fontSize: 20,color: Colors.black),
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

  Widget _buildChannelsPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Channels'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
              height: 400,
              width: 300,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _hdchannelsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[_colorCodes[index]],
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
                            _hdchannelsList[index].name!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20),
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

  Widget _buildEmptyChartPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Human Design', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue,
      content: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Image.asset('assets/emptybodygraph.png'),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Image.asset('assets/emptymandala.png'),
            ),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Close',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildFearsPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('FEARS - False Evidence Appearing Real'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
              height: 300,
              width: 400,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _fearSentence.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[_colorCodes[index]],
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
                            _fearSentence[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
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

  Widget _buildSelfReminderPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('RE-MIND HER'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
              height: 400,
              width: 600,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: _selfreminderSentence.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[_colorCodes[index]],
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
                            _selfreminderSentence[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
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


  Widget _buildProfilePopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Profile'),
      content: SizedBox(
        height: 200,
        width: 400,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                      child: Text(_planetsnowList[0].line.toString(),
                          textAlign: TextAlign.center,
                          style:
                          const TextStyle(color: Colors.black, fontSize: 25)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Conscious ',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.black, fontSize: 20)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                          idonotknowlinesList[_planetsnowList[0].line!]
                              .toString(),
                          textAlign: TextAlign.center,
                          style:
                          const TextStyle(color: Colors.black, fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                      child: Text(_planetsdesignList[0].line.toString(),
                          textAlign: TextAlign.center,
                          style:
                          const TextStyle(color: Colors.red, fontSize: 25)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Living ',
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(color: Colors.red, fontSize: 20)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
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
                          idonotknowlinesList[_planetsdesignList[0].line!]
                              .toString(),
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
    _controllerType.text = _hdbasicdata[2];
    _controllerAuthority.text = _hdbasicdata[1];
    _controllerStrategy.text = _hdbasicdata[0];
    _controllerSentence.text = _hdbasicdata[3];
    _controllerFinalLine.text = 'XIO I don\'t know';
  }
}