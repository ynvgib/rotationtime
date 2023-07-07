import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finallyicanlearn/logic/calculatehdchart.dart';
import 'package:finallyicanlearn/logic/hexagramaligment.dart';
import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/services/datetime.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RotateComplex extends StatefulWidget {
  const RotateComplex({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateComplexState();
  }
}

class _RotateComplexState extends State<RotateComplex> {
  List<String> _centers = [];

  HumanDesign hdfinaldata = HumanDesign();

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
      _controllermaintext = TextEditingController(),
      _controllergatelinestory = TextEditingController(),
      _controllergatetext = TextEditingController(),
      _controllerlinetext = TextEditingController(),
      _controllercoinsttext = TextEditingController(),
      _controllercoinfirsttext = TextEditingController(),
      _controllercoinsecondtext = TextEditingController(),
      _controllercointhirdtext = TextEditingController(),
      _controllerNorthNodeHex = TextEditingController(),
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
      _controllerPlanetType = TextEditingController(),
      _controllerPlanetSubType = TextEditingController();

  final CarouselController _controllercoin = CarouselController(),
      _controllerconstate = CarouselController(),
      _controllerrotationstate = CarouselController(),
      _controllertop = CarouselController(),
      _controllermid = CarouselController(),
      _controllerbot = CarouselController();

  final String _title = subtitles[0];

  String _textlevel = '',
      _planettext = '',
      _formattedDate = '',
      _formattedTime = '';

  DateTime _now = DateTime.now(),
      _designTime = DateTime.now(),
      _selectedDate = DateTime.now();

  TimeOfDay _selectedtime = const TimeOfDay(hour: 0, minute: 0);

  List<Hexagram> _planetsList = [Hexagram(line: 1)],
      _planetsdesignList = [Hexagram(line: 1)],
      _planetsnowList = [Hexagram(line: 1)];

  List<HDChannel> _channelsList = [];

  int _currentmain = 0,
      _currenttop = 0,
      _currentmid = 0,
      _currentbot = 0,
      _currentconstate = 0,
      _currentrotationstate = 0,
      _chosenhex = 1,
      _hexagramVal = 0,
      _carouselvalueindex = 0,
      _previousPlanetIndex = -1;

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

  Hexagram _planethex = Hexagram();

  final List<bool> _isPlanetSelectedList =
      List<bool>.filled(13, false, growable: false);

  final List<String> finalhexNamesList = hexNamesList;

  List<int> _hexalignedList = [0, 0, 0];

  Color colorindex = Colors.blue,
      firstcolor = Colors.blue,
      secondcolor = Colors.blue,
      thirdcolor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        title: AutoSizeText(_title, textAlign: TextAlign.left, maxFontSize: 15),
        leading: IconButton(
          iconSize: 20,
          icon: const Icon(Icons.close),
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
            const SizedBox(height: 10),
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
                    controller: _controllermaintext,
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
                      carouselController: _controllercoin,
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          enlargeCenterPage: true,
                          aspectRatio: 1.5,
                          onPageChanged: (indextop, reason) {
                            setState(() {
                              _currentmain = indextop;
                              _controllermaintext.text =
                                  hexNamesList[_currentmain];
                            });
                          }),
                    ),
                  ),
                )
              ],
            ),

            const Divider(
              color: Colors.blue,
              thickness: 5,
            ),
            SizedBox(
              height: 40,
              width: 40,
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
                            _controllerTime.text =
                            '$_formattedTime $_formattedDate';
                            //_controllerDate.text = _formattedDate;
                            _controllerPlanetType.text = 'Thought Later';

                            _controllerrotationstate.jumpToPage(0);
                            break;
                          case 1:
                            _planetsList = _planetsdesignList;

                            _controlPlanetHexagramData(_planetsList);

                            _formattedDate =
                                DateFormat('yyyy-MM-dd').format(_designTime);
                            _formattedTime =
                                DateFormat.Hms().format(_designTime);
                            _controllerTime.text =
                            '$_formattedTime $_formattedDate';
                            //_controllerDate.text = _formattedDate;

                            _controllerPlanetType.text = 'Life First';

                            _controllerrotationstate.jumpToPage(3);
                            break;
                          default:
                            _planetsList = _planetsnowList;

                            _controlPlanetHexagramData(_planetsList);

                            _formattedDate =
                                DateFormat('yyyy-MM-dd').format(_now);
                            _formattedTime = DateFormat.Hms().format(_now);
                            _controllerTime.text =
                            '$_formattedTime $_formattedDate';
                            //_controllerDate.text = _formattedDate;
                            break;
                        }
                      });
                    }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            ToggleButtons(
              direction: Axis.horizontal,
              constraints: BoxConstraints.expand(
                  width: MediaQuery.of(context).size.width * 0.9 / 14,
                  height: MediaQuery.of(context).size.height * 0.9 / 14),
              borderWidth: 0.5,
              hoverColor: Colors.black,
              //borderRadius: BorderRadius.circular(20),
              fillColor: Colors.blue,
              isSelected: _isPlanetSelectedList,
              onPressed: (int index) async {
                setState(() {
                  switch (_previousPlanetIndex) {
                    case -1:
                      _previousPlanetIndex = index;
                      _isPlanetSelectedList[index] =
                          !_isPlanetSelectedList[index];
                      break;
                    default:
                      _isPlanetSelectedList[_previousPlanetIndex] =
                          !_isPlanetSelectedList[_previousPlanetIndex];
                      _isPlanetSelectedList[index] =
                          !_isPlanetSelectedList[index];
                      _previousPlanetIndex = index;
                  }

                  _planethex = _planetsList[index];
                  //_hexsentence = getGateSentence(_planethex.gate!, _chosenlanguage);
                  //_hexsentence = LineSentenceList[_planethex.gate!];

                  _hexalignedList = hexagramAlignment(_planethex.gate!);
                  _controllertop.jumpToPage(_hexalignedList[0]);
                  _controllermid.jumpToPage(_hexalignedList[1]);
                  _controllerbot.jumpToPage(_hexalignedList[2]);

                  _controllerlinetext.text = _planethex.line!.toString();

                  _controllergatelinestory.text = idonotknowlinesList[
                      (idonotknowlinesList.indexOf(_planethex.gate!) +
                          _planethex.line!)];
                });
              },
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/sun.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/earth.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/northnode.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/southnode.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/moon.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/mercury.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/venus.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/mars.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/jupiter.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/saturn.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/uranus.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/neptune.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/pluto.png")),
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                SizedBox(
                    width: 30,
                    child: AutoSizeTextField(
                      fullwidth: false,
                      decoration: const InputDecoration.collapsed(
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllergatetext,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                SizedBox(
                    width: 20,
                    child: AutoSizeTextField(
                      fullwidth: false,
                      decoration: const InputDecoration.collapsed(
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllerlinetext,
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
              ],
            ),
            const Divider(
              color: Colors.blue,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.height / 3,
                child: AutoSizeTextField(
                  minLines: 1,
                  maxLines: 4,
                  minFontSize: 17,
                  fullwidth: true,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'Story',
                      hintStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                  controller: _controllergatelinestory,
                  readOnly: true,
                )),
            const Divider(
              color: Colors.blue,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 10,
                minWidth: 10,
                maxHeight: MediaQuery.of(context).size.height * 0.1,
                maxWidth: MediaQuery.of(context).size.width * 0.15,
              ),
              child: CarouselSlider(
                items: mixHexagramSlidersNew,
                carouselController: _controllertop,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indextop, reason) {
                      setState(() {
                        _currenttop = indextop;

                        _hexagramVal = ((_currenttop + 1) * 100 +
                            (_currentmid + 1) * 10 +
                            (_currentbot + 1));

                        _carouselvalueindex =
                            hexCarouselWheelOrderList.indexOf(_hexagramVal);

                        _chosenhex = orderHexagramsWheel[_carouselvalueindex];

                        _controllergatetext.text = _chosenhex.toString();

                        //_hexsentence = getGateSentence(_chosenhex, _chosenlanguage);
                        //_hexsentence = LineSentenceList[_planethex.gate!];

                        //_controllertopfirsttext.text = _hexsentence.adjective!;

                        _controllercoinsttext.text =
                            LineSentenceWBreaksList[_chosenhex];
                        //_controllertopsecondtext.text = _hexsentence.subject!;
                        //_controllertopthirdtext.text = _hexsentence.verb!;
                        //_controllertopfourthtext.text = _hexsentence.adverb!;

                        thirdcolor =
                            controlCollor(finalhexNamesList[_currenttop]);
                        _controllercointhirdtext.text =
                            finalhexNamesList[_currenttop];
                      });
                    }),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 10,
                minWidth: 10,
                maxHeight: MediaQuery.of(context).size.height * 0.1,
                maxWidth: MediaQuery.of(context).size.width * 0.15,
              ),
              child: CarouselSlider(
                items: mixHexagramSlidersNew,
                carouselController: _controllermid,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexmid, reason) {
                      setState(() {
                        _currentmid = indexmid;

                        _hexagramVal = ((_currenttop + 1) * 100 +
                            (_currentmid + 1) * 10 +
                            (_currentbot + 1));

                        _carouselvalueindex =
                            hexCarouselWheelOrderList.indexOf(_hexagramVal);

                        _chosenhex = orderHexagramsWheel[_carouselvalueindex];

                        _controllergatetext.text = _chosenhex.toString();

                        //_hexsentence = getGateSentence(_chosenhex, _chosenlanguage);

                        _controllercoinsttext.text =
                            LineSentenceWBreaksList[_chosenhex];

                        //_controllertopfirsttext.text = _hexsentence.adjective!;
                        //_controllertopsecondtext.text = _hexsentence.subject!;
                        //_controllertopthirdtext.text = _hexsentence.verb!;
                        //_controllertopfourthtext.text = _hexsentence.adverb!;

                        secondcolor =
                            controlCollor(finalhexNamesList[_currentmid]);
                        _controllercoinsecondtext.text =
                            finalhexNamesList[_currentmid];
                      });
                    }),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 10,
                minWidth: 10,
                maxHeight: MediaQuery.of(context).size.height * 0.1,
                maxWidth: MediaQuery.of(context).size.width * 0.15,
              ),
              child: CarouselSlider(
                items: mixHexagramSlidersNew,
                carouselController: _controllerbot,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexbot, reason) {
                      setState(() {
                        _currentbot = indexbot;
                        _hexagramVal = ((_currenttop + 1) * 100 +
                            (_currentmid + 1) * 10 +
                            (_currentbot + 1));

                        _carouselvalueindex =
                            hexCarouselWheelOrderList.indexOf(_hexagramVal);

                        _chosenhex = orderHexagramsWheel[_carouselvalueindex];

                        _controllergatetext.text = _chosenhex.toString();

                        //_hexsentence = getGateSentence(_chosenhex, _chosenlanguage);

                        _controllercoinsttext.text =
                            LineSentenceWBreaksList[_chosenhex];
                        //_controllertopfirsttext.text = _hexsentence.adjective!;
                        //_controllertopsecondtext.text = _hexsentence.subject!;
                        //_controllertopthirdtext.text = _hexsentence.verb!;
                        //_controllertopfourthtext.text = _hexsentence.adverb!;

                        firstcolor =
                            controlCollor(finalhexNamesList[_currentbot]);
                        _controllercoinfirsttext.text =
                            finalhexNamesList[_currentbot];
                      });
                    }),
              ),
            ),
            const Divider(
              color: Colors.blue,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.7,
              child: AutoSizeTextField(
                minLines: 1,
                maxLines: 3,
                minFontSize: 16,
                fullwidth: false,
                decoration: InputDecoration.collapsed(
                    hintText: LineSentenceWBreaksList[0],
                    hintStyle: const TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                controller: _controllercoinsttext,
                readOnly: true,
              ),
            ),
            const Divider(
              color: Colors.blue,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: AutoSizeTextField(
                      minFontSize: 10,
                      maxFontSize: 30,
                      decoration: InputDecoration.collapsed(
                          hintText: finalhexNamesList[0],
                          hintStyle: const TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: firstcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercoinfirsttext,
                      readOnly: true,
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: AutoSizeTextField(
                      decoration: InputDecoration.collapsed(
                          hintText: finalhexNamesList[0],
                          hintStyle: const TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: secondcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercoinsecondtext,
                      readOnly: true,
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: AutoSizeTextField(
                      decoration: InputDecoration.collapsed(
                          hintText: finalhexNamesList[0],
                          hintStyle: const TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: thirdcolor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllercointhirdtext,
                      readOnly: true,
                    )),
              ],
            ),
            const Divider(
              color: Colors.blue,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                            _currentrotationstate = indexcrotstate;

                            switch (_currentrotationstate) {
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
                const SizedBox(width: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: AutoSizeTextField(
                      fullwidth: false,
                      readOnly: true,
                      textAlign: TextAlign.right,
                      decoration:
                          const InputDecoration.collapsed(hintText: 'Sentence'),
                      controller: _controllerPlanetSubType,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black)),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: AutoSizeTextField(
                      fullwidth: false,
                      textAlign: TextAlign.left,
                      readOnly: true,
                      decoration:
                          const InputDecoration.collapsed(hintText: 'Rotation'),
                      controller: _controllerPlanetType,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black)),
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
                    switch (_currentrotationstate) {
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
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    switch (_currentrotationstate) {
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
                      switch (_currentrotationstate) {
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
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerMoonGate,
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
                      switch (_currentrotationstate) {
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
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
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
                      switch (_currentrotationstate) {
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
                        backgroundImage:
                            AssetImage('assets/planets/venus.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerVenusGate,
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
                      switch (_currentrotationstate) {
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
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
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
                      switch (_currentrotationstate) {
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
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerJupiterGate,
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
                      switch (_currentrotationstate) {
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
                        backgroundImage:
                            AssetImage('assets/planets/saturn.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
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
                    switch (_currentrotationstate) {
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
                      switch (_currentrotationstate) {
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
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerNeptuneGate,
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
                      switch (_currentrotationstate) {
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
                        backgroundImage:
                            AssetImage('assets/planets/pluto.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
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
                      switch (_currentrotationstate) {
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
                        backgroundImage:
                            AssetImage('assets/planets/earth.png')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.left,
                        controller: _controllerEarthGate,
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
                      switch (_currentrotationstate) {
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
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
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
            SizedBox(height: 10),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            const Divider(
              color: Colors.blue,
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
      content: SingleChildScrollView(
        child: Flex(
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
                      fontSize: 15, fontWeight: FontWeight.normal)),
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
                      fontSize: 15, fontWeight: FontWeight.normal)),
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

                _channelsList = HDServices.getHDChannels(
                    _planetsnowList, _planetsdesignList);

                //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);
                hdfinaldata = HDServices.getHDBasicData(_channelsList);

                _centers = HDServices.getHDDefinedCenters(_channelsList);
                //_fearSentence = HDServices.getHDDefinedFears(_centers);
                //_selfreminderSentence = HDServices.getSelfReminder();
                _selfreminder = _timeselfreminder;

                //_controlHDData(hdbasicdata);
                _controlHDData(hdfinaldata);
                hdfinaldata = HDServices.getHDBasicData(_channelsList);

                _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
                _formattedTime = DateFormat.Hms().format(_now);
                _controllerTime.text = 'text $_formattedTime $_formattedDate';

                _planetsList = _planetsnowList;
                _planethex = _planetsList[0];
                //_hexsentence = getGateSentence(_planethex.gate!, _chosenlanguage);

                _hexalignedList = hexagramAlignment(_planethex.gate!);
                _controllertop.jumpToPage(_hexalignedList[0]);
                _controllermid.jumpToPage(_hexalignedList[1]);
                _controllerbot.jumpToPage(_hexalignedList[2]);

                _controllerlinetext.text = _planethex.line!.toString();
                _controllergatelinestory.text = idonotknowlinesList[
                    (idonotknowlinesList.indexOf(_planethex.gate!) +
                        _planethex.line!)];

                switch (_previousPlanetIndex) {
                  case -1:
                    _previousPlanetIndex = 0;
                    _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                    break;
                  default:
                    _isPlanetSelectedList[_previousPlanetIndex] =
                        !_isPlanetSelectedList[_previousPlanetIndex];
                    _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                    _previousPlanetIndex = 0;
                }

                switch (_currentconstate) {
                  case 0:
                    _controllerconstate.jumpToPage(1);
                    _controllerconstate.jumpToPage(0);
                    _controllerrotationstate.jumpToPage(0);
                    break;
                  case 1:
                    _controllerconstate.jumpToPage(0);
                    break;
                  default:
                    _controllerconstate.jumpToPage(0);
                    break;
                }

                setState(() {
                  Navigator.of(context).pop();
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text('Fetch Your Time',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
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

                //_designTime = await AstrologyServices.getDesignTime(_now);
                //emulate design time to now time to prevent blank
                _planetsdesignList =
                    await AstrologyServices.getCurrentData(_now);

                _channelsList =
                    HDServices.getHDChannelsJustNow(_planetsnowList);

                //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);

                hdfinaldata = HDServices.getHDBasicData(_channelsList);
                //_controlHDData(hdbasicdata);
                _controlHDData(hdfinaldata);

                _centers = HDServices.getHDDefinedCenters(_channelsList);
                //_fearSentence = HDServices.getHDDefinedFears(_centers);
                //_selfreminderSentence = HDServices.getSelfReminder();
                _selfreminder = _timeselfreminder;

                _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
                _formattedTime = DateFormat.Hms().format(_now);
                _controllerTime.text = '$_formattedTime $_formattedDate';

                _planetsList = _planetsnowList;
                _planethex = _planetsList[0];
                //_hexsentence = getGateSentence(_planethex.gate!, _chosenlanguage);

                _hexalignedList = hexagramAlignment(_planethex.gate!);
                _controllertop.jumpToPage(_hexalignedList[0]);
                _controllermid.jumpToPage(_hexalignedList[1]);
                _controllerbot.jumpToPage(_hexalignedList[2]);

                _controllerlinetext.text = _planethex.line!.toString();
                _controllergatelinestory.text = idonotknowlinesList[
                    (idonotknowlinesList.indexOf(_planethex.gate!) +
                        _planethex.line!)];

                switch (_previousPlanetIndex) {
                  case -1:
                    _previousPlanetIndex = 0;
                    _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                    break;
                  default:
                    _isPlanetSelectedList[_previousPlanetIndex] =
                        !_isPlanetSelectedList[_previousPlanetIndex];
                    _isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                    _previousPlanetIndex = 0;
                }

                switch (_currentconstate) {
                  case 0:
                    _controllerconstate.jumpToPage(1);
                    _controllerconstate.jumpToPage(0);
                    _controllerrotationstate.jumpToPage(0);
                    break;
                  case 1:
                    _controllerconstate.jumpToPage(0);
                    break;
                  default:
                    _controllerconstate.jumpToPage(0);
                    break;
                }

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
                      fontSize: 15,
                      fontWeight: FontWeight.normal)),
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

  Widget _buildCentersPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Centers'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            padding: const EdgeInsets.all(1),
            itemCount: _centers.length,
            itemBuilder: (BuildContext context, int index) {
              Color centercolor = Colors.green;
              switch (_centers[index]) {
                case 'head':
                  centercolor = Colors.yellow;
                  break;
                case 'ajna':
                  centercolor = Colors.yellow;
                  break;
                case 'throat':
                  centercolor = const Color(0xFF807A2B);
                  break;
                case 'self':
                  centercolor = const Color(0xFFFF7700);
                  break;
                case 'sacral':
                  centercolor = Colors.red;
                  break;
                case 'root':
                  centercolor = const Color(0xFFFF7700);
                  break;
                case 'spleen':
                  centercolor = const Color(0xFFFF7700);
                  break;
                case 'solar':
                  centercolor = const Color(0xFF807A2B);
                  break;
                case 'heart':
                  centercolor = const Color(0xFF809A56);
                  break;
                default:
                  centercolor = Colors.red;
                  break;
              }
              return Container(
                decoration: BoxDecoration(
                    color: centercolor,
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
                    style: const TextStyle(fontSize: 18, color: Colors.black),
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
            itemCount: _channelsList.length,
            itemBuilder: (BuildContext context, int index) {
              Color coincolor = Colors.red;
              switch (_channelsList[index].coin) {
                case 'silence':
                  coincolor = Colors.red;
                  break;
                case 'breath':
                  coincolor = Colors.yellow;
                  break;
                case 'simple':
                  coincolor = Colors.green;
                  break;
                case 'complex':
                  coincolor = Colors.blue;
                  break;
                default:
                  coincolor = Colors.red;
                  break;
              }
              return Container(
                decoration: BoxDecoration(
                    //color: Colors.blue[100],
                    color: coincolor,
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
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _channelsList[index].adaptname!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        _channelsList[index].coin!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15),
                      ),
                    ],
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
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
            ),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          style: const TextStyle(
                              color: Colors.blue, fontSize: 15)),
                    ),
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
                        style: TextStyle(color: Colors.blue, fontSize: 15)),
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
                            const TextStyle(color: Colors.blue, fontSize: 15)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FittedBox(
                fit: BoxFit.fill,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                              const TextStyle(color: Colors.red, fontSize: 15)),
                    ),
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
                        style: TextStyle(color: Colors.red, fontSize: 15)),
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
                            const TextStyle(color: Colors.red, fontSize: 15)),
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

  void _controlHDData(HumanDesign hdbasicdata) {

    _controllerFinalLine.text = 'XIO I don\'t know';

    _controllerStrategy.text = hdbasicdata.strategy!;
    _controllerAuthority.text = hdbasicdata.authority!;
    _controllerType.text = hdbasicdata.type!;
    _controllerSentence.text = hdbasicdata.sentence!;
    _controllercoinfirsttext.text = hdbasicdata.coinname!;
    _controllercoin.jumpToPage(hexNamesList.indexOf(hdbasicdata.coinname!));
    _currenttop = hexNamesList.indexOf(hdbasicdata.coinname!);

  }

  controlCollor(String colorcoin) {
    Color finalcolor;
    switch (colorcoin) {
      case 'silence':
        finalcolor = Colors.red;
        break;
      case 'Breath':
        finalcolor = Colors.yellow;
        break;
      case 'Simple':
        finalcolor = Colors.green;
        break;
      case 'COMPLEX':
        finalcolor = Colors.blue;
        break;
      default:
        finalcolor = Colors.black;
        break;
    }
    return finalcolor;
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
                    CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: Colors.transparent,
                        foregroundImage: AssetImage(planetsimagelist[index])),
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
                    CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: Colors.transparent,
                        foregroundImage: AssetImage(planetsimagelist[index])),
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
        _controllerPlanetSubType.text = 'COMPLEX';

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
        _controllerPlanetSubType.text = 'Simple';

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
        _controllerPlanetSubType.text = 'Breathe';

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
        _controllerPlanetSubType.text = 'silent';

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
