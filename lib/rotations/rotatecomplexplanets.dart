import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finallyicanlearn/logic/hdsubstructure.dart';
import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/services/datetime.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RotateComplexPlanets extends StatefulWidget {
  const RotateComplexPlanets({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateComplexPlanetsState();
  }
}

class _RotateComplexPlanetsState extends State<RotateComplexPlanets> {
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

  String _formattedDate = '',
      _formattedTime = '',
      _textlevel = '',
      _planettext = '';
  final String _title = subtitlesEN[0], _chosenlanguage = 'EN';

  final HexagramSentence _hexsentence = getGateSentence(1, 'EN');

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

  int _currentconstate = 0, _currentcrotationstate = 0;

  final CarouselController _controllerconstate = CarouselController(),
      _controllerrotationstate = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 40,
        title: AutoSizeText(_title, textAlign: TextAlign.left, maxFontSize: 15),
        leading: TextButton(
          child: const Text(
            'X',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildTimeDialog(context),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      'Time',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildStoriesDialog(context),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      'Stories',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CarouselSlider(
                    items: mixHexagramSlidersBol,
                    carouselController: _controllerconstate,
                    options: CarouselOptions(
                        scrollDirection: Axis.vertical,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexconstate, reason) {
                          setState(() {
                            _currentconstate = indexconstate;

                            switch (_currentconstate) {
                              case 0:
                                _planetsList = _planetsnowList;

                                _controlPlanetHexagramData(_planetsList);

                                _formattedDate =
                                    DateFormat('yyyy-MM-dd').format(_now);
                                _formattedTime = DateFormat.Hms().format(_now);
                                _controllerTime.text = _formattedTime;
                                _controllerDate.text = _formattedDate;

                                _controllerType.text = 'Thought Later';
                                _controllerSubType.text = 'COMPLEX';
                                break;
                              case 1:
                                _planetsList = _planetsdesignList;

                                _controlPlanetHexagramData(_planetsList);

                                _textlevel = 'silence';
                                _changeTextLevels(_textlevel);

                                _formattedDate =
                                    DateFormat('yyyy-MM-dd').format(_designTime);
                                _formattedTime =
                                    DateFormat.Hms().format(_designTime);

                                _controllerTime.text = _formattedTime;
                                _controllerDate.text = _formattedDate;
                                _controllerType.text = 'Life First';
                                break;
                              default:
                                _planetsList = _planetsnowList;
                                _formattedDate =
                                    DateFormat('yyyy-MM-dd').format(_now);
                                _formattedTime = DateFormat.Hms().format(_now);
                                _controllerTime.text = _formattedTime;
                                _controllerDate.text = _formattedDate;
                                break;
                            }
                          });
                        }),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: AutoSizeTextField(
                      fullwidth: false,
                      readOnly: true,
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration.collapsed(hintText: 'Sentence'),
                      controller: _controllerSubType,
                      style: const TextStyle(fontSize: 12, color: Colors.black)),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: AutoSizeTextField(
                      fullwidth: false,
                      textAlign: TextAlign.left,
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(hintText: 'Rotation'),
                      controller: _controllerType,
                      style: const TextStyle(fontSize: 12, color: Colors.black)),
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerrotationstate,
                    options: CarouselOptions(
                        scrollDirection: Axis.vertical,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexcrotstate, reason) {
                          setState(() {
                            _currentcrotationstate = indexcrotstate;

                            switch (_currentcrotationstate) {
                              case 0:
                                _textlevel = 'complex';
                                _changeTextLevels(_textlevel);
                                break;
                              case 1:
                                _textlevel = 'simple';
                                _changeTextLevels(_textlevel);
                                break;
                              case 2:
                                _textlevel = 'breath';
                                _changeTextLevels(_textlevel);
                                break;
                              case 3:
                                _textlevel = 'silence';
                                _changeTextLevels(_textlevel);
                                break;
                              default:
                                _textlevel = 'complex';
                                _changeTextLevels(_textlevel);
                                break;
                            }
                          });
                        }),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: AutoSizeTextField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: 'Time'),
                        controller: _controllerTime,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.blue)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: AutoSizeTextField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: 'Date'),
                        controller: _controllerDate,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.blue)),
                  ),
                ]),
            const Divider(
              color: Colors.black,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    switch (_currentcrotationstate) {
                      case 0:
                        _planettext = _sunhex.linename!;
                        break;
                      case 1:
                        _planettext = idkHexList[_sunhex.gate!];
                        break;
                      case 2:
                        _planettext = 'breath';
                        break;
                      case 3:
                        _planettext = 'silence';
                        break;
                      default:
                        break;
                    }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPlanetDialog(context, _planettext),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    shape: const CircleBorder(),
                  ),
                  child: const CircleAvatar(
                      minRadius: 13.0,
                      maxRadius: 13.0,
                      backgroundColor: Colors.blue,
                      foregroundImage: AssetImage('assets/planets/sun.png')),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: AutoSizeTextField(
                      fullwidth: false,
                      minFontSize: 10,
                      maxFontSize: 20,
                      maxLines: 1,
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      textAlign: TextAlign.left,
                      controller: _controllerSunGate,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (_currentcrotationstate) {
                      case 0:
                        _planettext = _northnodehex.linename!;
                        break;
                      case 1:
                        _planettext = idkHexList[_northnodehex.gate!];
                        break;
                      case 2:
                        _planettext = 'breath';
                        break;
                      case 3:
                        _planettext = 'silence';
                        break;
                      default:
                        break;
                    }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPlanetDialog(context, _planettext),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    shape: const CircleBorder(),
                  ),
                  child: const CircleAvatar(
                      minRadius: 13.0,
                      maxRadius: 13.0,
                      backgroundColor: Colors.blue,
                      foregroundImage:
                          AssetImage('assets/planets/northnode.png')),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: AutoSizeTextField(
                      fullwidth: false,
                      minFontSize: 10,
                      maxFontSize: 20,
                      maxLines: 1,
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      textAlign: TextAlign.left,
                      controller: _controllerNorthNodeGate,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
            const Divider(
              color: Colors.blue,
            ),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentcrotationstate) {
                        case 0:
                          _planettext = _moonhex.linename!;
                          break;
                        case 1:
                          _planettext = idkHexList[_moonhex.gate!];
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.green,
                        backgroundImage: AssetImage('assets/planets/moon.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerMoonGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentcrotationstate) {
                        case 0:
                          _planettext = _mercuryhex.linename!;
                          break;
                        case 1:
                          _planettext = idkHexList[_mercuryhex.gate!];
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.green,
                        backgroundImage:
                            AssetImage('assets/planets/mercury.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerMercuryGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentcrotationstate) {
                        case 0:
                          _planettext = _venushex.linename!;
                          break;
                        case 1:
                          _planettext = idkHexList[_venushex.gate!];
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.green,
                        backgroundImage: AssetImage('assets/planets/venus.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerVenusGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentcrotationstate) {
                        case 0:
                          _planettext = _marshex.linename!;
                          break;
                        case 1:
                          _planettext = idkHexList[_marshex.gate!];
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.green,
                        backgroundImage: AssetImage('assets/planets/mars.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerMarsGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            const Divider(
              color: Colors.green,
            ),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentcrotationstate) {
                        case 0:
                          _planettext = _jupiterhex.linename!;
                          break;
                        case 1:
                          _planettext = idkHexList[_jupiterhex.gate!];
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage:
                            AssetImage('assets/planets/jupiter.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerJupiterGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentcrotationstate) {
                        case 0:
                          _planettext = _saturnhex.linename!;
                          break;
                        case 1:
                          _planettext = idkHexList[_saturnhex.gate!];
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage('assets/planets/saturn.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerSaturnGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    switch (_currentcrotationstate) {
                      case 0:
                        _planettext = _uranushex.linename!;
                        break;
                      case 1:
                        _planettext = idkHexList[_uranushex.gate!];
                        break;
                      case 2:
                        _planettext = 'breath';
                        break;
                      case 3:
                        _planettext = 'silence';
                        break;
                      default:
                        break;
                    }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPlanetDialog(context, _planettext),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                    shape: const CircleBorder(),
                  ),
                  child: const CircleAvatar(
                      minRadius: 13.0,
                      maxRadius: 13.0,
                      backgroundColor: Colors.yellow,
                      backgroundImage: AssetImage('assets/planets/uranus.png')),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: AutoSizeTextField(
                      readOnly: true,
                      decoration: const InputDecoration.collapsed(hintText: ''),
                      textAlign: TextAlign.left,
                      controller: _controllerUranusGate,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            ),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentcrotationstate) {
                        case 0:
                          _planettext = _neptunehex.linename!;
                          break;
                        case 1:
                          _planettext = idkHexList[_neptunehex.gate!];
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage:
                            AssetImage('assets/planets/neptune.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerNeptuneGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentcrotationstate) {
                        case 0:
                          _planettext = _plutohex.linename!;
                          break;
                        case 1:
                          _planettext = idkHexList[_plutohex.gate!];
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage('assets/planets/pluto.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerPlutoGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            const Divider(
              color: Colors.yellow,
            ),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentcrotationstate) {
                        case 0:
                          _planettext = _earthhex.linename!;
                          break;
                        case 1:
                          _planettext = idkHexList[_earthhex.gate!];
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.red,
                        backgroundImage: AssetImage('assets/planets/earth.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerEarthGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentcrotationstate) {
                        case 0:
                          _planettext = _southnodehex.linename!;
                          break;
                        case 1:
                          _planettext = idkHexList[_southnodehex.gate!];
                          break;
                        case 2:
                          _planettext = 'breath';
                          break;
                        case 3:
                          _planettext = 'silence';
                          break;
                        default:
                          break;
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPlanetDialog(context, _planettext),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      shape: const CircleBorder(),
                    ),
                    child: const CircleAvatar(
                        minRadius: 13.0,
                        maxRadius: 13.0,
                        backgroundColor: Colors.red,
                        backgroundImage:
                            AssetImage('assets/planets/southnode.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerSouthNodeGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ]),
            const Divider(
              color: Colors.red,
            ),
            const SizedBox(
              width: 50,
              child: AutoSizeText(
                'a',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontFamily: 'iChing',
                ),
              ),
            ),
          ],
        ),
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
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.normal)),
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
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.normal)),
            child: const Text('Set Date'),
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

              _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
              _formattedTime = DateFormat.Hms().format(_now);
              _controllerTime.text = _formattedTime;
              _controllerDate.text = _formattedDate;
              _controllerType.text = 'Thought Later';
              _controllerSubType.text = 'COMPLEX';
              _controllerconstate.jumpToPage(0);
              _controllerrotationstate.jumpToPage(0);

              setState(() {
                Navigator.of(context).pop();
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
            child: const Text('Fetch Your Time',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.normal)),
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

                _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
                _formattedTime = DateFormat.Hms().format(_now);
                _controllerTime.text = _formattedTime;
                _controllerDate.text = _formattedDate;

                _controllerType.text = 'Thought Later';
                _controllerSubType.text = 'COMPLEX';

                _controllerconstate.jumpToPage(0);
                _controllerrotationstate.jumpToPage(0);

                setState(() {
                  Navigator.of(context).pop();
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.normal)),
              child: const Text('Fetch Now Instead')),
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
      content: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildGatesDialog(context),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: const Text(
                  'Gates',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildLinesDialog(context),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: const Text(
                  'Lines',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
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

  Widget _buildGatesDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Gates'),
      content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView.builder(
            reverse: false,
            itemCount: _planetsList.length,
            itemBuilder: (context, index) => ListTile(
              title: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      _planetsList[index].gate!.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      idkHexList[_planetsList[index].gate!],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          )),
      actions: [
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
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView.builder(
            reverse: false,
            itemCount: _planetsList.length,
            itemBuilder: (context, index) => ListTile(
              title: SizedBox(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      _planetsList[index].gateline!.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      idonotknowOnlylinesList[(_planetsList[index].gate! * 6) +
                          _planetsList[index].line! -
                          1],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          )),
      actions: [
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

  Widget _buildPlanetDialog(BuildContext context, String matchtext) {
    return AlertDialog(
      title: const Text('Story'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        child: Text(matchtext,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal)),
      ),
      actions: [
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

  void _controlPlanetHexagramData(List<Hexagram> planetList) {
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
    //_controllerSunGate.text = _sunhex.gatelinecolortonebase!;
    _controllerEarthGate.text = _earthhex.gatelinecolortone!;
    //_controllerEarthGate.text = _earthhex.gatelinecolortonebase!;
    _controllerNorthNodeGate.text = _northnodehex.gatelinecolortone!;
    //_controllerNorthNodeGate.text = _northnodehex.gatelinecolortonebase!;
    _controllerSouthNodeGate.text = _southnodehex.gatelinecolortone!;
    //_controllerSouthNodeGate.text = _southnodehex.gatelinecolortonebase!;
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

  void _changeTextLevels(String textlevel) {
    switch (textlevel) {
      case 'complex':
        _controllerSubType.text = 'COMPLEX';

        _controllerSunGate.text = _sunhex.gatelinecolortone!;
        //_controllerSunGate.text = _sunhex.gatelinecolortonebase!;
        _controllerEarthGate.text = _earthhex.gatelinecolortone!;
        //_controllerEarthGate.text = _earthhex.gatelinecolortonebase!;
        _controllerNorthNodeGate.text = _northnodehex.gatelinecolortone!;
        //_controllerNorthNodeGate.text = _northnodehex.gatelinecolortonebase!;
        _controllerSouthNodeGate.text = _southnodehex.gatelinecolortone!;
        //_controllerSouthNodeGate.text = _southnodehex.gatelinecolortonebase!;
        _controllerMoonGate.text = _moonhex.gatelinecolor!;
        _controllerMercuryGate.text = _mercuryhex.gatelinecolor!;
        _controllerVenusGate.text = _venushex.gatelinecolor!;
        _controllerMarsGate.text = _marshex.gatelinecolor!;
        _controllerJupiterGate.text = _jupiterhex.gatelinecolor!;
        _controllerSaturnGate.text = _saturnhex.gatelinecolor!;
        _controllerUranusGate.text = _uranushex.gatelinecolor!;
        _controllerNeptuneGate.text = _neptunehex.gatelinecolor!;
        _controllerPlutoGate.text = _plutohex.gatelinecolor!;

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

        break;
      case 'breath':
        _controllerSubType.text = 'Breathe';

        _controllerSunGate.text = 'Exhale';
        _controllerEarthGate.text = 'Inhale';
        _controllerNorthNodeGate.text = 'BREATHE';
        _controllerSouthNodeGate.text = 'BREATH';
        _controllerMoonGate.text = 'Exhale';
        _controllerMercuryGate.text = 'Exhale';
        _controllerVenusGate.text = 'Exhale';
        _controllerMarsGate.text = 'Exhale';
        _controllerJupiterGate.text = 'Inhale';
        _controllerSaturnGate.text = 'Inhale';
        _controllerUranusGate.text = 'Inhale';
        _controllerNeptuneGate.text = 'Inhale';
        _controllerPlutoGate.text = 'Inhale';

        break;
      case 'silence':
        _controllerSubType.text = 'silent';

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

        break;
      default:
        break;
    }
  }
}
