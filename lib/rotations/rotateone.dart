import 'package:carousel_slider/carousel_slider.dart';
import 'package:finallyicanlearn/logic/hexagramaligment.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finallyicanlearn/models/lists.dart';

// /rotatehexwithlogic
// rotate one hexagram
class RotateOneHexagram extends StatefulWidget {
  const RotateOneHexagram({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateOneHexagramState();
  }
}

class _RotateOneHexagramState extends State<RotateOneHexagram> {
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
      _controllertopfirsttext = TextEditingController(),
      _controllertopsecondtext = TextEditingController(),
      _controllertopthirdtext = TextEditingController(),
      _controllertopfourthtext = TextEditingController(),
      _controllerbottomfirsttext = TextEditingController(),
      _controllerbottomsecondtext = TextEditingController(),
      _controllerbottomthirdtext = TextEditingController();


  var _dropdownvalue = hexagramslist[1],
      _dropdowichingvalue = fontHexOrderList[0],
      _dropdowichingordervalue = orderHexagramsWheel[0];

  List<int> _hexalignedList = [0, 0, 0];

  DateTime _now = DateTime.now();
  List<Hexagram> _planetsList = [];

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
      appBar: AppBar(
        actions: [
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _sunhex = _planetsList[0];


            _controllerhextext.text = _sunhex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_sunhex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_sunhex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_sunhex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_sunhex.gate!];

            _hexalignedList = hexagramAlignment(_sunhex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
              child: Container(
                height: 40,
                width: 40,
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
              ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _earthhex = _planetsList[1];


            _controllerhextext.text = _earthhex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_earthhex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_earthhex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_earthhex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_earthhex.gate!];

            _hexalignedList = hexagramAlignment(_earthhex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
              child: Container(
                height: 40,
                width: 40,
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
              ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _northnodehex = _planetsList[2];


            _controllerhextext.text = _northnodehex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_northnodehex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_northnodehex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_northnodehex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_northnodehex.gate!];

            _hexalignedList = hexagramAlignment(_northnodehex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/northnode.png")),
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
              ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _southnodehex = _planetsList[3];


            _controllerhextext.text = _southnodehex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_southnodehex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_southnodehex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_southnodehex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_southnodehex.gate!];

            _hexalignedList = hexagramAlignment(_southnodehex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(
                        image: AssetImage("assets/planets/southnode.png")),
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
              ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _moonhex = _planetsList[4];


            _controllerhextext.text = _moonhex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_moonhex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_moonhex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_moonhex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_moonhex.gate!];

            _hexalignedList = hexagramAlignment(_moonhex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
            child: Container(
              height: 40,
              width: 40,
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
            ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _mercuryhex = _planetsList[5];


            _controllerhextext.text = _mercuryhex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_mercuryhex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_mercuryhex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_mercuryhex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_mercuryhex.gate!];

            _hexalignedList = hexagramAlignment(_mercuryhex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
            child: Container(
              height: 40,
              width: 40,
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
            ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _venushex = _planetsList[6];


            _controllerhextext.text = _venushex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_venushex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_venushex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_venushex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_venushex.gate!];

            _hexalignedList = hexagramAlignment(_venushex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
            child: Container(
              height: 40,
              width: 40,
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
            ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _marshex = _planetsList[7];


            _controllerhextext.text = _marshex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_marshex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_marshex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_marshex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_marshex.gate!];

            _hexalignedList = hexagramAlignment(_marshex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
            child: Container(
              height: 40,
              width: 40,
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
            ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _jupiterhex = _planetsList[8];


            _controllerhextext.text = _jupiterhex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_jupiterhex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_jupiterhex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_jupiterhex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_jupiterhex.gate!];

            _hexalignedList = hexagramAlignment(_jupiterhex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
            child: Container(
              height: 40,
              width: 40,
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
            ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _saturnhex = _planetsList[9];


            _controllerhextext.text = _saturnhex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_saturnhex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_saturnhex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_saturnhex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_saturnhex.gate!];

            _hexalignedList = hexagramAlignment(_saturnhex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
            child: Container(
              height: 40,
              width: 40,
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
            ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _uranushex = _planetsList[10];


            _controllerhextext.text = _uranushex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_uranushex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_uranushex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_uranushex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_uranushex.gate!];

            _hexalignedList = hexagramAlignment(_uranushex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
            child: Container(
              height: 40,
              width: 40,
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
            ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _neptunehex = _planetsList[11];


            _controllerhextext.text = _neptunehex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_neptunehex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_neptunehex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_neptunehex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_neptunehex.gate!];

            _hexalignedList = hexagramAlignment(_neptunehex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
            child: Container(
              height: 40,
              width: 40,
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
            ),),
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _plutohex = _planetsList[12];


            _controllerhextext.text = _plutohex.gate.toString();
            _controllertopfirsttext.text = hexagramAdjectiveList[_plutohex.gate!];
            _controllertopsecondtext.text = hexagramSubjectList[_plutohex.gate!];
            _controllertopthirdtext.text = hexagramVerbList[_plutohex.gate!];
            _controllertopfourthtext.text = hexagramAdverbList[_plutohex.gate!];

            _hexalignedList = hexagramAlignment(_plutohex.gate!);
            _controllertop.jumpToPage(_hexalignedList[0]);
            _controllermid.jumpToPage(_hexalignedList[1]);
            _controllerbot.jumpToPage(_hexalignedList[2]);


          },
            child: Container(
              height: 40,
              width: 40,
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
            ),),
        ],
          title: const Text('Rotate One Hexagram'),
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
                          _controllertopfirsttext.text = hexagramAdjectiveList[
                              _dropdowichingordervalue];
                          _controllertopsecondtext.text = hexagramSubjectList[
                              _dropdowichingordervalue];
                          _controllertopthirdtext.text = hexagramVerbList[
                              _dropdowichingordervalue];
                          _controllertopfourthtext.text = hexagramAdverbList[
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

                          _controllertopfirsttext.text = hexagramAdjectiveList[
                              fontHexNumbersList[_fontindex]];
                          _controllertopsecondtext.text = hexagramSubjectList[
                              fontHexNumbersList[_fontindex]];
                          _controllertopthirdtext.text = hexagramVerbList[
                              fontHexNumbersList[_fontindex]];
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
                            _controllertopfirsttext.text = hexagramAdjectiveList[
                                _textHexValueChange];
                            _controllertopsecondtext.text = hexagramSubjectList[
                                _textHexValueChange];
                            _controllertopthirdtext.text = hexagramVerbList[
                                _textHexValueChange];
                            _controllertopfourthtext.text = hexagramAdverbList[
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  controller: _controllertopfirsttext,
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
                  controller: _controllertopsecondtext,
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
                  controller: _controllertopthirdtext,
                  readOnly: true,
                )),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: hexagramAdverbList[1],
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
                        _carouselvalueindex = hexCarouselValueList.indexWhere(
                            (element) => element == _hexagramVal.toString());
                        _carouselvalueindex++;
                        _controllerhextext.text =
                            hexCarouselValueList[_carouselvalueindex];

                        _controllertopfirsttext.text = hexagramAdjectiveList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];
                        _controllertopsecondtext.text = hexagramSubjectList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];
                        _controllertopthirdtext.text = hexagramVerbList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];
                        _controllertopfourthtext.text = hexagramAdverbList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];

                         _controllerbottomfirsttext.text = hexNamesList[_currenttop];
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

                        _controllertopfirsttext.text = hexagramAdjectiveList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];
                        _controllertopsecondtext.text = hexagramSubjectList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];
                        _controllertopthirdtext.text = hexagramVerbList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];
                        _controllertopfourthtext.text = hexagramAdverbList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];

                        _controllerbottomsecondtext.text = hexNamesList[_currentmid];
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

                        _controllertopfirsttext.text = hexagramAdjectiveList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];
                        _controllertopsecondtext.text = hexagramSubjectList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];
                        _controllertopthirdtext.text = hexagramVerbList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];
                        _controllertopfourthtext.text = hexagramAdverbList[
                            int.parse(
                                hexCarouselValueList[_carouselvalueindex])];

                        _controllerbottomthirdtext.text = hexNamesList[_currentbot];
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
                          hintText: hexNamesList[0],
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
                          hintText: hexNamesList[0],
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
                          hintText: hexNamesList[0],
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
}
