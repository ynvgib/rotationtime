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

  String _formattedDate = '', _formattedTime = '',
      _textlevel = '';
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
        actions: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildEmptyChartPopUp(context),
                );
              },
              child: const Text('HD'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold))),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildTimeDialog(context),
                );
              },
              child: const Text(
                'TIME',
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
                  builder: (BuildContext context) => _buildStoriesDialog(context),
                );
              },
              child: const Text(
                'Stories',
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _planetsList = _planetsdesignList;

                    _controlPlanetHexagramData(_planetsList);

                    _textlevel = 'silence';
                    _changeTextLevels(_textlevel);

                    _formattedDate =
                        DateFormat('yyyy-MM-dd').format(_designTime);
                    _formattedTime = DateFormat.Hms().format(_designTime);
                    _controllerTime.text = _formattedTime;
                    _controllerDate.text = _formattedDate;
                    _controllerType.text = 'Life First';
                  },
                  child: const Text('LIFE'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                ToggleButtons(
                  borderWidth: 10.0,
                  hoverColor: Colors.blue,
                  //borderRadius: BorderRadius.circular(20),
                  fillColor: Colors.blueGrey,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image:
                                  AssetImage("assets/planets/northnode.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image: AssetImage("assets/planets/sun.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image: AssetImage("assets/planets/moon.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image: AssetImage("assets/planets/mercury.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image: AssetImage("assets/planets/venus.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image: AssetImage("assets/planets/mars.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image: AssetImage("assets/planets/jupiter.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image: AssetImage("assets/planets/saturn.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image: AssetImage("assets/planets/uranus.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image: AssetImage("assets/planets/neptune.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image: AssetImage("assets/planets/pluto.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image: AssetImage("assets/planets/earth.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: const DecorationImage(
                              image:
                                  AssetImage("assets/planets/southnode.png")),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                    ),
                  ],
                  isSelected: _isPlanetSelectedList,
                  onPressed: (int index) {
                    setState(() {
                      _isPlanetSelectedList[index] =
                          !_isPlanetSelectedList[index];
                      switch (index) {
                        case 0:
                          _isNorthNodeVisible = !_isNorthNodeVisible;
                          break;
                        case 1:
                          _isSunVisible = !_isSunVisible;
                          break;
                        case 2:
                          _isMoonVisible = !_isMoonVisible;
                          break;
                        case 3:
                          _isMercuryVisible = !_isMercuryVisible;
                          break;
                        case 4:
                          _isVenusVisible = !_isVenusVisible;
                          break;
                        case 5:
                          _isMarsVisible = !_isMarsVisible;
                          break;
                        case 6:
                          _isJupiterVisible = !_isJupiterVisible;
                          break;
                        case 7:
                          _isSaturnVisible = !_isSaturnVisible;
                          break;
                        case 8:
                          _isUranusVisible = !_isUranusVisible;
                          break;
                        case 9:
                          _isNeptuneVisible = !_isNeptuneVisible;
                          break;
                        case 10:
                          _isPlutoVisible = !_isPlutoVisible;
                          break;
                        case 11:
                          _isEarthVisible = !_isEarthVisible;
                          break;
                        case 12:
                          _isSouthNodeVisible = !_isSouthNodeVisible;
                          break;
                        default:
                          _isSunVisible = !_isSunVisible;
                      }
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    _planetsList = _planetsnowList;

                    _controlPlanetHexagramData(_planetsList);

                    //_now = _now.toUtc();

                    _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
                    _formattedTime = DateFormat.Hms().format(_now);
                    _controllerTime.text = _formattedTime;
                    _controllerDate.text = _formattedDate;

                    _controllerType.text = 'Thought Later';
                    _controllerSubType.text = 'COMPLEX';
                  },
                  child: const Text('THOUGHT'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(
                          hintText: ''),
                      controller: _controllerSubType,
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black)),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  child: TextField(
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(
                          hintText: ''),
                      controller: _controllerType,
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black)),
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
                    width: MediaQuery.of(context).size.width * 0.3,
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
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 40,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: ''),
                              controller: _controllerSunHex,
                              style: const TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'iChing',
                                  color: Colors.blue)),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 50,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: ''),
                              textAlign: TextAlign.left,
                              controller: _controllerSunGate,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 230,
                          child: TextField(
                              readOnly: false,
                              decoration: const InputDecoration.collapsed(
                                  hintText: ''),
                              textAlign: TextAlign.left,
                              minLines: 2,
                              maxLines: 2,
                              controller: _controllerSunText,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: _isNorthNodeVisible,
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
                              backgroundColor: Colors.blue,
                              foregroundImage:
                                  AssetImage('assets/planets/northnode.png')),
                          const SizedBox(width: 10),
                          SizedBox(
                              width: 40,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  controller: _controllerNorthNodeHex,
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontFamily: 'iChing',
                                      color: Colors.blue))),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 50,
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: ''),
                                textAlign: TextAlign.left,
                                controller: _controllerNorthNodeGate,
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 230,
                            child: TextField(
                                readOnly: false,
                                decoration: const InputDecoration.collapsed(
                                    hintText: ''),
                                textAlign: TextAlign.left,
                                minLines: 2,
                                maxLines: 2,
                                controller: _controllerNorthNodeText,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ]),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'Time'),
                                controller: _controllerTime,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                    color: Colors.blue)),
                          ),
                          SizedBox(
                            width: 120,
                            child: TextButton(
                              child: const Text('COMPLEX',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      color: Colors.blue)),
                              onPressed: () {
                                setState(() {
                                  _textlevel = 'complex';
                                  _changeTextLevels(_textlevel);
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                                textAlign: TextAlign.right,
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'Date'),
                                controller: _controllerDate,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20,
                                    color: Colors.blue)),
                          ),
                        ])),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 420),
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
                          const SizedBox(width: 10),
                          SizedBox(
                              width: 40,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  controller: _controllerMoonHex,
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontFamily: 'iChing',
                                      color: Colors.green))),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 50,
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: ''),
                                textAlign: TextAlign.left,
                                controller: _controllerMoonGate,
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 230,
                            child: TextField(
                                readOnly: false,
                                decoration: const InputDecoration.collapsed(
                                    hintText: ''),
                                textAlign: TextAlign.left,
                                controller: _controllerMoonText,
                                minLines: 2,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
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
                        style: TextStyle(fontSize: 20, color: Colors.green),
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
                                    AssetImage('assets/planets/mercury.png')),
                            const SizedBox(width: 10),
                            SizedBox(
                                width: 40,
                                child: TextField(
                                    readOnly: true,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: ''),
                                    controller: _controllerMercuryHex,
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontFamily: 'iChing',
                                        color: Colors.green))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerMercuryGate,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 230,
                              child: TextField(
                                  readOnly: false,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerMercuryText,
                                  minLines: 2,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ])),
                ),
                Visibility(
                  visible: _isVenusVisible,
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
                                    AssetImage('assets/planets/venus.png')),
                            const SizedBox(width: 10),
                            SizedBox(
                                width: 40,
                                child: TextField(
                                    readOnly: true,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: ''),
                                    controller: _controllerVenusHex,
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontFamily: 'iChing',
                                        color: Colors.green))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerVenusGate,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 230,
                              child: TextField(
                                  readOnly: false,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerVenusText,
                                  minLines: 2,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
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
                            const SizedBox(width: 10),
                            SizedBox(
                                width: 40,
                                child: TextField(
                                    readOnly: true,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: ''),
                                    controller: _controllerMarsHex,
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontFamily: 'iChing',
                                        color: Colors.green))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerMarsGate,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 230,
                              child: TextField(
                                  readOnly: false,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerMarsText,
                                  minLines: 2,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
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
                      width: MediaQuery.of(context).size.width * 0.3,
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
                            const SizedBox(width: 10),
                            SizedBox(
                                width: 40,
                                child: TextField(
                                    readOnly: true,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: ''),
                                    controller: _controllerJupiterHex,
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontFamily: 'iChing',
                                        color: Colors.yellow))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerJupiterGate,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 230,
                              child: TextField(
                                  readOnly: false,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerJupiterText,
                                  minLines: 2,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ])),
                ),
                Visibility(
                  visible: _isSaturnVisible,
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
                                backgroundColor: Colors.yellow,
                                backgroundImage:
                                    AssetImage('assets/planets/saturn.png')),
                            const SizedBox(width: 10),
                            SizedBox(
                                width: 40,
                                child: TextField(
                                    readOnly: true,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: ''),
                                    controller: _controllerSaturnHex,
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontFamily: 'iChing',
                                        color: Colors.yellow))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerSaturnGate,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 230,
                              child: TextField(
                                  readOnly: false,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerSaturnText,
                                  minLines: 2,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
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
                          style: TextStyle(fontSize: 20, color: Colors.yellow)),
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
                      width: MediaQuery.of(context).size.width * 0.3,
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
                            const SizedBox(width: 10),
                            SizedBox(
                                width: 40,
                                child: TextField(
                                    readOnly: true,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: ''),
                                    controller: _controllerUranusHex,
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontFamily: 'iChing',
                                        color: Colors.yellow))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerUranusGate,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 230,
                              child: TextField(
                                  readOnly: false,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerUranusText,
                                  minLines: 2,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ])),
                ),
                Visibility(
                  visible: _isNeptuneVisible,
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
                                backgroundColor: Colors.yellow,
                                backgroundImage:
                                    AssetImage('assets/planets/neptune.png')),
                            const SizedBox(width: 10),
                            SizedBox(
                                width: 40,
                                child: TextField(
                                    readOnly: true,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: ''),
                                    controller: _controllerNeptuneHex,
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontFamily: 'iChing',
                                        color: Colors.yellow))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerNeptuneGate,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 230,
                              child: TextField(
                                  readOnly: false,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerNeptuneText,
                                  minLines: 2,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ])),
                ),
                Visibility(
                  visible: _isPlutoVisible,
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
                                backgroundColor: Colors.yellow,
                                backgroundImage:
                                    AssetImage('assets/planets/pluto.png')),
                            const SizedBox(width: 10),
                            SizedBox(
                                width: 40,
                                child: TextField(
                                    readOnly: true,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: ''),
                                    controller: _controllerPlutoHex,
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontFamily: 'iChing',
                                        color: Colors.yellow))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerPlutoGate,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 230,
                              child: TextField(
                                  readOnly: false,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerPlutoText,
                                  minLines: 2,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
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
                      width: MediaQuery.of(context).size.width * 0.3,
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
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 40,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  controller: _controllerEarthHex,
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontFamily: 'iChing',
                                      color: Colors.red)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerEarthGate,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 230,
                              child: TextField(
                                  readOnly: false,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerEarthText,
                                  minLines: 2,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ])),
                ),
                Visibility(
                  visible: _isSouthNodeVisible,
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
                                backgroundColor: Colors.red,
                                backgroundImage:
                                    AssetImage('assets/planets/southnode.png')),
                            const SizedBox(width: 10),
                            SizedBox(
                                width: 40,
                                child: TextField(
                                    readOnly: true,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: ''),
                                    controller: _controllerSouthNodeHex,
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontFamily: 'iChing',
                                        color: Colors.red))),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 50,
                              child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerSouthNodeGate,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 230,
                              child: TextField(
                                  readOnly: false,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  textAlign: TextAlign.left,
                                  controller: _controllerSouthNodeText,
                                  minLines: 2,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ])),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(3.0),
                  child: TextButton(
                    child: const Text('silence',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.red)),
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
          child:  ListView.builder(
            reverse: false,
            padding: const EdgeInsets.all(2.0),
            itemCount: _planetsList.length,
            itemBuilder: (context, index) => ListTile(
              visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
              dense: true,
              leading: Text(
                idkHexList[_planetsList[index].gate!],
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
          child:  ListView.builder(
            reverse: false,
            padding: const EdgeInsets.all(2.0),
            itemCount: _planetsList.length,
            itemBuilder: (context, index) => ListTile(
              visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
              dense: true,
              leading: Text(
                idonotknowOnlylinesList[(_planetsList[index].gate! * 6) +  _planetsList[index].line! - 1],
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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

        break;
      case 'simple':

        _controllerSubType.text = 'Simple';

        _controllerSunGate.text = _sunhex.gateline!;
        _controllerEarthGate.text = _earthhex.gateline!;
        _controllerNorthNodeGate.text = _northnodehex.gateline!;
        _controllerSouthNodeGate.text = _southnodehex.gateline!;
        _controllerMoonGate.text = _moonhex.gateline!;
        _controllerMercuryGate.text = _mercuryhex.gateline!;
        _controllerVenusGate.text = _venushex.gateline!;
        _controllerMarsGate.text = _marshex.gateline!;
        _controllerJupiterGate.text = _jupiterhex.gateline!;
        _controllerSaturnGate.text = _saturnhex.gateline!;
        _controllerUranusGate.text = _uranushex.gateline!;
        _controllerNeptuneGate.text = _neptunehex.gateline!;
        _controllerPlutoGate.text = _plutohex.gateline!;

        _hexsentence = getGateSentence(_sunhex.gate!, _chosenlanguage);
        _controllerSunText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_earthhex.gate!, _chosenlanguage);
        _controllerEarthText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_northnodehex.gate!, _chosenlanguage);
        _controllerNorthNodeText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_southnodehex.gate!, _chosenlanguage);
        _controllerSouthNodeText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_moonhex.gate!, _chosenlanguage);
        _controllerMoonText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_mercuryhex.gate!, _chosenlanguage);
        _controllerMercuryText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_venushex.gate!, _chosenlanguage);
        _controllerVenusText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_marshex.gate!, _chosenlanguage);
        _controllerMarsText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_jupiterhex.gate!, _chosenlanguage);
        _controllerJupiterText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_saturnhex.gate!, _chosenlanguage);
        _controllerSaturnText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_uranushex.gate!, _chosenlanguage);
        _controllerUranusText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_neptunehex.gate!, _chosenlanguage);
        _controllerNeptuneText.text = _hexsentence.sentence!;
        _hexsentence = getGateSentence(_plutohex.gate!, _chosenlanguage);
        _controllerPlutoText.text = _hexsentence.sentence!;


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

        break;
      case 'breath':

        _controllerSubType.text = 'Breathe';

        _controllerSunText.text = 'Exhale';
        _controllerEarthText.text = 'Inhale';
        _controllerNorthNodeText.text = 'BREATHE';
        _controllerSouthNodeText.text = 'BREATH';
        _controllerMoonText.text = 'Exhale';
        _controllerMercuryText.text = 'Exhale';
        _controllerVenusText.text = 'Exhale';
        _controllerMarsText.text = 'Exhale';
        _controllerJupiterText.text = 'Inhale';
        _controllerSaturnText.text = 'Inhale';
        _controllerUranusText.text = 'Inhale';
        _controllerNeptuneText.text = 'Inhale';
        _controllerPlutoText.text = 'Inhale';

        _controllerSunGate.text = '';
        _controllerEarthGate.text = '';
        _controllerNorthNodeGate.text = '';
        _controllerSouthNodeGate.text = '';
        _controllerMoonGate.text = '';
        _controllerMercuryGate.text = '';
        _controllerVenusGate.text = '';
        _controllerMarsGate.text = '';
        _controllerJupiterGate.text = '';
        _controllerSaturnGate.text = '';
        _controllerUranusGate.text = '';
        _controllerNeptuneGate.text = '';
        _controllerPlutoGate.text = '';

        _controllerSunHex.text = '';
        _controllerEarthHex.text = '';
        _controllerNorthNodeHex.text = '';
        _controllerSouthNodeHex.text = '';
        _controllerMoonHex.text = '';
        _controllerMercuryHex.text = '';
        _controllerVenusHex.text = '';
        _controllerMarsHex.text = '';
        _controllerJupiterHex.text = '';
        _controllerSaturnHex.text = '';
        _controllerUranusHex.text = '';
        _controllerNeptuneHex.text = '';
        _controllerPlutoHex.text = '';

        break;
      case 'silence':

        _controllerSubType.text = 'silent';

        _controllerSunText.text = '';
        _controllerEarthText.text = '';
        _controllerNorthNodeText.text = '';
        _controllerSouthNodeText.text = '';
        _controllerMoonText.text = '';
        _controllerMercuryText.text = '';
        _controllerVenusText.text = '';
        _controllerMarsText.text = '';
        _controllerJupiterText.text = '';
        _controllerSaturnText.text = '';
        _controllerUranusText.text = '';
        _controllerNeptuneText.text = '';
        _controllerPlutoText.text = '';

        _controllerSunGate.text = '';
        _controllerEarthGate.text = '';
        _controllerNorthNodeGate.text = '';
        _controllerSouthNodeGate.text = '';
        _controllerMoonGate.text = '';
        _controllerMercuryGate.text = '';
        _controllerVenusGate.text = '';
        _controllerMarsGate.text = '';
        _controllerJupiterGate.text = '';
        _controllerSaturnGate.text = '';
        _controllerUranusGate.text = '';
        _controllerNeptuneGate.text = '';
        _controllerPlutoGate.text = '';

        _controllerSunHex.text = '';
        _controllerEarthHex.text = '';
        _controllerNorthNodeHex.text = '';
        _controllerSouthNodeHex.text = '';
        _controllerMoonHex.text = '';
        _controllerMercuryHex.text = '';
        _controllerVenusHex.text = '';
        _controllerMarsHex.text = '';
        _controllerJupiterHex.text = '';
        _controllerSaturnHex.text = '';
        _controllerUranusHex.text = '';
        _controllerNeptuneHex.text = '';
        _controllerPlutoHex.text = '';

        break;
      default:
        break;
    }
  }
}
