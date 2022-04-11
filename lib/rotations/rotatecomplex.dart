import 'package:carousel_slider/carousel_slider.dart';
import 'package:finallyicanlearn/logic/hexagramaligment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finallyicanlearn/models/lists.dart';

// /rotatehexwithlogic
// rotate one hexagram
class RotateComplex extends StatefulWidget {
  const RotateComplex({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateComplexState();
  }
}

class _RotateComplexState extends State<RotateComplex> {
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

  final TextEditingController _controllerhextext = TextEditingController(),
      _controllerfirsttext = TextEditingController(),
      _controllersecondtext = TextEditingController(),
      _controllerthirdtext = TextEditingController();

  var _dropdownvalue = hexagramslist[1],
      _dropdowichingvalue = fontHexOrderList[0],
      _dropdowichingordervalue = orderHexagramsWheel[0];

  List<int> _hexalignedList = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Rotate Complex'),
          backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.grey[100],
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
                          _controllerfirsttext.text = hexagramAdjectiveList[
                          _dropdowichingordervalue];
                          _controllersecondtext.text = hexagramSubjectList[
                          _dropdowichingordervalue];
                          _controllerthirdtext.text = hexagramVerbList[
                          _dropdowichingordervalue];

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

                          _controllerfirsttext.text = hexagramAdjectiveList[
                          fontHexNumbersList[_fontindex]];
                          _controllersecondtext.text = hexagramSubjectList[
                          fontHexNumbersList[_fontindex]];
                          _controllerthirdtext.text = hexagramVerbList[
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
                          _controllerfirsttext.text =
                          hexagramAdjectiveList[_dropdownvalue];
                          _controllersecondtext.text =
                          hexagramSubjectList[_dropdownvalue];
                          _controllerthirdtext.text =
                          hexagramVerbList[_dropdownvalue];

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
                            _textHexValueChange = int.parse(textHexValueChange!);
                            _controllerfirsttext.text = hexagramAdjectiveList[
                            _textHexValueChange];
                            _controllersecondtext.text = hexagramSubjectList[
                            _textHexValueChange];
                            _controllerthirdtext.text = hexagramVerbList[
                            _textHexValueChange];

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
            SizedBox(
                child: TextField(
                  decoration: const InputDecoration.collapsed(
                      hintText: '1', hintStyle: TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllerhextext,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: hexagramAdjectiveList[1],
                          hintStyle: const TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllerfirsttext,
                      readOnly: true,
                    )),
                Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: hexagramSubjectList[1],
                          hintStyle: const TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllersecondtext,
                      readOnly: true,
                    )),
                Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: hexagramVerbList[1],
                          hintStyle: const TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllerthirdtext,
                      readOnly: true,
                    )),
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
                        _carouselvalueindex = hexCarouselValueList.indexWhere(
                                (element) => element == _hexagramVal.toString());
                        _carouselvalueindex++;
                        _controllerhextext.text =
                        hexCarouselValueList[_carouselvalueindex];

                        _controllerfirsttext.text = hexagramAdjectiveList[
                        int.parse(
                            hexCarouselValueList[_carouselvalueindex])];
                        _controllersecondtext.text = hexagramSubjectList[
                        int.parse(
                            hexCarouselValueList[_carouselvalueindex])];
                        _controllerthirdtext.text = hexagramVerbList[
                        int.parse(
                            hexCarouselValueList[_carouselvalueindex])];
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

                        _carouselvalueindex = hexCarouselValueList.indexWhere(
                                (element) => element == _hexagramVal.toString());
                        _carouselvalueindex++;
                        _controllerhextext.text =
                        hexCarouselValueList[_carouselvalueindex];

                        _controllerfirsttext.text = hexagramAdjectiveList[
                        int.parse(
                            hexCarouselValueList[_carouselvalueindex])];
                        _controllersecondtext.text = hexagramSubjectList[
                        int.parse(
                            hexCarouselValueList[_carouselvalueindex])];
                        _controllerthirdtext.text = hexagramVerbList[
                        int.parse(
                            hexCarouselValueList[_carouselvalueindex])];
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
                        _carouselvalueindex = hexCarouselValueList.indexWhere(
                                (element) => element == _hexagramVal.toString());
                        _carouselvalueindex++;
                        _controllerhextext.text =
                        hexCarouselValueList[_carouselvalueindex];

                        _controllerfirsttext.text = hexagramAdjectiveList[
                        int.parse(
                            hexCarouselValueList[_carouselvalueindex])];
                        _controllersecondtext.text = hexagramSubjectList[
                        int.parse(
                            hexCarouselValueList[_carouselvalueindex])];
                        _controllerthirdtext.text = hexagramVerbList[
                        int.parse(
                            hexCarouselValueList[_carouselvalueindex])];
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
                ))
          ]),
    );
  }
}