import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
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
      _currentconstate = 0,
      _hexagramVal = 0,
      _fontindex = 0,
      _carouselvalueindex = 0,
      _chosenhex = 1,
      _fonthexconverted = 0,
      _textHexValueChange = 1,
      _previousPlanetIndex = -1;

  final CarouselController _controllerconstate = CarouselController(),
      _controllertop = CarouselController(),
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
        toolbarHeight: 40,
        title: AutoSizeText(_title, textAlign: TextAlign.left, maxFontSize: 15),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(
          Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),

          backgroundColor: Colors.blue),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 5,
          ),
          Flex(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                                'Hexagram $_chosenhex: '
                                '${_controllertopfirsttext.text} '
                                '${_controllertopsecondtext.text} '
                                '${_controllertopthirdtext.text} '
                                '${_controllertopfourthtext.text}',
                                style: const TextStyle(fontSize: 18)),
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
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  child: const Text('Stories', style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold))),
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
                              _formattedDate =
                                  DateFormat('yyyy-MM-dd').format(_now);
                              _formattedTime = DateFormat.Hms().format(_now);
                              _controllerTime.text = _formattedTime;
                              _controllerDate.text = _formattedDate;
                              break;
                            case 1:
                              _planetsList = _planetsdesignList;
                              _formattedDate =
                                  DateFormat('yyyy-MM-dd').format(_designTime);
                              _formattedTime =
                                  DateFormat.Hms().format(_designTime);
                              _controllerTime.text = _formattedTime;
                              _controllerDate.text = _formattedDate;
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
              const SizedBox (width: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: AutoSizeTextField(
                    fullwidth: false,
                    readOnly: true,
                    decoration: InputDecoration.collapsed(hintText: _timehint),
                    controller: _controllerTime,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black)),
              ),
              const SizedBox (width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: AutoSizeTextField(
                    fullwidth: false,
                    readOnly: true,
                    decoration: InputDecoration.collapsed(hintText: _datehint),
                    controller: _controllerDate,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black)),
              ),

            ],
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
                    _isPlanetSelectedList[index] = !_isPlanetSelectedList[index];
                    break;
                  default:
                    _isPlanetSelectedList[_previousPlanetIndex] =
                        !_isPlanetSelectedList[_previousPlanetIndex];
                    _isPlanetSelectedList[index] = !_isPlanetSelectedList[index];
                    _previousPlanetIndex = index;
                }

                _planethex = _planetsList[index];
                _hexsentence = getGateSentence(_planethex.gate!, _chosenlanguage);

                _hexalignedList = hexagramAlignment(_planethex.gate!);
                _controllertop.jumpToPage(_hexalignedList[0]);
                _controllermid.jumpToPage(_hexalignedList[1]);
                _controllerbot.jumpToPage(_hexalignedList[2]);

                _controllerlinetext.text = _planethex.line!.toString();
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
                        hintText: '1', hintStyle: TextStyle(color: Colors.black)),
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
                        hintText: '1', hintStyle: TextStyle(color: Colors.black)),
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

                        _hexsentence = getGateSentence(_chosenhex, _chosenlanguage);

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

                        _hexsentence = getGateSentence(_chosenhex, _chosenlanguage);

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

                        _hexsentence = getGateSentence(_chosenhex, _chosenlanguage);

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
          const Divider(
            color: Colors.blue,
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 20,
                child: AutoSizeTextField(
                  fullwidth: false,
                  decoration: InputDecoration.collapsed(
                      hintText: _hexsentence.adjective,
                      hintStyle: const TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllertopfirsttext,
                  readOnly: true,
                ),
              ),
              SizedBox(
                width: 40,
                height: 20,
                child: AutoSizeTextField(
                  fullwidth: false,
                  decoration: InputDecoration.collapsed(
                      hintText: _hexsentence.subject,
                      hintStyle: const TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  controller: _controllertopsecondtext,
                  readOnly: true,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 20,
            child: AutoSizeTextField(
              fullwidth: false,
              decoration: InputDecoration.collapsed(
                  hintText: _hexsentence.verb,
                  hintStyle: const TextStyle(color: Colors.black)),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              controller: _controllertopthirdtext,
              readOnly: true,
            ),
          ),
          SizedBox(
            width: 200,
            child: AutoSizeTextField(
              fullwidth: false,
              decoration: InputDecoration.collapsed(
                  hintText: _hexsentence.adverb,
                  hintStyle: const TextStyle(color: Colors.black)),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              controller: _controllertopfourthtext,
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
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                controller: _controllerbottomfirsttext,
                readOnly: true,
              )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: AutoSizeTextField(
                decoration: InputDecoration.collapsed(
                    hintText: finalhexNamesList[0],
                    hintStyle: const TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                controller: _controllerbottomsecondtext,
                readOnly: true,
              )),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: AutoSizeTextField(
                decoration: InputDecoration.collapsed(
                    hintText: finalhexNamesList[0],
                    hintStyle: const TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                controller: _controllerbottomthirdtext,
                readOnly: true,
              )),
            ],
          ),
          const Divider(
            color: Colors.blue,
          ),
          Container(
            alignment: Alignment.center,
            child: const AutoSizeText(
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
          const SizedBox(
            height: 5,
          )
        ]),
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
          SizedBox(
            width: 150,
            child: TextField(
                readOnly: true,
                decoration: const InputDecoration.collapsed(hintText: '16:58'),
                textAlign: TextAlign.center,
                controller: _controllerTimePick,
                style: const TextStyle(
                    fontSize: 20,
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
                    fontSize: 18, fontWeight: FontWeight.normal)),
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
                    const InputDecoration.collapsed(hintText: '02/19/1984'),
                textAlign: TextAlign.center,
                controller: _controllerDatePick,
                style: const TextStyle(
                    fontSize: 18,
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
                    fontSize: 18, fontWeight: FontWeight.normal)),
            child: const Text('Set Date'),
          ),
          const Divider(
            color: Colors.black,
            thickness: 5,
          ),
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

              switch (_currentconstate) {
                case 0:
                  _controllerconstate.jumpToPage(1);
                  _controllerconstate.jumpToPage(0);
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
                    fontSize: 18,
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

              _planetsList = _planetsnowList;

              _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
              _formattedTime = DateFormat.Hms().format(_now);

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

              switch (_currentconstate) {
                case 0:
                  _controllerconstate.jumpToPage(1);
                  _controllerconstate.jumpToPage(0);
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
                backgroundColor: Colors.red),
            child: const Text('Fetch Now Instead',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal)),
          ),
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

  Widget _showLinesDialog() {
    return SizedBox(
      width: 600.0,
      child: Center(
        child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.vertical,
          reverse: false,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            int newindex = idonotknowlinesList.indexOf(_chosenhex) + 6 - index;
            return ListTile(
              title: Flex(
                direction: Axis.vertical,
                children: [
                  Text(idonotknowlinesList[newindex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20)),
                  Text(((index - 6) * -1).toString()),
                ],
              ),
            );
          },
        ),
      ),
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
}
