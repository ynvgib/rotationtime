import 'package:finallyicanlearn/logic/hdsubstructure.dart';
import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/services/datetime.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RotatePlanets extends StatefulWidget {
  const RotatePlanets({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotatePlanetsState();
  }
}

class _RotatePlanetsState extends State<RotatePlanets> {
  final TextEditingController _controllerNorthNodeHex = TextEditingController(),
      _controllerNorthNodeText = TextEditingController(),
      _controllerNorthNodeGate = TextEditingController(),
      _controllerSunHex = TextEditingController(),
      _controllerSunText = TextEditingController(),
      _controllerSunGate = TextEditingController(),
      _controllerMoonHex = TextEditingController(),
      _controllerMoonText = TextEditingController(),
      _controllerMoonGate = TextEditingController(),
      _controllerMarsHex = TextEditingController(),
      _controllerMarsText = TextEditingController(),
      _controllerMarsGate = TextEditingController(),
      _controllerVenusHex = TextEditingController(),
      _controllerVenusText = TextEditingController(),
      _controllerVenusGate = TextEditingController(),
      _controllerMercuryHex = TextEditingController(),
      _controllerMercuryText = TextEditingController(),
      _controllerMercuryGate = TextEditingController(),
      _controllerJupiterHex = TextEditingController(),
      _controllerJupiterText = TextEditingController(),
      _controllerJupiterGate = TextEditingController(),
      _controllerSaturnHex = TextEditingController(),
      _controllerSaturnText = TextEditingController(),
      _controllerSaturnGate = TextEditingController(),
      _controllerUranusHex = TextEditingController(),
      _controllerUranusText = TextEditingController(),
      _controllerUranusGate = TextEditingController(),
      _controllerNeptuneHex = TextEditingController(),
      _controllerNeptuneText = TextEditingController(),
      _controllerNeptuneGate = TextEditingController(),
      _controllerPlutoHex = TextEditingController(),
      _controllerPlutoText = TextEditingController(),
      _controllerPlutoGate = TextEditingController(),
      _controllerEarthHex = TextEditingController(),
      _controllerEarthText = TextEditingController(),
      _controllerEarthGate = TextEditingController(),
      _controllerSouthNodeHex = TextEditingController(),
      _controllerSouthNodeText = TextEditingController(),
      _controllerSouthNodeGate = TextEditingController(),
      _controllerTime = TextEditingController(),
      _controllerDate = TextEditingController(),
      _controllerTimePick = TextEditingController(),
      _controllerDatePick = TextEditingController(),
      _controllerType = TextEditingController(),
      _controllerSubType = TextEditingController();

  String _formattedDate = '', _formattedTime = '', _textlevel = '';
  final String _title = subtitlesEN[0], _chosenlanguage = 'EN';

  HexagramSentence _hexsentence = getGateSentence(1, 'EN');

  // visibility of planets init
  bool _isSunVisible = true,
      _isEarthVisible = true,
      _isNorthNodeVisible = true,
      _isSouthNodeVisible = true,
      _isMoonVisible = true,
      _isMercuryVisible = true,
      _isVenusVisible = true,
      _isMarsVisible = true,
      _isJupiterVisible = true,
      _isSaturnVisible = true,
      _isUranusVisible = true,
      _isNeptuneVisible = true,
      _isPlutoVisible = true;

  final List<bool> _isPlanetSelectedList =
      List<bool>.filled(13, true, growable: false);

  DateTime _now = DateTime.now(),
      _designTime = DateTime.now(),
      _selectedDate = DateTime.now();

  TimeOfDay _selectedtime = const TimeOfDay(hour: 0, minute: 0);

  List<Hexagram> _planetsList = [],
      _planetsdesignList = [],
      _planetsnowList = [];

  Hexagram _sunhex = Hexagram(),
      _earthhex = Hexagram(),
      _northnodehex = Hexagram(),
      _southnodehex = Hexagram(),
      _moonhex = Hexagram(),
      _mercuryhex = Hexagram(),
      _venushex = Hexagram(),
      _marshex = Hexagram(),
      _jupiterhex = Hexagram(),
      _saturnhex = Hexagram(),
      _uranushex = Hexagram(),
      _neptunehex = Hexagram(),
      _plutohex = Hexagram();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(_title),
        leading: TextButton(
          child: const Text(
            'X',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue,
        actions: [],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(
                          hintText: 'Too Complex for Phone'),
                      controller: _controllerSubType,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: _isSunVisible,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CircleAvatar(
                            minRadius: 15.0,
                            maxRadius: 15.0,
                            backgroundColor: Colors.blue,
                            foregroundImage:
                                AssetImage('assets/planets/sun.png')),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: _isNorthNodeVisible,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CircleAvatar(
                              minRadius: 15.0,
                              maxRadius: 15.0,
                              backgroundColor: Colors.blue,
                              foregroundImage:
                                  AssetImage('assets/planets/northnode.png')),
                        ]),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(3.0),
                            child: SizedBox(
                              width: 80,
                              child: TextButton(
                                child: const Text(
                                  'COMPLEX',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blue),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _textlevel = 'complex';
                                    _changeTextLevels(_textlevel);
                                  });
                                },
                              ),
                            ),
                          ),
                        ])),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: _isMoonVisible,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CircleAvatar(
                              minRadius: 15.0,
                              maxRadius: 15.0,
                              backgroundColor: Colors.green,
                              backgroundImage:
                                  AssetImage('assets/planets/moon.png')),
                        ]),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    width: 100,
                    child: TextButton(
                      child: const Text(
                        'SIMPLE',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.green),
                      ),
                      onPressed: () {
                        setState(() {
                          _textlevel = 'simple';
                          _changeTextLevels(_textlevel);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: _isMercuryVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                                minRadius: 15.0,
                                maxRadius: 15.0,
                                backgroundColor: Colors.green,
                                backgroundImage:
                                    AssetImage('assets/planets/mercury.png')),
                          ])),
                ),
                Visibility(
                  visible: _isVenusVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                                minRadius: 15.0,
                                maxRadius: 15.0,
                                backgroundColor: Colors.green,
                                backgroundImage:
                                    AssetImage('assets/planets/venus.png')),
                          ])),
                ),

                // Mars
                Visibility(
                  visible: _isMarsVisible,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                                minRadius: 15.0,
                                maxRadius: 15.0,
                                backgroundColor: Colors.green,
                                backgroundImage:
                                    AssetImage('assets/planets/mars.png')),
                          ])),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: _isJupiterVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                                minRadius: 15.0,
                                maxRadius: 15.0,
                                backgroundColor: Colors.yellow,
                                backgroundImage:
                                    AssetImage('assets/planets/jupiter.png')),
                          ])),
                ),
                Visibility(
                  visible: _isSaturnVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                                minRadius: 15.0,
                                maxRadius: 15.0,
                                backgroundColor: Colors.yellow,
                                backgroundImage:
                                    AssetImage('assets/planets/saturn.png')),
                          ])),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    width: 100,
                    child: TextButton(
                      child: const Text('breath',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.yellow)),
                      onPressed: () {
                        setState(() {
                          _textlevel = 'breath';
                          _changeTextLevels(_textlevel);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: _isUranusVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                                minRadius: 15.0,
                                maxRadius: 15.0,
                                backgroundColor: Colors.yellow,
                                backgroundImage:
                                    AssetImage('assets/planets/uranus.png')),
                          ])),
                ),
                Visibility(
                  visible: _isNeptuneVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                                minRadius: 15.0,
                                maxRadius: 15.0,
                                backgroundColor: Colors.yellow,
                                backgroundImage:
                                    AssetImage('assets/planets/neptune.png')),
                          ])),
                ),
                Visibility(
                  visible: _isPlutoVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                                minRadius: 15.0,
                                maxRadius: 15.0,
                                backgroundColor: Colors.yellow,
                                backgroundImage:
                                    AssetImage('assets/planets/pluto.png'))
                          ])),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: _isEarthVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                                minRadius: 15.0,
                                maxRadius: 15.0,
                                backgroundColor: Colors.red,
                                backgroundImage:
                                    AssetImage('assets/planets/earth.png')),
                          ])),
                ),
                Visibility(
                  visible: _isSouthNodeVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CircleAvatar(
                                minRadius: 15.0,
                                maxRadius: 15.0,
                                backgroundColor: Colors.red,
                                backgroundImage:
                                    AssetImage('assets/planets/southnode.png')),
                          ])),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(3.0),
                  child: TextButton(
                    child: const Text('silence',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.red)),
                    onPressed: () {
                      setState(() {
                        _textlevel = 'silence';
                        _changeTextLevels(_textlevel);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeDialog(BuildContext context) {
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
              _now = _selectedDate.applied(_selectedtime);
              _planetsnowList = await AstrologyServices.getCurrentData(_now);

              _designTime = await AstrologyServices.getDesignTime(_now);
              _planetsdesignList =
                  await AstrologyServices.getCurrentData(_designTime);

              _planetsList = _planetsnowList;

              _controlPlanetHexagramData(_planetsList);

              //_now = _now.toUtc();

              _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
              _formattedTime = DateFormat.Hms().format(_now);
              _controllerTime.text = _formattedTime;
              _controllerDate.text = _formattedDate;
              _controllerType.text = 'Thought Later';
              _controllerSubType.text = 'COMPLEX';

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

                _planetsList = _planetsnowList;

                _controlPlanetHexagramData(_planetsList);

                //_now = _now.toUtc();

                _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
                _formattedTime = DateFormat.Hms().format(_now);
                _controllerTime.text = _formattedTime;
                _controllerDate.text = _formattedDate;

                _controllerType.text = 'THINK AFTER';
                _controllerSubType.text = 'COMPLEX';

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

  Widget _buildStoriesDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Stories'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildGatesDialog(context),
                );
              },
              child: const Text(
                'Gates',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)))),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildLinesDialog(context),
                );
              },
              child: const Text(
                'Lines',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)))),
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

  Widget _buildGatesDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Gates'),
      content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: ListView.builder(
            reverse: false,
            padding: const EdgeInsets.all(2.0),
            itemCount: _planetsList.length,
            itemBuilder: (context, index) => ListTile(
              visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
              dense: true,
              leading: Text(
                idkHexList[_planetsList[index].gate!],
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'X',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildLinesDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Lines'),
      content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ListView.builder(
            reverse: false,
            padding: const EdgeInsets.all(2.0),
            itemCount: _planetsList.length,
            itemBuilder: (context, index) => ListTile(
              visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
              dense: true,
              leading: Text(
                idonotknowOnlylinesList[(_planetsList[index].gate! * 6) +
                    _planetsList[index].line! -
                    1],
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'X',
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

  void _controlPlanetHexagramData(List<Hexagram> _planetList) {
    _sunhex = _planetsList[0];
    _earthhex = _planetsList[1];
    _northnodehex = _planetsList[2];
    _southnodehex = _planetsList[3];
    _moonhex = _planetsList[4];
    _mercuryhex = _planetsList[5];
    _venushex = _planetsList[6];
    _marshex = _planetsList[7];
    _jupiterhex = _planetsList[8];
    _saturnhex = _planetsList[9];
    _uranushex = _planetsList[10];
    _neptunehex = _planetsList[11];
    _plutohex = _planetsList[12];

    _controllerSunText.text = _sunhex.linename!;
    _controllerEarthText.text = _earthhex.linename!;
    _controllerNorthNodeText.text = _northnodehex.linename!;
    _controllerSouthNodeText.text = _southnodehex.linename!;
    _controllerMoonText.text = _moonhex.linename!;
    _controllerMercuryText.text = _mercuryhex.linename!;
    _controllerVenusText.text = _venushex.linename!;
    _controllerMarsText.text = _marshex.linename!;
    _controllerJupiterText.text = _jupiterhex.linename!;
    _controllerSaturnText.text = _saturnhex.linename!;
    _controllerUranusText.text = _uranushex.linename!;
    _controllerNeptuneText.text = _neptunehex.linename!;
    _controllerPlutoText.text = _plutohex.linename!;

    _controllerSunGate.text = _sunhex.gatelinecolortone!;
    _controllerEarthGate.text = _earthhex.gatelinecolortone!;
    _controllerNorthNodeGate.text = _northnodehex.gatelinecolortone!;
    _controllerSouthNodeGate.text = _southnodehex.gatelinecolortone!;
    _controllerMoonGate.text = _moonhex.gatelinecolor!;
    _controllerMercuryGate.text = _mercuryhex.gatelinecolor!;
    _controllerVenusGate.text = _venushex.gatelinecolor!;
    _controllerMarsGate.text = _marshex.gatelinecolor!;
    _controllerJupiterGate.text = _jupiterhex.gatelinecolor!;
    _controllerSaturnGate.text = _saturnhex.gatelinecolor!;
    _controllerUranusGate.text = _uranushex.gatelinecolor!;
    _controllerNeptuneGate.text = _neptunehex.gatelinecolor!;
    _controllerPlutoGate.text = _plutohex.gatelinecolor!;

    _controllerSunHex.text = _sunhex.hex!;
    _controllerEarthHex.text = _earthhex.hex!;
    _controllerNorthNodeHex.text = _northnodehex.hex!;
    _controllerSouthNodeHex.text = _southnodehex.hex!;
    _controllerMoonHex.text = _moonhex.hex!;
    _controllerMercuryHex.text = _mercuryhex.hex!;
    _controllerVenusHex.text = _venushex.hex!;
    _controllerMarsHex.text = _marshex.hex!;
    _controllerJupiterHex.text = _jupiterhex.hex!;
    _controllerSaturnHex.text = _saturnhex.hex!;
    _controllerUranusHex.text = _uranushex.hex!;
    _controllerNeptuneHex.text = _neptunehex.hex!;
    _controllerPlutoHex.text = _plutohex.hex!;
  }

  void _changeTextLevels(String _textlevel) {
    switch (_textlevel) {
      case 'complex':
        _controllerSubType.text = 'COMPLEX';

        break;
      case 'simple':
        _controllerSubType.text = 'Simple';

        break;
      case 'breath':
        _controllerSubType.text = 'Breathe';

        break;
      case 'silence':
        _controllerSubType.text = 'silence';

        break;
      default:
        break;
    }
  }
}
