import 'package:carousel_slider/carousel_slider.dart';
import 'package:finallyicanlearn/logic/hdsubstructure.dart';
import 'package:finallyicanlearn/logic/hexagramaligment.dart';
import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/datetime.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:intl/intl.dart';

// /rotatehexwithlogic
// rotate one hexagram
class RotateComplexOne extends StatefulWidget {
  const RotateComplexOne({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateComplexOneState();
  }
}

class _RotateComplexOneState extends State<RotateComplexOne> {
  int _currenttop = 0,
      _currentmid = 0,
      _currentbot = 0,
      _hexagramVal = 0,
      _fontindex = 0,
      _carouselvalueindex = 0,
      _chosenhex = 1,
      _fonthexconverted = 0,
      _textHexValueChange = 1;

  final CarouselController _controllertop = CarouselController(),
      _controllermid = CarouselController(),
      _controllerbot = CarouselController();

  final TextEditingController _controllergatetext = TextEditingController(),
      _controllerlinetext = TextEditingController(),
      _controllertopfirsttext = TextEditingController(),
      _controllertopsecondtext = TextEditingController(),
      _controllertopthirdtext = TextEditingController(),
      _controllertopfourthtext = TextEditingController(),
      _controllerbottomfirsttext = TextEditingController(),
      _controllerbottomsecondtext = TextEditingController(),
      _controllerbottomthirdtext = TextEditingController(),
      _controllerTime = TextEditingController(),
      _controllerDate = TextEditingController(),
      _controllerTimePick = TextEditingController(),
      _controllerDatePick = TextEditingController();

  TimeOfDay _selectedtime = const TimeOfDay(hour: 0, minute: 0);

  var _dropdownvalue = hexagramslist[1],
      _dropdowichingvalue = fontHexOrderList[0],
      _dropdowichingordervalue = orderHexagramsWheel[0];

  DateTime _now = DateTime.now(),
      _designTime = DateTime.now(),
      _selectedDate = DateTime.now();

  List<int> _hexalignedList = [0, 0, 0];

  List<Hexagram> _planetsList = [Hexagram(line: 1)],
      _planetsdesignList = [Hexagram(line: 1)],
      _planetsnowList = [Hexagram(line: 1)];

  final List<bool> _isPlanetSelectedList =
          List<bool>.filled(13, false, growable: false),
      _isLifeTime = List<bool>.filled(2, false, growable: false);

  int _previousPlanetIndex = -1, _previousLifeTimeIndex = -1;

  Hexagram _planethex = Hexagram();

  String _formattedDate = '', _formattedTime = '';

  final String _chosenlanguage = 'EN',
      _timehint = 'time',
      _datehint = 'date',
      _title = subtitlesEN[1];

  HexagramSentence _hexsentence = getGateSentence(1, 'EN');

  final List<String> finalhexNamesList = hexNamesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: TextButton(
            child: const Text(
              'X',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
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
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Hexagram $_chosenhex: '
                              +  _controllertopfirsttext.text
                              + ' ' + _controllertopsecondtext.text
                              + ' ' + _controllertopthirdtext.text
                              + ' ' + _controllertopfourthtext.text),
                          content: _showLinesDialog(),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Close',
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        );
                      });
                },
                child: const Text('Stories'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold))),
          ],
          title: Text(_title, style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue),
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                    ToggleButtons(
                      borderWidth: 5.0,
                      hoverColor: Colors.black,
                      //borderRadius: BorderRadius.circular(20),
                      fillColor: Colors.black,
                      selectedColor: Colors.black,
                      children: [
                        Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[500]!,
                                      offset: const Offset(4, 4),
                                      blurRadius: 15,
                                      spreadRadius: 1),
                                  const BoxShadow(
                                      color: Colors.red,
                                      offset: Offset(-4, -4),
                                      blurRadius: 15,
                                      spreadRadius: 1),
                                ]),
                            child: const Text('Life',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20, color: Colors.white))),
                        Container(
                          height: 30,
                          width: 100,
                          child: const Text('Thought',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20, color: Colors.white)),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[500]!,
                                    offset: const Offset(4, 4),
                                    blurRadius: 15,
                                    spreadRadius: 1),
                                const BoxShadow(
                                    color: Colors.blue,
                                    offset: Offset(-4, -4),
                                    blurRadius: 15,
                                    spreadRadius: 1),
                              ]),
                        ),
                      ],
                      isSelected: _isLifeTime,
                      onPressed: (int index) {
                        switch (index) {
                          case 0:
                            _planetsList = _planetsdesignList;
                            _formattedDate =
                                DateFormat('yyyy-MM-dd').format(_designTime);
                            _formattedTime =
                                DateFormat.Hms().format(_designTime);
                            _controllerTime.text = _formattedTime;
                            _controllerDate.text = _formattedDate;
                            break;
                          case 1:
                            _planetsList = _planetsnowList;
                            _formattedDate =
                                DateFormat('yyyy-MM-dd').format(_now);
                            _formattedTime = DateFormat.Hms().format(_now);
                            _controllerTime.text = _formattedTime;
                            _controllerDate.text = _formattedDate;
                            break;
                          default:
                            break;
                        }

                        setState(() {
                          switch (_previousLifeTimeIndex) {
                            case -1:
                              _previousLifeTimeIndex = index;
                              _isLifeTime[index] = !_isLifeTime[index];
                              break;
                            default:
                              _isLifeTime[_previousLifeTimeIndex] =
                                  !_isLifeTime[_previousLifeTimeIndex];
                              _isLifeTime[index] = !_isLifeTime[index];
                              _previousLifeTimeIndex = index;
                              break;
                          }
                        });
                      },
                    ),
                    ToggleButtons(
                      borderWidth: 5.0,
                      hoverColor: Colors.black,
                      //borderRadius: BorderRadius.circular(20),
                      fillColor: Colors.blue,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              image: const DecorationImage(
                                  image: AssetImage("assets/planets/sun.png")),
                              borderRadius: BorderRadius.circular(10),
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
                                      AssetImage("assets/planets/earth.png")),
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
                                  image: AssetImage(
                                      "assets/planets/northnode.png")),
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
                                  image: AssetImage(
                                      "assets/planets/southnode.png")),
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
                                  image:
                                      AssetImage("assets/planets/mercury.png")),
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
                                      AssetImage("assets/planets/venus.png")),
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
                                  image:
                                      AssetImage("assets/planets/jupiter.png")),
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
                                      AssetImage("assets/planets/saturn.png")),
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
                                      AssetImage("assets/planets/uranus.png")),
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
                                      AssetImage("assets/planets/neptune.png")),
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
                                      AssetImage("assets/planets/pluto.png")),
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
                          _hexsentence = getGateSentence(
                              _planethex.gate!, _chosenlanguage);

                          _hexalignedList = hexagramAlignment(_planethex.gate!);
                          _controllertop.jumpToPage(_hexalignedList[0]);
                          _controllermid.jumpToPage(_hexalignedList[1]);
                          _controllerbot.jumpToPage(_hexalignedList[2]);

                          _controllerlinetext.text = _planethex.line!.toString();
                        });
                      },
                    ),
                  ]),
            ),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdowichingordervalue,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: orderHexagramsWheelList,
                      onChanged: (int? _dropdowichingordervalueChange) {
                        setState(() {
                          _dropdowichingordervalue =
                              _dropdowichingordervalueChange!;
                          _controllertopfirsttext.text =
                              hexagramAdjectiveList[_dropdowichingordervalue];
                          _controllertopsecondtext.text =
                              hexagramSubjectList[_dropdowichingordervalue];
                          _controllertopthirdtext.text =
                              hexagramVerbList[_dropdowichingordervalue];
                          _controllertopfourthtext.text =
                              hexagramAdverbList[_dropdowichingordervalue];

                          _chosenhex = _dropdowichingordervalue;
                          _hexalignedList = hexagramAlignment(_chosenhex);
                          _controllertop.jumpToPage(_hexalignedList[0]);
                          _controllermid.jumpToPage(_hexalignedList[1]);
                          _controllerbot.jumpToPage(_hexalignedList[2]);
                        });
                      },
                    ),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdowichingvalue,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: fontHexList,
                      onChanged: (String? _dropdowichingvalueChange) {
                        setState(() {
                          _dropdowichingvalue = _dropdowichingvalueChange!;
                          _fontindex = fontHexOrderList.indexWhere(
                              (element) => element == _dropdowichingvalue);
                          _fonthexconverted = fontHexNumbersList[_fontindex];

                          _controllertopfirsttext.text = hexagramAdjectiveList[
                              fontHexNumbersList[_fontindex]];
                          _controllertopsecondtext.text = hexagramSubjectList[
                              fontHexNumbersList[_fontindex]];
                          _controllertopthirdtext.text =
                              hexagramVerbList[fontHexNumbersList[_fontindex]];
                          _controllertopfourthtext.text = hexagramAdverbList[
                              fontHexNumbersList[_fontindex]];

                          _chosenhex = _fonthexconverted;
                          _hexalignedList = hexagramAlignment(_chosenhex);
                          _controllertop.jumpToPage(_hexalignedList[0]);
                          _controllermid.jumpToPage(_hexalignedList[1]);
                          _controllerbot.jumpToPage(_hexalignedList[2]);
                        });
                      },
                    ),
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(
                            width: 100,
                            child: TextField(
                                readOnly: true,
                                decoration: InputDecoration.collapsed(
                                    hintText: _timehint),
                                controller: _controllerTime,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black)),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                                textAlign: TextAlign.right,
                                readOnly: true,
                                decoration: InputDecoration.collapsed(
                                    hintText: _datehint),
                                controller: _controllerDate,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black)),
                          ),
                        ])),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownvalueChange) {
                        setState(() {
                          _dropdownvalue = _dropdownvalueChange!;
                          _controllertopfirsttext.text =
                              hexagramAdjectiveList[_dropdownvalue];
                          _controllertopsecondtext.text =
                              hexagramSubjectList[_dropdownvalue];
                          _controllertopthirdtext.text =
                              hexagramVerbList[_dropdownvalue];
                          _controllertopfourthtext.text =
                              hexagramAdverbList[_dropdownvalue];

                          _chosenhex = _dropdownvalue;
                          _hexalignedList = hexagramAlignment(_chosenhex);
                          _controllertop.jumpToPage(_hexalignedList[0]);
                          _controllermid.jumpToPage(_hexalignedList[1]);
                          _controllerbot.jumpToPage(_hexalignedList[2]);
                        });
                      },
                    ),
                    Container(
                      width: 50,
                      alignment: Alignment.center,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String? textHexValueChange) {
                          setState(() {
                            _textHexValueChange =
                                int.parse(textHexValueChange!);
                            _controllertopfirsttext.text =
                                hexagramAdjectiveList[_textHexValueChange];
                            _controllertopsecondtext.text =
                                hexagramSubjectList[_textHexValueChange];
                            _controllertopthirdtext.text =
                                hexagramVerbList[_textHexValueChange];
                            _controllertopfourthtext.text =
                                hexagramAdverbList[_textHexValueChange];

                            _chosenhex = _textHexValueChange;
                            _hexalignedList = hexagramAlignment(_chosenhex);
                            _controllertop.jumpToPage(_hexalignedList[0]);
                            _controllermid.jumpToPage(_hexalignedList[1]);
                            _controllerbot.jumpToPage(_hexalignedList[2]);
                          });
                        },
                      ),
                    )
                  ]),
            ),
            Row( mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                width: 40,
                    child: TextField(
                  decoration: const InputDecoration.collapsed(
                      hintText: '1', hintStyle: TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
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
                  width: 40,
                    child: TextField(
                      decoration: const InputDecoration.collapsed(
                          hintText: '1', hintStyle: TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: _hexsentence.adjective,
                      hintStyle: const TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllertopfirsttext,
                  readOnly: true,
                )),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: _hexsentence.subject,
                      hintStyle: const TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllertopsecondtext,
                  readOnly: true,
                )),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: _hexsentence.verb,
                      hintStyle: const TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllertopthirdtext,
                  readOnly: true,
                )),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: _hexsentence.adverb,
                        hintStyle: const TextStyle(color: Colors.grey)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllertopfourthtext,
                    readOnly: true,
                  ),
                ),
              ],
            ),
            Expanded(
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

                        _hexsentence =
                            getGateSentence(_chosenhex, _chosenlanguage);

                        _controllertopfirsttext.text = _hexsentence.adjective!;
                        _controllertopsecondtext.text = _hexsentence.subject!;
                        _controllertopthirdtext.text = _hexsentence.verb!;
                        _controllertopfourthtext.text = _hexsentence.adverb!;

                        switch (_chosenlanguage) {
                          case 'EN':
                            _controllerbottomfirsttext.text =
                                finalhexNamesList[_currenttop];
                            break;
                          case 'HE':
                            _controllerbottomthirdtext.text =
                                finalhexNamesList[_currenttop];
                            break;
                          default:
                            _controllerbottomfirsttext.text =
                                finalhexNamesList[_currenttop];
                            break;
                        }
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: hexList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controllertop.jumpToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_currenttop == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Expanded(
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

                        _hexsentence =
                            getGateSentence(_chosenhex, _chosenlanguage);

                        _controllertopfirsttext.text = _hexsentence.adjective!;
                        _controllertopsecondtext.text = _hexsentence.subject!;
                        _controllertopthirdtext.text = _hexsentence.verb!;
                        _controllertopfourthtext.text = _hexsentence.adverb!;

                        _controllerbottomsecondtext.text =
                            finalhexNamesList[_currentmid];
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: hexList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controllermid.jumpToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_currentmid == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Expanded(
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

                        _hexsentence =
                            getGateSentence(_chosenhex, _chosenlanguage);

                        _controllertopfirsttext.text = _hexsentence.adjective!;
                        _controllertopsecondtext.text = _hexsentence.subject!;
                        _controllertopthirdtext.text = _hexsentence.verb!;
                        _controllertopfourthtext.text = _hexsentence.adverb!;

                        switch (_chosenlanguage) {
                          case 'EN':
                            _controllerbottomthirdtext.text =
                                finalhexNamesList[_currentbot];
                            break;
                          case 'HE':
                            _controllerbottomfirsttext.text =
                                finalhexNamesList[_currentbot];
                            break;
                          default:
                            _controllerbottomthirdtext.text =
                                finalhexNamesList[_currentbot];
                            break;
                        }
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: hexList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controllerbot.jumpToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_currentbot == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: finalhexNamesList[0],
                      hintStyle: const TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllerbottomfirsttext,
                  readOnly: true,
                )),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: finalhexNamesList[0],
                      hintStyle: const TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllerbottomsecondtext,
                  readOnly: true,
                )),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: finalhexNamesList[0],
                      hintStyle: const TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllerbottomthirdtext,
                  readOnly: true,
                )),
              ],
            ),
            Expanded(
                child: Container(
              child: const Text(
                'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontFamily: 'iChing',
                ),
              ),
              alignment: Alignment.center,
            )),
          ]),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
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
                    fontSize: 17,
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
                    fontSize: 17, fontWeight: FontWeight.normal)),
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
            child: const Text('Set Date'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(
                    fontSize: 17, fontWeight: FontWeight.normal)),
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

              //_now = _now.toUtc();

              _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
              _formattedTime = DateFormat.Hms().format(_now);
              _controllerTime.text = _formattedTime;
              _controllerDate.text = _formattedDate;
              //_controllerType.text = 'Thought Later';
              //_controllerSubType.text = 'COMPLEX';

              //_isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
              _planethex = _planetsList[0];
              _hexsentence = getGateSentence(_planethex.gate!, _chosenlanguage);

              _hexalignedList = hexagramAlignment(_planethex.gate!);
              _controllertop.jumpToPage(_hexalignedList[0]);
              _controllermid.jumpToPage(_hexalignedList[1]);
              _controllerbot.jumpToPage(_hexalignedList[2]);

              _controllerlinetext.text = _planethex.line!.toString();

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

              switch (_previousLifeTimeIndex) {
                case -1:
                  _previousLifeTimeIndex = 1;
                  _isLifeTime[1] = !_isLifeTime[1];
                  break;
                default:
                  _isLifeTime[_previousLifeTimeIndex] =
                      !_isLifeTime[_previousLifeTimeIndex];
                  _isLifeTime[1] = !_isLifeTime[1];
                  _previousLifeTimeIndex = 1;
                  break;
              }

              setState(() {
                Navigator.of(context).pop();
              });
            },
            child: const Text('1) Fetch Your Time',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
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

                //_now = _now.toUtc();

                _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
                _formattedTime = DateFormat.Hms().format(_now);
                _controllerTime.text = _formattedTime;
                _controllerDate.text = _formattedDate;

                //_controllerType.text = 'THINK AFTER';
                //_controllerSubType.text = 'COMPLEX';

                //_isPlanetSelectedList[0] = !_isPlanetSelectedList[0];
                _planethex = _planetsList[0];
                _hexsentence =
                    getGateSentence(_planethex.gate!, _chosenlanguage);

                _hexalignedList = hexagramAlignment(_planethex.gate!);
                _controllertop.jumpToPage(_hexalignedList[0]);
                _controllermid.jumpToPage(_hexalignedList[1]);
                _controllerbot.jumpToPage(_hexalignedList[2]);

                _controllerlinetext.text = _planethex.line!.toString();

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

                switch (_previousLifeTimeIndex) {
                  case -1:
                    _previousLifeTimeIndex = 1;
                    _isLifeTime[1] = !_isLifeTime[1];
                    break;
                  default:
                    _isLifeTime[_previousLifeTimeIndex] =
                        !_isLifeTime[_previousLifeTimeIndex];
                    _isLifeTime[1] = !_isLifeTime[1];
                    _previousLifeTimeIndex = 1;
                    break;
                }

                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: const Text('2) Get Now Instead'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  textStyle: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.normal))),
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
                        borderRadius: BorderRadius.circular(10),
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
                    child: Text(
                        _planetsnowList[0].line.toString(),
                        textAlign: TextAlign.center,
                        style:
                        const TextStyle(color: Colors.black, fontSize: 25)),
                  ),
                ),
                const SizedBox(width: 10,),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
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
                    child: const Text(
                        '::',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 25)),
                  ),
                ),
                const SizedBox(width: 10,),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
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
                    child: Text(
                        _planetsdesignList[0].line.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red, fontSize: 25)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
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
                    child: Text(
                        idonotknowlinesList[_planetsnowList[0].line!].toString(),
                        textAlign: TextAlign.center,
                        style:
                        const TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ),
                const SizedBox(width: 10,),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
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
                    child: const Text(
                        '::',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 20)),
                  ),
                ),
                const SizedBox(width: 10,),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
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
                    child: Text(
                        idonotknowlinesList[_planetsdesignList[0].line!].toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red, fontSize: 20)),
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

  Widget _showLinesDialog() {
    return SizedBox(
      width: 600.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, _index) {
          int _newindex = idonotknowlinesList.indexOf(_chosenhex) + 6 - _index;
          return ListTile(
            title: FittedBox(fit: BoxFit.scaleDown,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1),
                      const BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1),
                    ]),
                child: Text(idonotknowlinesList[_newindex],
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25 - (_index * 1.2))),
              ),
            ),
            leading: Text(((_index - 6) * -1).toString()),
          );
        },
      ),
    );
  }

  Widget _buildEmptyChartPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Human Design', style: TextStyle (color: Colors.white)),
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
}
