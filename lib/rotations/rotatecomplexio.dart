import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finallyicanlearn/logic/calculatehdchart.dart';
import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/services/datetime.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RotateCompleXIO extends StatefulWidget {
  const RotateCompleXIO({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateCompleXIOState();
  }
}

class _RotateCompleXIOState extends State<RotateCompleXIO> {
  List<String> _centers = [];
  List<String> _fearSentence = [];
  List<String> _selfreminderSentence = [
    'First Choose Time',
    'Then Return Here',
    'For the Reminder'
  ];

  String _selfreminder =
      'First Choose Time\nThen Return Here \nFor the Reminder';
  final String _timeselfreminder =
      'Time is a\nComplex\nof the MIND\nwhich most people\nsimply do not fetch';

  final TextEditingController _controllerType = TextEditingController(),
      _controllerAuthority = TextEditingController(),
      _controllerStrategy = TextEditingController(),
      _controllerSentence = TextEditingController(),
      _controllerFinalLine = TextEditingController(),
      _controllerTime = TextEditingController(),
      _controllerTimePick = TextEditingController(),
      _controllerDatePick = TextEditingController(),
      _controllerbottomfirsttext = TextEditingController();

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

  final CarouselController _controllertop = CarouselController();
  int _currenttop = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        title: AutoSizeText(_title, textAlign: TextAlign.left, maxFontSize: 15),
        leading: TextButton(
          child: const Text(
            'X',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue,
        actions: const [
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 20),
            Flex(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              direction: Axis.horizontal,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildTimePopupDialog(context),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      'Time',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildSelfReminderPopUp(context),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      'Reminder',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            const Divider(
              color: Colors.blue,
              thickness: 5,
            ),
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
            Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: AutoSizeTextField(
                    maxLines: 1,
                    minFontSize: 15,
                    fullwidth: false,
                    decoration: InputDecoration.collapsed(
                        hintText: hexNamesList[0],
                        hintStyle: const TextStyle(color: Colors.grey)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllerbottomfirsttext,
                    readOnly: true,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxWidth: MediaQuery.of(context).size.width / 1.5,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80.0,
                    child: CarouselSlider(
                      items: mixHexagramSlidersNew,
                      carouselController: _controllertop,
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          enlargeCenterPage: true,
                          aspectRatio: 1.5,
                          onPageChanged: (indextop, reason) {
                            setState(() {
                              _currenttop = indextop;
                              _controllerbottomfirsttext.text =
                              hexNamesList[indextop];
                            });
                          }),
                    ),
                  ),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _buildDataPopUp(context),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: const Text(
                  'Rotate Human Design',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            const Divider(
              color: Colors.blue,
              thickness: 5,
            ),
            const SizedBox(
              width: 50,
              child: AutoSizeText(
                'a',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                  fontFamily: 'iChing',
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildTimePopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Time'),
      content: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
                readOnly: true,
                decoration: const InputDecoration.collapsed(hintText: '07:30'),
                textAlign: TextAlign.center,
                controller: _controllerTimePick,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),

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
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.normal)),
            child: const Text('Set Time'),
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
                    fontSize: 17,
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
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.normal)),
            child: const Text('Set Date'),
          ),
          const Divider(
            color: Colors.black,
            thickness: 5,
          ),
          ElevatedButton(
            onPressed: () async {
              // _selectedDate by user pick
              _now = _selectedDate.applied(_selectedtime);

              _planetsnowList = await AstrologyServices.getCurrentData(_now);

              _designTime = await AstrologyServices.getDesignTime(_now);
              _planetsdesignList =
                  await AstrologyServices.getCurrentData(_designTime);

              List<String> hdbasicdata = HDServices.getHDBasicData(
                  _planetsnowList, _planetsdesignList);

              _hdchannelsList =
                  HDServices.getHDChannels(_planetsnowList, _planetsdesignList);
              _centers = HDServices.getHDDefinedCenters(_hdchannelsList);
              _fearSentence = HDServices.getHDDefinedFears(_centers);
              _selfreminderSentence = HDServices.getSelfReminder();
              _selfreminder = _timeselfreminder;

              _controlHDData(hdbasicdata);

              _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
              _formattedTime = DateFormat.Hms().format(_now);
              _controllerTime.text = '$_formattedTime $_formattedDate';

              setState(() {
                Navigator.of(context).pop();
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
            child: const Text('Fetch Your Time',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.normal)),
          ),
          const Divider(
            color: Colors.black,
            thickness: 5,
          ),
          ElevatedButton(
              onPressed: () async {
                _now = DateTime.now();

                _planetsnowList = await AstrologyServices.getCurrentData(_now);

                _designTime = await AstrologyServices.getDesignTime(_now);
                _planetsdesignList =
                    await AstrologyServices.getCurrentData(_designTime);

                List<String> hdbasicdata = HDServices.getHDBasicData(
                    _planetsnowList, _planetsdesignList);

                _controlHDData(hdbasicdata);

                _hdchannelsList = HDServices.getHDChannels(
                    _planetsnowList, _planetsdesignList);
                _centers = HDServices.getHDDefinedCenters(_hdchannelsList);
                _fearSentence = HDServices.getHDDefinedFears(_centers);
                _selfreminderSentence = HDServices.getSelfReminder();
                _selfreminder = _timeselfreminder;

                _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
                _formattedTime = DateFormat.Hms().format(_now);
                _controllerTime.text = '$_formattedTime $_formattedDate';

                setState(() {
                  Navigator.of(context).pop();
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.normal)),
            child: const Text('Fetch Now Instead',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.normal)),),
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
      content:
          SizedBox(
      width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  padding: const EdgeInsets.all(1),
                  itemCount: _centers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
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
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            _centers[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                          ),
                        ),
                      );
                  }),
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
      content: SizedBox(
          width: MediaQuery.of(context).size.width,
        child: ListView.builder(
                  padding: const EdgeInsets.all(2),
                  itemCount: _hdchannelsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[100],
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
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                        ),
                      );
                  }),
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
      content: Flex(
        direction: Axis.vertical,
        children: [
          Text(
            _selfreminder,
            style: const TextStyle(fontSize: 25),
          )
        ],
      ),
      actions: [
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

  Widget _buildDataPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Rotate Human Design', style: TextStyle(fontSize: 15)),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
              textAlign: TextAlign.center,
              readOnly: true,
              minLines: 1,
              maxLines: 4,
              decoration: const InputDecoration.collapsed(hintText: 'X'),
              controller: _controllerType,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue)),
          TextField(
              textAlign: TextAlign.center,
              readOnly: true,
              minLines: 1,
              maxLines: 1,
              decoration: const InputDecoration.collapsed(hintText: 'I'),
              controller: _controllerAuthority,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green)),
          TextField(
              textAlign: TextAlign.center,
              readOnly: true,
              minLines: 1,
              maxLines: 2,
              decoration: const InputDecoration.collapsed(hintText: 'O'),
              controller: _controllerStrategy,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.yellow)),
          TextField(
              textAlign: TextAlign.center,
              readOnly: true,
              minLines: 1,
              maxLines: 2,
              decoration:
                  const InputDecoration.collapsed(hintText: 'I don\'t know'),
              controller: _controllerFinalLine,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.red)),
          Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildProfilePopUp(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Profile', style: TextStyle(fontSize: 13))),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildCentersPopUp(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Centers', style: TextStyle(fontSize: 13))),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildChannelsPopUp(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child:
                      const Text('Channels', style: TextStyle(fontSize: 13))),
            ],
          ),
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
      content: Column(
        children: [
          Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            const TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ),
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
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ),
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
          Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            const TextStyle(color: Colors.red, fontSize: 20)),
                  ),
                ),
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
                        style: TextStyle(color: Colors.red, fontSize: 20)),
                  ),
                ),
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

  void _controlHDData(List<String> hdbasicdata) {
    _controllerStrategy.text = hdbasicdata[0];

    _controllerAuthority.text = hdbasicdata[1];
    _controllerType.text = hdbasicdata[2];
    _controllerSentence.text = hdbasicdata[3];
    //_controllerbottomfirsttext.text = hdbasicdata[4];
    //_currenttop = hexNamesList.indexOf(hdbasicdata[4]);
    _controllertop.jumpToPage(hexNamesList.indexOf(hdbasicdata[4]));
    _controllerFinalLine.text = 'XIO I don\'t know';
  }
}
