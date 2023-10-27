import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_list/circle_list.dart';
import 'package:dashed_color_circle/dashed_color_circle.dart';
import 'package:finallyicanlearn/logic/hexagramaligment.dart';
import 'package:finallyicanlearn/services/rotatewidgets.dart';
import 'package:flutter/material.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:flutter/services.dart';

class RotateSimple extends StatefulWidget {
  const RotateSimple({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSimpleState();
  }
}

class _RotateSimpleState extends State<RotateSimple> {
  int _currentone = 0;

  final CarouselController _controllerone = CarouselController();

  final TextEditingController _controllerbottomfirsttext =
      TextEditingController();

  final String _title = subtitles[3];

  final List<String> finalhexNamesList = hexNamesList;

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

  var _dropdownvalue = hexagramslist[1],
      _dropdowichingvalue = fontHexOrderList[0],
      _dropdowichingordervalue = orderHexagramsWheel[0];

  List<int> _hexalignedList = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                foregroundImage: AssetImage(titlesicon[3]),
              ),
            ],
          ),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.green),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 100.0,
                child: CarouselSlider(
                  items: mixHexagramSlidersNew,
                  carouselController: _controllerone,
                  options: CarouselOptions(
                      initialPage: 1,
                      autoPlay: false,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      enlargeCenterPage: true,
                      aspectRatio: 1.3,
                      onPageChanged: (indextop, reason) {
                        setState(() {
                          _currenttop = indextop;
                          _controllerbottomfirsttext.text =
                              hexNamesList[indextop];
                        });
                      }),
                ),
              ),
              SizedBox(
                  width: 200,
                  child: AutoSizeTextField(
                    minLines: 1,
                    minFontSize: 15,
                    fullwidth: false,
                    decoration: InputDecoration.collapsed(
                        hintText: hexNamesList[1],
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
              const SizedBox(height: 20),
              const Divider(
                color: Colors.green,
                thickness: 5,
              ),
              Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
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
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
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
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
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
                            _textHexValueChange =
                                int.parse(textHexValueChange!);

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
                      initialPage: 1,
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
                      initialPage: 1,
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
                      initialPage: 1,
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
              const SizedBox(height: 20),
              const Divider(
                color: Colors.green,
                thickness: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              build36PopUp(context),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      child: const Text('36',
                          style: TextStyle(color: Colors.white))),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              build64PopUp(context),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      child: const Text('64',
                          style: TextStyle(color: Colors.white))),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              build384PopUp(context),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      child: const Text('384',
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              const Divider(
                color: Colors.green,
                thickness: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        buildComplexPopUp(context),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                child: const AutoSizeText(
                  'abcdefghijklmnop',
                  minFontSize: 10,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 36,
                    fontFamily: 'iChing',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        buildSimplePopUp(context),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                child: const AutoSizeText(
                  'qrstuvwxyzABCDEF',
                  minFontSize: 10,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 36,
                    fontFamily: 'iChing',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        buildBreathPopUp(context),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                child: const AutoSizeText(
                  'GHIJKLMNOPQRSTUV',
                  minFontSize: 10,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 36,
                    fontFamily: 'iChing',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        buildSilencePopUp(context),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                child: const AutoSizeText(
                  'WXYZ1234567890!@',
                  minFontSize: 10,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 36,
                    fontFamily: 'iChing',
                  ),
                ),
              ),
              const Divider(
                color: Colors.green,
                thickness: 5,
              ),
              Stack(
                children: [
                  CircleList(
                    innerRadius: MediaQuery.of(context).size.width / 12,
                    initialAngle: -0.8,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(64, (index) {
                      return Container(
                        width: 35,
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: reversedbotcoincolor[index],
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                    centerWidget: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: Image.asset("assets/fullrotateicon.png")),
                  ),
                  CircleList(
                    innerRadius: MediaQuery.of(context).size.width / 8,
                    initialAngle: -0.8,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(64, (index) {
                      return Container(
                        width: 35,
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: reversedmidcoincolor[index],
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                  CircleList(
                    innerRadius: MediaQuery.of(context).size.width / 6,
                    initialAngle: -0.8,
                    childrenPadding: 0.1,
                    origin: const Offset(0, 0),
                    children: List.generate(64, (index) {
                      return InkWell(
                        child: Container(
                          width: 55,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: reversedtopcoincolor[index],
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.black)),
                          child: AutoSizeText(
                              reversedHexagramsWheel[index].toString(),
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
                            builder: (BuildContext context) =>
                                buildWalletPopUp(context, index),
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
              const Divider(
                color: Colors.green,
                thickness: 5,
              ),
              Container(
                width: 400,
                height: 500,
                child: Stack(
                  children: [

                    //channels

                    //64 47
                    Positioned(
                      top: 10,
                      left: 158,
                      child: Container(
                          width: 5,
                          height: 15,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.yellow,
                            ),
                          ),
                        ),

                    ),
                    Positioned(
                      top: 25,
                      left: 158,
                      child: Container(
                        width: 5,
                        height: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.yellow,
                          ),
                        ),
                      ),

                    ),

                    //61 24
                    Positioned(
                      top: 10,
                      left: 178,
                      child: Container(
                        width: 5,
                        height: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.yellow,
                          ),
                        ),
                      ),

                    ),
                    Positioned(
                      top: 25,
                      left: 178,
                      child: Container(
                        width: 5,
                        height: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.yellow,
                          ),
                        ),
                      ),

                    ),

                    //63 4
                    Positioned(
                      top: 10,
                      left: 198,
                      child: Container(
                        width: 5,
                        height: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.yellow,
                          ),
                        ),
                      ),

                    ),
                    Positioned(
                      top: 25,
                      left: 198,
                      child: Container(
                        width: 5,
                        height: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.yellow,
                          ),
                        ),
                      ),

                    ),

                    //17 62
                    Positioned(
                      top: 70,
                      left: 158,
                      child: Container(
                        width: 5,
                        height: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.yellow,
                          ),
                        ),
                      ),

                    ),
                    Positioned(
                      top: 80,
                      left: 158,
                      child: Container(
                        width: 5,
                        height: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.yellow,
                          ),
                        ),
                      ),

                    ),

                    //23 43
                    Positioned(
                      top: 70,
                      left: 178,
                      child: Container(
                        width: 5,
                        height: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.yellow,
                          ),
                        ),
                      ),

                    ),
                    Positioned(
                      top: 80,
                      left: 178,
                      child: Container(
                        width: 5,
                        height: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.yellow,
                          ),
                        ),
                      ),

                    ),

                    //11 56
                    Positioned(
                      top: 70,
                      left: 198,
                      child: Container(
                        width: 5,
                        height: 15,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.yellow,
                          ),
                        ),
                      ),

                    ),
                    Positioned(
                      top: 85,
                      left: 198,
                      child: Container(
                        width: 5,
                        height: 7,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.yellow,
                          ),
                        ),
                      ),

                    ),

                    // 57 20
                    Positioned(
                      top: 130,
                      left: 120,
                      child: Transform.rotate(
                        angle: 0.85,
                        child: Container(
                          width: 5,
                          height: 65,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 168,
                      left: 80,
                      child: Transform.rotate(
                        angle: 0.85,
                        child: Container(
                          width: 5,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 170,
                      left: 125,
                      child: Transform.rotate(
                        angle: 5.4,
                        child: Container(
                          width: 5,
                          height: 65,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 175,
                      left: 125,
                      child: Transform.rotate(
                        angle: 5.9,
                        child: Container(
                          width: 5,
                          height: 135,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),


                    // head
                    Positioned(
                      top: 5,
                      left: 150,
                      child: Container(
                        width: 60,
                        height: 10,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 150,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      left: 170,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      left: 190,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    // ajna
                    Positioned(
                      top: 35,
                      left: 150,
                      child: Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 6,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // top

                    Positioned(
                      top: 30,
                      left: 150,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 30,
                      left: 150 + 20,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 30,
                      left: 150 + 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    // bottom
                    Positioned(
                      top: 60,
                      left: 150,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 60,
                      left: 150 + 20,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 60,
                      left: 150 + 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    // throat
                    Positioned(
                      top: 100,
                      left: 140,
                      child: Container(
                        width: 80,
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    //top
                    Positioned(
                      top: 90,
                      left: 150,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 90,
                      left: 150 + 20,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 90,
                      left: 150 + 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    //middle
                    //left
                    Positioned(
                      top: 110,
                      left: 140,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 130,
                      left: 140,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.orange))),
                    ),
                    //right
                    Positioned(
                      top: 110,
                      left: 140 + 60,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.blue))),
                    ),
                    Positioned(
                      top: 130,
                      left: 140 + 60,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.blue))),
                    ),

                    // exception
                    Positioned(
                      top: 160,
                      left: 150 + 60,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.blue))),
                    ),

                    //bottom
                    Positioned(
                      top: 150,
                      left: 150,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 150,
                      left: 150 + 20,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 150,
                      left: 150 + 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    //Self G
                    Positioned(
                      top: 190,
                      left: 140,
                      child: Container(
                        width: 80,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    //top
                    Positioned(
                      top: 190,
                      left: 150,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 190,
                      left: 150 + 20,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 190,
                      left: 150 + 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    //middle
                    //left
                    Positioned(
                      top: 210,
                      left: 140,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.orange))),
                    ),
                    //right
                    Positioned(
                      top: 210,
                      left: 140 + 60,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    // exception
                    Positioned(
                      top: 160,
                      left: 150 + 60,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.blue))),
                    ),

                    //bottom
                    Positioned(
                      top: 230,
                      left: 150,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 230,
                      left: 150 + 20,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 230,
                      left: 150 + 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    //Ego Heart
                    Positioned(
                      top: 200,
                      left: 240,
                      child: Container(
                        width: 40,
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    //top
                    Positioned(
                      top: 190,
                      left: 250,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.blue))),
                    ),
                    //left
                    Positioned(
                      top: 210,
                      left: 230,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    //bottom
                    Positioned(
                      top: 250,
                      left: 230,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    Positioned(
                      top: 250,
                      left: 270,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    //right
                    Positioned(
                      top: 210,
                      left: 140 + 60,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    // exception
                    Positioned(
                      top: 160,
                      left: 150 + 60,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(width: 10.0, color: Colors.blue))),
                    ),

                    //bottom
                    Positioned(
                      top: 230,
                      left: 150,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 230,
                      left: 150 + 20,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 230,
                      left: 150 + 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    
                    //Sacral
                    Positioned(
                      top: 275,
                      left: 145,
                      child: Container(
                        width: 75,
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    //top
                    Positioned(
                      top: 270,
                      left: 150,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),
                    Positioned(
                      top: 270,
                      left: 170,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),
                    Positioned(
                      top: 270,
                      left: 150 + 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),

                    //middle
                    //left
                    Positioned(
                      top: 310,
                      left: 140,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),
                    //right
                    Positioned(
                      top: 310,
                      left: 205,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),

                    // exception
                    Positioned(
                      top: 290,
                      left: 140,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),

                    //bottom
                    Positioned(
                      top: 330,
                      left: 150,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),
                    Positioned(
                      top: 330,
                      left: 170,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),
                    Positioned(
                      top: 330,
                      left: 190,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),

                    //root
                    Positioned(
                      top: 370,
                      left: 140,
                      child: Container(
                        width: 80,
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    //top
                    Positioned(
                      top: 360,
                      left: 150,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),
                    Positioned(
                      top: 360,
                      left: 150 + 20,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),
                    Positioned(
                      top: 360,
                      left: 150 + 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.red))),
                    ),

                    //middle
                    //left
                    Positioned(
                      top: 380,
                      left: 140,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 400,
                      left: 140,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 420,
                      left: 140,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    //right
                    Positioned(
                      top: 380,
                      left: 200,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 400,
                      left: 200,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 420,
                      left: 200,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.yellow))),
                    ),

                    //spleen
                    Positioned(
                      top: 120,
                      left: 40,
                      child: Container(
                        width: 20,
                        height: 320,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // top
                    Positioned(
                      top: 110,
                      left: 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.yellow))),
                    ),



                    Positioned(
                      top: 210,
                      left: 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.orange))),
                    ),
                    Positioned(
                      top: 250,
                      left: 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 10.0, color: Colors.yellow))),
                    ),

                    //middle
                    Positioned(
                      top: 310,
                      left: 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.red))),
                    ),

                    //bottom
                    Positioned(
                      top: 380,
                      left: 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 400,
                      left: 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 420,
                      left: 40,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(width: 10.0, color: Colors.yellow))),
                    ),

                    //solar plexus
                    Positioned(
                      top: 120,
                      left: 300,
                      child: Container(
                        width: 20,
                        height: 320,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 9,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // top
                    Positioned(
                      top: 110,
                      left: 300,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(width: 10.0, color: Colors.blue))),
                    ),
                    Positioned(
                      top: 130,
                      left: 300,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(width: 10.0, color: Colors.blue))),
                    ),
                    Positioned(
                      top: 250,
                      left: 300,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(width: 10.0, color: Colors.yellow))),
                    ),

                    //middle
                    Positioned(
                      top: 310,
                      left: 300,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 10.0, color: Colors.red))),
                    ),

                    //bottom
                    Positioned(
                      top: 380,
                      left: 300,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 400,
                      left: 300,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(width: 10.0, color: Colors.yellow))),
                    ),
                    Positioned(
                      top: 420,
                      left: 300,
                      child: Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(width: 10.0, color: Colors.yellow))),
                    ),

                    // end centers
                  ],
                ),
              ),
              const Divider(
                color: Colors.green,
                thickness: 5,
              ),
              Container(
                alignment: Alignment.center,
                child: const AutoSizeText(
                  'O',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 40,
                    fontFamily: 'iChing',
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
