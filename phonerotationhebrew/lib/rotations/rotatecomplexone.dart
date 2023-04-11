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
          title: Text(_title, style: const TextStyle(color: Colors.white)),
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
                  ]),
            ),
            Divider(
              color: Colors.blue, thickness: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 40,
                    child: TextField(
                      decoration: const InputDecoration.collapsed(
                          hintText: '1',
                          hintStyle: TextStyle(color: Colors.grey)),
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
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: _hexsentence.adjective,
                      hintStyle: const TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllertopfirsttext,
                  readOnly: true,
                )),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: _hexsentence.subject,
                      hintStyle: const TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllertopsecondtext,
                  readOnly: true,
                )),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: _hexsentence.verb,
                      hintStyle: const TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllertopthirdtext,
                  readOnly: true,
                )),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: _hexsentence.adverb,
                        hintStyle: const TextStyle(color: Colors.grey)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllertopfourthtext,
                    readOnly: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
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
                    fontSize: 15.0,
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
                    fontSize: 15.0,
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
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllerbottomthirdtext,
                  readOnly: true,
                )),
              ],
            ),
            SizedBox(height: 10,),
            Divider(
              color: Colors.blue, thickness: 10.0,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                              '$_chosenhex: ' +
                              _controllertopfirsttext.text +
                              ' ' +
                              _controllertopsecondtext.text +
                              ' ' +
                              _controllertopthirdtext.text +
                              ' ' +
                              _controllertopfourthtext.text),
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
                child: const Text('מחשבון משפחתי'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold))),
            Expanded(
                child: Container(
              child: const Text(
                'a O # P @',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
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
                decoration: const InputDecoration.collapsed(hintText: '16:58'),
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
                    const InputDecoration.collapsed(hintText: '02/19/1984'),
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

  Widget _showLinesDialog() {
    return SizedBox(
      width: 600.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, _index) {
          int _newindex = idonotknowlinesList.indexOf(_chosenhex) + 6 - _index;
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[500]!,
                        offset: const Offset(1, 1),
                        blurRadius: 5,
                        spreadRadius: 1),
                    const BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(-1, -1),
                        blurRadius: 5,
                        spreadRadius: 1),
                  ]),
              child: Text(idonotknowlinesList[_newindex],
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12)),
            ),
            leading: Text(((_index - 6) * -1).toString()),
          );
        },
      ),
    );
  }
}
