import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finallyicanlearn/lists.dart';

// /allimages
class AllHexagrams extends StatelessWidget {
  const AllHexagrams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Items')),
      body: CarouselSlider.builder(
        options: CarouselOptions(
          aspectRatio: 0.5,
          enlargeCenterPage: false,
          viewportFraction: 1,
        ),
        itemCount: hexFullList.length,
        itemBuilder: (context, index, realIdx) {
          return Column(
            children: hexFullList.asMap().entries.map((idx) {
              return Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(hexFullList[idx.key], fit: BoxFit.cover),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

// /rotatehexwithlogic
class RotateHexagramWithLogic extends StatefulWidget {
  const RotateHexagramWithLogic({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateHexagramWithLogicState();
  }
}

class _RotateHexagramWithLogicState extends State<RotateHexagramWithLogic> {
  int _currenttop = 0;
  int _currentmid = 0;
  int _currentbot = 0;
  int hexagramVal = 0;
  //String chosenHex = '1';
  //String _chosenHex = '1';
  final CarouselController _controllertop = CarouselController();
  final CarouselController _controllermid = CarouselController();
  final CarouselController _controllerbot = CarouselController();
  final TextEditingController _hexTxt = TextEditingController();

  //var items = [for (var i = 1; i <= 64; i++) i];
  var dropdownvalue = hexagramslist[1];
  var dropdowichingvalue = orderiChingFontHexagrams[0];
  var dropdowichingordervalue = orderHexagramsWheel[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rotate One Hexagram')),
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        const Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          DropdownButton(
            value: dropdowichingordervalue,
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            items: orderHexagramsWheelList,
            onChanged: (String? dropdowichingordervalueChange) {
              setState(() {
                dropdowichingordervalue = dropdowichingordervalueChange!;
                switch (dropdowichingordervalueChange) {
                //Quarter of Mutation
                  case '1':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                  case '43':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                  case '14':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                  case '34':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                  case '9':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;
                  case '5':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;
                  case '26':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;
                  case '11':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;
                  case '10':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                  case '58':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                  case '38':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                  case '54':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                  case '61':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;
                  case '60':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;
                  case '41':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;
                  case '19':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;

                //Quarter of Initiation
                  case '13':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                  case '49':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                  case '30':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                  case '55':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                  case '37':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                  case '63':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                  case '22':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                  case '36':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                  case '25':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;
                  case '17':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;
                  case '21':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;
                  case '51':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;
                  case '42':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;
                  case '3':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;
                  case '27':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;
                  case '24':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;

                //Quarter of Duality
                  case '44':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                  case '28':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                  case '50':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                  case '32':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                  case '57':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                  case '48':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                  case '18':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                  case '46':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                  case '6':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                  case '47':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                  case '64':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                  case '40':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                  case '59':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;
                  case '29':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;
                  case '4':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;
                  case '7':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;

                //Quarter of Civilization
                  case '33':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                  case '31':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                  case '56':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                  case '62':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                  case '53':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                  case '39':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                  case '52':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                  case '15':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                  case '12':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                  case '45':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                  case '35':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                  case '16':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                  case '20':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                  case '8':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                  case '23':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                  case '2':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                  default:
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                }
              });
            },
          ),
          DropdownButton(
            value: dropdowichingvalue,
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            items: fontHexList,
            onChanged: (String? dropdowichingvalueChange) {
              setState(() {
                dropdowichingvalue = dropdowichingvalueChange!;
                switch (dropdowichingvalueChange) {
                //Quarter of Mutation
                  case 'a':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                //case '43':
                //case '44':
                  case 'b':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                //case '14':
                //case '13':
                  case 'c':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                //case '34':
                //case '10':
                  case 'd':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                //case '9':
                //case '9':
                  case 'e':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;
                //case '5':
                //case '14':
                  case 'f':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                //case '26':
                //case '43':
                  case 'g':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                //case '11':
                //case '33':
                  case 'h':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                //case '10':
                //case '25':
                  case 'i':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;
                //case '58':
                //case '61':
                  case 'j':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;
                //case '38':
                //case '26':
                  case 'k':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;
                //case '54':
                //case '34':
                  case 'l':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                //case '61':
                //case '6':
                  case 'm':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                //case '60':
                //case '37':
                  case 'n':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                //case '41':
                //case '38':
                  case 'o':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                //case '19':
                //case '5':
                  case 'p':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;

                //Quarter of Initiation
                //case '13':
                //case '57':
                  case 'q':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                //case '49':
                //case '30':
                  case 'r':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                //case '30':
                //case '58':
                  case 's':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                //case '55':
                //case '50':
                  case 't':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                //case '37':
                //case '49'':
                  case 'u':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                //case '63':
                //case '28':
                  case 'v':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                //case '22':
                //case '12':
                  case 'w':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                //case '36':
                //case '42':
                  case 'x':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;
                //case '25':
                //case '41':
                  case 'y':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;
                //case '17':
                //case '11':
                  case 'z':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;
                //case '21':
                //case '62':
                  case '1':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                //case '51':
                //case '45':
                  case '2':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                //case '42':
                //case '29':
                  case '3':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;
                //case '3':
                //case '39':
                  case '4':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                //case '27':
                //case '40':
                  case '5':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                //case '24':
                //case '24':
                  case '6':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;

                //Quarter of Duality
                //case '44':
                //case '7':
                  case '7':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;
                //case '28':
                //case '15':
                  case '8':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                //case '50':
                //case '16':
                  case '9':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                //case '32':
                //case '8':
                  case '0':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                //case '57':
                //case '23':
                  case '!':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                //case '48':
                //case '2':
                  case '@':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                //case '18':
                //case '59':
                  case 'A':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;
                //case '46':
                //case '22':
                  case 'B':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                //case '6':
                //case '54':
                  case 'C':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                //case '47':
                //case '53':
                  case 'D':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                //case '64':
                //case '21':
                  case 'E':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;
                //case '40':
                //case '60':
                  case 'F':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;
                //case '59':
                //case '18':
                  case 'G':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                //case '29':
                //case '55':
                  case 'H':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                //case '4':
                //case '56':
                  case 'I':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                //case '7':
                //case '17':
                  case 'J':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;

                //Quarter of Civilization
                //case '33':
                //case '32':
                  case 'K':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                //case '31':
                //case '31':
                  case 'L':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                //case '56':
                //case '47':
                  case 'M':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                //case '62':
                //case '48':
                  case 'N':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                //case '53':
                //case '63':
                  case 'O':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                //case '39':
                //case '64':
                  case 'P':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                //case '52':
                //case '20':
                  case 'Q':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                //case '15':
                //case '27':
                  case 'R':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;
                //case '12':
                //case '19':
                  case 'S':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;
                //case '45':
                //case '4':
                  case 'T':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;
                //case '35':
                //case '36':
                  case 'U':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                //case '16':
                //case '52':
                  case 'V':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                //case '20':
                //case '51':
                  case 'W':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;
                //case '8':
                //case '35':
                  case 'X':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                //case '23':
                //case '3':
                  case 'Y':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;
                //case '2':
                //case '46':
                  case 'Z':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                  default:
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                }
              });
            },
          ),
          DropdownButton(
            // Initial Value
            value: dropdownvalue,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            // Array list of items
            items: hexDropDownNumbersList,
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? dropdownvalueChange) {
              setState(() {
                dropdownvalue = dropdownvalueChange!;
                switch (dropdownvalueChange) {
                //Quarter of Mutation
                  case '1':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                  case '43':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                  case '14':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                  case '34':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                  case '9':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;
                  case '5':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;
                  case '26':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;
                  case '11':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(0);
                    break;
                  case '10':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                  case '58':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                  case '38':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                  case '54':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(0);
                    break;
                  case '61':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;
                  case '60':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;
                  case '41':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;
                  case '19':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(0);
                    break;

                //Quarter of Initiation
                  case '13':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                  case '49':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                  case '30':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                  case '55':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(1);
                    break;
                  case '37':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                  case '63':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                  case '22':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                  case '36':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(1);
                    break;
                  case '25':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;
                  case '17':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;
                  case '21':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;
                  case '51':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(1);
                    break;
                  case '42':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;
                  case '3':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;
                  case '27':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;
                  case '24':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(1);
                    break;

                //Quarter of Duality
                  case '44':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                  case '28':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                  case '50':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                  case '32':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(2);
                    break;
                  case '57':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                  case '48':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                  case '18':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                  case '46':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(2);
                    break;
                  case '6':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                  case '47':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                  case '64':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                  case '40':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(2);
                    break;
                  case '59':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;
                  case '29':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;
                  case '4':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;
                  case '7':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(2);
                    break;

                //Quarter of Civilization
                  case '33':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                  case '31':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                  case '56':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                  case '62':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(3);
                    break;
                  case '53':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                  case '39':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                  case '52':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                  case '15':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(1);
                    _controllerbot.animateToPage(3);
                    break;
                  case '12':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                  case '45':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                  case '35':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                  case '16':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(2);
                    _controllerbot.animateToPage(3);
                    break;
                  case '20':
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                  case '8':
                    _controllertop.animateToPage(1);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                  case '23':
                    _controllertop.animateToPage(2);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                  case '2':
                    _controllertop.animateToPage(3);
                    _controllermid.animateToPage(3);
                    _controllerbot.animateToPage(3);
                    break;
                  default:
                    _controllertop.animateToPage(0);
                    _controllermid.animateToPage(0);
                    _controllerbot.animateToPage(0);
                    break;
                }
              });
            },
          ),
        ]),
        TextField(
          decoration: const InputDecoration(
              hintText: '1', hintStyle: TextStyle(color: Colors.grey)),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
          controller: _hexTxt,
          readOnly: true,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
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
                    hexagramVal = ((_currenttop + 1) * 100 +
                        (_currentmid + 1) * 10 +
                        (_currentbot + 1));
                    switch (hexagramVal) {
                    //Quarter of Mutation
                      case 111:
                        _hexTxt.text = '1';
                        break;
                      case 211:
                        _hexTxt.text = '43';
                        break;
                      case 311:
                        _hexTxt.text = '14';
                        break;
                      case 411:
                        _hexTxt.text = '34';
                        break;
                      case 121:
                        _hexTxt.text = '9';
                        break;
                      case 221:
                        _hexTxt.text = '5';
                        break;
                      case 321:
                        _hexTxt.text = '26';
                        break;
                      case 421:
                        _hexTxt.text = '11';
                        break;
                      case 131:
                        _hexTxt.text = '10';
                        break;
                      case 231:
                        _hexTxt.text = '58';
                        break;
                      case 331:
                        _hexTxt.text = '38';
                        break;
                      case 431:
                        _hexTxt.text = '54';
                        break;
                      case 141:
                        _hexTxt.text = '61';
                        break;
                      case 241:
                        _hexTxt.text = '60';
                        break;
                      case 341:
                        _hexTxt.text = '41';
                        break;
                      case 441:
                        _hexTxt.text = '19';
                        break;
                    //Quarter of Initiation
                      case 112:
                        _hexTxt.text = '13';
                        break;
                      case 212:
                        _hexTxt.text = '49';
                        break;
                      case 312:
                        _hexTxt.text = '30';
                        break;
                      case 412:
                        _hexTxt.text = '55';
                        break;
                      case 122:
                        _hexTxt.text = '37';
                        break;
                      case 222:
                        _hexTxt.text = '63';
                        break;
                      case 322:
                        _hexTxt.text = '22';
                        break;
                      case 422:
                        _hexTxt.text = '36';
                        break;
                      case 132:
                        _hexTxt.text = '25';
                        break;
                      case 232:
                        _hexTxt.text = '17';
                        break;
                      case 332:
                        _hexTxt.text = '21';
                        break;
                      case 432:
                        _hexTxt.text = '51';
                        break;
                      case 142:
                        _hexTxt.text = '42';
                        break;
                      case 242:
                        _hexTxt.text = '3';
                        break;
                      case 342:
                        _hexTxt.text = '27';
                        break;
                      case 442:
                        _hexTxt.text = '24';
                        break;

                    //Quarter of Duality
                      case 113:
                        _hexTxt.text = '44';
                        break;
                      case 213:
                        _hexTxt.text = '28';
                        break;
                      case 313:
                        _hexTxt.text = '50';
                        break;
                      case 413:
                        _hexTxt.text = '32';
                        break;
                      case 123:
                        _hexTxt.text = '57';
                        break;
                      case 223:
                        _hexTxt.text = '48';
                        break;
                      case 323:
                        _hexTxt.text = '18';
                        break;
                      case 423:
                        _hexTxt.text = '46';
                        break;
                      case 133:
                        _hexTxt.text = '6';
                        break;
                      case 233:
                        _hexTxt.text = '47';
                        break;
                      case 333:
                        _hexTxt.text = '64';
                        break;
                      case 433:
                        _hexTxt.text = '40';
                        break;
                      case 143:
                        _hexTxt.text = '59';
                        break;
                      case 243:
                        _hexTxt.text = '29';
                        break;
                      case 343:
                        _hexTxt.text = '4';
                        break;
                      case 443:
                        _hexTxt.text = '7';
                        break;
                    //Quarter of Civilization
                      case 114:
                        _hexTxt.text = '33';
                        break;
                      case 214:
                        _hexTxt.text = '31';
                        break;
                      case 314:
                        _hexTxt.text = '56';
                        break;
                      case 414:
                        _hexTxt.text = '62';
                        break;
                      case 124:
                        _hexTxt.text = '53';
                        break;
                      case 224:
                        _hexTxt.text = '39';
                        break;
                      case 324:
                        _hexTxt.text = '52';
                        break;
                      case 424:
                        _hexTxt.text = '15';
                        break;
                      case 134:
                        _hexTxt.text = '12';
                        break;
                      case 234:
                        _hexTxt.text = '45';
                        break;
                      case 334:
                        _hexTxt.text = '35';
                        break;
                      case 434:
                        _hexTxt.text = '16';
                        break;
                      case 144:
                        _hexTxt.text = '20';
                        break;
                      case 244:
                        _hexTxt.text = '8';
                        break;
                      case 344:
                        _hexTxt.text = '23';
                        break;
                      case 444:
                        _hexTxt.text = '2';
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
              onTap: () => _controllertop.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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

                    hexagramVal = ((_currenttop + 1) * 100 +
                        (_currentmid + 1) * 10 +
                        (_currentbot + 1));
                    switch (hexagramVal) {
                    //Quarter of Mutation
                      case 111:
                        _hexTxt.text = '1';
                        break;
                      case 211:
                        _hexTxt.text = '43';
                        break;
                      case 311:
                        _hexTxt.text = '14';
                        break;
                      case 411:
                        _hexTxt.text = '34';
                        break;
                      case 121:
                        _hexTxt.text = '9';
                        break;
                      case 221:
                        _hexTxt.text = '5';
                        break;
                      case 321:
                        _hexTxt.text = '26';
                        break;
                      case 421:
                        _hexTxt.text = '11';
                        break;
                      case 131:
                        _hexTxt.text = '10';
                        break;
                      case 231:
                        _hexTxt.text = '58';
                        break;
                      case 331:
                        _hexTxt.text = '38';
                        break;
                      case 431:
                        _hexTxt.text = '54';
                        break;
                      case 141:
                        _hexTxt.text = '61';
                        break;
                      case 241:
                        _hexTxt.text = '60';
                        break;
                      case 341:
                        _hexTxt.text = '41';
                        break;
                      case 441:
                        _hexTxt.text = '19';
                        break;
                    //Quarter of Initiation
                      case 112:
                        _hexTxt.text = '13';
                        break;
                      case 212:
                        _hexTxt.text = '49';
                        break;
                      case 312:
                        _hexTxt.text = '30';
                        break;
                      case 412:
                        _hexTxt.text = '55';
                        break;
                      case 122:
                        _hexTxt.text = '37';
                        break;
                      case 222:
                        _hexTxt.text = '63';
                        break;
                      case 322:
                        _hexTxt.text = '22';
                        break;
                      case 422:
                        _hexTxt.text = '36';
                        break;
                      case 132:
                        _hexTxt.text = '25';
                        break;
                      case 232:
                        _hexTxt.text = '17';
                        break;
                      case 332:
                        _hexTxt.text = '21';
                        break;
                      case 432:
                        _hexTxt.text = '51';
                        break;
                      case 142:
                        _hexTxt.text = '42';
                        break;
                      case 242:
                        _hexTxt.text = '3';
                        break;
                      case 342:
                        _hexTxt.text = '27';
                        break;
                      case 442:
                        _hexTxt.text = '24';
                        break;

                    //Quarter of Duality
                      case 113:
                        _hexTxt.text = '44';
                        break;
                      case 213:
                        _hexTxt.text = '28';
                        break;
                      case 313:
                        _hexTxt.text = '50';
                        break;
                      case 413:
                        _hexTxt.text = '32';
                        break;
                      case 123:
                        _hexTxt.text = '57';
                        break;
                      case 223:
                        _hexTxt.text = '48';
                        break;
                      case 323:
                        _hexTxt.text = '18';
                        break;
                      case 423:
                        _hexTxt.text = '46';
                        break;
                      case 133:
                        _hexTxt.text = '6';
                        break;
                      case 233:
                        _hexTxt.text = '47';
                        break;
                      case 333:
                        _hexTxt.text = '64';
                        break;
                      case 433:
                        _hexTxt.text = '40';
                        break;
                      case 143:
                        _hexTxt.text = '59';
                        break;
                      case 243:
                        _hexTxt.text = '29';
                        break;
                      case 343:
                        _hexTxt.text = '4';
                        break;
                      case 443:
                        _hexTxt.text = '7';
                        break;
                    //Quarter of Civilization
                      case 114:
                        _hexTxt.text = '33';
                        break;
                      case 214:
                        _hexTxt.text = '31';
                        break;
                      case 314:
                        _hexTxt.text = '56';
                        break;
                      case 414:
                        _hexTxt.text = '62';
                        break;
                      case 124:
                        _hexTxt.text = '53';
                        break;
                      case 224:
                        _hexTxt.text = '39';
                        break;
                      case 324:
                        _hexTxt.text = '52';
                        break;
                      case 424:
                        _hexTxt.text = '15';
                        break;
                      case 134:
                        _hexTxt.text = '12';
                        break;
                      case 234:
                        _hexTxt.text = '45';
                        break;
                      case 334:
                        _hexTxt.text = '35';
                        break;
                      case 434:
                        _hexTxt.text = '16';
                        break;
                      case 144:
                        _hexTxt.text = '20';
                        break;
                      case 244:
                        _hexTxt.text = '8';
                        break;
                      case 344:
                        _hexTxt.text = '23';
                        break;
                      case 444:
                        _hexTxt.text = '2';
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
              onTap: () => _controllermid.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
                    hexagramVal = ((_currenttop + 1) * 100 +
                        (_currentmid + 1) * 10 +
                        (_currentbot + 1));
                    switch (hexagramVal) {
                    //Quarter of Mutation
                      case 111:
                        _hexTxt.text = '1';
                        break;
                      case 211:
                        _hexTxt.text = '43';
                        break;
                      case 311:
                        _hexTxt.text = '14';
                        break;
                      case 411:
                        _hexTxt.text = '34';
                        break;
                      case 121:
                        _hexTxt.text = '9';
                        break;
                      case 221:
                        _hexTxt.text = '5';
                        break;
                      case 321:
                        _hexTxt.text = '26';
                        break;
                      case 421:
                        _hexTxt.text = '11';
                        break;
                      case 131:
                        _hexTxt.text = '10';
                        break;
                      case 231:
                        _hexTxt.text = '58';
                        break;
                      case 331:
                        _hexTxt.text = '38';
                        break;
                      case 431:
                        _hexTxt.text = '54';
                        break;
                      case 141:
                        _hexTxt.text = '61';
                        break;
                      case 241:
                        _hexTxt.text = '60';
                        break;
                      case 341:
                        _hexTxt.text = '41';
                        break;
                      case 441:
                        _hexTxt.text = '19';
                        break;
                    //Quarter of Initiation
                      case 112:
                        _hexTxt.text = '13';
                        break;
                      case 212:
                        _hexTxt.text = '49';
                        break;
                      case 312:
                        _hexTxt.text = '30';
                        break;
                      case 412:
                        _hexTxt.text = '55';
                        break;
                      case 122:
                        _hexTxt.text = '37';
                        break;
                      case 222:
                        _hexTxt.text = '63';
                        break;
                      case 322:
                        _hexTxt.text = '22';
                        break;
                      case 422:
                        _hexTxt.text = '36';
                        break;
                      case 132:
                        _hexTxt.text = '25';
                        break;
                      case 232:
                        _hexTxt.text = '17';
                        break;
                      case 332:
                        _hexTxt.text = '21';
                        break;
                      case 432:
                        _hexTxt.text = '51';
                        break;
                      case 142:
                        _hexTxt.text = '42';
                        break;
                      case 242:
                        _hexTxt.text = '3';
                        break;
                      case 342:
                        _hexTxt.text = '27';
                        break;
                      case 442:
                        _hexTxt.text = '24';
                        break;

                    //Quarter of Duality
                      case 113:
                        _hexTxt.text = '44';
                        break;
                      case 213:
                        _hexTxt.text = '28';
                        break;
                      case 313:
                        _hexTxt.text = '50';
                        break;
                      case 413:
                        _hexTxt.text = '32';
                        break;
                      case 123:
                        _hexTxt.text = '57';
                        break;
                      case 223:
                        _hexTxt.text = '48';
                        break;
                      case 323:
                        _hexTxt.text = '18';
                        break;
                      case 423:
                        _hexTxt.text = '46';
                        break;
                      case 133:
                        _hexTxt.text = '6';
                        break;
                      case 233:
                        _hexTxt.text = '47';
                        break;
                      case 333:
                        _hexTxt.text = '64';
                        break;
                      case 433:
                        _hexTxt.text = '40';
                        break;
                      case 143:
                        _hexTxt.text = '59';
                        break;
                      case 243:
                        _hexTxt.text = '29';
                        break;
                      case 343:
                        _hexTxt.text = '4';
                        break;
                      case 443:
                        _hexTxt.text = '7';
                        break;
                    //Quarter of Civilization
                      case 114:
                        _hexTxt.text = '33';
                        break;
                      case 214:
                        _hexTxt.text = '31';
                        break;
                      case 314:
                        _hexTxt.text = '56';
                        break;
                      case 414:
                        _hexTxt.text = '62';
                        break;
                      case 124:
                        _hexTxt.text = '53';
                        break;
                      case 224:
                        _hexTxt.text = '39';
                        break;
                      case 324:
                        _hexTxt.text = '52';
                        break;
                      case 424:
                        _hexTxt.text = '15';
                        break;
                      case 134:
                        _hexTxt.text = '12';
                        break;
                      case 234:
                        _hexTxt.text = '45';
                        break;
                      case 334:
                        _hexTxt.text = '35';
                        break;
                      case 434:
                        _hexTxt.text = '16';
                        break;
                      case 144:
                        _hexTxt.text = '20';
                        break;
                      case 244:
                        _hexTxt.text = '8';
                        break;
                      case 344:
                        _hexTxt.text = '23';
                        break;
                      case 444:
                        _hexTxt.text = '2';
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
              onTap: () => _controllerbot.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
      ]),
    );
  }
}

// /indicatorNoLogic
class RotateHexagramNoLogic extends StatefulWidget {
  const RotateHexagramNoLogic({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateHexagramNoLogicState();
  }
}

class _RotateHexagramNoLogicState extends State<RotateHexagramNoLogic> {
  //int _current = 0;
  int _currenttop = 0;
  int _currentmid = 0;
  int _currentbot = 0;
  final CarouselController _controllertop = CarouselController();
  final CarouselController _controllermid = CarouselController();
  final CarouselController _controllerbot = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rotate Hexagrams No Choice')),
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: allItemsSliders,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: hexFullList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controllertop.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
            items: allItemsSliders,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: hexFullList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controllermid.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
            items: allItemsSliders,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: hexFullList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controllerbot.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
      ]),
    );
  }
}

// /indicatorNoLogic
class RotateMultipleHexagrams extends StatefulWidget {
  const RotateMultipleHexagrams({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateMultipleHexagramsState();
  }
}

class _RotateMultipleHexagramsState extends State<RotateMultipleHexagrams> {
  final CarouselController _controllerlefttop = CarouselController();
  final CarouselController _controllerleftmid = CarouselController();
  final CarouselController _controllerleftbot = CarouselController();

  final CarouselController _controllercenterlefttop = CarouselController();
  final CarouselController _controllercenterleftmid = CarouselController();
  final CarouselController _controllercenterleftbot = CarouselController();

  final CarouselController _controllercenterrighttop = CarouselController();
  final CarouselController _controllercenterrightmid = CarouselController();
  final CarouselController _controllercenterrightbot = CarouselController();

  final CarouselController _controllerrighttop = CarouselController();
  final CarouselController _controllerrightmid = CarouselController();
  final CarouselController _controllerrightbot = CarouselController();

  final TextEditingController _controllertextlefttop = TextEditingController();
  final TextEditingController _controllertextleftbot = TextEditingController();
  final TextEditingController _controllertextcenterlefttop =
  TextEditingController();
  final TextEditingController _controllertextcenterleftbot =
  TextEditingController();
  final TextEditingController _controllertextcenterrighttop =
  TextEditingController();
  final TextEditingController _controllertextcenterrightbot =
  TextEditingController();
  final TextEditingController _controllertextrighttop = TextEditingController();
  final TextEditingController _controllertextrightbot = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment with Hexagrams'),
        actions: [
          IconButton(
              icon: const Icon(Icons.color_lens),
              onPressed: () {
                _controllerlefttop.animateToPage(0);
                _controllerleftmid.animateToPage(0);
                _controllerleftbot.animateToPage(0);

                _controllercenterlefttop.animateToPage(5);
                _controllercenterleftmid.animateToPage(5);
                _controllercenterleftbot.animateToPage(5);

                _controllercenterrighttop.animateToPage(10);
                _controllercenterrightmid.animateToPage(10);
                _controllercenterrightbot.animateToPage(10);

                _controllerrighttop.animateToPage(15);
                _controllerrightmid.animateToPage(15);
                _controllerrightbot.animateToPage(15);

                _controllertextlefttop.text = "Complex";
                _controllertextleftbot.text = "Mind";
                _controllertextcenterlefttop.text = "Simple";
                _controllertextcenterleftbot.text = "Mind";
                _controllertextcenterrighttop.text = "Breath";
                _controllertextcenterrightbot.text = "Body";
                _controllertextrighttop.text = "Silence";
                _controllertextrightbot.text = "Body";
              }),
          IconButton(
              icon: const Icon(Icons.color_lens_outlined),
              onPressed: () {
                _controllerlefttop.animateToPage(0);
                _controllerleftmid.animateToPage(0);
                _controllerleftbot.animateToPage(0);

                _controllercenterlefttop.animateToPage(0);
                _controllercenterleftmid.animateToPage(0);
                _controllercenterleftbot.animateToPage(0);

                _controllercenterrighttop.animateToPage(0);
                _controllercenterrightmid.animateToPage(0);
                _controllercenterrightbot.animateToPage(0);

                _controllerrighttop.animateToPage(0);
                _controllerrightmid.animateToPage(0);
                _controllerrightbot.animateToPage(0);

                _controllertextlefttop.text = "";
                _controllertextleftbot.text = "";
                _controllertextcenterlefttop.text = "";
                _controllertextcenterleftbot.text = "";
                _controllertextcenterrighttop.text = "";
                _controllertextcenterrightbot.text = "";
                _controllertextrighttop.text = "";
                _controllertextrightbot.text = "";
              }),
          //IconButton(
          // icon: const Icon(Icons.fast_forward),
          // onPressed: () {
          //   _controllerlefttop.nextPage();
          //   _controllerleftmid.nextPage();
          //   _controllerleftbot.nextPage();

          //    _controllercenterlefttop.nextPage();
          //   _controllercenterleftmid.nextPage();
          //   _controllercenterleftbot.nextPage();

          //  _controllercenterrighttop.nextPage();
          //  _controllercenterrightmid.nextPage();
          //   _controllercenterrightbot.nextPage();

          //  _controllerrighttop.nextPage();
          //   _controllerrightmid.nextPage();
          //  _controllerrightbot.nextPage();

          //_controllertextlefttop.text = "";
          //_controllertextleftbot.text = "";
          // _controllertextcenterlefttop.text = "";
          // _controllertextcenterleftbot.text = "";
          // _controllertextcenterrighttop.text = "";
          // _controllertextcenterrightbot.text = "";
          // _controllertextrighttop.text = "";
          // _controllertextrightbot.text = "";

          //}),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Row(children: [
        // Left Column
        Flexible(
          flex: 25,
          child: Column(children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: 'You', hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextlefttop,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Are',
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextleftbot,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
              // keyboardType: TextInputType.number,
            ),
            Expanded(
              child: CarouselSlider(
                //idonotknow 727
                items: allItemsSliders,
                carouselController: _controllerlefttop,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indextopleft, reason) {
                      setState(() {
                        //_currenttopleft = indextopleft;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerlefttop.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.blue),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerlefttop.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllerleftmid,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexmidleft, reason) {
                      setState(() {
                        //_currentmidleft = indexmidleft;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerleftmid.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.orange),
                  ),
                ),
                Flexible(
                  child: IconButton(
                      onPressed: () => _controllerleftmid.nextPage(),
                      icon: const Icon(Icons.arrow_forward,
                          color: Colors.orange)),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllerleftbot,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexbotleft, reason) {
                      setState(() {
                        //_currentbotleft = indexbotleft;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerleftbot.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.red),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerleftbot.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.red),
                  ),
                ),
              ],
            ),
          ]),
        ),
        // Center Column
        Flexible(
          flex: 25,
          child: Column(children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: 'A',
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextcenterlefttop,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Complex',
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextcenterleftbot,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
              // keyboardType: TextInputType.number,
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterlefttop,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indextopcenter, reason) {
                      setState(() {
                        //_currenttopcenter = indextopcenter;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterlefttop.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.blue),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterlefttop.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterleftmid,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexmidcenter, reason) {
                      setState(() {
                        //_currentmidcenter = indexmidcenter;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterleftmid.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.orange),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterleftmid.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.orange),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterleftbot,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexbotcenter, reason) {
                      setState(() {
                        //_currentbotcenter = indexbotcenter;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterleftbot.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.red),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterleftbot.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.red),
                  ),
                ),
              ],
            ),
          ]),
        ),
        // Right Column
        Flexible(
          flex: 25,
          child: Column(children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Mesculine',
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextcenterrighttop,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Mind',
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextcenterrightbot,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
              //keyboardType: TextInputType.number,
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterrighttop,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indextopright, reason) {
                      setState(() {
                        //_currenttopright = indextopright;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterrighttop.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.blue),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterrighttop.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterrightmid,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexmidright, reason) {
                      setState(() {
                        //_currentmidright = indexmidright;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterrightmid.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.orange),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllercenterrightmid.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.orange),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllercenterrightbot,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexbotright, reason) {
                      setState(() {
                        //_currentbotright = indexbotright;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                      onPressed: () => _controllercenterrightbot.previousPage(),
                      icon: const Icon(Icons.arrow_back, color: Colors.red)),
                ),
                Flexible(
                  child: IconButton(
                      onPressed: () => _controllercenterrightbot.nextPage(),
                      icon: const Icon(Icons.arrow_forward, color: Colors.red)),
                ),
              ],
            ),
          ]),
        ),
        // Right Column New
        Flexible(
          flex: 25,
          child: Column(children: [
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Mind', hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextrighttop,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
              //keyboardType: TextInputType.number,
              //inputFormatters: <TextInputFormatter>[
              //FilteringTextInputFormatter.digitsOnly
              //],
            ),
            TextField(
              decoration: const InputDecoration(
                  hintText: 'Complex',
                  hintStyle: TextStyle(color: Colors.grey)),
              controller: _controllertextrightbot,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
              ),
              //controller: _txtleftop,
              readOnly: false,
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllerrighttop,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indextoprightnew, reason) {
                      setState(() {
                        //_currenttoprightnew = indextoprightnew;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerrighttop.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.blue),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerrighttop.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllerrightmid,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexmidrightnew, reason) {
                      setState(() {
                        //_currentmidrightnew = indexmidrightnew;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerrightmid.previousPage(),
                    icon: const Icon(Icons.arrow_back, color: Colors.orange),
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () => _controllerrightmid.nextPage(),
                    icon: const Icon(Icons.arrow_forward, color: Colors.orange),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                items: allItemsSliders,
                carouselController: _controllerrightbot,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexbotrightnew, reason) {
                      setState(() {
                        //_currentbotrightnew = indexbotrightnew;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                      onPressed: () => _controllerrightbot.previousPage(),
                      icon: const Icon(Icons.arrow_back, color: Colors.red)),
                ),
                Flexible(
                  child: IconButton(
                      onPressed: () => _controllerrightbot.nextPage(),
                      icon: const Icon(Icons.arrow_forward, color: Colors.red)),
                ),
              ],
            ),
          ]),
        ),
      ]),

    );
  }
}
