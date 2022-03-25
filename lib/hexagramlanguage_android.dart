import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finallyicanlearn/lists.dart';

// /rotatehexwithlogic
class RotateHexLanguage extends StatefulWidget {
  const RotateHexLanguage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateHexLanguageState();
  }
}

class _RotateHexLanguageState extends State<RotateHexLanguage> {
  int _currentfirsttop = 0;
  int _currentfirstmid = 0;
  int _currentfirstbot = 0;

  int _currentsecondtop = 0;
  int _currentsecondmid = 0;
  int _currentsecondbot = 0;

  int _currentthirdtop = 0;
  int _currentthirdmid = 0;
  int _currentthirdbot = 0;

  int _currentfourthtop = 0;
  int _currentfourthmid = 0;
  int _currentfourthbot = 0;

  int hexagramVal = 0;

  final CarouselController _controllerfirsttop = CarouselController();
  final CarouselController _controllerfirstmid = CarouselController();
  final CarouselController _controllerfirstbot = CarouselController();
  final TextEditingController _controllerfirsttoptxt = TextEditingController();
  final TextEditingController _controllerfirstbottxt = TextEditingController();

  final CarouselController _controllersecondtop = CarouselController();
  final CarouselController _controllersecondmid = CarouselController();
  final CarouselController _controllersecondbot = CarouselController();
  final TextEditingController _controllersecondtoptxt = TextEditingController();
  final TextEditingController _controllersecondbottxt = TextEditingController();

  final CarouselController _controllerthirdtop = CarouselController();
  final CarouselController _controllerthirdmid = CarouselController();
  final CarouselController _controllerthirdbot = CarouselController();
  final TextEditingController _controllerthirdtoptxt = TextEditingController();
  final TextEditingController _controllerthirdbottxt = TextEditingController();

  final CarouselController _controllerfourthtop = CarouselController();
  final CarouselController _controllerfourthmid = CarouselController();
  final CarouselController _controllerfourthbot = CarouselController();
  final TextEditingController _controllerfourthtoptxt = TextEditingController();
  final TextEditingController _controllerfourthbottxt = TextEditingController();

  //var items = [for (var i = 1; i <= 64; i++) i];
  var dropdownfirstvalue = hexagramslist[1];
  var dropdownfirstichingvalue = orderiChingFontHexagrams[0];
  var dropdownfirstichingordervalue = orderHexagramsWheel[0];

  var dropdownsecondvalue = hexagramslist[1];
  var dropdownsecondichingvalue = orderiChingFontHexagrams[0];
  var dropdownsecondichingordervalue = orderHexagramsWheel[0];

  var dropdownthirdvalue = hexagramslist[1];
  var dropdownthirdichingvalue = orderiChingFontHexagrams[0];
  var dropdownthirdichingordervalue = orderHexagramsWheel[0];

  var dropdownfourthvalue = hexagramslist[1];
  var dropdownfourthichingvalue = orderiChingFontHexagrams[0];
  var dropdownfourthichingordervalue = orderHexagramsWheel[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Hexagram Language'),
          backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.grey[100],
      body: Row(
        children: [
          Expanded(
              child: Column(children: [
                const Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  DropdownButton(
                    value: dropdownfirstichingordervalue,
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: orderHexagramsWheelList,
                    onChanged: (String? dropdownfirstichingordervalueChange) {
                      setState(() {
                        dropdownfirstichingordervalue =
                        dropdownfirstichingordervalueChange!;
                        switch (dropdownfirstichingordervalueChange) {
                        //Quarter of Mutation
                          case '1':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '43':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '14':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '34':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '9':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '5':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '26':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '11':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '10':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '58':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '38':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '54':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '61':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '60':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '41':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '19':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                          case '13':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '49':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '30':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '55':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '37':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '63':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '22':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '36':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '25':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '17':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '21':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '51':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '42':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '3':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '27':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '24':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                          case '44':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '28':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '50':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '32':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '57':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '48':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '18':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '46':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '6':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '47':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '64':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '40':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '59':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '29':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '4':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '7':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;

                        //Quarter of Civilization
                          case '33':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '31':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '56':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '62':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '53':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '39':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '52':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '15':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '12':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '45':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '35':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '16':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '20':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '8':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '23':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '2':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          default:
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        }
                      });
                    },
                  ),
                  DropdownButton(
                    value: dropdownfirstichingvalue,
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: fontHexList,
                    onChanged: (String? dropdownfirstichingvalueChange) {
                      setState(() {
                        dropdownfirstichingvalue = dropdownfirstichingvalueChange!;
                        switch (dropdownfirstichingvalueChange) {
                        //Quarter of Mutation
                          case 'a':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '43':
                        //case '44':
                          case 'b':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '14':
                        //case '13':
                          case 'c':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '34':
                        //case '10':
                          case 'd':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '9':
                        //case '9':
                          case 'e':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '5':
                        //case '14':
                          case 'f':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '26':
                        //case '43':
                          case 'g':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '11':
                        //case '33':
                          case 'h':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '10':
                        //case '25':
                          case 'i':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '58':
                        //case '61':
                          case 'j':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '38':
                        //case '26':
                          case 'k':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '54':
                        //case '34':
                          case 'l':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '61':
                        //case '6':
                          case 'm':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '60':
                        //case '37':
                          case 'n':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '41':
                        //case '38':
                          case 'o':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '19':
                        //case '5':
                          case 'p':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                        //case '13':
                        //case '57':
                          case 'q':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '49':
                        //case '30':
                          case 'r':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '30':
                        //case '58':
                          case 's':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '55':
                        //case '50':
                          case 't':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '37':
                        //case '49'':
                          case 'u':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '63':
                        //case '28':
                          case 'v':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '22':
                        //case '12':
                          case 'w':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '36':
                        //case '42':
                          case 'x':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '25':
                        //case '41':
                          case 'y':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '17':
                        //case '11':
                          case 'z':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '21':
                        //case '62':
                          case '1':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '51':
                        //case '45':
                          case '2':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '42':
                        //case '29':
                          case '3':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '3':
                        //case '39':
                          case '4':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '27':
                        //case '40':
                          case '5':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '24':
                        //case '24':
                          case '6':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                        //case '44':
                        //case '7':
                          case '7':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '28':
                        //case '15':
                          case '8':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '50':
                        //case '16':
                          case '9':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '32':
                        //case '8':
                          case '0':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '57':
                        //case '23':
                          case '!':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '48':
                        //case '2':
                          case '@':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '18':
                        //case '59':
                          case 'A':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '46':
                        //case '22':
                          case 'B':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '6':
                        //case '54':
                          case 'C':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '47':
                        //case '53':
                          case 'D':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '64':
                        //case '21':
                          case 'E':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '40':
                        //case '60':
                          case 'F':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '59':
                        //case '18':
                          case 'G':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '29':
                        //case '55':
                          case 'H':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '4':
                        //case '56':
                          case 'I':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '7':
                        //case '17':
                          case 'J':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;

                        //Quarter of Civilization
                        //case '33':
                        //case '32':
                          case 'K':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '31':
                        //case '31':
                          case 'L':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '56':
                        //case '47':
                          case 'M':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '62':
                        //case '48':
                          case 'N':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '53':
                        //case '63':
                          case 'O':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '39':
                        //case '64':
                          case 'P':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '52':
                        //case '20':
                          case 'Q':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '15':
                        //case '27':
                          case 'R':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '12':
                        //case '19':
                          case 'S':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        //case '45':
                        //case '4':
                          case 'T':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;
                        //case '35':
                        //case '36':
                          case 'U':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '16':
                        //case '52':
                          case 'V':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '20':
                        //case '51':
                          case 'W':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '8':
                        //case '35':
                          case 'X':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                        //case '23':
                        //case '3':
                          case 'Y':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;
                        //case '2':
                        //case '46':
                          case 'Z':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          default:
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                        }
                      });
                    },
                  ),
                  DropdownButton(
                    // Initial Value
                    value: dropdownfirstvalue,
                    // Down Arrow Icon
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: hexDropDownNumbersList,
                    onChanged: (String? dropdownfirstvalueChange) {
                      setState(() {
                        dropdownfirstvalue = dropdownfirstvalueChange!;
                        switch (dropdownfirstvalueChange) {
                        //Quarter of Mutation
                          case '1':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '43':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '14':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '34':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '9':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '5':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '26':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '11':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '10':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '58':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '38':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '54':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '61':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '60':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '41':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;
                          case '19':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                          case '13':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '49':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '30':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '55':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '37':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '63':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '22':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '36':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '25':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '17':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '21':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '51':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '42':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '3':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '27':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;
                          case '24':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                          case '44':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '28':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '50':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '32':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '57':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '48':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '18':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '46':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '6':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '47':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '64':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '40':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '59':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '29':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '4':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;
                          case '7':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(2);
                            break;

                        //Quarter of Civilization
                          case '33':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '31':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '56':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '62':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '53':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '39':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '52':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '15':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(1);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '12':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '45':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '35':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '16':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(2);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '20':
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '8':
                            _controllerfirsttop.animateToPage(1);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '23':
                            _controllerfirsttop.animateToPage(2);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          case '2':
                            _controllerfirsttop.animateToPage(3);
                            _controllerfirstmid.animateToPage(3);
                            _controllerfirstbot.animateToPage(3);
                            break;
                          default:
                            _controllerfirsttop.animateToPage(0);
                            _controllerfirstmid.animateToPage(0);
                            _controllerfirstbot.animateToPage(0);
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
                  controller: _controllerfirsttoptxt,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Creative',
                      hintStyle: TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllerfirstbottxt,
                  readOnly: true,
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerfirsttop,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexfirsttop, reason) {
                          setState(() {
                            _currentfirsttop = indexfirsttop;
                            hexagramVal = ((_currentfirsttop + 1) * 100 +
                                (_currentfirstmid + 1) * 10 +
                                (_currentfirstbot + 1));
                            switch (hexagramVal) {
                            //Quarter of Mutation
                              case 111:
                                _controllerfirsttoptxt.text = '1';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[1];
                                break;
                              case 211:
                                _controllerfirsttoptxt.text = '43';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[43];
                                break;
                              case 311:
                                _controllerfirsttoptxt.text = '14';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[14];
                                break;
                              case 411:
                                _controllerfirsttoptxt.text = '34';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[34];
                                break;
                              case 121:
                                _controllerfirsttoptxt.text = '9';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[9];
                                break;
                              case 221:
                                _controllerfirsttoptxt.text = '5';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[5];
                                break;
                              case 321:
                                _controllerfirsttoptxt.text = '26';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[26];
                                break;
                              case 421:
                                _controllerfirsttoptxt.text = '11';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[11];
                                break;
                              case 131:
                                _controllerfirsttoptxt.text = '10';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[10];
                                break;
                              case 231:
                                _controllerfirsttoptxt.text = '58';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[58];
                                break;
                              case 331:
                                _controllerfirsttoptxt.text = '38';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[38];
                                break;
                              case 431:
                                _controllerfirsttoptxt.text = '54';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[54];
                                break;
                              case 141:
                                _controllerfirsttoptxt.text = '61';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[61];
                                break;
                              case 241:
                                _controllerfirsttoptxt.text = '60';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[60];
                                break;
                              case 341:
                                _controllerfirsttoptxt.text = '41';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[41];
                                break;
                              case 441:
                                _controllerfirsttoptxt.text = '19';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllerfirsttoptxt.text = '13';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[13];
                                break;
                              case 212:
                                _controllerfirsttoptxt.text = '49';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[49];
                                break;
                              case 312:
                                _controllerfirsttoptxt.text = '30';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[30];
                                break;
                              case 412:
                                _controllerfirsttoptxt.text = '55';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[55];
                                break;
                              case 122:
                                _controllerfirsttoptxt.text = '37';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[37];
                                break;
                              case 222:
                                _controllerfirsttoptxt.text = '63';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[63];
                                break;
                              case 322:
                                _controllerfirsttoptxt.text = '22';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[22];
                                break;
                              case 422:
                                _controllerfirsttoptxt.text = '36';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[36];
                                break;
                              case 132:
                                _controllerfirsttoptxt.text = '25';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[25];
                                break;
                              case 232:
                                _controllerfirsttoptxt.text = '17';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[17];
                                break;
                              case 332:
                                _controllerfirsttoptxt.text = '21';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[21];
                                break;
                              case 432:
                                _controllerfirsttoptxt.text = '51';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[51];
                                break;
                              case 142:
                                _controllerfirsttoptxt.text = '42';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[42];
                                break;
                              case 242:
                                _controllerfirsttoptxt.text = '3';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[3];
                                break;
                              case 342:
                                _controllerfirsttoptxt.text = '27';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[27];
                                break;
                              case 442:
                                _controllerfirsttoptxt.text = '24';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllerfirsttoptxt.text = '44';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[44];
                                break;
                              case 213:
                                _controllerfirsttoptxt.text = '28';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[28];
                                break;
                              case 313:
                                _controllerfirsttoptxt.text = '50';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[50];
                                break;
                              case 413:
                                _controllerfirsttoptxt.text = '32';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[32];
                                break;
                              case 123:
                                _controllerfirsttoptxt.text = '57';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[57];
                                break;
                              case 223:
                                _controllerfirsttoptxt.text = '48';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[48];
                                break;
                              case 323:
                                _controllerfirsttoptxt.text = '18';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[18];
                                break;
                              case 423:
                                _controllerfirsttoptxt.text = '46';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[46];
                                break;
                              case 133:
                                _controllerfirsttoptxt.text = '6';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[6];
                                break;
                              case 233:
                                _controllerfirsttoptxt.text = '47';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[47];
                                break;
                              case 333:
                                _controllerfirsttoptxt.text = '64';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[64];
                                break;
                              case 433:
                                _controllerfirsttoptxt.text = '40';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[40];
                                break;
                              case 143:
                                _controllerfirsttoptxt.text = '59';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[59];
                                break;
                              case 243:
                                _controllerfirsttoptxt.text = '29';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[29];
                                break;
                              case 343:
                                _controllerfirsttoptxt.text = '4';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[4];
                                break;
                              case 443:
                                _controllerfirsttoptxt.text = '7';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllerfirsttoptxt.text = '33';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[33];
                                break;
                              case 214:
                                _controllerfirsttoptxt.text = '31';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[31];
                                break;
                              case 314:
                                _controllerfirsttoptxt.text = '56';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[56];
                                break;
                              case 414:
                                _controllerfirsttoptxt.text = '62';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[62];
                                break;
                              case 124:
                                _controllerfirsttoptxt.text = '53';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[53];
                                break;
                              case 224:
                                _controllerfirsttoptxt.text = '39';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[39];
                                break;
                              case 324:
                                _controllerfirsttoptxt.text = '52';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[52];
                                break;
                              case 424:
                                _controllerfirsttoptxt.text = '15';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[15];
                                break;
                              case 134:
                                _controllerfirsttoptxt.text = '12';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[12];
                                break;
                              case 234:
                                _controllerfirsttoptxt.text = '45';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[45];
                                break;
                              case 334:
                                _controllerfirsttoptxt.text = '35';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[35];
                                break;
                              case 434:
                                _controllerfirsttoptxt.text = '16';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[16];
                                break;
                              case 144:
                                _controllerfirsttoptxt.text = '20';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[20];
                                break;
                              case 244:
                                _controllerfirsttoptxt.text = '8';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[8];
                                break;
                              case 344:
                                _controllerfirsttoptxt.text = '23';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[23];
                                break;
                              case 444:
                                _controllerfirsttoptxt.text = '2';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerfirstmid,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexfirstmid, reason) {
                          setState(() {
                            _currentfirstmid = indexfirstmid;
                            hexagramVal = ((_currentfirsttop + 1) * 100 +
                                (_currentfirstmid + 1) * 10 +
                                (_currentfirstbot + 1));
                            switch (hexagramVal) {
                            //Quarter of Mutation
                              case 111:
                                _controllerfirsttoptxt.text = '1';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[1];
                                break;
                              case 211:
                                _controllerfirsttoptxt.text = '43';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[43];
                                break;
                              case 311:
                                _controllerfirsttoptxt.text = '14';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[14];
                                break;
                              case 411:
                                _controllerfirsttoptxt.text = '34';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[34];
                                break;
                              case 121:
                                _controllerfirsttoptxt.text = '9';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[9];
                                break;
                              case 221:
                                _controllerfirsttoptxt.text = '5';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[5];
                                break;
                              case 321:
                                _controllerfirsttoptxt.text = '26';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[26];
                                break;
                              case 421:
                                _controllerfirsttoptxt.text = '11';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[11];
                                break;
                              case 131:
                                _controllerfirsttoptxt.text = '10';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[10];
                                break;
                              case 231:
                                _controllerfirsttoptxt.text = '58';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[58];
                                break;
                              case 331:
                                _controllerfirsttoptxt.text = '38';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[38];
                                break;
                              case 431:
                                _controllerfirsttoptxt.text = '54';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[54];
                                break;
                              case 141:
                                _controllerfirsttoptxt.text = '61';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[61];
                                break;
                              case 241:
                                _controllerfirsttoptxt.text = '60';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[60];
                                break;
                              case 341:
                                _controllerfirsttoptxt.text = '41';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[41];
                                break;
                              case 441:
                                _controllerfirsttoptxt.text = '19';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllerfirsttoptxt.text = '13';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[13];
                                break;
                              case 212:
                                _controllerfirsttoptxt.text = '49';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[49];
                                break;
                              case 312:
                                _controllerfirsttoptxt.text = '30';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[30];
                                break;
                              case 412:
                                _controllerfirsttoptxt.text = '55';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[55];
                                break;
                              case 122:
                                _controllerfirsttoptxt.text = '37';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[37];
                                break;
                              case 222:
                                _controllerfirsttoptxt.text = '63';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[63];
                                break;
                              case 322:
                                _controllerfirsttoptxt.text = '22';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[22];
                                break;
                              case 422:
                                _controllerfirsttoptxt.text = '36';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[36];
                                break;
                              case 132:
                                _controllerfirsttoptxt.text = '25';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[25];
                                break;
                              case 232:
                                _controllerfirsttoptxt.text = '17';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[17];
                                break;
                              case 332:
                                _controllerfirsttoptxt.text = '21';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[21];
                                break;
                              case 432:
                                _controllerfirsttoptxt.text = '51';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[51];
                                break;
                              case 142:
                                _controllerfirsttoptxt.text = '42';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[42];
                                break;
                              case 242:
                                _controllerfirsttoptxt.text = '3';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[3];
                                break;
                              case 342:
                                _controllerfirsttoptxt.text = '27';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[27];
                                break;
                              case 442:
                                _controllerfirsttoptxt.text = '24';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllerfirsttoptxt.text = '44';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[44];
                                break;
                              case 213:
                                _controllerfirsttoptxt.text = '28';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[28];
                                break;
                              case 313:
                                _controllerfirsttoptxt.text = '50';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[50];
                                break;
                              case 413:
                                _controllerfirsttoptxt.text = '32';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[32];
                                break;
                              case 123:
                                _controllerfirsttoptxt.text = '57';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[57];
                                break;
                              case 223:
                                _controllerfirsttoptxt.text = '48';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[48];
                                break;
                              case 323:
                                _controllerfirsttoptxt.text = '18';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[18];
                                break;
                              case 423:
                                _controllerfirsttoptxt.text = '46';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[46];
                                break;
                              case 133:
                                _controllerfirsttoptxt.text = '6';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[6];
                                break;
                              case 233:
                                _controllerfirsttoptxt.text = '47';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[47];
                                break;
                              case 333:
                                _controllerfirsttoptxt.text = '64';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[64];
                                break;
                              case 433:
                                _controllerfirsttoptxt.text = '40';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[40];
                                break;
                              case 143:
                                _controllerfirsttoptxt.text = '59';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[59];
                                break;
                              case 243:
                                _controllerfirsttoptxt.text = '29';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[29];
                                break;
                              case 343:
                                _controllerfirsttoptxt.text = '4';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[4];
                                break;
                              case 443:
                                _controllerfirsttoptxt.text = '7';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllerfirsttoptxt.text = '33';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[33];
                                break;
                              case 214:
                                _controllerfirsttoptxt.text = '31';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[31];
                                break;
                              case 314:
                                _controllerfirsttoptxt.text = '56';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[56];
                                break;
                              case 414:
                                _controllerfirsttoptxt.text = '62';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[62];
                                break;
                              case 124:
                                _controllerfirsttoptxt.text = '53';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[53];
                                break;
                              case 224:
                                _controllerfirsttoptxt.text = '39';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[39];
                                break;
                              case 324:
                                _controllerfirsttoptxt.text = '52';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[52];
                                break;
                              case 424:
                                _controllerfirsttoptxt.text = '15';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[15];
                                break;
                              case 134:
                                _controllerfirsttoptxt.text = '12';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[12];
                                break;
                              case 234:
                                _controllerfirsttoptxt.text = '45';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[45];
                                break;
                              case 334:
                                _controllerfirsttoptxt.text = '35';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[35];
                                break;
                              case 434:
                                _controllerfirsttoptxt.text = '16';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[16];
                                break;
                              case 144:
                                _controllerfirsttoptxt.text = '20';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[20];
                                break;
                              case 244:
                                _controllerfirsttoptxt.text = '8';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[8];
                                break;
                              case 344:
                                _controllerfirsttoptxt.text = '23';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[23];
                                break;
                              case 444:
                                _controllerfirsttoptxt.text = '2';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerfirstbot,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexfirstbot, reason) {
                          setState(() {
                            _currentfirstbot = indexfirstbot;
                            hexagramVal = ((_currentfirsttop + 1) * 100 +
                                (_currentfirstmid + 1) * 10 +
                                (_currentfirstbot + 1));
                            switch (hexagramVal) {
                            //Quarter of Mutation
                              case 111:
                                _controllerfirsttoptxt.text = '1';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[1];
                                break;
                              case 211:
                                _controllerfirsttoptxt.text = '43';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[43];
                                break;
                              case 311:
                                _controllerfirsttoptxt.text = '14';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[14];
                                break;
                              case 411:
                                _controllerfirsttoptxt.text = '34';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[34];
                                break;
                              case 121:
                                _controllerfirsttoptxt.text = '9';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[9];
                                break;
                              case 221:
                                _controllerfirsttoptxt.text = '5';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[5];
                                break;
                              case 321:
                                _controllerfirsttoptxt.text = '26';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[26];
                                break;
                              case 421:
                                _controllerfirsttoptxt.text = '11';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[11];
                                break;
                              case 131:
                                _controllerfirsttoptxt.text = '10';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[10];
                                break;
                              case 231:
                                _controllerfirsttoptxt.text = '58';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[58];
                                break;
                              case 331:
                                _controllerfirsttoptxt.text = '38';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[38];
                                break;
                              case 431:
                                _controllerfirsttoptxt.text = '54';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[54];
                                break;
                              case 141:
                                _controllerfirsttoptxt.text = '61';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[61];
                                break;
                              case 241:
                                _controllerfirsttoptxt.text = '60';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[60];
                                break;
                              case 341:
                                _controllerfirsttoptxt.text = '41';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[41];
                                break;
                              case 441:
                                _controllerfirsttoptxt.text = '19';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllerfirsttoptxt.text = '13';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[13];
                                break;
                              case 212:
                                _controllerfirsttoptxt.text = '49';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[49];
                                break;
                              case 312:
                                _controllerfirsttoptxt.text = '30';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[30];
                                break;
                              case 412:
                                _controllerfirsttoptxt.text = '55';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[55];
                                break;
                              case 122:
                                _controllerfirsttoptxt.text = '37';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[37];
                                break;
                              case 222:
                                _controllerfirsttoptxt.text = '63';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[63];
                                break;
                              case 322:
                                _controllerfirsttoptxt.text = '22';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[22];
                                break;
                              case 422:
                                _controllerfirsttoptxt.text = '36';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[36];
                                break;
                              case 132:
                                _controllerfirsttoptxt.text = '25';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[25];
                                break;
                              case 232:
                                _controllerfirsttoptxt.text = '17';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[17];
                                break;
                              case 332:
                                _controllerfirsttoptxt.text = '21';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[21];
                                break;
                              case 432:
                                _controllerfirsttoptxt.text = '51';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[51];
                                break;
                              case 142:
                                _controllerfirsttoptxt.text = '42';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[42];
                                break;
                              case 242:
                                _controllerfirsttoptxt.text = '3';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[3];
                                break;
                              case 342:
                                _controllerfirsttoptxt.text = '27';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[27];
                                break;
                              case 442:
                                _controllerfirsttoptxt.text = '24';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllerfirsttoptxt.text = '44';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[44];
                                break;
                              case 213:
                                _controllerfirsttoptxt.text = '28';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[28];
                                break;
                              case 313:
                                _controllerfirsttoptxt.text = '50';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[50];
                                break;
                              case 413:
                                _controllerfirsttoptxt.text = '32';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[32];
                                break;
                              case 123:
                                _controllerfirsttoptxt.text = '57';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[57];
                                break;
                              case 223:
                                _controllerfirsttoptxt.text = '48';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[48];
                                break;
                              case 323:
                                _controllerfirsttoptxt.text = '18';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[18];
                                break;
                              case 423:
                                _controllerfirsttoptxt.text = '46';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[46];
                                break;
                              case 133:
                                _controllerfirsttoptxt.text = '6';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[6];
                                break;
                              case 233:
                                _controllerfirsttoptxt.text = '47';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[47];
                                break;
                              case 333:
                                _controllerfirsttoptxt.text = '64';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[64];
                                break;
                              case 433:
                                _controllerfirsttoptxt.text = '40';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[40];
                                break;
                              case 143:
                                _controllerfirsttoptxt.text = '59';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[59];
                                break;
                              case 243:
                                _controllerfirsttoptxt.text = '29';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[29];
                                break;
                              case 343:
                                _controllerfirsttoptxt.text = '4';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[4];
                                break;
                              case 443:
                                _controllerfirsttoptxt.text = '7';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllerfirsttoptxt.text = '33';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[33];
                                break;
                              case 214:
                                _controllerfirsttoptxt.text = '31';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[31];
                                break;
                              case 314:
                                _controllerfirsttoptxt.text = '56';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[56];
                                break;
                              case 414:
                                _controllerfirsttoptxt.text = '62';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[62];
                                break;
                              case 124:
                                _controllerfirsttoptxt.text = '53';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[53];
                                break;
                              case 224:
                                _controllerfirsttoptxt.text = '39';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[39];
                                break;
                              case 324:
                                _controllerfirsttoptxt.text = '52';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[52];
                                break;
                              case 424:
                                _controllerfirsttoptxt.text = '15';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[15];
                                break;
                              case 134:
                                _controllerfirsttoptxt.text = '12';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[12];
                                break;
                              case 234:
                                _controllerfirsttoptxt.text = '45';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[45];
                                break;
                              case 334:
                                _controllerfirsttoptxt.text = '35';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[35];
                                break;
                              case 434:
                                _controllerfirsttoptxt.text = '16';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[16];
                                break;
                              case 144:
                                _controllerfirsttoptxt.text = '20';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[20];
                                break;
                              case 244:
                                _controllerfirsttoptxt.text = '8';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[8];
                                break;
                              case 344:
                                _controllerfirsttoptxt.text = '23';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[23];
                                break;
                              case 444:
                                _controllerfirsttoptxt.text = '2';
                                _controllerfirstbottxt.text =
                                hexagramAdjectiveList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
              ])),
          Expanded(
              child: Column(children: [
                const Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  DropdownButton(
                    value: dropdownsecondichingordervalue,
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: orderHexagramsWheelList,
                    onChanged: (String? dropdownsecondichingordervalueChange) {
                      setState(() {
                        dropdownsecondichingordervalue =
                        dropdownsecondichingordervalueChange!;
                        switch (dropdownsecondichingordervalueChange) {
                        //Quarter of Mutation
                          case '1':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '43':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '14':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '34':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '9':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '5':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '26':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '11':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '10':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '58':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '38':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '54':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '61':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '60':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '41':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '19':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                          case '13':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '49':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '30':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '55':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '37':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '63':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '22':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '36':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '25':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '17':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '21':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '51':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '42':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '3':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '27':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '24':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                          case '44':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '28':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '50':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '32':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '57':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '48':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '18':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '46':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '6':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '47':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '64':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '40':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '59':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '29':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '4':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '7':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;

                        //Quarter of Civilization
                          case '33':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '31':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '56':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '62':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '53':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '39':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '52':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '15':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '12':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '45':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '35':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '16':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '20':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '8':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '23':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '2':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                          default:
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                        }
                      });
                    },
                  ),
                  DropdownButton(
                    value: dropdownsecondichingvalue,
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: fontHexList,
                    onChanged: (String? dropdownsecondichingvalueChange) {
                      setState(() {
                        dropdownsecondichingvalue =
                        dropdownsecondichingvalueChange!;
                        switch (dropdownsecondichingvalueChange) {
                        //Quarter of Mutation
                          case 'a':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '43':
                        //case '44':
                          case 'b':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '14':
                        //case '13':
                          case 'c':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '34':
                        //case '10':
                          case 'd':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '9':
                        //case '9':
                          case 'e':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '5':
                        //case '14':
                          case 'f':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '26':
                        //case '43':
                          case 'g':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '11':
                        //case '33':
                          case 'h':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '10':
                        //case '25':
                          case 'i':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '58':
                        //case '61':
                          case 'j':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '38':
                        //case '26':
                          case 'k':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '54':
                        //case '34':
                          case 'l':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '61':
                        //case '6':
                          case 'm':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '60':
                        //case '37':
                          case 'n':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '41':
                        //case '38':
                          case 'o':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '19':
                        //case '5':
                          case 'p':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                        //case '13':
                        //case '57':
                          case 'q':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '49':
                        //case '30':
                          case 'r':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '30':
                        //case '58':
                          case 's':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '55':
                        //case '50':
                          case 't':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '37':
                        //case '49'':
                          case 'u':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '63':
                        //case '28':
                          case 'v':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '22':
                        //case '12':
                          case 'w':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '36':
                        //case '42':
                          case 'x':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '25':
                        //case '41':
                          case 'y':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '17':
                        //case '11':
                          case 'z':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '21':
                        //case '62':
                          case '1':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '51':
                        //case '45':
                          case '2':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '42':
                        //case '29':
                          case '3':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '3':
                        //case '39':
                          case '4':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '27':
                        //case '40':
                          case '5':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '24':
                        //case '24':
                          case '6':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                        //case '44':
                        //case '7':
                          case '7':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '28':
                        //case '15':
                          case '8':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '50':
                        //case '16':
                          case '9':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '32':
                        //case '8':
                          case '0':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '57':
                        //case '23':
                          case '!':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '48':
                        //case '2':
                          case '@':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '18':
                        //case '59':
                          case 'A':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '46':
                        //case '22':
                          case 'B':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '6':
                        //case '54':
                          case 'C':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '47':
                        //case '53':
                          case 'D':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '64':
                        //case '21':
                          case 'E':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '40':
                        //case '60':
                          case 'F':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '59':
                        //case '18':
                          case 'G':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '29':
                        //case '55':
                          case 'H':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '4':
                        //case '56':
                          case 'I':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '7':
                        //case '17':
                          case 'J':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;

                        //Quarter of Civilization
                        //case '33':
                        //case '32':
                          case 'K':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '31':
                        //case '31':
                          case 'L':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '56':
                        //case '47':
                          case 'M':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '62':
                        //case '48':
                          case 'N':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '53':
                        //case '63':
                          case 'O':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '39':
                        //case '64':
                          case 'P':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '52':
                        //case '20':
                          case 'Q':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '15':
                        //case '27':
                          case 'R':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '12':
                        //case '19':
                          case 'S':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;
                        //case '45':
                        //case '4':
                          case 'T':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;
                        //case '35':
                        //case '36':
                          case 'U':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '16':
                        //case '52':
                          case 'V':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '20':
                        //case '51':
                          case 'W':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '8':
                        //case '35':
                          case 'X':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                        //case '23':
                        //case '3':
                          case 'Y':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;
                        //case '2':
                        //case '46':
                          case 'Z':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                          default:
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                        }
                      });
                    },
                  ),
                  DropdownButton(
                    // Initial Value
                    value: dropdownsecondvalue,
                    // Down Arrow Icon
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: hexDropDownNumbersList,
                    onChanged: (String? dropdownsecondvalueChange) {
                      setState(() {
                        dropdownsecondvalue = dropdownsecondvalueChange!;
                        switch (dropdownsecondvalueChange) {
                        //Quarter of Mutation
                          case '1':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '43':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '14':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '34':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '9':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '5':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '26':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '11':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '10':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '58':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '38':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '54':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '61':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '60':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '41':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;
                          case '19':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                          case '13':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '49':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '30':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '55':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '37':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '63':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '22':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '36':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '25':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '17':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '21':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '51':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '42':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '3':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '27':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;
                          case '24':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                          case '44':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '28':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '50':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '32':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '57':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '48':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '18':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '46':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '6':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '47':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '64':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '40':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '59':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '29':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '4':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;
                          case '7':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(2);
                            break;

                        //Quarter of Civilization
                          case '33':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '31':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '56':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '62':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '53':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '39':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '52':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '15':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(1);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '12':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '45':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '35':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '16':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(2);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '20':
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '8':
                            _controllersecondtop.animateToPage(1);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '23':
                            _controllersecondtop.animateToPage(2);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                          case '2':
                            _controllersecondtop.animateToPage(3);
                            _controllersecondmid.animateToPage(3);
                            _controllersecondbot.animateToPage(3);
                            break;
                          default:
                            _controllersecondtop.animateToPage(0);
                            _controllersecondmid.animateToPage(0);
                            _controllersecondbot.animateToPage(0);
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
                  controller: _controllersecondtoptxt,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Creativity',
                      hintStyle: TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllersecondbottxt,
                  readOnly: true,
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllersecondtop,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexsecondtop, reason) {
                          setState(() {
                            _currentsecondtop = indexsecondtop;
                            hexagramVal = ((_currentsecondtop + 1) * 100 +
                                (_currentsecondmid + 1) * 10 +
                                (_currentsecondbot + 1));
                            switch (hexagramVal) {
                            //Quarter of Mutation
                            //_controllersecond
                              case 111:
                                _controllersecondtoptxt.text = '1';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[1];
                                break;
                              case 211:
                                _controllersecondtoptxt.text = '43';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[43];
                                break;
                              case 311:
                                _controllersecondtoptxt.text = '14';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[14];
                                break;
                              case 411:
                                _controllersecondtoptxt.text = '34';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[34];
                                break;
                              case 121:
                                _controllersecondtoptxt.text = '9';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[9];
                                break;
                              case 221:
                                _controllersecondtoptxt.text = '5';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[5];
                                break;
                              case 321:
                                _controllersecondtoptxt.text = '26';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[26];
                                break;
                              case 421:
                                _controllersecondtoptxt.text = '11';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[11];
                                break;
                              case 131:
                                _controllersecondtoptxt.text = '10';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[10];
                                break;
                              case 231:
                                _controllersecondtoptxt.text = '58';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[58];
                                break;
                              case 331:
                                _controllersecondtoptxt.text = '38';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[38];
                                break;
                              case 431:
                                _controllersecondtoptxt.text = '54';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[54];
                                break;
                              case 141:
                                _controllersecondtoptxt.text = '61';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[61];
                                break;
                              case 241:
                                _controllersecondtoptxt.text = '60';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[60];
                                break;
                              case 341:
                                _controllersecondtoptxt.text = '41';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[41];
                                break;
                              case 441:
                                _controllersecondtoptxt.text = '19';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllersecondtoptxt.text = '13';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[13];
                                break;
                              case 212:
                                _controllersecondtoptxt.text = '49';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[49];
                                break;
                              case 312:
                                _controllersecondtoptxt.text = '30';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[30];
                                break;
                              case 412:
                                _controllersecondtoptxt.text = '55';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[55];
                                break;
                              case 122:
                                _controllersecondtoptxt.text = '37';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[37];
                                break;
                              case 222:
                                _controllersecondtoptxt.text = '63';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[63];
                                break;
                              case 322:
                                _controllersecondtoptxt.text = '22';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[22];
                                break;
                              case 422:
                                _controllersecondtoptxt.text = '36';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[36];
                                break;
                              case 132:
                                _controllersecondtoptxt.text = '25';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[25];
                                break;
                              case 232:
                                _controllersecondtoptxt.text = '17';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[17];
                                break;
                              case 332:
                                _controllersecondtoptxt.text = '21';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[21];
                                break;
                              case 432:
                                _controllersecondtoptxt.text = '51';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[51];
                                break;
                              case 142:
                                _controllersecondtoptxt.text = '42';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[42];
                                break;
                              case 242:
                                _controllersecondtoptxt.text = '3';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[3];
                                break;
                              case 342:
                                _controllersecondtoptxt.text = '27';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[27];
                                break;
                              case 442:
                                _controllersecondtoptxt.text = '24';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllersecondtoptxt.text = '44';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[44];
                                break;
                              case 213:
                                _controllersecondtoptxt.text = '28';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[28];
                                break;
                              case 313:
                                _controllersecondtoptxt.text = '50';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[50];
                                break;
                              case 413:
                                _controllersecondtoptxt.text = '32';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[32];
                                break;
                              case 123:
                                _controllersecondtoptxt.text = '57';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[57];
                                break;
                              case 223:
                                _controllersecondtoptxt.text = '48';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[48];
                                break;
                              case 323:
                                _controllersecondtoptxt.text = '18';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[18];
                                break;
                              case 423:
                                _controllersecondtoptxt.text = '46';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[46];
                                break;
                              case 133:
                                _controllersecondtoptxt.text = '6';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[6];
                                break;
                              case 233:
                                _controllersecondtoptxt.text = '47';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[47];
                                break;
                              case 333:
                                _controllersecondtoptxt.text = '64';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[64];
                                break;
                              case 433:
                                _controllersecondtoptxt.text = '40';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[40];
                                break;
                              case 143:
                                _controllersecondtoptxt.text = '59';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[59];
                                break;
                              case 243:
                                _controllersecondtoptxt.text = '29';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[29];
                                break;
                              case 343:
                                _controllersecondtoptxt.text = '4';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[4];
                                break;
                              case 443:
                                _controllersecondtoptxt.text = '7';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllersecondtoptxt.text = '33';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[33];
                                break;
                              case 214:
                                _controllersecondtoptxt.text = '31';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[31];
                                break;
                              case 314:
                                _controllersecondtoptxt.text = '56';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[56];
                                break;
                              case 414:
                                _controllersecondtoptxt.text = '62';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[62];
                                break;
                              case 124:
                                _controllersecondtoptxt.text = '53';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[53];
                                break;
                              case 224:
                                _controllersecondtoptxt.text = '39';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[39];
                                break;
                              case 324:
                                _controllersecondtoptxt.text = '52';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[52];
                                break;
                              case 424:
                                _controllersecondtoptxt.text = '15';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[15];
                                break;
                              case 134:
                                _controllersecondtoptxt.text = '12';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[12];
                                break;
                              case 234:
                                _controllersecondtoptxt.text = '45';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[45];
                                break;
                              case 334:
                                _controllersecondtoptxt.text = '35';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[35];
                                break;
                              case 434:
                                _controllersecondtoptxt.text = '16';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[16];
                                break;
                              case 144:
                                _controllersecondtoptxt.text = '20';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[20];
                                break;
                              case 244:
                                _controllersecondtoptxt.text = '8';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[8];
                                break;
                              case 344:
                                _controllersecondtoptxt.text = '23';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[23];
                                break;
                              case 444:
                                _controllersecondtoptxt.text = '2';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllersecondmid,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexsecondmid, reason) {
                          setState(() {
                            _currentsecondmid = indexsecondmid;
                            hexagramVal = ((_currentsecondtop + 1) * 100 +
                                (_currentsecondmid + 1) * 10 +
                                (_currentsecondbot + 1));
                            switch (hexagramVal) {
                            //Quarter of Mutation
                              case 111:
                                _controllersecondtoptxt.text = '1';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[1];
                                break;
                              case 211:
                                _controllersecondtoptxt.text = '43';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[43];
                                break;
                              case 311:
                                _controllersecondtoptxt.text = '14';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[14];
                                break;
                              case 411:
                                _controllersecondtoptxt.text = '34';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[34];
                                break;
                              case 121:
                                _controllersecondtoptxt.text = '9';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[9];
                                break;
                              case 221:
                                _controllersecondtoptxt.text = '5';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[5];
                                break;
                              case 321:
                                _controllersecondtoptxt.text = '26';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[26];
                                break;
                              case 421:
                                _controllersecondtoptxt.text = '11';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[11];
                                break;
                              case 131:
                                _controllersecondtoptxt.text = '10';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[10];
                                break;
                              case 231:
                                _controllersecondtoptxt.text = '58';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[58];
                                break;
                              case 331:
                                _controllersecondtoptxt.text = '38';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[38];
                                break;
                              case 431:
                                _controllersecondtoptxt.text = '54';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[54];
                                break;
                              case 141:
                                _controllersecondtoptxt.text = '61';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[61];
                                break;
                              case 241:
                                _controllersecondtoptxt.text = '60';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[60];
                                break;
                              case 341:
                                _controllersecondtoptxt.text = '41';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[41];
                                break;
                              case 441:
                                _controllersecondtoptxt.text = '19';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllersecondtoptxt.text = '13';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[13];
                                break;
                              case 212:
                                _controllersecondtoptxt.text = '49';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[49];
                                break;
                              case 312:
                                _controllersecondtoptxt.text = '30';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[30];
                                break;
                              case 412:
                                _controllersecondtoptxt.text = '55';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[55];
                                break;
                              case 122:
                                _controllersecondtoptxt.text = '37';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[37];
                                break;
                              case 222:
                                _controllersecondtoptxt.text = '63';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[63];
                                break;
                              case 322:
                                _controllersecondtoptxt.text = '22';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[22];
                                break;
                              case 422:
                                _controllersecondtoptxt.text = '36';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[36];
                                break;
                              case 132:
                                _controllersecondtoptxt.text = '25';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[25];
                                break;
                              case 232:
                                _controllersecondtoptxt.text = '17';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[17];
                                break;
                              case 332:
                                _controllersecondtoptxt.text = '21';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[21];
                                break;
                              case 432:
                                _controllersecondtoptxt.text = '51';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[51];
                                break;
                              case 142:
                                _controllersecondtoptxt.text = '42';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[42];
                                break;
                              case 242:
                                _controllersecondtoptxt.text = '3';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[3];
                                break;
                              case 342:
                                _controllersecondtoptxt.text = '27';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[27];
                                break;
                              case 442:
                                _controllersecondtoptxt.text = '24';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllersecondtoptxt.text = '44';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[44];
                                break;
                              case 213:
                                _controllersecondtoptxt.text = '28';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[28];
                                break;
                              case 313:
                                _controllersecondtoptxt.text = '50';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[50];
                                break;
                              case 413:
                                _controllersecondtoptxt.text = '32';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[32];
                                break;
                              case 123:
                                _controllersecondtoptxt.text = '57';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[57];
                                break;
                              case 223:
                                _controllersecondtoptxt.text = '48';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[48];
                                break;
                              case 323:
                                _controllersecondtoptxt.text = '18';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[18];
                                break;
                              case 423:
                                _controllersecondtoptxt.text = '46';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[46];
                                break;
                              case 133:
                                _controllersecondtoptxt.text = '6';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[6];
                                break;
                              case 233:
                                _controllersecondtoptxt.text = '47';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[47];
                                break;
                              case 333:
                                _controllersecondtoptxt.text = '64';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[64];
                                break;
                              case 433:
                                _controllersecondtoptxt.text = '40';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[40];
                                break;
                              case 143:
                                _controllersecondtoptxt.text = '59';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[59];
                                break;
                              case 243:
                                _controllersecondtoptxt.text = '29';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[29];
                                break;
                              case 343:
                                _controllersecondtoptxt.text = '4';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[4];
                                break;
                              case 443:
                                _controllersecondtoptxt.text = '7';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllersecondtoptxt.text = '33';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[33];
                                break;
                              case 214:
                                _controllersecondtoptxt.text = '31';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[31];
                                break;
                              case 314:
                                _controllersecondtoptxt.text = '56';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[56];
                                break;
                              case 414:
                                _controllersecondtoptxt.text = '62';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[62];
                                break;
                              case 124:
                                _controllersecondtoptxt.text = '53';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[53];
                                break;
                              case 224:
                                _controllersecondtoptxt.text = '39';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[39];
                                break;
                              case 324:
                                _controllersecondtoptxt.text = '52';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[52];
                                break;
                              case 424:
                                _controllersecondtoptxt.text = '15';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[15];
                                break;
                              case 134:
                                _controllersecondtoptxt.text = '12';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[12];
                                break;
                              case 234:
                                _controllersecondtoptxt.text = '45';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[45];
                                break;
                              case 334:
                                _controllersecondtoptxt.text = '35';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[35];
                                break;
                              case 434:
                                _controllersecondtoptxt.text = '16';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[16];
                                break;
                              case 144:
                                _controllersecondtoptxt.text = '20';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[20];
                                break;
                              case 244:
                                _controllersecondtoptxt.text = '8';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[8];
                                break;
                              case 344:
                                _controllersecondtoptxt.text = '23';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[23];
                                break;
                              case 444:
                                _controllersecondtoptxt.text = '2';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllersecondbot,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexsecondbot, reason) {
                          setState(() {
                            _currentsecondbot = indexsecondbot;
                            hexagramVal = ((_currentsecondtop + 1) * 100 +
                                (_currentsecondmid + 1) * 10 +
                                (_currentsecondbot + 1));
                            switch (hexagramVal) {
                            //Quarter of Mutation
                              case 111:
                                _controllersecondtoptxt.text = '1';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[1];
                                break;
                              case 211:
                                _controllersecondtoptxt.text = '43';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[43];
                                break;
                              case 311:
                                _controllersecondtoptxt.text = '14';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[14];
                                break;
                              case 411:
                                _controllersecondtoptxt.text = '34';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[34];
                                break;
                              case 121:
                                _controllersecondtoptxt.text = '9';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[9];
                                break;
                              case 221:
                                _controllersecondtoptxt.text = '5';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[5];
                                break;
                              case 321:
                                _controllersecondtoptxt.text = '26';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[26];
                                break;
                              case 421:
                                _controllersecondtoptxt.text = '11';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[11];
                                break;
                              case 131:
                                _controllersecondtoptxt.text = '10';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[10];
                                break;
                              case 231:
                                _controllersecondtoptxt.text = '58';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[58];
                                break;
                              case 331:
                                _controllersecondtoptxt.text = '38';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[38];
                                break;
                              case 431:
                                _controllersecondtoptxt.text = '54';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[54];
                                break;
                              case 141:
                                _controllersecondtoptxt.text = '61';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[61];
                                break;
                              case 241:
                                _controllersecondtoptxt.text = '60';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[60];
                                break;
                              case 341:
                                _controllersecondtoptxt.text = '41';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[41];
                                break;
                              case 441:
                                _controllersecondtoptxt.text = '19';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllersecondtoptxt.text = '13';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[13];
                                break;
                              case 212:
                                _controllersecondtoptxt.text = '49';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[49];
                                break;
                              case 312:
                                _controllersecondtoptxt.text = '30';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[30];
                                break;
                              case 412:
                                _controllersecondtoptxt.text = '55';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[55];
                                break;
                              case 122:
                                _controllersecondtoptxt.text = '37';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[37];
                                break;
                              case 222:
                                _controllersecondtoptxt.text = '63';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[63];
                                break;
                              case 322:
                                _controllersecondtoptxt.text = '22';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[22];
                                break;
                              case 422:
                                _controllersecondtoptxt.text = '36';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[36];
                                break;
                              case 132:
                                _controllersecondtoptxt.text = '25';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[25];
                                break;
                              case 232:
                                _controllersecondtoptxt.text = '17';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[17];
                                break;
                              case 332:
                                _controllersecondtoptxt.text = '21';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[21];
                                break;
                              case 432:
                                _controllersecondtoptxt.text = '51';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[51];
                                break;
                              case 142:
                                _controllersecondtoptxt.text = '42';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[42];
                                break;
                              case 242:
                                _controllersecondtoptxt.text = '3';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[3];
                                break;
                              case 342:
                                _controllersecondtoptxt.text = '27';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[27];
                                break;
                              case 442:
                                _controllersecondtoptxt.text = '24';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllersecondtoptxt.text = '44';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[44];
                                break;
                              case 213:
                                _controllersecondtoptxt.text = '28';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[28];
                                break;
                              case 313:
                                _controllersecondtoptxt.text = '50';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[50];
                                break;
                              case 413:
                                _controllersecondtoptxt.text = '32';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[32];
                                break;
                              case 123:
                                _controllersecondtoptxt.text = '57';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[57];
                                break;
                              case 223:
                                _controllersecondtoptxt.text = '48';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[48];
                                break;
                              case 323:
                                _controllersecondtoptxt.text = '18';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[18];
                                break;
                              case 423:
                                _controllersecondtoptxt.text = '46';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[46];
                                break;
                              case 133:
                                _controllersecondtoptxt.text = '6';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[6];
                                break;
                              case 233:
                                _controllersecondtoptxt.text = '47';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[47];
                                break;
                              case 333:
                                _controllersecondtoptxt.text = '64';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[64];
                                break;
                              case 433:
                                _controllersecondtoptxt.text = '40';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[40];
                                break;
                              case 143:
                                _controllersecondtoptxt.text = '59';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[59];
                                break;
                              case 243:
                                _controllersecondtoptxt.text = '29';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[29];
                                break;
                              case 343:
                                _controllersecondtoptxt.text = '4';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[4];
                                break;
                              case 443:
                                _controllersecondtoptxt.text = '7';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllersecondtoptxt.text = '33';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[33];
                                break;
                              case 214:
                                _controllersecondtoptxt.text = '31';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[31];
                                break;
                              case 314:
                                _controllersecondtoptxt.text = '56';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[56];
                                break;
                              case 414:
                                _controllersecondtoptxt.text = '62';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[62];
                                break;
                              case 124:
                                _controllersecondtoptxt.text = '53';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[53];
                                break;
                              case 224:
                                _controllersecondtoptxt.text = '39';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[39];
                                break;
                              case 324:
                                _controllersecondtoptxt.text = '52';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[52];
                                break;
                              case 424:
                                _controllersecondtoptxt.text = '15';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[15];
                                break;
                              case 134:
                                _controllersecondtoptxt.text = '12';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[12];
                                break;
                              case 234:
                                _controllersecondtoptxt.text = '45';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[45];
                                break;
                              case 334:
                                _controllersecondtoptxt.text = '35';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[35];
                                break;
                              case 434:
                                _controllersecondtoptxt.text = '16';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[16];
                                break;
                              case 144:
                                _controllersecondtoptxt.text = '20';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[20];
                                break;
                              case 244:
                                _controllersecondtoptxt.text = '8';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[8];
                                break;
                              case 344:
                                _controllersecondtoptxt.text = '23';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[23];
                                break;
                              case 444:
                                _controllersecondtoptxt.text = '2';
                                _controllersecondbottxt.text =
                                hexagramSubjectList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
              ])),
          Expanded(
              child: Column(children: [
                const Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  DropdownButton(
                    value: dropdownthirdichingordervalue,
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: orderHexagramsWheelList,
                    onChanged: (String? dropdownthirdichingordervalueChange) {
                      setState(() {
                        dropdownthirdichingordervalue =
                        dropdownthirdichingordervalueChange!;
                        switch (dropdownthirdichingordervalueChange) {
                        //Quarter of Mutation
                          case '1':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '43':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '14':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '34':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '9':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '5':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '26':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '11':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '10':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '58':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '38':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '54':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '61':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '60':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '41':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '19':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                          case '13':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '49':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '30':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '55':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '37':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '63':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '22':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '36':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '25':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '17':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '21':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '51':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '42':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '3':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '27':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '24':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                          case '44':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '28':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '50':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '32':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '57':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '48':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '18':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '46':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '6':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '47':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '64':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '40':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '59':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '29':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '4':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '7':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;

                        //Quarter of Civilization
                          case '33':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '31':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '56':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '62':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '53':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '39':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '52':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '15':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '12':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '45':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '35':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '16':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '20':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '8':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '23':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '2':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          default:
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        }
                      });
                    },
                  ),
                  DropdownButton(
                    value: dropdownthirdichingvalue,
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: fontHexList,
                    onChanged: (String? dropdownthirdichingvalueChange) {
                      setState(() {
                        dropdownthirdichingvalue = dropdownthirdichingvalueChange!;
                        switch (dropdownthirdichingvalueChange) {
                        //Quarter of Mutation
                          case 'a':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '43':
                        //case '44':
                          case 'b':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '14':
                        //case '13':
                          case 'c':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '34':
                        //case '10':
                          case 'd':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '9':
                        //case '9':
                          case 'e':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '5':
                        //case '14':
                          case 'f':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '26':
                        //case '43':
                          case 'g':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '11':
                        //case '33':
                          case 'h':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '10':
                        //case '25':
                          case 'i':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '58':
                        //case '61':
                          case 'j':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '38':
                        //case '26':
                          case 'k':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '54':
                        //case '34':
                          case 'l':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '61':
                        //case '6':
                          case 'm':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '60':
                        //case '37':
                          case 'n':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '41':
                        //case '38':
                          case 'o':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '19':
                        //case '5':
                          case 'p':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                        //case '13':
                        //case '57':
                          case 'q':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '49':
                        //case '30':
                          case 'r':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '30':
                        //case '58':
                          case 's':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '55':
                        //case '50':
                          case 't':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '37':
                        //case '49'':
                          case 'u':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '63':
                        //case '28':
                          case 'v':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '22':
                        //case '12':
                          case 'w':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '36':
                        //case '42':
                          case 'x':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '25':
                        //case '41':
                          case 'y':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '17':
                        //case '11':
                          case 'z':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '21':
                        //case '62':
                          case '1':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '51':
                        //case '45':
                          case '2':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '42':
                        //case '29':
                          case '3':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '3':
                        //case '39':
                          case '4':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '27':
                        //case '40':
                          case '5':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '24':
                        //case '24':
                          case '6':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                        //case '44':
                        //case '7':
                          case '7':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '28':
                        //case '15':
                          case '8':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '50':
                        //case '16':
                          case '9':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '32':
                        //case '8':
                          case '0':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '57':
                        //case '23':
                          case '!':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '48':
                        //case '2':
                          case '@':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '18':
                        //case '59':
                          case 'A':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '46':
                        //case '22':
                          case 'B':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '6':
                        //case '54':
                          case 'C':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '47':
                        //case '53':
                          case 'D':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '64':
                        //case '21':
                          case 'E':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '40':
                        //case '60':
                          case 'F':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '59':
                        //case '18':
                          case 'G':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '29':
                        //case '55':
                          case 'H':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '4':
                        //case '56':
                          case 'I':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '7':
                        //case '17':
                          case 'J':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;

                        //Quarter of Civilization
                        //case '33':
                        //case '32':
                          case 'K':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '31':
                        //case '31':
                          case 'L':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '56':
                        //case '47':
                          case 'M':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '62':
                        //case '48':
                          case 'N':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '53':
                        //case '63':
                          case 'O':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '39':
                        //case '64':
                          case 'P':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '52':
                        //case '20':
                          case 'Q':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '15':
                        //case '27':
                          case 'R':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '12':
                        //case '19':
                          case 'S':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        //case '45':
                        //case '4':
                          case 'T':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;
                        //case '35':
                        //case '36':
                          case 'U':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '16':
                        //case '52':
                          case 'V':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '20':
                        //case '51':
                          case 'W':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '8':
                        //case '35':
                          case 'X':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                        //case '23':
                        //case '3':
                          case 'Y':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;
                        //case '2':
                        //case '46':
                          case 'Z':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          default:
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                        }
                      });
                    },
                  ),
                  DropdownButton(
                    value: dropdownthirdvalue,
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: hexDropDownNumbersList,
                    onChanged: (String? dropdownthirdvalueChange) {
                      setState(() {
                        dropdownthirdvalue = dropdownthirdvalueChange!;
                        switch (dropdownthirdvalueChange) {
                        //Quarter of Mutation
                          case '1':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '43':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '14':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '34':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '9':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '5':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '26':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '11':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '10':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '58':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '38':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '54':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '61':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '60':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '41':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;
                          case '19':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                          case '13':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '49':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '30':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '55':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '37':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '63':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '22':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '36':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '25':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '17':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '21':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '51':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '42':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '3':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '27':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;
                          case '24':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                          case '44':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '28':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '50':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '32':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '57':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '48':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '18':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '46':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '6':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '47':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '64':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '40':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '59':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '29':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '4':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;
                          case '7':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(2);
                            break;

                        //Quarter of Civilization
                          case '33':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '31':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '56':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '62':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '53':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '39':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '52':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '15':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(1);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '12':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '45':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '35':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '16':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(2);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '20':
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '8':
                            _controllerthirdtop.animateToPage(1);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '23':
                            _controllerthirdtop.animateToPage(2);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          case '2':
                            _controllerthirdtop.animateToPage(3);
                            _controllerthirdmid.animateToPage(3);
                            _controllerthirdbot.animateToPage(3);
                            break;
                          default:
                            _controllerthirdtop.animateToPage(0);
                            _controllerthirdmid.animateToPage(0);
                            _controllerthirdbot.animateToPage(0);
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
                  controller: _controllerthirdtoptxt,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Creates',
                      hintStyle: TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllerthirdbottxt,
                  readOnly: true,
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerthirdtop,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexthirdtop, reason) {
                          setState(() {
                            _currentthirdtop = indexthirdtop;
                            hexagramVal = ((_currentthirdtop + 1) * 100 +
                                (_currentthirdmid + 1) * 10 +
                                (_currentthirdbot + 1));
                            switch (hexagramVal) {
                            // controllerthirdtoptxt
                            //Quarter of Mutation
                              case 111:
                                _controllerthirdtoptxt.text = '1';
                                _controllerthirdbottxt.text = hexagramVerbList[1];
                                break;
                              case 211:
                                _controllerthirdtoptxt.text = '43';
                                _controllerthirdbottxt.text = hexagramVerbList[43];
                                break;
                              case 311:
                                _controllerthirdtoptxt.text = '14';
                                _controllerthirdbottxt.text = hexagramVerbList[14];
                                break;
                              case 411:
                                _controllerthirdtoptxt.text = '34';
                                _controllerthirdbottxt.text = hexagramVerbList[34];
                                break;
                              case 121:
                                _controllerthirdtoptxt.text = '9';
                                _controllerthirdbottxt.text = hexagramVerbList[9];
                                break;
                              case 221:
                                _controllerthirdtoptxt.text = '5';
                                _controllerthirdbottxt.text = hexagramVerbList[5];
                                break;
                              case 321:
                                _controllerthirdtoptxt.text = '26';
                                _controllerthirdbottxt.text = hexagramVerbList[26];
                                break;
                              case 421:
                                _controllerthirdtoptxt.text = '11';
                                _controllerthirdbottxt.text = hexagramVerbList[11];
                                break;
                              case 131:
                                _controllerthirdtoptxt.text = '10';
                                _controllerthirdbottxt.text = hexagramVerbList[10];
                                break;
                              case 231:
                                _controllerthirdtoptxt.text = '58';
                                _controllerthirdbottxt.text = hexagramVerbList[58];
                                break;
                              case 331:
                                _controllerthirdtoptxt.text = '38';
                                _controllerthirdbottxt.text = hexagramVerbList[38];
                                break;
                              case 431:
                                _controllerthirdtoptxt.text = '54';
                                _controllerthirdbottxt.text = hexagramVerbList[54];
                                break;
                              case 141:
                                _controllerthirdtoptxt.text = '61';
                                _controllerthirdbottxt.text = hexagramVerbList[61];
                                break;
                              case 241:
                                _controllerthirdtoptxt.text = '60';
                                _controllerthirdbottxt.text = hexagramVerbList[60];
                                break;
                              case 341:
                                _controllerthirdtoptxt.text = '41';
                                _controllerthirdbottxt.text = hexagramVerbList[41];
                                break;
                              case 441:
                                _controllerthirdtoptxt.text = '19';
                                _controllerthirdbottxt.text = hexagramVerbList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllerthirdtoptxt.text = '13';
                                _controllerthirdbottxt.text = hexagramVerbList[13];
                                break;
                              case 212:
                                _controllerthirdtoptxt.text = '49';
                                _controllerthirdbottxt.text = hexagramVerbList[49];
                                break;
                              case 312:
                                _controllerthirdtoptxt.text = '30';
                                _controllerthirdbottxt.text = hexagramVerbList[30];
                                break;
                              case 412:
                                _controllerthirdtoptxt.text = '55';
                                _controllerthirdbottxt.text = hexagramVerbList[55];
                                break;
                              case 122:
                                _controllerthirdtoptxt.text = '37';
                                _controllerthirdbottxt.text = hexagramVerbList[37];
                                break;
                              case 222:
                                _controllerthirdtoptxt.text = '63';
                                _controllerthirdbottxt.text = hexagramVerbList[63];
                                break;
                              case 322:
                                _controllerthirdtoptxt.text = '22';
                                _controllerthirdbottxt.text = hexagramVerbList[22];
                                break;
                              case 422:
                                _controllerthirdtoptxt.text = '36';
                                _controllerthirdbottxt.text = hexagramVerbList[36];
                                break;
                              case 132:
                                _controllerthirdtoptxt.text = '25';
                                _controllerthirdbottxt.text = hexagramVerbList[25];
                                break;
                              case 232:
                                _controllerthirdtoptxt.text = '17';
                                _controllerthirdbottxt.text = hexagramVerbList[17];
                                break;
                              case 332:
                                _controllerthirdtoptxt.text = '21';
                                _controllerthirdbottxt.text = hexagramVerbList[21];
                                break;
                              case 432:
                                _controllerthirdtoptxt.text = '51';
                                _controllerthirdbottxt.text = hexagramVerbList[51];
                                break;
                              case 142:
                                _controllerthirdtoptxt.text = '42';
                                _controllerthirdbottxt.text = hexagramVerbList[42];
                                break;
                              case 242:
                                _controllerthirdtoptxt.text = '3';
                                _controllerthirdbottxt.text = hexagramVerbList[3];
                                break;
                              case 342:
                                _controllerthirdtoptxt.text = '27';
                                _controllerthirdbottxt.text = hexagramVerbList[27];
                                break;
                              case 442:
                                _controllerthirdtoptxt.text = '24';
                                _controllerthirdbottxt.text = hexagramVerbList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllerthirdtoptxt.text = '44';
                                _controllerthirdbottxt.text = hexagramVerbList[44];
                                break;
                              case 213:
                                _controllerthirdtoptxt.text = '28';
                                _controllerthirdbottxt.text = hexagramVerbList[28];
                                break;
                              case 313:
                                _controllerthirdtoptxt.text = '50';
                                _controllerthirdbottxt.text = hexagramVerbList[50];
                                break;
                              case 413:
                                _controllerthirdtoptxt.text = '32';
                                _controllerthirdbottxt.text = hexagramVerbList[32];
                                break;
                              case 123:
                                _controllerthirdtoptxt.text = '57';
                                _controllerthirdbottxt.text = hexagramVerbList[57];
                                break;
                              case 223:
                                _controllerthirdtoptxt.text = '48';
                                _controllerthirdbottxt.text = hexagramVerbList[48];
                                break;
                              case 323:
                                _controllerthirdtoptxt.text = '18';
                                _controllerthirdbottxt.text = hexagramVerbList[18];
                                break;
                              case 423:
                                _controllerthirdtoptxt.text = '46';
                                _controllerthirdbottxt.text = hexagramVerbList[46];
                                break;
                              case 133:
                                _controllerthirdtoptxt.text = '6';
                                _controllerthirdbottxt.text = hexagramVerbList[6];
                                break;
                              case 233:
                                _controllerthirdtoptxt.text = '47';
                                _controllerthirdbottxt.text = hexagramVerbList[47];
                                break;
                              case 333:
                                _controllerthirdtoptxt.text = '64';
                                _controllerthirdbottxt.text = hexagramVerbList[64];
                                break;
                              case 433:
                                _controllerthirdtoptxt.text = '40';
                                _controllerthirdbottxt.text = hexagramVerbList[40];
                                break;
                              case 143:
                                _controllerthirdtoptxt.text = '59';
                                _controllerthirdbottxt.text = hexagramVerbList[59];
                                break;
                              case 243:
                                _controllerthirdtoptxt.text = '29';
                                _controllerthirdbottxt.text = hexagramVerbList[29];
                                break;
                              case 343:
                                _controllerthirdtoptxt.text = '4';
                                _controllerthirdbottxt.text = hexagramVerbList[4];
                                break;
                              case 443:
                                _controllerthirdtoptxt.text = '7';
                                _controllerthirdbottxt.text = hexagramVerbList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllerthirdtoptxt.text = '33';
                                _controllerthirdbottxt.text = hexagramVerbList[33];
                                break;
                              case 214:
                                _controllerthirdtoptxt.text = '31';
                                _controllerthirdbottxt.text = hexagramVerbList[31];
                                break;
                              case 314:
                                _controllerthirdtoptxt.text = '56';
                                _controllerthirdbottxt.text = hexagramVerbList[56];
                                break;
                              case 414:
                                _controllerthirdtoptxt.text = '62';
                                _controllerthirdbottxt.text = hexagramVerbList[62];
                                break;
                              case 124:
                                _controllerthirdtoptxt.text = '53';
                                _controllerthirdbottxt.text = hexagramVerbList[53];
                                break;
                              case 224:
                                _controllerthirdtoptxt.text = '39';
                                _controllerthirdbottxt.text = hexagramVerbList[39];
                                break;
                              case 324:
                                _controllerthirdtoptxt.text = '52';
                                _controllerthirdbottxt.text = hexagramVerbList[52];
                                break;
                              case 424:
                                _controllerthirdtoptxt.text = '15';
                                _controllerthirdbottxt.text = hexagramVerbList[15];
                                break;
                              case 134:
                                _controllerthirdtoptxt.text = '12';
                                _controllerthirdbottxt.text = hexagramVerbList[12];
                                break;
                              case 234:
                                _controllerthirdtoptxt.text = '45';
                                _controllerthirdbottxt.text = hexagramVerbList[45];
                                break;
                              case 334:
                                _controllerthirdtoptxt.text = '35';
                                _controllerthirdbottxt.text = hexagramVerbList[35];
                                break;
                              case 434:
                                _controllerthirdtoptxt.text = '16';
                                _controllerthirdbottxt.text = hexagramVerbList[16];
                                break;
                              case 144:
                                _controllerthirdtoptxt.text = '20';
                                _controllerthirdbottxt.text = hexagramVerbList[20];
                                break;
                              case 244:
                                _controllerthirdtoptxt.text = '8';
                                _controllerthirdbottxt.text = hexagramVerbList[8];
                                break;
                              case 344:
                                _controllerthirdtoptxt.text = '23';
                                _controllerthirdbottxt.text = hexagramVerbList[23];
                                break;
                              case 444:
                                _controllerthirdtoptxt.text = '2';
                                _controllerthirdbottxt.text = hexagramVerbList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerthirdmid,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexthirdmid, reason) {
                          setState(() {
                            _currentthirdmid = indexthirdmid;
                            hexagramVal = ((_currentthirdtop + 1) * 100 +
                                (_currentthirdmid + 1) * 10 +
                                (_currentthirdbot + 1));
                            switch (hexagramVal) {
                            //Quarter of Mutation
                              case 111:
                                _controllerthirdtoptxt.text = '1';
                                _controllerthirdbottxt.text = hexagramVerbList[1];
                                break;
                              case 211:
                                _controllerthirdtoptxt.text = '43';
                                _controllerthirdbottxt.text = hexagramVerbList[43];
                                break;
                              case 311:
                                _controllerthirdtoptxt.text = '14';
                                _controllerthirdbottxt.text = hexagramVerbList[14];
                                break;
                              case 411:
                                _controllerthirdtoptxt.text = '34';
                                _controllerthirdbottxt.text = hexagramVerbList[34];
                                break;
                              case 121:
                                _controllerthirdtoptxt.text = '9';
                                _controllerthirdbottxt.text = hexagramVerbList[9];
                                break;
                              case 221:
                                _controllerthirdtoptxt.text = '5';
                                _controllerthirdbottxt.text = hexagramVerbList[5];
                                break;
                              case 321:
                                _controllerthirdtoptxt.text = '26';
                                _controllerthirdbottxt.text = hexagramVerbList[26];
                                break;
                              case 421:
                                _controllerthirdtoptxt.text = '11';
                                _controllerthirdbottxt.text = hexagramVerbList[11];
                                break;
                              case 131:
                                _controllerthirdtoptxt.text = '10';
                                _controllerthirdbottxt.text = hexagramVerbList[10];
                                break;
                              case 231:
                                _controllerthirdtoptxt.text = '58';
                                _controllerthirdbottxt.text = hexagramVerbList[58];
                                break;
                              case 331:
                                _controllerthirdtoptxt.text = '38';
                                _controllerthirdbottxt.text = hexagramVerbList[38];
                                break;
                              case 431:
                                _controllerthirdtoptxt.text = '54';
                                _controllerthirdbottxt.text = hexagramVerbList[54];
                                break;
                              case 141:
                                _controllerthirdtoptxt.text = '61';
                                _controllerthirdbottxt.text = hexagramVerbList[61];
                                break;
                              case 241:
                                _controllerthirdtoptxt.text = '60';
                                _controllerthirdbottxt.text = hexagramVerbList[60];
                                break;
                              case 341:
                                _controllerthirdtoptxt.text = '41';
                                _controllerthirdbottxt.text = hexagramVerbList[41];
                                break;
                              case 441:
                                _controllerthirdtoptxt.text = '19';
                                _controllerthirdbottxt.text = hexagramVerbList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllerthirdtoptxt.text = '13';
                                _controllerthirdbottxt.text = hexagramVerbList[13];
                                break;
                              case 212:
                                _controllerthirdtoptxt.text = '49';
                                _controllerthirdbottxt.text = hexagramVerbList[49];
                                break;
                              case 312:
                                _controllerthirdtoptxt.text = '30';
                                _controllerthirdbottxt.text = hexagramVerbList[30];
                                break;
                              case 412:
                                _controllerthirdtoptxt.text = '55';
                                _controllerthirdbottxt.text = hexagramVerbList[55];
                                break;
                              case 122:
                                _controllerthirdtoptxt.text = '37';
                                _controllerthirdbottxt.text = hexagramVerbList[37];
                                break;
                              case 222:
                                _controllerthirdtoptxt.text = '63';
                                _controllerthirdbottxt.text = hexagramVerbList[63];
                                break;
                              case 322:
                                _controllerthirdtoptxt.text = '22';
                                _controllerthirdbottxt.text = hexagramVerbList[22];
                                break;
                              case 422:
                                _controllerthirdtoptxt.text = '36';
                                _controllerthirdbottxt.text = hexagramVerbList[36];
                                break;
                              case 132:
                                _controllerthirdtoptxt.text = '25';
                                _controllerthirdbottxt.text = hexagramVerbList[25];
                                break;
                              case 232:
                                _controllerthirdtoptxt.text = '17';
                                _controllerthirdbottxt.text = hexagramVerbList[17];
                                break;
                              case 332:
                                _controllerthirdtoptxt.text = '21';
                                _controllerthirdbottxt.text = hexagramVerbList[21];
                                break;
                              case 432:
                                _controllerthirdtoptxt.text = '51';
                                _controllerthirdbottxt.text = hexagramVerbList[51];
                                break;
                              case 142:
                                _controllerthirdtoptxt.text = '42';
                                _controllerthirdbottxt.text = hexagramVerbList[42];
                                break;
                              case 242:
                                _controllerthirdtoptxt.text = '3';
                                _controllerthirdbottxt.text = hexagramVerbList[3];
                                break;
                              case 342:
                                _controllerthirdtoptxt.text = '27';
                                _controllerthirdbottxt.text = hexagramVerbList[27];
                                break;
                              case 442:
                                _controllerthirdtoptxt.text = '24';
                                _controllerthirdbottxt.text = hexagramVerbList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllerthirdtoptxt.text = '44';
                                _controllerthirdbottxt.text = hexagramVerbList[44];
                                break;
                              case 213:
                                _controllerthirdtoptxt.text = '28';
                                _controllerthirdbottxt.text = hexagramVerbList[28];
                                break;
                              case 313:
                                _controllerthirdtoptxt.text = '50';
                                _controllerthirdbottxt.text = hexagramVerbList[50];
                                break;
                              case 413:
                                _controllerthirdtoptxt.text = '32';
                                _controllerthirdbottxt.text = hexagramVerbList[32];
                                break;
                              case 123:
                                _controllerthirdtoptxt.text = '57';
                                _controllerthirdbottxt.text = hexagramVerbList[57];
                                break;
                              case 223:
                                _controllerthirdtoptxt.text = '48';
                                _controllerthirdbottxt.text = hexagramVerbList[48];
                                break;
                              case 323:
                                _controllerthirdtoptxt.text = '18';
                                _controllerthirdbottxt.text = hexagramVerbList[18];
                                break;
                              case 423:
                                _controllerthirdtoptxt.text = '46';
                                _controllerthirdbottxt.text = hexagramVerbList[46];
                                break;
                              case 133:
                                _controllerthirdtoptxt.text = '6';
                                _controllerthirdbottxt.text = hexagramVerbList[6];
                                break;
                              case 233:
                                _controllerthirdtoptxt.text = '47';
                                _controllerthirdbottxt.text = hexagramVerbList[47];
                                break;
                              case 333:
                                _controllerthirdtoptxt.text = '64';
                                _controllerthirdbottxt.text = hexagramVerbList[64];
                                break;
                              case 433:
                                _controllerthirdtoptxt.text = '40';
                                _controllerthirdbottxt.text = hexagramVerbList[40];
                                break;
                              case 143:
                                _controllerthirdtoptxt.text = '59';
                                _controllerthirdbottxt.text = hexagramVerbList[59];
                                break;
                              case 243:
                                _controllerthirdtoptxt.text = '29';
                                _controllerthirdbottxt.text = hexagramVerbList[29];
                                break;
                              case 343:
                                _controllerthirdtoptxt.text = '4';
                                _controllerthirdbottxt.text = hexagramVerbList[4];
                                break;
                              case 443:
                                _controllerthirdtoptxt.text = '7';
                                _controllerthirdbottxt.text = hexagramVerbList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllerthirdtoptxt.text = '33';
                                _controllerthirdbottxt.text = hexagramVerbList[33];
                                break;
                              case 214:
                                _controllerthirdtoptxt.text = '31';
                                _controllerthirdbottxt.text = hexagramVerbList[31];
                                break;
                              case 314:
                                _controllerthirdtoptxt.text = '56';
                                _controllerthirdbottxt.text = hexagramVerbList[56];
                                break;
                              case 414:
                                _controllerthirdtoptxt.text = '62';
                                _controllerthirdbottxt.text = hexagramVerbList[62];
                                break;
                              case 124:
                                _controllerthirdtoptxt.text = '53';
                                _controllerthirdbottxt.text = hexagramVerbList[53];
                                break;
                              case 224:
                                _controllerthirdtoptxt.text = '39';
                                _controllerthirdbottxt.text = hexagramVerbList[39];
                                break;
                              case 324:
                                _controllerthirdtoptxt.text = '52';
                                _controllerthirdbottxt.text = hexagramVerbList[52];
                                break;
                              case 424:
                                _controllerthirdtoptxt.text = '15';
                                _controllerthirdbottxt.text = hexagramVerbList[15];
                                break;
                              case 134:
                                _controllerthirdtoptxt.text = '12';
                                _controllerthirdbottxt.text = hexagramVerbList[12];
                                break;
                              case 234:
                                _controllerthirdtoptxt.text = '45';
                                _controllerthirdbottxt.text = hexagramVerbList[45];
                                break;
                              case 334:
                                _controllerthirdtoptxt.text = '35';
                                _controllerthirdbottxt.text = hexagramVerbList[35];
                                break;
                              case 434:
                                _controllerthirdtoptxt.text = '16';
                                _controllerthirdbottxt.text = hexagramVerbList[16];
                                break;
                              case 144:
                                _controllerthirdtoptxt.text = '20';
                                _controllerthirdbottxt.text = hexagramVerbList[20];
                                break;
                              case 244:
                                _controllerthirdtoptxt.text = '8';
                                _controllerthirdbottxt.text = hexagramVerbList[8];
                                break;
                              case 344:
                                _controllerthirdtoptxt.text = '23';
                                _controllerthirdbottxt.text = hexagramVerbList[23];
                                break;
                              case 444:
                                _controllerthirdtoptxt.text = '2';
                                _controllerthirdbottxt.text = hexagramVerbList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerthirdbot,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexthirdbot, reason) {
                          setState(() {
                            _currentthirdbot = indexthirdbot;
                            hexagramVal = ((_currentthirdtop + 1) * 100 +
                                (_currentthirdmid + 1) * 10 +
                                (_currentthirdbot + 1));
                            switch (hexagramVal) {
                            //Quarter of Mutation
                              case 111:
                                _controllerthirdtoptxt.text = '1';
                                _controllerthirdbottxt.text = hexagramVerbList[1];
                                break;
                              case 211:
                                _controllerthirdtoptxt.text = '43';
                                _controllerthirdbottxt.text = hexagramVerbList[43];
                                break;
                              case 311:
                                _controllerthirdtoptxt.text = '14';
                                _controllerthirdbottxt.text = hexagramVerbList[14];
                                break;
                              case 411:
                                _controllerthirdtoptxt.text = '34';
                                _controllerthirdbottxt.text = hexagramVerbList[34];
                                break;
                              case 121:
                                _controllerthirdtoptxt.text = '9';
                                _controllerthirdbottxt.text = hexagramVerbList[9];
                                break;
                              case 221:
                                _controllerthirdtoptxt.text = '5';
                                _controllerthirdbottxt.text = hexagramVerbList[5];
                                break;
                              case 321:
                                _controllerthirdtoptxt.text = '26';
                                _controllerthirdbottxt.text = hexagramVerbList[26];
                                break;
                              case 421:
                                _controllerthirdtoptxt.text = '11';
                                _controllerthirdbottxt.text = hexagramVerbList[11];
                                break;
                              case 131:
                                _controllerthirdtoptxt.text = '10';
                                _controllerthirdbottxt.text = hexagramVerbList[10];
                                break;
                              case 231:
                                _controllerthirdtoptxt.text = '58';
                                _controllerthirdbottxt.text = hexagramVerbList[58];
                                break;
                              case 331:
                                _controllerthirdtoptxt.text = '38';
                                _controllerthirdbottxt.text = hexagramVerbList[38];
                                break;
                              case 431:
                                _controllerthirdtoptxt.text = '54';
                                _controllerthirdbottxt.text = hexagramVerbList[54];
                                break;
                              case 141:
                                _controllerthirdtoptxt.text = '61';
                                _controllerthirdbottxt.text = hexagramVerbList[61];
                                break;
                              case 241:
                                _controllerthirdtoptxt.text = '60';
                                _controllerthirdbottxt.text = hexagramVerbList[60];
                                break;
                              case 341:
                                _controllerthirdtoptxt.text = '41';
                                _controllerthirdbottxt.text = hexagramVerbList[41];
                                break;
                              case 441:
                                _controllerthirdtoptxt.text = '19';
                                _controllerthirdbottxt.text = hexagramVerbList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllerthirdtoptxt.text = '13';
                                _controllerthirdbottxt.text = hexagramVerbList[13];
                                break;
                              case 212:
                                _controllerthirdtoptxt.text = '49';
                                _controllerthirdbottxt.text = hexagramVerbList[49];
                                break;
                              case 312:
                                _controllerthirdtoptxt.text = '30';
                                _controllerthirdbottxt.text = hexagramVerbList[30];
                                break;
                              case 412:
                                _controllerthirdtoptxt.text = '55';
                                _controllerthirdbottxt.text = hexagramVerbList[55];
                                break;
                              case 122:
                                _controllerthirdtoptxt.text = '37';
                                _controllerthirdbottxt.text = hexagramVerbList[37];
                                break;
                              case 222:
                                _controllerthirdtoptxt.text = '63';
                                _controllerthirdbottxt.text = hexagramVerbList[63];
                                break;
                              case 322:
                                _controllerthirdtoptxt.text = '22';
                                _controllerthirdbottxt.text = hexagramVerbList[22];
                                break;
                              case 422:
                                _controllerthirdtoptxt.text = '36';
                                _controllerthirdbottxt.text = hexagramVerbList[36];
                                break;
                              case 132:
                                _controllerthirdtoptxt.text = '25';
                                _controllerthirdbottxt.text = hexagramVerbList[25];
                                break;
                              case 232:
                                _controllerthirdtoptxt.text = '17';
                                _controllerthirdbottxt.text = hexagramVerbList[17];
                                break;
                              case 332:
                                _controllerthirdtoptxt.text = '21';
                                _controllerthirdbottxt.text = hexagramVerbList[21];
                                break;
                              case 432:
                                _controllerthirdtoptxt.text = '51';
                                _controllerthirdbottxt.text = hexagramVerbList[51];
                                break;
                              case 142:
                                _controllerthirdtoptxt.text = '42';
                                _controllerthirdbottxt.text = hexagramVerbList[42];
                                break;
                              case 242:
                                _controllerthirdtoptxt.text = '3';
                                _controllerthirdbottxt.text = hexagramVerbList[3];
                                break;
                              case 342:
                                _controllerthirdtoptxt.text = '27';
                                _controllerthirdbottxt.text = hexagramVerbList[27];
                                break;
                              case 442:
                                _controllerthirdtoptxt.text = '24';
                                _controllerthirdbottxt.text = hexagramVerbList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllerthirdtoptxt.text = '44';
                                _controllerthirdbottxt.text = hexagramVerbList[44];
                                break;
                              case 213:
                                _controllerthirdtoptxt.text = '28';
                                _controllerthirdbottxt.text = hexagramVerbList[28];
                                break;
                              case 313:
                                _controllerthirdtoptxt.text = '50';
                                _controllerthirdbottxt.text = hexagramVerbList[50];
                                break;
                              case 413:
                                _controllerthirdtoptxt.text = '32';
                                _controllerthirdbottxt.text = hexagramVerbList[32];
                                break;
                              case 123:
                                _controllerthirdtoptxt.text = '57';
                                _controllerthirdbottxt.text = hexagramVerbList[57];
                                break;
                              case 223:
                                _controllerthirdtoptxt.text = '48';
                                _controllerthirdbottxt.text = hexagramVerbList[48];
                                break;
                              case 323:
                                _controllerthirdtoptxt.text = '18';
                                _controllerthirdbottxt.text = hexagramVerbList[18];
                                break;
                              case 423:
                                _controllerthirdtoptxt.text = '46';
                                _controllerthirdbottxt.text = hexagramVerbList[46];
                                break;
                              case 133:
                                _controllerthirdtoptxt.text = '6';
                                _controllerthirdbottxt.text = hexagramVerbList[6];
                                break;
                              case 233:
                                _controllerthirdtoptxt.text = '47';
                                _controllerthirdbottxt.text = hexagramVerbList[47];
                                break;
                              case 333:
                                _controllerthirdtoptxt.text = '64';
                                _controllerthirdbottxt.text = hexagramVerbList[64];
                                break;
                              case 433:
                                _controllerthirdtoptxt.text = '40';
                                _controllerthirdbottxt.text = hexagramVerbList[40];
                                break;
                              case 143:
                                _controllerthirdtoptxt.text = '59';
                                _controllerthirdbottxt.text = hexagramVerbList[59];
                                break;
                              case 243:
                                _controllerthirdtoptxt.text = '29';
                                _controllerthirdbottxt.text = hexagramVerbList[29];
                                break;
                              case 343:
                                _controllerthirdtoptxt.text = '4';
                                _controllerthirdbottxt.text = hexagramVerbList[4];
                                break;
                              case 443:
                                _controllerthirdtoptxt.text = '7';
                                _controllerthirdbottxt.text = hexagramVerbList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllerthirdtoptxt.text = '33';
                                _controllerthirdbottxt.text = hexagramVerbList[33];
                                break;
                              case 214:
                                _controllerthirdtoptxt.text = '31';
                                _controllerthirdbottxt.text = hexagramVerbList[31];
                                break;
                              case 314:
                                _controllerthirdtoptxt.text = '56';
                                _controllerthirdbottxt.text = hexagramVerbList[56];
                                break;
                              case 414:
                                _controllerthirdtoptxt.text = '62';
                                _controllerthirdbottxt.text = hexagramVerbList[62];
                                break;
                              case 124:
                                _controllerthirdtoptxt.text = '53';
                                _controllerthirdbottxt.text = hexagramVerbList[53];
                                break;
                              case 224:
                                _controllerthirdtoptxt.text = '39';
                                _controllerthirdbottxt.text = hexagramVerbList[39];
                                break;
                              case 324:
                                _controllerthirdtoptxt.text = '52';
                                _controllerthirdbottxt.text = hexagramVerbList[52];
                                break;
                              case 424:
                                _controllerthirdtoptxt.text = '15';
                                _controllerthirdbottxt.text = hexagramVerbList[15];
                                break;
                              case 134:
                                _controllerthirdtoptxt.text = '12';
                                _controllerthirdbottxt.text = hexagramVerbList[12];
                                break;
                              case 234:
                                _controllerthirdtoptxt.text = '45';
                                _controllerthirdbottxt.text = hexagramVerbList[45];
                                break;
                              case 334:
                                _controllerthirdtoptxt.text = '35';
                                _controllerthirdbottxt.text = hexagramVerbList[35];
                                break;
                              case 434:
                                _controllerthirdtoptxt.text = '16';
                                _controllerthirdbottxt.text = hexagramVerbList[16];
                                break;
                              case 144:
                                _controllerthirdtoptxt.text = '20';
                                _controllerthirdbottxt.text = hexagramVerbList[20];
                                break;
                              case 244:
                                _controllerthirdtoptxt.text = '8';
                                _controllerthirdbottxt.text = hexagramVerbList[8];
                                break;
                              case 344:
                                _controllerthirdtoptxt.text = '23';
                                _controllerthirdbottxt.text = hexagramVerbList[23];
                                break;
                              case 444:
                                _controllerthirdtoptxt.text = '2';
                                _controllerthirdbottxt.text = hexagramVerbList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
              ])),
          Expanded(
              child: Column(children: [
                const Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  DropdownButton(
                    value: dropdownfourthichingordervalue,
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: orderHexagramsWheelList,
                    onChanged: (String? dropdownfourthichingordervalueChange) {
                      setState(() {
                        dropdownfourthichingordervalue =
                        dropdownfourthichingordervalueChange!;
                        switch (dropdownfourthichingordervalueChange) {
                        //Quarter of Mutation
                          case '1':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '43':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '14':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '34':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '9':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '5':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '26':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '11':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '10':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '58':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '38':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '54':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '61':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '60':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '41':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '19':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                          case '13':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '49':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '30':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '55':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '37':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '63':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '22':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '36':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '25':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '17':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '21':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '51':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '42':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '3':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '27':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '24':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                          case '44':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '28':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '50':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '32':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '57':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '48':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '18':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '46':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '6':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '47':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '64':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '40':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '59':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '29':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '4':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '7':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;

                        //Quarter of Civilization
                          case '33':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '31':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '56':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '62':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '53':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '39':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '52':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '15':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '12':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '45':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '35':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '16':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '20':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '8':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '23':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '2':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          default:
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        }
                      });
                    },
                  ),
                  DropdownButton(
                    value: dropdownfourthichingvalue,
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: fontHexList,
                    onChanged: (String? dropdownfourthichingvalueChange) {
                      setState(() {
                        dropdownfourthichingvalue =
                        dropdownfourthichingvalueChange!;
                        switch (dropdownfourthichingvalueChange) {
                        //Quarter of Mutation
                          case 'a':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '43':
                        //case '44':
                          case 'b':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '14':
                        //case '13':
                          case 'c':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '34':
                        //case '10':
                          case 'd':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '9':
                        //case '9':
                          case 'e':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '5':
                        //case '14':
                          case 'f':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '26':
                        //case '43':
                          case 'g':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '11':
                        //case '33':
                          case 'h':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '10':
                        //case '25':
                          case 'i':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '58':
                        //case '61':
                          case 'j':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '38':
                        //case '26':
                          case 'k':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '54':
                        //case '34':
                          case 'l':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '61':
                        //case '6':
                          case 'm':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '60':
                        //case '37':
                          case 'n':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '41':
                        //case '38':
                          case 'o':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '19':
                        //case '5':
                          case 'p':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                        //case '13':
                        //case '57':
                          case 'q':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '49':
                        //case '30':
                          case 'r':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '30':
                        //case '58':
                          case 's':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '55':
                        //case '50':
                          case 't':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '37':
                        //case '49'':
                          case 'u':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '63':
                        //case '28':
                          case 'v':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '22':
                        //case '12':
                          case 'w':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '36':
                        //case '42':
                          case 'x':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '25':
                        //case '41':
                          case 'y':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '17':
                        //case '11':
                          case 'z':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '21':
                        //case '62':
                          case '1':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '51':
                        //case '45':
                          case '2':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '42':
                        //case '29':
                          case '3':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '3':
                        //case '39':
                          case '4':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '27':
                        //case '40':
                          case '5':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '24':
                        //case '24':
                          case '6':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                        //case '44':
                        //case '7':
                          case '7':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '28':
                        //case '15':
                          case '8':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '50':
                        //case '16':
                          case '9':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '32':
                        //case '8':
                          case '0':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '57':
                        //case '23':
                          case '!':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '48':
                        //case '2':
                          case '@':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '18':
                        //case '59':
                          case 'A':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '46':
                        //case '22':
                          case 'B':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '6':
                        //case '54':
                          case 'C':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '47':
                        //case '53':
                          case 'D':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '64':
                        //case '21':
                          case 'E':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '40':
                        //case '60':
                          case 'F':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '59':
                        //case '18':
                          case 'G':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '29':
                        //case '55':
                          case 'H':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '4':
                        //case '56':
                          case 'I':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '7':
                        //case '17':
                          case 'J':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;

                        //Quarter of Civilization
                        //case '33':
                        //case '32':
                          case 'K':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '31':
                        //case '31':
                          case 'L':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '56':
                        //case '47':
                          case 'M':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '62':
                        //case '48':
                          case 'N':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '53':
                        //case '63':
                          case 'O':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '39':
                        //case '64':
                          case 'P':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '52':
                        //case '20':
                          case 'Q':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '15':
                        //case '27':
                          case 'R':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '12':
                        //case '19':
                          case 'S':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        //case '45':
                        //case '4':
                          case 'T':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;
                        //case '35':
                        //case '36':
                          case 'U':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '16':
                        //case '52':
                          case 'V':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '20':
                        //case '51':
                          case 'W':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '8':
                        //case '35':
                          case 'X':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                        //case '23':
                        //case '3':
                          case 'Y':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;
                        //case '2':
                        //case '46':
                          case 'Z':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          default:
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                        }
                      });
                    },
                  ),
                  DropdownButton(
                    value: dropdownfourthvalue,
                    icon:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    items: hexDropDownNumbersList,
                    onChanged: (String? dropdownfourthvalueChange) {
                      setState(() {
                        dropdownfourthvalue = dropdownfourthvalueChange!;
                        switch (dropdownfourthvalueChange) {
                        //Quarter of Mutation
                          case '1':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '43':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '14':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '34':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '9':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '5':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '26':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '11':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '10':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '58':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '38':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '54':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '61':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '60':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '41':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;
                          case '19':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(0);
                            break;

                        //Quarter of Initiation
                          case '13':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '49':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '30':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '55':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '37':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '63':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '22':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '36':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '25':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '17':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '21':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '51':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '42':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '3':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '27':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;
                          case '24':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(1);
                            break;

                        //Quarter of Duality
                          case '44':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '28':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '50':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '32':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '57':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '48':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '18':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '46':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '6':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '47':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '64':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '40':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '59':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '29':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '4':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;
                          case '7':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(2);
                            break;

                        //Quarter of Civilization
                          case '33':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '31':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '56':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '62':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '53':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '39':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '52':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '15':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(1);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '12':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '45':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '35':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '16':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(2);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '20':
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '8':
                            _controllerfourthtop.animateToPage(1);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '23':
                            _controllerfourthtop.animateToPage(2);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          case '2':
                            _controllerfourthtop.animateToPage(3);
                            _controllerfourthmid.animateToPage(3);
                            _controllerfourthbot.animateToPage(3);
                            break;
                          default:
                            _controllerfourthtop.animateToPage(0);
                            _controllerfourthmid.animateToPage(0);
                            _controllerfourthbot.animateToPage(0);
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
                  controller: _controllerfourthtoptxt,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Creatively',
                      hintStyle: TextStyle(color: Colors.grey)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: _controllerfourthbottxt,
                  readOnly: true,
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerfourthtop,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexfourthtop, reason) {
                          setState(() {
                            _currentfourthtop = indexfourthtop;
                            hexagramVal = ((_currentfourthtop + 1) * 100 +
                                (_currentfourthmid + 1) * 10 +
                                (_currentfourthbot + 1));
                            switch (hexagramVal) {
                            //Quarter of Mutation
                              case 111:
                                _controllerfourthtoptxt.text = '1';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[1];
                                break;
                              case 211:
                                _controllerfourthtoptxt.text = '43';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[43];
                                break;
                              case 311:
                                _controllerfourthtoptxt.text = '14';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[14];
                                break;
                              case 411:
                                _controllerfourthtoptxt.text = '34';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[34];
                                break;
                              case 121:
                                _controllerfourthtoptxt.text = '9';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[9];
                                break;
                              case 221:
                                _controllerfourthtoptxt.text = '5';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[5];
                                break;
                              case 321:
                                _controllerfourthtoptxt.text = '26';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[26];
                                break;
                              case 421:
                                _controllerfourthtoptxt.text = '11';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[11];
                                break;
                              case 131:
                                _controllerfourthtoptxt.text = '10';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[10];
                                break;
                              case 231:
                                _controllerfourthtoptxt.text = '58';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[58];
                                break;
                              case 331:
                                _controllerfourthtoptxt.text = '38';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[38];
                                break;
                              case 431:
                                _controllerfourthtoptxt.text = '54';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[54];
                                break;
                              case 141:
                                _controllerfourthtoptxt.text = '61';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[61];
                                break;
                              case 241:
                                _controllerfourthtoptxt.text = '60';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[60];
                                break;
                              case 341:
                                _controllerfourthtoptxt.text = '41';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[41];
                                break;
                              case 441:
                                _controllerfourthtoptxt.text = '19';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllerfourthtoptxt.text = '13';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[13];
                                break;
                              case 212:
                                _controllerfourthtoptxt.text = '49';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[49];
                                break;
                              case 312:
                                _controllerfourthtoptxt.text = '30';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[30];
                                break;
                              case 412:
                                _controllerfourthtoptxt.text = '55';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[55];
                                break;
                              case 122:
                                _controllerfourthtoptxt.text = '37';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[37];
                                break;
                              case 222:
                                _controllerfourthtoptxt.text = '63';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[63];
                                break;
                              case 322:
                                _controllerfourthtoptxt.text = '22';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[22];
                                break;
                              case 422:
                                _controllerfourthtoptxt.text = '36';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[36];
                                break;
                              case 132:
                                _controllerfourthtoptxt.text = '25';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[25];
                                break;
                              case 232:
                                _controllerfourthtoptxt.text = '17';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[17];
                                break;
                              case 332:
                                _controllerfourthtoptxt.text = '21';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[21];
                                break;
                              case 432:
                                _controllerfourthtoptxt.text = '51';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[51];
                                break;
                              case 142:
                                _controllerfourthtoptxt.text = '42';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[42];
                                break;
                              case 242:
                                _controllerfourthtoptxt.text = '3';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[3];
                                break;
                              case 342:
                                _controllerfourthtoptxt.text = '27';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[27];
                                break;
                              case 442:
                                _controllerfourthtoptxt.text = '24';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllerfourthtoptxt.text = '44';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[44];
                                break;
                              case 213:
                                _controllerfourthtoptxt.text = '28';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[28];
                                break;
                              case 313:
                                _controllerfourthtoptxt.text = '50';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[50];
                                break;
                              case 413:
                                _controllerfourthtoptxt.text = '32';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[32];
                                break;
                              case 123:
                                _controllerfourthtoptxt.text = '57';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[57];
                                break;
                              case 223:
                                _controllerfourthtoptxt.text = '48';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[48];
                                break;
                              case 323:
                                _controllerfourthtoptxt.text = '18';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[18];
                                break;
                              case 423:
                                _controllerfourthtoptxt.text = '46';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[46];
                                break;
                              case 133:
                                _controllerfourthtoptxt.text = '6';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[6];
                                break;
                              case 233:
                                _controllerfourthtoptxt.text = '47';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[47];
                                break;
                              case 333:
                                _controllerfourthtoptxt.text = '64';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[64];
                                break;
                              case 433:
                                _controllerfourthtoptxt.text = '40';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[40];
                                break;
                              case 143:
                                _controllerfourthtoptxt.text = '59';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[59];
                                break;
                              case 243:
                                _controllerfourthtoptxt.text = '29';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[29];
                                break;
                              case 343:
                                _controllerfourthtoptxt.text = '4';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[4];
                                break;
                              case 443:
                                _controllerfourthtoptxt.text = '7';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllerfourthtoptxt.text = '33';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[33];
                                break;
                              case 214:
                                _controllerfourthtoptxt.text = '31';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[31];
                                break;
                              case 314:
                                _controllerfourthtoptxt.text = '56';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[56];
                                break;
                              case 414:
                                _controllerfourthtoptxt.text = '62';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[62];
                                break;
                              case 124:
                                _controllerfourthtoptxt.text = '53';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[53];
                                break;
                              case 224:
                                _controllerfourthtoptxt.text = '39';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[39];
                                break;
                              case 324:
                                _controllerfourthtoptxt.text = '52';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[52];
                                break;
                              case 424:
                                _controllerfourthtoptxt.text = '15';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[15];
                                break;
                              case 134:
                                _controllerfourthtoptxt.text = '12';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[12];
                                break;
                              case 234:
                                _controllerfourthtoptxt.text = '45';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[45];
                                break;
                              case 334:
                                _controllerfourthtoptxt.text = '35';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[35];
                                break;
                              case 434:
                                _controllerfourthtoptxt.text = '16';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[16];
                                break;
                              case 144:
                                _controllerfourthtoptxt.text = '20';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[20];
                                break;
                              case 244:
                                _controllerfourthtoptxt.text = '8';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[8];
                                break;
                              case 344:
                                _controllerfourthtoptxt.text = '23';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[23];
                                break;
                              case 444:
                                _controllerfourthtoptxt.text = '2';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerfourthmid,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexfourthmid, reason) {
                          setState(() {
                            _currentfourthmid = indexfourthmid;
                            hexagramVal = ((_currentfourthtop + 1) * 100 +
                                (_currentfourthmid + 1) * 10 +
                                (_currentfourthbot + 1));
                            switch (hexagramVal) {
                            //Quarter of Mutation
                              case 111:
                                _controllerfourthtoptxt.text = '1';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[1];
                                break;
                              case 211:
                                _controllerfourthtoptxt.text = '43';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[43];
                                break;
                              case 311:
                                _controllerfourthtoptxt.text = '14';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[14];
                                break;
                              case 411:
                                _controllerfourthtoptxt.text = '34';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[34];
                                break;
                              case 121:
                                _controllerfourthtoptxt.text = '9';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[9];
                                break;
                              case 221:
                                _controllerfourthtoptxt.text = '5';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[5];
                                break;
                              case 321:
                                _controllerfourthtoptxt.text = '26';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[26];
                                break;
                              case 421:
                                _controllerfourthtoptxt.text = '11';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[11];
                                break;
                              case 131:
                                _controllerfourthtoptxt.text = '10';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[10];
                                break;
                              case 231:
                                _controllerfourthtoptxt.text = '58';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[58];
                                break;
                              case 331:
                                _controllerfourthtoptxt.text = '38';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[38];
                                break;
                              case 431:
                                _controllerfourthtoptxt.text = '54';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[54];
                                break;
                              case 141:
                                _controllerfourthtoptxt.text = '61';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[61];
                                break;
                              case 241:
                                _controllerfourthtoptxt.text = '60';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[60];
                                break;
                              case 341:
                                _controllerfourthtoptxt.text = '41';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[41];
                                break;
                              case 441:
                                _controllerfourthtoptxt.text = '19';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllerfourthtoptxt.text = '13';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[13];
                                break;
                              case 212:
                                _controllerfourthtoptxt.text = '49';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[49];
                                break;
                              case 312:
                                _controllerfourthtoptxt.text = '30';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[30];
                                break;
                              case 412:
                                _controllerfourthtoptxt.text = '55';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[55];
                                break;
                              case 122:
                                _controllerfourthtoptxt.text = '37';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[37];
                                break;
                              case 222:
                                _controllerfourthtoptxt.text = '63';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[63];
                                break;
                              case 322:
                                _controllerfourthtoptxt.text = '22';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[22];
                                break;
                              case 422:
                                _controllerfourthtoptxt.text = '36';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[36];
                                break;
                              case 132:
                                _controllerfourthtoptxt.text = '25';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[25];
                                break;
                              case 232:
                                _controllerfourthtoptxt.text = '17';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[17];
                                break;
                              case 332:
                                _controllerfourthtoptxt.text = '21';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[21];
                                break;
                              case 432:
                                _controllerfourthtoptxt.text = '51';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[51];
                                break;
                              case 142:
                                _controllerfourthtoptxt.text = '42';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[42];
                                break;
                              case 242:
                                _controllerfourthtoptxt.text = '3';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[3];
                                break;
                              case 342:
                                _controllerfourthtoptxt.text = '27';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[27];
                                break;
                              case 442:
                                _controllerfourthtoptxt.text = '24';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllerfourthtoptxt.text = '44';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[44];
                                break;
                              case 213:
                                _controllerfourthtoptxt.text = '28';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[28];
                                break;
                              case 313:
                                _controllerfourthtoptxt.text = '50';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[50];
                                break;
                              case 413:
                                _controllerfourthtoptxt.text = '32';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[32];
                                break;
                              case 123:
                                _controllerfourthtoptxt.text = '57';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[57];
                                break;
                              case 223:
                                _controllerfourthtoptxt.text = '48';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[48];
                                break;
                              case 323:
                                _controllerfourthtoptxt.text = '18';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[18];
                                break;
                              case 423:
                                _controllerfourthtoptxt.text = '46';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[46];
                                break;
                              case 133:
                                _controllerfourthtoptxt.text = '6';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[6];
                                break;
                              case 233:
                                _controllerfourthtoptxt.text = '47';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[47];
                                break;
                              case 333:
                                _controllerfourthtoptxt.text = '64';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[64];
                                break;
                              case 433:
                                _controllerfourthtoptxt.text = '40';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[40];
                                break;
                              case 143:
                                _controllerfourthtoptxt.text = '59';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[59];
                                break;
                              case 243:
                                _controllerfourthtoptxt.text = '29';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[29];
                                break;
                              case 343:
                                _controllerfourthtoptxt.text = '4';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[4];
                                break;
                              case 443:
                                _controllerfourthtoptxt.text = '7';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllerfourthtoptxt.text = '33';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[33];
                                break;
                              case 214:
                                _controllerfourthtoptxt.text = '31';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[31];
                                break;
                              case 314:
                                _controllerfourthtoptxt.text = '56';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[56];
                                break;
                              case 414:
                                _controllerfourthtoptxt.text = '62';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[62];
                                break;
                              case 124:
                                _controllerfourthtoptxt.text = '53';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[53];
                                break;
                              case 224:
                                _controllerfourthtoptxt.text = '39';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[39];
                                break;
                              case 324:
                                _controllerfourthtoptxt.text = '52';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[52];
                                break;
                              case 424:
                                _controllerfourthtoptxt.text = '15';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[15];
                                break;
                              case 134:
                                _controllerfourthtoptxt.text = '12';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[12];
                                break;
                              case 234:
                                _controllerfourthtoptxt.text = '45';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[45];
                                break;
                              case 334:
                                _controllerfourthtoptxt.text = '35';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[35];
                                break;
                              case 434:
                                _controllerfourthtoptxt.text = '16';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[16];
                                break;
                              case 144:
                                _controllerfourthtoptxt.text = '20';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[20];
                                break;
                              case 244:
                                _controllerfourthtoptxt.text = '8';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[8];
                                break;
                              case 344:
                                _controllerfourthtoptxt.text = '23';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[23];
                                break;
                              case 444:
                                _controllerfourthtoptxt.text = '2';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    items: mixHexagramSlidersNew,
                    carouselController: _controllerfourthbot,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexfourthbot, reason) {
                          setState(() {
                            _currentfourthbot = indexfourthbot;
                            hexagramVal = ((_currentfourthtop + 1) * 100 +
                                (_currentfourthmid + 1) * 10 +
                                (_currentfourthbot + 1));
                            switch (hexagramVal) {
                            //Quarter of Mutation
                              case 111:
                                _controllerfourthtoptxt.text = '1';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[1];
                                break;
                              case 211:
                                _controllerfourthtoptxt.text = '43';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[43];
                                break;
                              case 311:
                                _controllerfourthtoptxt.text = '14';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[14];
                                break;
                              case 411:
                                _controllerfourthtoptxt.text = '34';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[34];
                                break;
                              case 121:
                                _controllerfourthtoptxt.text = '9';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[9];
                                break;
                              case 221:
                                _controllerfourthtoptxt.text = '5';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[5];
                                break;
                              case 321:
                                _controllerfourthtoptxt.text = '26';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[26];
                                break;
                              case 421:
                                _controllerfourthtoptxt.text = '11';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[11];
                                break;
                              case 131:
                                _controllerfourthtoptxt.text = '10';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[10];
                                break;
                              case 231:
                                _controllerfourthtoptxt.text = '58';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[58];
                                break;
                              case 331:
                                _controllerfourthtoptxt.text = '38';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[38];
                                break;
                              case 431:
                                _controllerfourthtoptxt.text = '54';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[54];
                                break;
                              case 141:
                                _controllerfourthtoptxt.text = '61';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[61];
                                break;
                              case 241:
                                _controllerfourthtoptxt.text = '60';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[60];
                                break;
                              case 341:
                                _controllerfourthtoptxt.text = '41';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[41];
                                break;
                              case 441:
                                _controllerfourthtoptxt.text = '19';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[19];
                                break;
                            //Quarter of Initiation
                              case 112:
                                _controllerfourthtoptxt.text = '13';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[13];
                                break;
                              case 212:
                                _controllerfourthtoptxt.text = '49';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[49];
                                break;
                              case 312:
                                _controllerfourthtoptxt.text = '30';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[30];
                                break;
                              case 412:
                                _controllerfourthtoptxt.text = '55';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[55];
                                break;
                              case 122:
                                _controllerfourthtoptxt.text = '37';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[37];
                                break;
                              case 222:
                                _controllerfourthtoptxt.text = '63';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[63];
                                break;
                              case 322:
                                _controllerfourthtoptxt.text = '22';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[22];
                                break;
                              case 422:
                                _controllerfourthtoptxt.text = '36';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[36];
                                break;
                              case 132:
                                _controllerfourthtoptxt.text = '25';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[25];
                                break;
                              case 232:
                                _controllerfourthtoptxt.text = '17';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[17];
                                break;
                              case 332:
                                _controllerfourthtoptxt.text = '21';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[21];
                                break;
                              case 432:
                                _controllerfourthtoptxt.text = '51';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[51];
                                break;
                              case 142:
                                _controllerfourthtoptxt.text = '42';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[42];
                                break;
                              case 242:
                                _controllerfourthtoptxt.text = '3';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[3];
                                break;
                              case 342:
                                _controllerfourthtoptxt.text = '27';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[27];
                                break;
                              case 442:
                                _controllerfourthtoptxt.text = '24';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[24];
                                break;

                            //Quarter of Duality
                              case 113:
                                _controllerfourthtoptxt.text = '44';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[44];
                                break;
                              case 213:
                                _controllerfourthtoptxt.text = '28';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[28];
                                break;
                              case 313:
                                _controllerfourthtoptxt.text = '50';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[50];
                                break;
                              case 413:
                                _controllerfourthtoptxt.text = '32';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[32];
                                break;
                              case 123:
                                _controllerfourthtoptxt.text = '57';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[57];
                                break;
                              case 223:
                                _controllerfourthtoptxt.text = '48';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[48];
                                break;
                              case 323:
                                _controllerfourthtoptxt.text = '18';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[18];
                                break;
                              case 423:
                                _controllerfourthtoptxt.text = '46';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[46];
                                break;
                              case 133:
                                _controllerfourthtoptxt.text = '6';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[6];
                                break;
                              case 233:
                                _controllerfourthtoptxt.text = '47';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[47];
                                break;
                              case 333:
                                _controllerfourthtoptxt.text = '64';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[64];
                                break;
                              case 433:
                                _controllerfourthtoptxt.text = '40';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[40];
                                break;
                              case 143:
                                _controllerfourthtoptxt.text = '59';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[59];
                                break;
                              case 243:
                                _controllerfourthtoptxt.text = '29';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[29];
                                break;
                              case 343:
                                _controllerfourthtoptxt.text = '4';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[4];
                                break;
                              case 443:
                                _controllerfourthtoptxt.text = '7';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[7];
                                break;
                            //Quarter of Civilization
                              case 114:
                                _controllerfourthtoptxt.text = '33';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[33];
                                break;
                              case 214:
                                _controllerfourthtoptxt.text = '31';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[31];
                                break;
                              case 314:
                                _controllerfourthtoptxt.text = '56';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[56];
                                break;
                              case 414:
                                _controllerfourthtoptxt.text = '62';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[62];
                                break;
                              case 124:
                                _controllerfourthtoptxt.text = '53';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[53];
                                break;
                              case 224:
                                _controllerfourthtoptxt.text = '39';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[39];
                                break;
                              case 324:
                                _controllerfourthtoptxt.text = '52';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[52];
                                break;
                              case 424:
                                _controllerfourthtoptxt.text = '15';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[15];
                                break;
                              case 134:
                                _controllerfourthtoptxt.text = '12';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[12];
                                break;
                              case 234:
                                _controllerfourthtoptxt.text = '45';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[45];
                                break;
                              case 334:
                                _controllerfourthtoptxt.text = '35';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[35];
                                break;
                              case 434:
                                _controllerfourthtoptxt.text = '16';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[16];
                                break;
                              case 144:
                                _controllerfourthtoptxt.text = '20';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[20];
                                break;
                              case 244:
                                _controllerfourthtoptxt.text = '8';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[8];
                                break;
                              case 344:
                                _controllerfourthtoptxt.text = '23';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[23];
                                break;
                              case 444:
                                _controllerfourthtoptxt.text = '2';
                                _controllerfourthbottxt.text =
                                hexagramAdverbList[2];
                                break;
                            }
                          });
                        }),
                  ),
                ),
              ])),

        ],
      ),
    );
  }
}