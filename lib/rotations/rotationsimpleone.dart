import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:finallyicanlearn/logic/hexagramaligment.dart';
import 'package:flutter/material.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:flutter/services.dart';

// /rotatehexwithlogic
// rotate one hexagram
class RotateSimpleOne extends StatefulWidget {
  const RotateSimpleOne({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSimpleOneState();
  }
}

class _RotateSimpleOneState extends State<RotateSimpleOne> {
  int _currenttop = 0,
      _currentmid = 0,
      _currentbot = 0,
      _chosenhex = 1,
      _textHexValueChange = 1,
      _fontindex = 0,
      _fonthexconverted = 0;
  //_hexagramVal = 0;

  final CarouselController _controllertop = CarouselController(),
      _controllermid = CarouselController(),
      _controllerbot = CarouselController();

  final String _title = subtitlesEN[4];

  final List<String> finalhexNamesList = hexNamesList;

  var _dropdownvalue = hexagramslist[1],
      _dropdowichingvalue = fontHexOrderList[0],
      _dropdowichingordervalue = orderHexagramsWheel[0];

  List<int> _hexalignedList = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          title:
              AutoSizeText(_title, textAlign: TextAlign.left, maxFontSize: 15),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(
                Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.green),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      underline: DropdownButtonHideUnderline(child: Container()),
                      value: _dropdowichingordervalue,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: orderHexagramsWheelList,
                      onChanged: (int? dropdowichingordervalueChange) {
                        setState(() {
                          _dropdowichingordervalue =
                              dropdowichingordervalueChange!;

                          _chosenhex = _dropdowichingordervalue;
                          _hexalignedList = hexagramAlignment(_chosenhex);
                          _controllertop.jumpToPage(_hexalignedList[0]);
                          _controllermid.jumpToPage(_hexalignedList[1]);
                          _controllerbot.jumpToPage(_hexalignedList[2]);
                        });
                      },
                    ),
                    DropdownButton(
                      underline: DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? dropdownvalueChange) {
                        setState(() {
                          _dropdownvalue = dropdownvalueChange!;

                          _chosenhex = _dropdownvalue;
                          _hexalignedList = hexagramAlignment(_chosenhex);
                          _controllertop.jumpToPage(_hexalignedList[0]);
                          _controllermid.jumpToPage(_hexalignedList[1]);
                          _controllerbot.jumpToPage(_hexalignedList[2]);
                        });
                      },
                    ),
                    DropdownButton(
                      underline: DropdownButtonHideUnderline(child: Container()),
                      value: _dropdowichingvalue,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: fontHexList,
                      onChanged: (String? dropdowichingvalueChange) {
                        setState(() {
                          _dropdowichingvalue = dropdowichingvalueChange!;
                          _fontindex = fontHexOrderList.indexWhere(
                              (element) => element == _dropdowichingvalue);
                          _fonthexconverted = fontHexNumbersList[_fontindex];

                          _chosenhex = _fonthexconverted;
                          _hexalignedList = hexagramAlignment(_chosenhex);
                          _controllertop.jumpToPage(_hexalignedList[0]);
                          _controllermid.jumpToPage(_hexalignedList[1]);
                          _controllerbot.jumpToPage(_hexalignedList[2]);
                        });
                      },
                    ),
                    Container(
                      width: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String? textHexValueChange) {
                          setState(() {
                            _textHexValueChange = int.parse(textHexValueChange!);

                            _chosenhex = _textHexValueChange;
                            _hexalignedList = hexagramAlignment(_chosenhex);
                            _controllertop.jumpToPage(_hexalignedList[0]);
                            _controllermid.jumpToPage(_hexalignedList[1]);
                            _controllerbot.jumpToPage(_hexalignedList[2]);
                          });
                        },
                      ),
                    ),
                  ]),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 10,
                  minWidth: 10,
                  maxHeight: MediaQuery.of(context).size.height * 0.2,
                  maxWidth: MediaQuery.of(context).size.width * 0.5,
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
                        });
                      }),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 10,
                  minWidth: 10,
                  maxHeight: MediaQuery.of(context).size.height * 0.2,
                  maxWidth: MediaQuery.of(context).size.width * 0.5,
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
                        });
                      }),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 10,
                  minWidth: 10,
                  maxHeight: MediaQuery.of(context).size.height * 0.2,
                  maxWidth: MediaQuery.of(context).size.width * 0.5,
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
                        });
                      }),
                ),
              ),

              const Divider(
                color: Colors.green,
                thickness: 5,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'O',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontFamily: 'iChing',
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
