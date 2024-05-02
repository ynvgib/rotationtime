import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_list/circle_list.dart';
import 'package:finallyicanlearn/logic/calculatehdchart.dart';
import 'package:finallyicanlearn/logic/hexagramaligment.dart';
import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/services/datetime.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchplanets.dart';
import 'package:finallyicanlearn/services/rotatewidgets.dart';
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
  List<String> _centers = [], language = ['English', 'Hebrew'];

  List<int> listdesigngates = List.generate(13, (index) => index++),
      listpersonalitygates = List.generate(13, (index) => index++);

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
      _controllerPersonTime = TextEditingController(),
      _controllerDesignTime = TextEditingController(),
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
      _controllercointopfirsttext = TextEditingController(),
      _controllercointopsecondtext = TextEditingController(),
      _controllercointopthirdtext = TextEditingController(),
      _controllerNorthNodeHex = TextEditingController(),
      _controllerNorthNodeText = TextEditingController(),
      _controllerNorthNodeGate = TextEditingController(),
      _controllerDesignNorthNodeGate = TextEditingController(),
      _controllerSunHex = TextEditingController(),
      _controllerSunText = TextEditingController(),
      _controllerSunGate = TextEditingController(),
      _controllerDesignSunGate = TextEditingController(),
      _controllerMoonHex = TextEditingController(),
      _controllerMoonText = TextEditingController(),
      _controllerMoonGate = TextEditingController(),
      _controllerDesignMoonGate = TextEditingController(),
      _controllerMarsHex = TextEditingController(),
      _controllerMarsText = TextEditingController(),
      _controllerMarsGate = TextEditingController(),
      _controllerDesignMarsGate = TextEditingController(),
      _controllerVenusHex = TextEditingController(),
      _controllerVenusText = TextEditingController(),
      _controllerVenusGate = TextEditingController(),
      _controllerDesignVenusGate = TextEditingController(),
      _controllerMercuryHex = TextEditingController(),
      _controllerMercuryText = TextEditingController(),
      _controllerMercuryGate = TextEditingController(),
      _controllerDesignMercuryGate = TextEditingController(),
      _controllerJupiterHex = TextEditingController(),
      _controllerJupiterText = TextEditingController(),
      _controllerJupiterGate = TextEditingController(),
      _controllerDesignJupiterGate = TextEditingController(),
      _controllerSaturnHex = TextEditingController(),
      _controllerSaturnText = TextEditingController(),
      _controllerSaturnGate = TextEditingController(),
      _controllerDesignSaturnGate = TextEditingController(),
      _controllerUranusHex = TextEditingController(),
      _controllerUranusText = TextEditingController(),
      _controllerUranusGate = TextEditingController(),
      _controllerDesignUranusGate = TextEditingController(),
      _controllerNeptuneHex = TextEditingController(),
      _controllerNeptuneText = TextEditingController(),
      _controllerNeptuneGate = TextEditingController(),
      _controllerDesignNeptuneGate = TextEditingController(),
      _controllerPlutoHex = TextEditingController(),
      _controllerPlutoText = TextEditingController(),
      _controllerPlutoGate = TextEditingController(),
      _controllerDesignPlutoGate = TextEditingController(),
      _controllerEarthHex = TextEditingController(),
      _controllerEarthText = TextEditingController(),
      _controllerEarthGate = TextEditingController(),
      _controllerDesignEarthGate = TextEditingController(),
      _controllerSouthNodeHex = TextEditingController(),
      _controllerSouthNodeText = TextEditingController(),
      _controllerSouthNodeGate = TextEditingController(),
      _controllerDesignSouthNodeGate = TextEditingController(),
      _controllerPlanetType = TextEditingController(),
      _controllerPlanetSubType = TextEditingController();

  final CarouselController _controllercoin = CarouselController(),
      _controllerconstate = CarouselController(),
      _controllerrotationstate = CarouselController(),
      _controllertop = CarouselController(),
      _controllermid = CarouselController(),
      _controllerbot = CarouselController();

  //final String _title = subtitles[4];
  final String _title = subtitles_heb[4];

  String _textlevel = '',
      _planettext = '',
      _formattedDate = '',
      _formattedTime = '',
      _formatsaturnreturnDate = '',
      _formatsaturnreturnTime = '',
      _formatsUranusOppDate = '',
      _formatsUranusOppTime = '';

  DateTime _now = DateTime.now(),
      _newnow = DateTime.now(),
      _designTime = DateTime.now(),
      _selectedDate = DateTime.now(),
      _saturnreturntime = DateTime.now(),
      _uranusoppostiontime = DateTime.now();

  TimeOfDay _selectedtime = const TimeOfDay(hour: 0, minute: 0);

  List<Hexagram> _planetsList = [Hexagram(line: 1)],
      _planetsdesignList = [Hexagram(line: 1)],
      _planetsnowList = [Hexagram(line: 1)],
      _allplanetsList = [Hexagram(line: 1)];

  List<HDChannel> _channelsList = [],
      _personchannelsList = [],
      _designchannelsList = [];

  int _currentmain = 0,
      _currenttop = 0,
      _currentmid = 0,
      _currentbot = 0,
      _currentconstate = 0,
      _currentrotationstate = 0,
      _chosenhex = 1,
      _hexagramVal = 0,
      _carouselvalueindex = 0,
      _previousPlanetIndex = -1,
      _currentline = 1;

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
      _plutohex = Hexagram(),
      _sundesignhex = Hexagram(),
      _earthdesignhex = Hexagram(),
      _northnodedesignhex = Hexagram(),
      _southnodedesignhex = Hexagram(),
      _moondesignhex = Hexagram(),
      _mercurydesignhex = Hexagram(),
      _venusdesignhex = Hexagram(),
      _marsdesignhex = Hexagram(),
      _jupiterdesignhex = Hexagram(),
      _saturndesignhex = Hexagram(),
      _uranusdesignhex = Hexagram(),
      _neptunedesignhex = Hexagram(),
      _plutodesignhex = Hexagram();

  Hexagram _planethex = Hexagram();

  final List<bool> _isPlanetSelectedList =
      List<bool>.filled(13, false, growable: false);

  final List<String> finalhexNamesList = hexNamesList,
      finalnewcoinnamesList = newCoinNames;

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
        title: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(_title,
                textAlign: TextAlign.left,
                //maxFontSize: 15,
                style: const TextStyle(color: Colors.white)),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 15,
              foregroundImage: AssetImage(titlesicon[4]),
            ),
          ],
        ),
        leading: IconButton(
          iconSize: 20,
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.lightBlue,
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
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(mplantsneg[3]),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(mplantspos[3]),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText('דוק התור שלך מגיע',
                      textAlign: TextAlign.center,
                      minFontSize: 20,
                      maxFontSize: 40,
                      style: TextStyle(color: Colors.deepPurple)),
                ],
              ),
              const Divider(
                color: Colors.blue,
                thickness: 5,
              ),
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
                        'זמן',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
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
                        'תזכורת',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ],
              ),
              const Divider(
                color: Colors.blue,
                thickness: 5,
              ),
              SizedBox(
                height: 40,
                child: TextField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    decoration: const InputDecoration.collapsed(hintText: 'זמן'),
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
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: AutoSizeTextField(
                      maxLines: 1,
                      minFontSize: 25,
                      fullwidth: false,
                      decoration: InputDecoration.collapsed(
                          //hintText: '${newCoinNames[0]} ${hexNamesList[0]}',
                          hintText: '${hexNamesHebList[0]}',
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
                        //items: mixHexagramSlidersNew,
                        items: mixPlantsSliders,
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
                                    //'${newCoinNames[_currentmain]} ${hexNamesList[_currentmain]}';
                                    '${hexNamesHebList[_currentmain]}';
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
                    //'Rotate Design',
                    'זמן עיצוב',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              const Divider(
                color: Colors.blue,
                thickness: 5,
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: CarouselSlider(
                      items: mixHexagramSlidersBol,
                      carouselController: _controllerconstate,
                      options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
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
                                      DateFormat('MM/dd/yyyy').format(_now);
                                  _formattedTime = DateFormat.Hms().format(_now);
                                  _controllerTime.text =
                                      '$_formattedTime $_formattedDate';
                                  //_controllerDate.text = _formattedDate;
                                  _controllerPlanetType.text = 'Thought Later';

                                  _controllerrotationstate.jumpToPage(0);
                                  break;
                                case 1:
                                  _planetsList = _planetsdesignList;
                                  _controlPlanetHexagramData(_planetsdesignList);

                                  _formattedDate = DateFormat('MM/dd/yyyy')
                                      .format(_designTime);
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
                                      DateFormat('MM/dd/yyyy').format(_now);
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //channeldisplay(context, _channelsList),
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

                    _setCoins();

                    //_hexalignedList = hexagramAlignment(_planethex.gate!);

                    //_controllertop.jumpToPage(_hexalignedList[0]);
                    //_controllermid.jumpToPage(_hexalignedList[1]);
                    //_controllerbot.jumpToPage(_hexalignedList[2]);

                    _controllerlinetext.text = _planethex.line!.toString();
                    _currentline = _planethex.line!;

                    _controllergatelinestory.text = idonotknowlinesList[
                        (idonotknowlinesList.indexOf(_planethex.gate!) +
                            _planethex.line!)];

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
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: AutoSizeTextField(
                        minFontSize: 10,
                        maxFontSize: 30,
                        decoration: InputDecoration.collapsed(
                            hintText: newCoinNames[0],
                            hintStyle: const TextStyle(color: Colors.blue)),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: firstcolor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _controllercointopfirsttext,
                        readOnly: true,
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: AutoSizeTextField(
                        decoration: InputDecoration.collapsed(
                            hintText: newCoinNames[0],
                            hintStyle: const TextStyle(color: Colors.blue)),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: secondcolor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _controllercointopsecondtext,
                        readOnly: true,
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: AutoSizeTextField(
                        decoration: InputDecoration.collapsed(
                            hintText: newCoinNames[0],
                            hintStyle: const TextStyle(color: Colors.blue)),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: thirdcolor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _controllercointopthirdtext,
                        readOnly: true,
                      )),
                ],
              ),
              SizedBox(height: 5),
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
                            hintStyle: const TextStyle(color: Colors.blue)),
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
                            hintStyle: const TextStyle(color: Colors.blue)),
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
                            hintStyle: const TextStyle(color: Colors.blue)),
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

                          // idonotknow _currentline
                          //_controllergatelinestory.text = 'test';
                          _controllergatelinestory.text = idonotknowlinesList[
                              (idonotknowlinesList.indexOf(_chosenhex) +
                                  _currentline)];

                          //_hexsentence = getGateSentence(_chosenhex, _chosenlanguage);
                          //_hexsentence = LineSentenceList[_planethex.gate!];

                          //_controllertopfirsttext.text = _hexsentence.adjective!;

                          _controllercoinsttext.text =
                              idkNewHebrewList[_chosenhex];
                          //_controllertopsecondtext.text = _hexsentence.subject!;
                          //_controllertopthirdtext.text = _hexsentence.verb!;
                          //_controllertopfourthtext.text = _hexsentence.adverb!;

                          thirdcolor =
                              //controlCollor(finalhexNamesList[_currenttop]);
                              controlCollor(_currenttop);
                          _controllercointhirdtext.text =
                              finalhexNamesList[_currenttop];
                          _controllercointopthirdtext.text =
                              finalnewcoinnamesList[_currenttop];
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
                              idkNewHebrewList[_chosenhex];

                          //_controllertopfirsttext.text = _hexsentence.adjective!;
                          //_controllertopsecondtext.text = _hexsentence.subject!;
                          //_controllertopthirdtext.text = _hexsentence.verb!;
                          //_controllertopfourthtext.text = _hexsentence.adverb!;

                          _controllergatelinestory.text = idonotknowlinesList[
                              (idonotknowlinesList.indexOf(_chosenhex) +
                                  _currentline)];

                          secondcolor =
                              //controlCollor(finalhexNamesList[_currentmid]);
                              controlCollor(_currentmid);
                          _controllercoinsecondtext.text =
                              finalhexNamesList[_currentmid];
                          _controllercointopsecondtext.text =
                              finalnewcoinnamesList[_currentmid];
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
                              idkNewHebrewList[_chosenhex];
                          //_controllertopfirsttext.text = _hexsentence.adjective!;
                          //_controllertopsecondtext.text = _hexsentence.subject!;
                          //_controllertopthirdtext.text = _hexsentence.verb!;
                          //_controllertopfourthtext.text = _hexsentence.adverb!;

                          _controllergatelinestory.text = idonotknowlinesList[
                              (idonotknowlinesList.indexOf(_chosenhex) +
                                  _currentline)];

                          firstcolor =
                              //controlCollor(finalhexNamesList[_currentbot]);
                              controlCollor(_currentbot);
                          _controllercoinfirsttext.text =
                              finalhexNamesList[_currentbot];
                          _controllercointopfirsttext.text =
                              finalnewcoinnamesList[_currentbot];
                        });
                      }),
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
                //width: MediaQuery.of(context).size.width / 1.7,
                width: MediaQuery.of(context).size.width / 1.5,
                child: AutoSizeTextField(
                  minLines: 2,
                  maxLines: 4,
                  minFontSize: 18,
                  maxFontSize: 18,
                  fullwidth: true,
                  decoration: InputDecoration.collapsed(
                      //hintText: LineSentenceList[0],
                      hintText: idkNewHebrewList[0],
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
              SizedBox(
                  //width: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: AutoSizeTextField(
                    minLines: 3,
                    maxLines: 4,
                    minFontSize: 15,
                    maxFontSize: 15,
                    fullwidth: true,
                    decoration: const InputDecoration.collapsed(
                        //hintText: 'Rotating Coins Story',
                        hintText: 'סיפור סיבוב מטבעות',
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
                        //'Wallets',
                        'ארנקים',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
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
                        //'Coins',
                        'מטבעות',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
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
                  ElevatedButton(
                    onPressed: () async {
                      //_now = DateTime.now();
                      //_now = _newnow;
                      //if (now !=)
                      _now = _now.add(const Duration(hours: 1));

                      _planetsnowList =
                          await PlanetsServices.getCurrentData(_now);

                      //_designTime = await AstrologyServices.getDesignTime(_now);
                      //emulate design time to now time to prevent blank
                      _planetsdesignList =
                          await PlanetsServices.getCurrentData(_now);

                      _channelsList =
                          HDServices.getHDChannelsJustNow(_planetsnowList);

                      _personchannelsList = [];
                      _designchannelsList = [];

                      //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);

                      hdfinaldata = HDServices.getHDBasicData(_channelsList);
                      //_controlHDData(hdbasicdata);
                      _controlHDData(hdfinaldata);

                      _centers = HDServices.getHDDefinedCenters(_channelsList);
                      //_fearSentence = HDServices.getHDDefinedFears(_centers);
                      //_selfreminderSentence = HDServices.getSelfReminder();
                      _selfreminder = _timeselfreminder;

                      _setDateTime(_now);

                      _planetsList = _planetsnowList;
                      _planethex = _planetsList[0];

                      _setCoins();

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
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.normal)),
                    child: const Text('+1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () async {
                      //_now = DateTime.now();
                      //_now = _newnow;
                      //if (now !=)
                      _now = _now.add(const Duration(hours: 10));

                      _planetsnowList =
                          await PlanetsServices.getCurrentData(_now);

                      //_designTime = await AstrologyServices.getDesignTime(_now);
                      //emulate design time to now time to prevent blank
                      _planetsdesignList =
                          await PlanetsServices.getCurrentData(_now);

                      _channelsList =
                          HDServices.getHDChannelsJustNow(_planetsnowList);

                      _personchannelsList = [];
                      _designchannelsList = [];

                      //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);

                      hdfinaldata = HDServices.getHDBasicData(_channelsList);
                      //_controlHDData(hdbasicdata);
                      _controlHDData(hdfinaldata);

                      _centers = HDServices.getHDDefinedCenters(_channelsList);
                      //_fearSentence = HDServices.getHDDefinedFears(_centers);
                      //_selfreminderSentence = HDServices.getSelfReminder();
                      _selfreminder = _timeselfreminder;

                      _setDateTime(_now);

                      _planetsList = _planetsnowList;
                      _planethex = _planetsList[0];

                      _setCoins();

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
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.normal)),
                    child: const Text('+10',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () async {
                      //_now = DateTime.now();
                      //_now = _newnow;
                      //if (now !=)
                      _now = _now.add(const Duration(hours: 24));

                      _planetsnowList =
                          await PlanetsServices.getCurrentData(_now);

                      //_designTime = await AstrologyServices.getDesignTime(_now);
                      //emulate design time to now time to prevent blank
                      _planetsdesignList =
                          await PlanetsServices.getCurrentData(_now);

                      _channelsList =
                          HDServices.getHDChannelsJustNow(_planetsnowList);

                      _personchannelsList = [];
                      _designchannelsList = [];

                      //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);

                      hdfinaldata = HDServices.getHDBasicData(_channelsList);
                      //_controlHDData(hdbasicdata);
                      _controlHDData(hdfinaldata);

                      _centers = HDServices.getHDDefinedCenters(_channelsList);
                      //_fearSentence = HDServices.getHDDefinedFears(_centers);
                      //_selfreminderSentence = HDServices.getSelfReminder();
                      _selfreminder = _timeselfreminder;

                      _setDateTime(_now);

                      _planetsList = _planetsnowList;
                      _planethex = _planetsList[0];

                      _setCoins();

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
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.normal)),
                    child: const Text('+24',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      //_now = DateTime.now();
                      //_now = _newnow;
                      //if (now !=)
                      _now = _now.subtract(const Duration(hours: 1));

                      _planetsnowList =
                          await PlanetsServices.getCurrentData(_now);

                      //_designTime = await AstrologyServices.getDesignTime(_now);
                      //emulate design time to now time to prevent blank
                      _planetsdesignList =
                          await PlanetsServices.getCurrentData(_now);

                      _channelsList =
                          HDServices.getHDChannelsJustNow(_planetsnowList);

                      _personchannelsList = [];
                      _designchannelsList = [];

                      //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);

                      hdfinaldata = HDServices.getHDBasicData(_channelsList);
                      //_controlHDData(hdbasicdata);
                      _controlHDData(hdfinaldata);

                      _centers = HDServices.getHDDefinedCenters(_channelsList);
                      //_fearSentence = HDServices.getHDDefinedFears(_centers);
                      //_selfreminderSentence = HDServices.getSelfReminder();
                      _selfreminder = _timeselfreminder;

                      _setDateTime(_now);

                      _planetsList = _planetsnowList;
                      _planethex = _planetsList[0];

                      _setCoins();

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
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.normal)),
                    child: const Text('-1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () async {
                      //_now = DateTime.now();
                      //_now = _newnow;
                      //if (now !=)
                      _now = _now.subtract(const Duration(hours: 10));

                      _planetsnowList =
                          await PlanetsServices.getCurrentData(_now);

                      //_designTime = await AstrologyServices.getDesignTime(_now);
                      //emulate design time to now time to prevent blank
                      _planetsdesignList =
                          await PlanetsServices.getCurrentData(_now);

                      _channelsList =
                          HDServices.getHDChannelsJustNow(_planetsnowList);

                      _personchannelsList = [];
                      _designchannelsList = [];

                      //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);

                      hdfinaldata = HDServices.getHDBasicData(_channelsList);
                      //_controlHDData(hdbasicdata);
                      _controlHDData(hdfinaldata);

                      _centers = HDServices.getHDDefinedCenters(_channelsList);
                      //_fearSentence = HDServices.getHDDefinedFears(_centers);
                      //_selfreminderSentence = HDServices.getSelfReminder();
                      _selfreminder = _timeselfreminder;

                      _setDateTime(_now);

                      _planetsList = _planetsnowList;
                      _planethex = _planetsList[0];

                      _setCoins();

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
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.normal)),
                    child: const Text('-10',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () async {
                      //_now = DateTime.now();
                      //_now = _newnow;
                      //if (now !=)
                      _now = _now.subtract(const Duration(hours: 24));

                      _planetsnowList =
                          await PlanetsServices.getCurrentData(_now);

                      //_designTime = await AstrologyServices.getDesignTime(_now);
                      //emulate design time to now time to prevent blank
                      _planetsdesignList =
                          await PlanetsServices.getCurrentData(_now);

                      _channelsList =
                          HDServices.getHDChannelsJustNow(_planetsnowList);

                      _personchannelsList = [];
                      _designchannelsList = [];

                      //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);

                      hdfinaldata = HDServices.getHDBasicData(_channelsList);
                      //_controlHDData(hdbasicdata);
                      _controlHDData(hdfinaldata);

                      _centers = HDServices.getHDDefinedCenters(_channelsList);
                      //_fearSentence = HDServices.getHDDefinedFears(_centers);
                      //_selfreminderSentence = HDServices.getSelfReminder();
                      _selfreminder = _timeselfreminder;

                      _setDateTime(_now);

                      _planetsList = _planetsnowList;
                      _planethex = _planetsList[0];

                      _setCoins();

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
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.normal)),
                    child: const Text('-24',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 30,
                child: TextField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    //decoration: const InputDecoration.collapsed(hintText: 'Time'),
                    decoration: const InputDecoration.collapsed(hintText: 'זמן'),
                    controller: _controllerTime,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black)),
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
                          scrollDirection: Axis.horizontal,
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
                            //const InputDecoration.collapsed(hintText: 'Sentence'),
                            const InputDecoration.collapsed(hintText: 'משפטי'),
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
                            //const InputDecoration.collapsed(hintText: 'Rotation'),
                            const InputDecoration.collapsed(hintText: 'סיבוב'),
                        controller: _controllerPlanetType,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black)),
                  ),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignSunGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _sunhex.linename!;
                          _planettext =
                              '1 year of COMPLEX PersonReality and Reality shining';
                          break;
                        case 1:
                          _planettext =
                              '1 year of COMPLEX PersonReality and Reality shining';
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
                        textAlign: TextAlign.center,
                        controller: _controllerSunGate,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerDesignEarthGate,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        switch (_currentrotationstate) {
                          case 0:
                            //_planettext = _earthhex.linename!;
                            _planettext =
                                '1 year of silence PersonReality and Reality grounded';
                            break;
                          case 1:
                            _planettext =
                                '1 year of silence PersonReality and Reality grounded';
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
                          textAlign: TextAlign.center,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignNorthNodeGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _northnodehex.linename!;
                          _planettext =
                              '18.6 years of COMPLEX PersonReality and Reality moving forward';
                          break;
                        case 1:
                          _planettext =
                              '18.6 years of COMPLEX PersonReality and Reality moving forward';
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
                        textAlign: TextAlign.center,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerDesignSouthNodeGate,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        switch (_currentrotationstate) {
                          case 0:
                            //_planettext = _southnodehex.linename!;
                            _planettext =
                                '18.6 years of silence PersonReality and Reality leaving behind';
                            break;
                          case 1:
                            _planettext =
                                '18.6 years of silence PersonReality and Reality leaving behind';
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
                              AssetImage('assets/planets/southnode.png')),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerSouthNodeGate,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerDesignMoonGate,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        switch (_currentrotationstate) {
                          case 0:
                            //_planettext = _moonhex.linename!;
                            _planettext =
                                '27 days of Simple PersonReality and Reality driven to rise';
                            break;
                          case 1:
                            _planettext =
                                '27 days of Simple PersonReality and Reality driven to rise';
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
                          backgroundImage: AssetImage('assets/planets/moon.png')),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerDesignMercuryGate,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        switch (_currentrotationstate) {
                          case 0:
                            //_planettext = _mercuryhex.linename!;
                            _planettext =
                                '88 days of Simple PersonReality and Reality communicating';
                            break;
                          case 1:
                            _planettext =
                                '88 days of Simple PersonReality and Reality communicating';
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
                          textAlign: TextAlign.center,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerDesignVenusGate,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        switch (_currentrotationstate) {
                          case 0:
                            //_planettext = _venushex.linename!;                          break;
                            _planettext =
                                '225 days of Simple PersonReality and Reality values';
                            break;
                          case 1:
                            _planettext =
                                '225 days of Simple PersonReality and Reality values';
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
                          textAlign: TextAlign.center,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerDesignMarsGate,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        switch (_currentrotationstate) {
                          case 0:
                            //_planettext = _marshex.linename!;
                            _planettext =
                                '687 days of Simple PersonReality and Reality Like Children';
                            break;
                          case 1:
                            _planettext =
                                '687 days of Simple PersonReality and Reality Like Children';
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
                          textAlign: TextAlign.center,
                          controller: _controllerMarsGate,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerDesignJupiterGate,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        switch (_currentrotationstate) {
                          case 0:
                            //_planettext = _jupiterhex.linename!;
                            _planettext =
                                '12 years of Breath PersonReality and Reality Justice';
                            break;
                          case 1:
                            _planettext =
                                '12 years of Breath PersonReality and Reality Justice';
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
                          textAlign: TextAlign.center,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerDesignSaturnGate,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        switch (_currentrotationstate) {
                          case 0:
                            //_planettext = _saturnhex.linename!;
                            _planettext =
                                '29 years of Breath PersonReality and Reality Discipline';
                            break;
                          case 1:
                            _planettext =
                                '29 years of Breath PersonReality and Reality Discipline';
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
                          textAlign: TextAlign.center,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AutoSizeTextField(
                        readOnly: true,
                        decoration: const InputDecoration.collapsed(hintText: ''),
                        textAlign: TextAlign.center,
                        controller: _controllerDesignUranusGate,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      switch (_currentrotationstate) {
                        case 0:
                          //_planettext = _uranushex.linename!;
                          _planettext =
                              '84 years of Breath PersonReality and Reality Unusual';
                          break;
                        case 1:
                          _planettext =
                              '84 years of Breath PersonReality and Reality Unusual';
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
                        textAlign: TextAlign.center,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerDesignNeptuneGate,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        switch (_currentrotationstate) {
                          case 0:
                            //_planettext = _neptunehex.linename!;
                            _planettext =
                                '165 years of Breath PersonReality and Reality Hidden';
                            break;
                          case 1:
                            _planettext =
                                '165 years of Breath PersonReality and Reality Hidden';
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
                              AssetImage('assets/planets/neptune.png')),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerDesignPlutoGate,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        switch (_currentrotationstate) {
                          case 0:
                            //_planettext = _plutohex.linename!;
                            _planettext =
                                '248 yeays of Breath PersonReality and Reality Truth';
                            break;
                          case 1:
                            _planettext =
                                '248 yeays of Breath PersonReality and Reality Truth';
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
                              AssetImage('assets/planets/pluto.png')),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: AutoSizeTextField(
                          readOnly: true,
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          textAlign: TextAlign.center,
                          controller: _controllerPlutoGate,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                  ]),

              const Divider(
                color: Colors.blue,
              ),
              Stack(
                fit: StackFit.loose,
                children: [
                  CircleList(
                    rotateMode: RotateMode.stopRotate,
                    innerRadius: 50,
                    initialAngle: 4.22,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(13, (index) {
                      return CircleAvatar(
                        minRadius: 5,
                        maxRadius: 13,
                        foregroundImage: AssetImage(planetsfullList[index]),
                      );
                    }),
                  ),
                  CircleList(
                    rotateMode: RotateMode.stopRotate,
                    innerRadius: 100,
                    initialAngle: 4.2,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(13, (index) {
                      return InkWell(
                          child: Container(
                            width: 45,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2, color: Colors.blue)),
                            child: AutoSizeText(
                                listpersonalitygates[index].toString(),
                                //minFontSize: 8,
                                //maxFontSize: 85,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => buildWalletPopUp(
                                  context, listpersonalitygates[index]),
                            );
                          });
                    }),
                  ),
                ],
              ),
              Stack(
                fit: StackFit.loose,
                children: [
                  CircleList(
                    rotateMode: RotateMode.stopRotate,
                    innerRadius: 50,
                    initialAngle: 4.22,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(13, (index) {
                      return CircleAvatar(
                        minRadius: 5,
                        maxRadius: 13,
                        foregroundImage: AssetImage(planetsfullList[index]),
                      );
                    }),
                  ),
                  CircleList(
                    rotateMode: RotateMode.stopRotate,
                    innerRadius: 1,
                    initialAngle: 4.22,
                    childrenPadding: 1,
                    origin: const Offset(0, 0),
                    children: List.generate(13, (index) {
                      return InkWell(
                          child: Container(
                            width: 40,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 2.0, color: Colors.red)),
                            child: AutoSizeText(listdesigngates[index].toString(),
                                //minFontSize: 8,
                                //maxFontSize: 12,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => buildWalletPopUp(
                                  context, listdesigngates[index]),
                            );
                          });
                    }),
                  ),
                ],
              ),
              const Divider(
                color: Colors.blue,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(mplantsneg[3]),
                    fit: BoxFit.scaleDown,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(mplantsneg[2]),
                    fit: BoxFit.scaleDown,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(mplantsneg[1]),
                    fit: BoxFit.scaleDown,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(mplantsneg[0]),
                    fit: BoxFit.scaleDown,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              const Divider(
                color: Colors.blue,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(mplantspos[3]),
                    fit: BoxFit.scaleDown,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(mplantspos[2]),
                    fit: BoxFit.scaleDown,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(mplantspos[1]),
                    fit: BoxFit.scaleDown,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(mplantspos[0]),
                    fit: BoxFit.scaleDown,
                  ),
                  shape: BoxShape.rectangle,
                ),
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

  // idk
  Widget _buildCyclesPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Cycles'),
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Saturn Return',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
            Text('$_formatsaturnreturnTime   $_formatsaturnreturnDate',
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
            const Divider(
              thickness: 5,
            ),
            const Text('Uranus Opposition',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
            Text('$_formatsUranusOppTime   $_formatsUranusOppDate',
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildTimePopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Time',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      content: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                readOnly: true,
                decoration: const InputDecoration.collapsed(
                    hintText: '07:30',
                    hintStyle: TextStyle(color: Colors.grey)),
                textAlign: TextAlign.center,
                controller: _controllerTimePick,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
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
              child: const Text(
                'לקבוע זמן',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: 150,
              child: TextField(
                  readOnly: true,
                  decoration: const InputDecoration.collapsed(
                      hintText: '02/19/1984',
                      hintStyle: TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  controller: _controllerDatePick,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.normal)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () async {
                _selectedDate = await TimeServices.selectDate(context);
                _formattedDate = DateFormat('MM/dd/yyyy').format(_selectedDate);
                setState(() {
                  //_controllerDatePick.text = "${_selectedDate.toLocal()}".split(' ')[0];
                  _controllerDatePick.text = _formattedDate;
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal)),
              child: const Text('לקבוע תאריך',
                  style: TextStyle(color: Colors.white)),
            ),
            const Divider(
              color: Colors.black,
              thickness: 5,
            ),
            ElevatedButton(
              onPressed: () async {
                // _selectedDate by user pick
                _now = _selectedDate.applied(_selectedtime);

                _planetsnowList = await PlanetsServices.getCurrentData(_now);

                _designTime = await PlanetsServices.getDesignTime(_now);
                _planetsdesignList =
                    await PlanetsServices.getCurrentData(_designTime);

                _allplanetsList = _planetsnowList + _planetsdesignList;
                _channelsList = HDServices.getHDChannels(_allplanetsList);
                _personchannelsList = HDServices.getHDChannels(_planetsnowList);
                _designchannelsList =
                    HDServices.getHDChannels(_planetsdesignList);

                //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);
                hdfinaldata = HDServices.getHDBasicData(_channelsList);

                _centers = HDServices.getHDDefinedCenters(_channelsList);
                //_fearSentence = HDServices.getHDDefinedFears(_centers);
                //_selfreminderSentence = HDServices.getSelfReminder();
                _selfreminder = _timeselfreminder;

                //_controlHDData(hdbasicdata);
                _controlHDData(hdfinaldata);
                //hdfinaldata = HDServices.getHDBasicData(_channelsList);

                _setDateTime(_now);

                //_formattedDate = DateFormat('MM/dd/yyyy').format(_now);
                //_formattedTime = DateFormat.Hms().format(_now);
                //_controllerTime.text = 'text $_formattedTime $_formattedDate';

                _planetsList = _planetsnowList;
                _planethex = _planetsList[0];
                //_hexsentence = getGateSentence(_planethex.gate!, _chosenlanguage);

                _setCoins();

                //_hexalignedList = hexagramAlignment(_planethex.gate!);

                //_controllertop.jumpToPage(_hexalignedList[0]);
                //_controllermid.jumpToPage(_hexalignedList[1]);
                //_controllerbot.jumpToPage(_hexalignedList[2]);

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

                // idk
                // calc cycles
                //_saturnreturntime = await PlanetsServices.getSaturnReturn(_now);
                //_formatsaturnreturnDate = DateFormat('MM/dd/yyyy').format(_saturnreturntime);
                //_formatsaturnreturnTime = DateFormat.Hms().format(_saturnreturntime);

                //_uranusoppostiontime = await PlanetsServices.getUranusOpposition(_now);
                //_formatsUranusOppDate = DateFormat('MM/dd/yyyy').format(_uranusoppostiontime);
                //_formatsUranusOppTime = DateFormat.Hms().format(_uranusoppostiontime);
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text('להשיג זמן עבורך',
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

                _planetsnowList = await PlanetsServices.getCurrentData(_now);

                //_designTime = await AstrologyServices.getDesignTime(_now);
                //emulate design time to now time to prevent blank
                _planetsdesignList = await PlanetsServices.getCurrentData(_now);

                _channelsList =
                    HDServices.getHDChannelsJustNow(_planetsnowList);

                _personchannelsList = [];
                _designchannelsList = [];

                //List<String> hdbasicdata = HDServices.getHDBasicData(_channelsList);

                hdfinaldata = HDServices.getHDBasicData(_channelsList);
                //_controlHDData(hdbasicdata);
                _controlHDData(hdfinaldata);

                _centers = HDServices.getHDDefinedCenters(_channelsList);
                //_fearSentence = HDServices.getHDDefinedFears(_centers);
                //_selfreminderSentence = HDServices.getSelfReminder();
                _selfreminder = _timeselfreminder;

                _setDateTime(_now);

                _planetsList = _planetsnowList;
                _planethex = _planetsList[0];

                _setCoins();

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
              child: const Text('להשיג זמן כעת',
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
          child: const Icon(Icons.close, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildCentersPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('טחן-אות'),
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
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildChannelsPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('מעבר-בים'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(hexList[0])),
              Divider(color: Colors.transparent),
              channeldisplay(context, _channelsList),
              Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(hexList[1])),
              Divider(color: Colors.transparent),
              //channeldisplay(context, _personchannelsList),
              Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(hexList[2])),
              Divider(color: Colors.transparent),
              channeldisplay(context, _personchannelsList),
              Divider(color: Colors.transparent),
              CircleAvatar(
                  minRadius: 5,
                  maxRadius: 13,
                  foregroundImage: AssetImage(hexList[3])),
              Divider(color: Colors.transparent),
              channeldisplay(context, _designchannelsList),
              Divider(color: Colors.transparent),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget channeldisplay(BuildContext context, List<HDChannel> displaychannels) {
    return ListView.builder(
        padding: const EdgeInsets.all(2),
        shrinkWrap: true,
        itemCount: displaychannels.length,
        itemBuilder: (BuildContext context, int index) {
          Color coincolor = Colors.red;
          switch (displaychannels[index].coin) {
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
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                ),
                //color: Colors.blue[100],
                color: coincolor,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                displaychannels[index].sentence!,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          );
        });
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
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildDataPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('זמן עיצוב',
          style: TextStyle(fontSize: 15, color: Colors.white)),
      backgroundColor: Colors.black,
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
                  child: const Text('חלי-פה',
                      style: TextStyle(fontSize: 13, color: Colors.white))),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildCentersPopUp(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('טחן-אות',
                      style: TextStyle(fontSize: 13, color: Colors.white))),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildChannelsPopUp(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('מעבר-בים',
                      style: TextStyle(fontSize: 13, color: Colors.white))),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.close, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildProfilePopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('חלי-פה', style: TextStyle(color: Colors.black)),
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
          child: const Icon(Icons.close, color: Colors.black),
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
    //_controllercoinfirsttext.text = hdbasicdata.coinname!;
    _controllercoin.jumpToPage(hexNamesList.indexOf(hdbasicdata.coinname!));
    //_currenttop = hexNamesList.indexOf(hdbasicdata.coinname!);
  }

  controlCollor(int colorcoin) {
    Color finalcolor;
    switch (colorcoin) {
      //case 'silence':
      //case 0:
      case 3:
        finalcolor = Colors.red;
        break;
      //case 'Breath':
      //case 1:
      case 2:
        finalcolor = Colors.yellow;
        break;
      //case 'Simple':
      //case 2:
      case 1:
        finalcolor = Colors.green;
        break;
      //case 'COMPLEX':
      //case 3:
      case 0:
        finalcolor = Colors.blue;
        break;
      default:
        finalcolor = Colors.black;
        break;
    }
    return finalcolor;
  }

  Widget _buildHebGatesDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('ארנקים'),
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
                      idkNewHebrewList[_planetsList[index].gate!],
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
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildHebLinesDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('מטבעות'),
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
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildGatesDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Wallets'),
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
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildLinesDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Coins'),
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
          child: const Icon(Icons.close, color: Colors.black),
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
          child: const Icon(Icons.close, color: Colors.black),
        ),
      ],
    );
  }

  void _controlPlanetHexagramData(List<Hexagram> planetList) {
    //_sunhex = _planetsList[0];
    //_earthhex = _planetsList[1];
    //_northnodehex = _planetsList[2];
    //_southnodehex = _planetsList[3];
    //_moonhex = _planetsList[4];
    //_mercuryhex = _planetsList[5];
    //_venushex = _planetsList[6];
    //_marshex = _planetsList[7];
    //_jupiterhex = _planetsList[8];
    //_saturnhex = _planetsList[9];
    //_uranushex = _planetsList[10];
    //_neptunehex = _planetsList[11];
    //_plutohex = _planetsList[12];

    _sunhex = _planetsnowList[0];
    _earthhex = _planetsnowList[1];
    _northnodehex = _planetsnowList[2];
    _southnodehex = _planetsnowList[3];
    _moonhex = _planetsnowList[4];
    _mercuryhex = _planetsnowList[5];
    _venushex = _planetsnowList[6];
    _marshex = _planetsnowList[7];
    _jupiterhex = _planetsnowList[8];
    _saturnhex = _planetsnowList[9];
    _uranushex = _planetsnowList[10];
    _neptunehex = _planetsnowList[11];
    _plutohex = _planetsnowList[12];

    _sundesignhex = _planetsdesignList[0];
    _earthdesignhex = _planetsdesignList[1];
    _northnodedesignhex = _planetsdesignList[2];
    _southnodedesignhex = _planetsdesignList[3];
    _moondesignhex = _planetsdesignList[4];
    _mercurydesignhex = _planetsdesignList[5];
    _venusdesignhex = _planetsdesignList[6];
    _marsdesignhex = _planetsdesignList[7];
    _jupiterdesignhex = _planetsdesignList[8];
    _saturndesignhex = _planetsdesignList[9];
    _uranusdesignhex = _planetsdesignList[10];
    _neptunedesignhex = _planetsdesignList[11];
    _plutodesignhex = _planetsdesignList[12];

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

    _controllerSunGate.text = _sunhex.gatelinecolortonebase!;
    _controllerEarthGate.text = _earthhex.gatelinecolortonebase!;
    _controllerNorthNodeGate.text = _northnodehex.gatelinecolortonebase!;
    _controllerSouthNodeGate.text = _southnodehex.gatelinecolortonebase!;
    _controllerMoonGate.text = _moonhex.gatelinecolor!;
    _controllerMercuryGate.text = _mercuryhex.gatelinecolor!;
    _controllerVenusGate.text = _venushex.gatelinecolor!;
    _controllerMarsGate.text = _marshex.gatelinecolor!;
    _controllerJupiterGate.text = _jupiterhex.gatelinecolor!;
    _controllerSaturnGate.text = _saturnhex.gatelinecolor!;
    _controllerUranusGate.text = _uranushex.gatelinecolor!;
    _controllerNeptuneGate.text = _neptunehex.gatelinecolor!;
    _controllerPlutoGate.text = _plutohex.gatelinecolor!;

    _controllerDesignSunGate.text = _sundesignhex.gatelinecolortonebase!;
    _controllerDesignEarthGate.text = _earthdesignhex.gatelinecolortonebase!;
    _controllerDesignNorthNodeGate.text =
        _northnodedesignhex.gatelinecolortonebase!;
    _controllerDesignSouthNodeGate.text =
        _southnodedesignhex.gatelinecolortonebase!;
    _controllerDesignMoonGate.text = _moondesignhex.gatelinecolor!;
    _controllerDesignMercuryGate.text = _mercurydesignhex.gatelinecolor!;
    _controllerDesignVenusGate.text = _venusdesignhex.gatelinecolor!;
    _controllerDesignMarsGate.text = _marsdesignhex.gatelinecolor!;
    _controllerDesignJupiterGate.text = _jupiterdesignhex.gatelinecolor!;
    _controllerDesignSaturnGate.text = _saturndesignhex.gatelinecolor!;
    _controllerDesignUranusGate.text = _uranusdesignhex.gatelinecolor!;
    _controllerDesignNeptuneGate.text = _neptunedesignhex.gatelinecolor!;
    _controllerDesignPlutoGate.text = _plutodesignhex.gatelinecolor!;

    listpersonalitygates = [
      _northnodehex.gate!,
      _sunhex.gate!,
      _moonhex.gate!,
      _mercuryhex.gate!,
      _venushex.gate!,
      _marshex.gate!,
      _jupiterhex.gate!,
      _saturnhex.gate!,
      _uranushex.gate!,
      _neptunehex.gate!,
      _plutohex.gate!,
      _earthhex.gate!,
      _southnodehex.gate!,
    ];

    listdesigngates = [
      _northnodedesignhex.gate!,
      _sundesignhex.gate!,
      _moondesignhex.gate!,
      _mercurydesignhex.gate!,
      _venusdesignhex.gate!,
      _marsdesignhex.gate!,
      _jupiterdesignhex.gate!,
      _saturndesignhex.gate!,
      _uranusdesignhex.gate!,
      _neptunedesignhex.gate!,
      _plutodesignhex.gate!,
      _earthdesignhex.gate!,
      _southnodedesignhex.gate!,
    ];
  }

  void _setDateTime(DateTime timedata) {
    _formattedDate = DateFormat('MM/dd/yyyy').format(timedata);
    _formattedTime = DateFormat.Hms().format(timedata);
    _controllerTime.text = '$_formattedTime $_formattedDate';
  }

  void _setCoins() {
    _hexalignedList = hexagramAlignment(_planethex.gate!);

    _controllertop.jumpToPage(_hexalignedList[0]);
    _controllermid.jumpToPage(_hexalignedList[1]);
    _controllerbot.jumpToPage(_hexalignedList[2]);
  }

  void _changeTextLevels(String textlevel) {
    switch (textlevel) {
      case 'complex':
        _controllerPlanetSubType.text = 'COMPLEX';

        _controllerSunGate.text = _sunhex.gatelinecolortonebase!;
        _controllerEarthGate.text = _earthhex.gatelinecolortonebase!;
        _controllerNorthNodeGate.text = _northnodehex.gatelinecolortonebase!;
        _controllerSouthNodeGate.text = _southnodehex.gatelinecolortonebase!;
        _controllerMoonGate.text = _moonhex.gatelinecolor!;
        _controllerMercuryGate.text = _mercuryhex.gatelinecolor!;
        _controllerVenusGate.text = _venushex.gatelinecolor!;
        _controllerMarsGate.text = _marshex.gatelinecolor!;
        _controllerJupiterGate.text = _jupiterhex.gatelinecolor!;
        _controllerSaturnGate.text = _saturnhex.gatelinecolor!;
        _controllerUranusGate.text = _uranushex.gatelinecolor!;
        _controllerNeptuneGate.text = _neptunehex.gatelinecolor!;
        _controllerPlutoGate.text = _plutohex.gatelinecolor!;

        _controllerDesignSunGate.text = _sundesignhex.gatelinecolortonebase!;
        _controllerDesignEarthGate.text =
            _earthdesignhex.gatelinecolortonebase!;
        _controllerDesignNorthNodeGate.text =
            _northnodedesignhex.gatelinecolortonebase!;
        _controllerDesignSouthNodeGate.text =
            _southnodedesignhex.gatelinecolortonebase!;
        _controllerDesignMoonGate.text = _moondesignhex.gatelinecolor!;
        _controllerDesignMercuryGate.text = _mercurydesignhex.gatelinecolor!;
        _controllerDesignVenusGate.text = _venusdesignhex.gatelinecolor!;
        _controllerDesignMarsGate.text = _marsdesignhex.gatelinecolor!;
        _controllerDesignJupiterGate.text = _jupiterdesignhex.gatelinecolor!;
        _controllerDesignSaturnGate.text = _saturndesignhex.gatelinecolor!;
        _controllerDesignUranusGate.text = _uranusdesignhex.gatelinecolor!;
        _controllerDesignNeptuneGate.text = _neptunedesignhex.gatelinecolor!;
        _controllerDesignPlutoGate.text = _plutodesignhex.gatelinecolor!;

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

        _controllerDesignSunGate.text = _sundesignhex.gateline!;
        _controllerDesignEarthGate.text = _earthdesignhex.gateline!;
        _controllerDesignNorthNodeGate.text = _northnodedesignhex.gateline!;
        _controllerDesignSouthNodeGate.text = _southnodedesignhex.gateline!;
        _controllerDesignMoonGate.text = _moondesignhex.gateline!;
        _controllerDesignMercuryGate.text = _mercurydesignhex.gateline!;
        _controllerDesignVenusGate.text = _venusdesignhex.gateline!;
        _controllerDesignMarsGate.text = _marsdesignhex.gateline!;
        _controllerDesignJupiterGate.text = _jupiterdesignhex.gateline!;
        _controllerDesignSaturnGate.text = _saturndesignhex.gateline!;
        _controllerDesignUranusGate.text = _uranusdesignhex.gateline!;
        _controllerDesignNeptuneGate.text = _neptunedesignhex.gateline!;
        _controllerDesignPlutoGate.text = _plutodesignhex.gateline!;

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

        _controllerDesignSunGate.text = 'Exhale';
        _controllerDesignEarthGate.text = 'Inhale';
        _controllerDesignNorthNodeGate.text = 'BREATHE';
        _controllerDesignSouthNodeGate.text = 'BREATH';
        _controllerDesignMoonGate.text = 'Exhale';
        _controllerDesignMercuryGate.text = 'Exhale';
        _controllerDesignVenusGate.text = 'Exhale';
        _controllerDesignMarsGate.text = 'Exhale';
        _controllerDesignJupiterGate.text = 'Inhale';
        _controllerDesignSaturnGate.text = 'Inhale';
        _controllerDesignUranusGate.text = 'Inhale';
        _controllerDesignNeptuneGate.text = 'Inhale';
        _controllerDesignPlutoGate.text = 'Inhale';

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

        _controllerDesignSunGate.text = '';
        _controllerDesignEarthGate.text = '';
        _controllerDesignNorthNodeGate.text = '';
        _controllerDesignSouthNodeGate.text = '';
        _controllerDesignMoonGate.text = '';
        _controllerDesignMercuryGate.text = '';
        _controllerDesignVenusGate.text = '';
        _controllerDesignMarsGate.text = '';
        _controllerDesignJupiterGate.text = '';
        _controllerDesignSaturnGate.text = '';
        _controllerDesignUranusGate.text = '';
        _controllerDesignNeptuneGate.text = '';
        _controllerDesignPlutoGate.text = '';

        break;
      default:
        break;
    }
  }
}
