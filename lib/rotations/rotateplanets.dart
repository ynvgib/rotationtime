import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/services/fetchastrology.dart';
import 'package:flutter/material.dart';
import 'package:finallyicanlearn/models/lists.dart';

// /about
// /indicatorNoLogic
class RotatePlanets extends StatefulWidget {
  const RotatePlanets({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotatePlanetsState();
  }
}

class _RotatePlanetsState extends State<RotatePlanets> {
  final TextEditingController _controllerNorthNodeHex = TextEditingController(),
      _controllerNorthNodeText = TextEditingController(),
      _controllerNorthNodeGate = TextEditingController(),
      _controllerSunHex = TextEditingController(),
      _controllerSunText = TextEditingController(),
      _controllerSunGate = TextEditingController(),
      _controllerMoonHex = TextEditingController(),
      _controllerMoonText = TextEditingController(),
      _controllerMoonGate = TextEditingController(),
      _controllerMarsHex = TextEditingController(),
      _controllerMarsText = TextEditingController(),
      _controllerMarsGate = TextEditingController(),
      _controllerVenusHex = TextEditingController(),
      _controllerVenusText = TextEditingController(),
      _controllerVenusGate = TextEditingController(),
      _controllerMercuryHex = TextEditingController(),
      _controllerMercuryText = TextEditingController(),
      _controllerMercuryGate = TextEditingController(),
      _controllerJupiterHex = TextEditingController(),
      _controllerJupiterText = TextEditingController(),
      _controllerJupiterGate = TextEditingController(),
      _controllerSaturnHex = TextEditingController(),
      _controllerSaturnText = TextEditingController(),
      _controllerSaturnGate = TextEditingController(),
      _controllerUranusHex = TextEditingController(),
      _controllerUranusText = TextEditingController(),
      _controllerUranusGate = TextEditingController(),
      _controllerNeptuneHex = TextEditingController(),
      _controllerNeptuneText = TextEditingController(),
      _controllerNeptuneGate = TextEditingController(),
      _controllerPlutoHex = TextEditingController(),
      _controllerPlutoText = TextEditingController(),
      _controllerPlutoGate = TextEditingController(),
      _controllerEarthHex = TextEditingController(),
      _controllerEarthText = TextEditingController(),
      _controllerEarthGate = TextEditingController(),
      _controllerSouthNodeHex = TextEditingController(),
      _controllerSouthNodeText = TextEditingController(),
      _controllerSouthNodeGate = TextEditingController();

  int _dropdownNorthNode = hexagramslist[1],
      _dropdownSun = hexagramslist[1],
      _dropdownMoon = hexagramslist[1],
      _dropdownMars = hexagramslist[1],
      _dropdownVenus = hexagramslist[1],
      _dropdownMercury = hexagramslist[1],
      _dropdownJupiter = hexagramslist[1],
      _dropdownSaturn = hexagramslist[1],
      _dropdownUranus = hexagramslist[1],
      _dropdownNeptune = hexagramslist[1],
      _dropdownPluto = hexagramslist[1],
      _dropdownEarth = hexagramslist[1],
      _dropdownSouthNode = hexagramslist[1],
      _fontMapSun = 1,
      _fontMapNorthNode = 1,
      _fontMapMoon = 1,
      _fontMapMercury = 1,
      _fontMapVenus = 1,
      _fontMapMars = 1,
      _fontMapSaturn = 1,
      _fontMapJupiter = 1,
      _fontMapUranus = 1,
      _fontMapNeptune = 1,
      _fontMapPluto = 1,
      _fontMapEarth = 1,
      _fontMapSouthNode = 1;

  String _fontMapFinalSun = 'a',
      _fontMapFinalNorthNode = 'a',
      _fontMapFinalMoon = 'a',
      _fontMapFinalMercury = 'a',
      _fontMapFinalVenus = 'a',
      _fontMapFinalMars = 'a',
      _fontMapFinalJupiter = 'a',
      _fontMapFinalSaturn = 'a',
      _fontMapFinalUranus = 'a',
      _fontMapFinalNeptune = 'a',
      _fontMapFinalPluto = 'a',
      _fontMapFinalEarth = 'a',
      _fontMapFinalSouthNode = 'a';

  // visibility of planets init
  bool _isSunVisible = true,
      _isEarthVisible = true,
      _isNorthNodeVisible = true,
      _isSouthNodeVisible = true,
      _isMoonVisible = true,
      _isMercuryVisible = true,
      _isVenusVisible = true,
      _isMarsVisible = true,
      _isJupiterVisible = true,
      _isSaturnVisible = true,
      _isUranusVisible = true,
      _isNeptuneVisible = true,
      _isPlutoVisible = true;

  final List<bool> _isPlanetSelectedList =
      List<bool>.filled(13, true, growable: false);

  DateTime _now = DateTime.now();

  List<Hexagram> _planetsList = [];
  Hexagram _sunhex = Hexagram(),
      _earthhex = Hexagram(),
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Rotate Astro Planets'),
        backgroundColor: Colors.blueGrey,
        actions: [
          ElevatedButton(onPressed: () async {

            _now = DateTime.now();
            _planetsList = await AstrologyServices.getPlanetsGatesNow(_now);
            _sunhex = _planetsList[0];
            _earthhex = _planetsList[1];
            _moonhex = _planetsList[2];
            _mercuryhex = _planetsList[3];
            _venushex = _planetsList[4];
            _marshex = _planetsList[5];
            _jupiterhex = _planetsList[6];
            _saturnhex = _planetsList[7];
            _uranushex = _planetsList[8];
            _neptunehex = _planetsList[9];
            _plutohex = _planetsList[10];

            _controllerSunText.text = _sunhex.name!;
            _controllerEarthText.text = _earthhex.name!;
            _controllerMoonText.text = _moonhex.name!;
            _controllerMercuryText.text = _mercuryhex.name!;
            _controllerVenusText.text = _venushex.name!;
            _controllerMarsText.text = _marshex.name!;
            _controllerJupiterText.text = _jupiterhex.name!;
            _controllerSaturnText.text = _saturnhex.name!;
            _controllerUranusText.text = _uranushex.name!;
            _controllerNeptuneText.text = _neptunehex.name!;
            _controllerPlutoText.text = _plutohex.name!;

            _controllerSunGate.text = _sunhex.gate.toString();
            _controllerEarthGate.text = _earthhex.gate.toString();
            _controllerMoonGate.text = _moonhex.gate.toString();
            _controllerMercuryGate.text = _mercuryhex.gate.toString();
            _controllerVenusGate.text = _venushex.gate.toString();
            _controllerMarsGate.text = _marshex.gate.toString();
            _controllerJupiterGate.text = _jupiterhex.gate.toString();
            _controllerSaturnGate.text = _saturnhex.gate.toString();
            _controllerUranusGate.text = _uranushex.gate.toString();
            _controllerNeptuneGate.text = _neptunehex.gate.toString();
            _controllerPlutoGate.text = _plutohex.gate.toString();

            _dropdownSun = _sunhex.gate!;
            _dropdownEarth = _earthhex.gate!;
            _dropdownMoon = _moonhex.gate!;
            _dropdownMercury = _mercuryhex.gate!;
            _dropdownVenus = _venushex.gate!;
            _dropdownMars = _marshex.gate!;
            _dropdownJupiter = _jupiterhex.gate!;
            _dropdownSaturn = _saturnhex.gate!;
            _dropdownUranus = _uranushex.gate!;
            _dropdownNeptune = _neptunehex.gate!;
            _dropdownPluto = _plutohex.gate!;

            _controllerSunHex.text = _sunhex.hex!;
            _controllerEarthHex.text = _earthhex.hex!;
            _controllerMoonHex.text = _moonhex.hex!;
            _controllerMercuryHex.text = _mercuryhex.hex!;
            _controllerVenusHex.text = _venushex.hex!;
            _controllerMarsHex.text = _marshex.hex!;
            _controllerJupiterHex.text = _jupiterhex.hex!;
            _controllerSaturnHex.text = _saturnhex.hex!;
            _controllerUranusHex.text = _uranushex.hex!;
            _controllerNeptuneHex.text = _neptunehex.hex!;
            _controllerPlutoHex.text = _plutohex.hex!;

          },
              child: const Text('Planets Now')),
          ToggleButtons(
            borderWidth: 10.0,
            hoverColor: Colors.blue,
            //borderRadius: BorderRadius.circular(20),
            fillColor: Colors.white,
            children: [
              Container(
                height: 20,
                width: 20,
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
              ),
              Container(
                height: 20,
                width: 20,
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
              ),
              Container(
                height: 20,
                width: 20,
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
              ),
              Container(
                height: 20,
                width: 20,
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
              ),
              Container(
                height: 20,
                width: 20,
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
              ),
              Container(
                height: 20,
                width: 20,
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
              ),
              Container(
                height: 20,
                width: 20,
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
              ),
              Container(
                height: 20,
                width: 20,
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
              ),
              Container(
                height: 20,
                width: 20,
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
              ),
            ],
            isSelected: _isPlanetSelectedList,
            onPressed: (int index) {
              setState(() {
                _isPlanetSelectedList[index] = !_isPlanetSelectedList[index];
                switch (index) {
                  case 0:
                    _isNorthNodeVisible = !_isNorthNodeVisible;
                    break;
                  case 1:
                    _isSunVisible = !_isSunVisible;
                    break;
                  case 2:
                    _isMoonVisible = !_isMoonVisible;
                    break;
                  case 3:
                    _isMercuryVisible = !_isMercuryVisible;
                    break;
                  case 4:
                    _isVenusVisible = !_isVenusVisible;
                    break;
                  case 5:
                    _isMarsVisible = !_isMarsVisible;
                    break;
                  case 6:
                    _isJupiterVisible = !_isJupiterVisible;
                    break;
                  case 7:
                    _isSaturnVisible = !_isSaturnVisible;
                    break;
                  case 8:
                    _isUranusVisible = !_isUranusVisible;
                    break;
                  case 9:
                    _isNeptuneVisible = !_isNeptuneVisible;
                    break;
                  case 10:
                    _isPlutoVisible = !_isPlutoVisible;
                    break;
                  case 11:
                    _isEarthVisible = !_isEarthVisible;
                    break;
                  case 12:
                    _isSouthNodeVisible = !_isSouthNodeVisible;
                    break;
                  default:
                    _isSunVisible = !_isSunVisible;
                }
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //main row
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownSun,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownSunChange) {
                        setState(() {
                          _dropdownSun = _dropdownSunChange!;
                          _fontMapSun =
                              fontHexNumbersList.indexOf(_dropdownSun);
                          _fontMapFinalSun = fontHexOrderList[_fontMapSun];
                          _controllerSunHex.text = _fontMapFinalSun;

                          _controllerSunText.text =
                              hexagramSubjectList[_dropdownSun];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.blue,
                        foregroundImage: AssetImage('assets/planets/sun.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownNorthNode,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownNorthNodeChange) {
                        setState(() {
                          _dropdownNorthNode = _dropdownNorthNodeChange!;
                          _fontMapNorthNode =
                              fontHexNumbersList.indexOf(_dropdownNorthNode);
                          _fontMapFinalNorthNode =
                              fontHexOrderList[_fontMapNorthNode];
                          _controllerNorthNodeHex.text = _fontMapFinalNorthNode;
                          _controllerNorthNodeText.text =
                              hexagramSubjectList[_dropdownNorthNode];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.blue,
                        foregroundImage:
                            AssetImage('assets/planets/northnode.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownMoon,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownMoonChange) {
                        setState(() {
                          _dropdownMoon = _dropdownMoonChange!;
                          _fontMapMoon =
                              fontHexNumbersList.indexOf(_dropdownMoon);
                          _fontMapFinalMoon = fontHexOrderList[_fontMapMoon];
                          _controllerMoonHex.text = _fontMapFinalMoon;
                          _controllerMoonText.text =
                              hexagramSubjectList[_dropdownMoon];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.green,
                        backgroundImage: AssetImage('assets/planets/moon.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownMercury,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownMercuryChange) {
                        setState(() {
                          _dropdownMercury = _dropdownMercuryChange!;
                          _fontMapMercury =
                              fontHexNumbersList.indexOf(_dropdownMercury);
                          _fontMapFinalMercury =
                              fontHexOrderList[_fontMapMercury];
                          _controllerMercuryHex.text = _fontMapFinalMercury;
                          _controllerMercuryText.text =
                              hexagramSubjectList[_dropdownMercury];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.green,
                        backgroundImage:
                            AssetImage('assets/planets/mercury.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownVenus,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownVenusChange) {
                        setState(() {
                          _dropdownVenus = _dropdownVenusChange!;
                          _fontMapVenus =
                              fontHexNumbersList.indexOf(_dropdownVenus);
                          _fontMapFinalVenus = fontHexOrderList[_fontMapVenus];
                          _controllerVenusHex.text = _fontMapFinalVenus;

                          _controllerVenusText.text =
                              hexagramSubjectList[_dropdownVenus];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.green,
                        backgroundImage:
                            AssetImage('assets/planets/venus.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownMars,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownMarsChange) {
                        setState(() {
                          _dropdownMars = _dropdownMarsChange!;
                          _fontMapMars =
                              fontHexNumbersList.indexOf(_dropdownMars);
                          _fontMapFinalMars = fontHexOrderList[_fontMapMars];
                          _controllerMarsHex.text = _fontMapFinalMars;

                          _controllerMarsText.text =
                              hexagramSubjectList[_dropdownMars];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.green,
                        backgroundImage: AssetImage('assets/planets/mars.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownJupiter,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownJupiterChange) {
                        setState(() {
                          _dropdownJupiter = _dropdownJupiterChange!;
                          _fontMapJupiter =
                              fontHexNumbersList.indexOf(_dropdownJupiter);
                          _fontMapFinalJupiter =
                              fontHexOrderList[_fontMapJupiter];
                          _controllerJupiterHex.text = _fontMapFinalJupiter;

                          _controllerJupiterText.text =
                              hexagramSubjectList[_dropdownJupiter];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage:
                            AssetImage('assets/planets/jupiter.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownSaturn,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownSaturnChange) {
                        setState(() {
                          _dropdownSaturn = _dropdownSaturnChange!;
                          _fontMapSaturn =
                              fontHexNumbersList.indexOf(_dropdownSaturn);
                          _fontMapFinalSaturn =
                              fontHexOrderList[_fontMapSaturn];
                          _controllerSaturnHex.text = _fontMapFinalSaturn;

                          _controllerSaturnText.text =
                              hexagramSubjectList[_dropdownSaturn];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage:
                            AssetImage('assets/planets/saturn.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownUranus,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownUranusChange) {
                        setState(() {
                          _dropdownUranus = _dropdownUranusChange!;
                          _fontMapUranus =
                              fontHexNumbersList.indexOf(_dropdownUranus);
                          _fontMapFinalUranus =
                              fontHexOrderList[_fontMapUranus];
                          _controllerUranusHex.text = _fontMapFinalUranus;
                          _controllerUranusText.text =
                              hexagramSubjectList[_dropdownUranus];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage:
                            AssetImage('assets/planets/uranus.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownNeptune,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownNeptuneChange) {
                        setState(() {
                          _dropdownNeptune = _dropdownNeptuneChange!;
                          _fontMapNeptune =
                              fontHexNumbersList.indexOf(_dropdownNeptune);
                          _fontMapFinalNeptune =
                              fontHexOrderList[_fontMapNeptune];
                          _controllerNeptuneHex.text = _fontMapFinalNeptune;
                          _controllerNeptuneText.text =
                              hexagramSubjectList[_dropdownNeptune];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage:
                            AssetImage('assets/planets/neptune.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownPluto,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownPlutoChange) {
                        setState(() {
                          _dropdownPluto = _dropdownPlutoChange!;
                          _fontMapPluto =
                              fontHexNumbersList.indexOf(_dropdownPluto);
                          _fontMapFinalPluto = fontHexOrderList[_fontMapPluto];
                          _controllerPlutoHex.text = _fontMapFinalPluto;
                          _controllerPlutoText.text =
                              hexagramSubjectList[_dropdownPluto];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.yellow,
                        backgroundImage:
                            AssetImage('assets/planets/pluto.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownEarth,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownEarthChange) {
                        setState(() {
                          _dropdownEarth = _dropdownEarthChange!;
                          _fontMapEarth =
                              fontHexNumbersList.indexOf(_dropdownEarth);
                          _fontMapFinalEarth = fontHexOrderList[_fontMapEarth];
                          _controllerEarthHex.text = _fontMapFinalEarth;
                          _controllerEarthText.text =
                              hexagramSubjectList[_dropdownEarth];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.red,
                        backgroundImage:
                            AssetImage('assets/planets/earth.png')),
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownSouthNode,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownSouthNodeChange) {
                        setState(() {
                          _dropdownSouthNode = _dropdownSouthNodeChange!;
                          _fontMapSouthNode =
                              fontHexNumbersList.indexOf(_dropdownSouthNode);
                          _fontMapFinalSouthNode =
                              fontHexOrderList[_fontMapSouthNode];
                          _controllerSouthNodeHex.text = _fontMapFinalSouthNode;
                          _controllerSouthNodeText.text =
                              hexagramSubjectList[_dropdownSouthNode];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.red,
                        backgroundImage:
                            AssetImage('assets/planets/southnode.png')),
                  ]),
            ),
          ),
          // 1st row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: _isSunVisible,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Row(
                    children: [
                      DropdownButton(
                        underline:
                            DropdownButtonHideUnderline(child: Container()),
                        value: _dropdownSun,
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.black),
                        items: hexDropDownNumbersList,
                        onChanged: (int? _dropdownSunChange) {
                          setState(() {
                            _dropdownSun = _dropdownSunChange!;
                            _fontMapSun =
                                fontHexNumbersList.indexOf(_dropdownSun);
                            _fontMapFinalSun = fontHexOrderList[_fontMapSun];
                            _controllerSunHex.text = _fontMapFinalSun;

                            _controllerSunText.text =
                                hexagramSubjectList[_dropdownSun];
                          });
                        },
                      ),
                      const CircleAvatar(
                          minRadius: 20.0,
                          maxRadius: 20.0,
                          backgroundColor: Colors.blue,
                          foregroundImage:
                              AssetImage('assets/planets/sun.png')),
                      SizedBox(width: 30,
                        child: TextField(
                            readOnly: true,
                            decoration: const InputDecoration.collapsed(
                                hintText: '1'),
                            textAlign: TextAlign.center,
                            controller: _controllerSunGate,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'a'),
                              controller: _controllerSunHex,
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'iChing',
                                  color: Colors.blue))),
                      Expanded(
                        child: TextField(
                            readOnly: true,
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Creative'),
                            textAlign: TextAlign.left,
                            controller: _controllerSunText,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: _isNorthNodeVisible,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Row(children: [
                    DropdownButton(
                      underline:
                          DropdownButtonHideUnderline(child: Container()),
                      value: _dropdownNorthNode,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: hexDropDownNumbersList,
                      onChanged: (int? _dropdownNorthNodeChange) {
                        setState(() {
                          _dropdownNorthNode = _dropdownNorthNodeChange!;
                          _fontMapNorthNode =
                              fontHexNumbersList.indexOf(_dropdownNorthNode);
                          _fontMapFinalNorthNode =
                              fontHexOrderList[_fontMapNorthNode];
                          _controllerNorthNodeHex.text = _fontMapFinalNorthNode;
                          _controllerNorthNodeText.text =
                              hexagramSubjectList[_dropdownNorthNode];
                        });
                      },
                    ),
                    const CircleAvatar(
                        minRadius: 20.0,
                        maxRadius: 20.0,
                        backgroundColor: Colors.blue,
                        foregroundImage:
                            AssetImage('assets/planets/northnode.png')),
                    SizedBox(width: 30,
                      child: TextField(
                          readOnly: true,
                          decoration: const InputDecoration.collapsed(
                              hintText: '1'),
                          textAlign: TextAlign.center,
                          controller: _controllerNorthNodeGate,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                        child: TextField(
                            readOnly: true,
                            decoration:
                                const InputDecoration.collapsed(hintText: 'a'),
                            controller: _controllerNorthNodeHex,
                            style: const TextStyle(
                                fontSize: 40,
                                fontFamily: 'iChing',
                                color: Colors.blue))),
                    Expanded(
                      child: TextField(
                          readOnly: true,
                          decoration: const InputDecoration.collapsed(
                              hintText: 'Creative'),
                          textAlign: TextAlign.left,
                          controller: _controllerNorthNodeText,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: _isMoonVisible,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.greenAccent)),
                    child: Row(children: [
                      DropdownButton(
                        underline:
                            DropdownButtonHideUnderline(child: Container()),
                        value: _dropdownMoon,
                        icon: const Icon(Icons.keyboard_arrow_down,
                            color: Colors.black),
                        items: hexDropDownNumbersList,
                        onChanged: (int? _dropdownMoonChange) {
                          setState(() {
                            _dropdownMoon = _dropdownMoonChange!;
                            _fontMapMoon =
                                fontHexNumbersList.indexOf(_dropdownMoon);
                            _fontMapFinalMoon = fontHexOrderList[_fontMapMoon];
                            _controllerMoonHex.text = _fontMapFinalMoon;
                            _controllerMoonText.text =
                                hexagramSubjectList[_dropdownMoon];
                          });
                        },
                      ),
                      const CircleAvatar(
                          minRadius: 20.0,
                          maxRadius: 20.0,
                          backgroundColor: Colors.green,
                          backgroundImage:
                              AssetImage('assets/planets/moon.png')),
                      SizedBox(width: 30,
                        child: TextField(
                            readOnly: true,
                            decoration: const InputDecoration.collapsed(
                                hintText: '1'),
                            textAlign: TextAlign.center,
                            controller: _controllerMoonGate,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'a'),
                              controller: _controllerMoonHex,
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'iChing',
                                  color: Colors.green))),
                      Expanded(
                        child: TextField(
                            readOnly: true,
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Creative'),
                            textAlign: TextAlign.left,
                            controller: _controllerMoonText,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: _isMercuryVisible,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent)),
                      child: Row(children: [
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: _dropdownMercury,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (int? _dropdownMercuryChange) {
                            setState(() {
                              _dropdownMercury = _dropdownMercuryChange!;
                              _fontMapMercury =
                                  fontHexNumbersList.indexOf(_dropdownMercury);
                              _fontMapFinalMercury =
                                  fontHexOrderList[_fontMapMercury];
                              _controllerMercuryHex.text = _fontMapFinalMercury;
                              _controllerMercuryText.text =
                                  hexagramSubjectList[_dropdownMercury];
                            });
                          },
                        ),
                        const CircleAvatar(
                            minRadius: 20.0,
                            maxRadius: 20.0,
                            backgroundColor: Colors.green,
                            backgroundImage:
                                AssetImage('assets/planets/mercury.png')),
                        SizedBox(width: 30,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: '1'),
                              textAlign: TextAlign.center,
                              controller: _controllerMercuryGate,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerMercuryHex,
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'iChing',
                                    color: Colors.green))),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Creative'),
                              textAlign: TextAlign.left,
                              controller: _controllerMercuryText,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ])),
                ),
                Visibility(
                  visible: _isVenusVisible,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent)),
                      child: Row(children: [
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: _dropdownVenus,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (int? _dropdownVenusChange) {
                            setState(() {
                              _dropdownVenus = _dropdownVenusChange!;
                              _fontMapVenus =
                                  fontHexNumbersList.indexOf(_dropdownVenus);
                              _fontMapFinalVenus =
                                  fontHexOrderList[_fontMapVenus];
                              _controllerVenusHex.text = _fontMapFinalVenus;

                              _controllerVenusText.text =
                                  hexagramSubjectList[_dropdownVenus];
                            });
                          },
                        ),
                        const CircleAvatar(
                            minRadius: 20.0,
                            maxRadius: 20.0,
                            backgroundColor: Colors.green,
                            backgroundImage:
                                AssetImage('assets/planets/venus.png')),
                        SizedBox(width: 30,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: '1'),
                              textAlign: TextAlign.center,
                              controller: _controllerVenusGate,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerVenusHex,
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'iChing',
                                    color: Colors.green))),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Creative'),
                              textAlign: TextAlign.left,
                              controller: _controllerVenusText,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ])),
                ),

                // Mars
                Visibility(
                  visible: _isMarsVisible,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent)),
                      child: Row(children: [
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: _dropdownMars,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (int? _dropdownMarsChange) {
                            setState(() {
                              _dropdownMars = _dropdownMarsChange!;
                              _fontMapMars =
                                  fontHexNumbersList.indexOf(_dropdownMars);
                              _fontMapFinalMars =
                                  fontHexOrderList[_fontMapMars];
                              _controllerMarsHex.text = _fontMapFinalMars;

                              _controllerMarsText.text =
                                  hexagramSubjectList[_dropdownMars];
                            });
                          },
                        ),
                        const CircleAvatar(
                            minRadius: 20.0,
                            maxRadius: 20.0,
                            backgroundColor: Colors.green,
                            backgroundImage:
                                AssetImage('assets/planets/mars.png')),
                        SizedBox(width: 30,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: '1'),
                              textAlign: TextAlign.center,
                              controller: _controllerMarsGate,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerMarsHex,
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'iChing',
                                    color: Colors.green))),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Creative'),
                              textAlign: TextAlign.left,
                              controller: _controllerMarsText,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ])),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: _isJupiterVisible,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Row(children: [
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: _dropdownJupiter,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (int? _dropdownJupiterChange) {
                            setState(() {
                              _dropdownJupiter = _dropdownJupiterChange!;
                              _fontMapJupiter =
                                  fontHexNumbersList.indexOf(_dropdownJupiter);
                              _fontMapFinalJupiter =
                                  fontHexOrderList[_fontMapJupiter];
                              _controllerJupiterHex.text = _fontMapFinalJupiter;

                              _controllerJupiterText.text =
                                  hexagramSubjectList[_dropdownJupiter];
                            });
                          },
                        ),
                        const CircleAvatar(
                            minRadius: 20.0,
                            maxRadius: 20.0,
                            backgroundColor: Colors.yellow,
                            backgroundImage:
                                AssetImage('assets/planets/jupiter.png')),
                        SizedBox(width: 30,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: '1'),
                              textAlign: TextAlign.center,
                              controller: _controllerJupiterGate,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerJupiterHex,
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'iChing',
                                    color: Colors.yellow))),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Creative'),
                              textAlign: TextAlign.left,
                              controller: _controllerJupiterText,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ])),
                ),
                Visibility(
                  visible: _isSaturnVisible,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Row(children: [
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: _dropdownSaturn,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (int? _dropdownSaturnChange) {
                            setState(() {
                              _dropdownSaturn = _dropdownSaturnChange!;
                              _fontMapSaturn =
                                  fontHexNumbersList.indexOf(_dropdownSaturn);
                              _fontMapFinalSaturn =
                                  fontHexOrderList[_fontMapSaturn];
                              _controllerSaturnHex.text = _fontMapFinalSaturn;

                              _controllerSaturnText.text =
                                  hexagramSubjectList[_dropdownSaturn];
                            });
                          },
                        ),
                        const CircleAvatar(
                            minRadius: 20.0,
                            maxRadius: 20.0,
                            backgroundColor: Colors.yellow,
                            backgroundImage:
                                AssetImage('assets/planets/saturn.png')),
                        SizedBox(width: 30,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: '1'),
                              textAlign: TextAlign.center,
                              controller: _controllerSaturnGate,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerSaturnHex,
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'iChing',
                                    color: Colors.yellow))),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Creative'),
                              textAlign: TextAlign.left,
                              controller: _controllerSaturnText,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ])),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: _isUranusVisible,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Row(children: [
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: _dropdownUranus,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (int? _dropdownUranusChange) {
                            setState(() {
                              _dropdownUranus = _dropdownUranusChange!;
                              _fontMapUranus =
                                  fontHexNumbersList.indexOf(_dropdownUranus);
                              _fontMapFinalUranus =
                                  fontHexOrderList[_fontMapUranus];
                              _controllerUranusHex.text = _fontMapFinalUranus;
                              _controllerUranusText.text =
                                  hexagramSubjectList[_dropdownUranus];
                            });
                          },
                        ),
                        const CircleAvatar(
                            minRadius: 20.0,
                            maxRadius: 20.0,
                            backgroundColor: Colors.yellow,
                            backgroundImage:
                                AssetImage('assets/planets/uranus.png')),
                        SizedBox(width: 30,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: '1'),
                              textAlign: TextAlign.center,
                              controller: _controllerUranusGate,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerUranusHex,
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'iChing',
                                    color: Colors.yellow))),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Creative'),
                              textAlign: TextAlign.left,
                              controller: _controllerUranusText,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ])),
                ),
                Visibility(
                  visible: _isNeptuneVisible,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Row(children: [
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: _dropdownNeptune,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (int? _dropdownNeptuneChange) {
                            setState(() {
                              _dropdownNeptune = _dropdownNeptuneChange!;
                              _fontMapNeptune =
                                  fontHexNumbersList.indexOf(_dropdownNeptune);
                              _fontMapFinalNeptune =
                                  fontHexOrderList[_fontMapNeptune];
                              _controllerNeptuneHex.text = _fontMapFinalNeptune;
                              _controllerNeptuneText.text =
                                  hexagramSubjectList[_dropdownNeptune];
                            });
                          },
                        ),
                        const CircleAvatar(
                            minRadius: 20.0,
                            maxRadius: 20.0,
                            backgroundColor: Colors.yellow,
                            backgroundImage:
                                AssetImage('assets/planets/neptune.png')),
                        SizedBox(width: 30,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: '1'),
                              textAlign: TextAlign.center,
                              controller: _controllerNeptuneGate,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerNeptuneHex,
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'iChing',
                                    color: Colors.yellow))),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Creative'),
                              textAlign: TextAlign.left,
                              controller: _controllerNeptuneText,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ])),
                ),
                Visibility(
                  visible: _isPlutoVisible,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Row(children: [
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: _dropdownPluto,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (int? _dropdownPlutoChange) {
                            setState(() {
                              _dropdownPluto = _dropdownPlutoChange!;
                              _fontMapPluto =
                                  fontHexNumbersList.indexOf(_dropdownPluto);
                              _fontMapFinalPluto =
                                  fontHexOrderList[_fontMapPluto];
                              _controllerPlutoHex.text = _fontMapFinalPluto;
                              _controllerPlutoText.text =
                                  hexagramSubjectList[_dropdownPluto];
                            });
                          },
                        ),
                        const CircleAvatar(
                            minRadius: 20.0,
                            maxRadius: 20.0,
                            backgroundColor: Colors.yellow,
                            backgroundImage:
                                AssetImage('assets/planets/pluto.png')),
                        SizedBox(width: 30,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: '1'),
                              textAlign: TextAlign.center,
                              controller: _controllerPlutoGate,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerPlutoHex,
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'iChing',
                                    color: Colors.yellow))),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Creative'),
                              textAlign: TextAlign.left,
                              controller: _controllerPlutoText,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ])),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: _isEarthVisible,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.redAccent)),
                      child: Row(children: [
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: _dropdownEarth,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (int? _dropdownEarthChange) {
                            setState(() {
                              _dropdownEarth = _dropdownEarthChange!;
                              _fontMapEarth =
                                  fontHexNumbersList.indexOf(_dropdownEarth);
                              _fontMapFinalEarth =
                                  fontHexOrderList[_fontMapEarth];
                              _controllerEarthHex.text = _fontMapFinalEarth;
                              _controllerEarthText.text =
                                  hexagramSubjectList[_dropdownEarth];
                            });
                          },
                        ),
                        const CircleAvatar(
                            minRadius: 20.0,
                            maxRadius: 20.0,
                            backgroundColor: Colors.red,
                            backgroundImage:
                                AssetImage('assets/planets/earth.png')),
                        SizedBox(width: 30,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: '1'),
                              textAlign: TextAlign.center,
                              controller: _controllerEarthGate,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'a'),
                              controller: _controllerEarthHex,
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'iChing',
                                  color: Colors.red)),
                        ),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Creative'),
                              textAlign: TextAlign.left,
                              controller: _controllerEarthText,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ])),
                ),
                Visibility(
                  visible: _isSouthNodeVisible,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.redAccent)),
                      child: Row(children: [
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: _dropdownSouthNode,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (int? _dropdownSouthNodeChange) {
                            setState(() {
                              _dropdownSouthNode = _dropdownSouthNodeChange!;
                              _fontMapSouthNode = fontHexNumbersList
                                  .indexOf(_dropdownSouthNode);
                              _fontMapFinalSouthNode =
                                  fontHexOrderList[_fontMapSouthNode];
                              _controllerSouthNodeHex.text =
                                  _fontMapFinalSouthNode;
                              _controllerSouthNodeText.text =
                                  hexagramSubjectList[_dropdownSouthNode];
                            });
                          },
                        ),
                        const CircleAvatar(
                            minRadius: 20.0,
                            maxRadius: 20.0,
                            backgroundColor: Colors.red,
                            backgroundImage:
                                AssetImage('assets/planets/southnode.png')),
                        SizedBox(width: 30,
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: '1'),
                              textAlign: TextAlign.center,
                              controller: _controllerSouthNodeGate,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerSouthNodeHex,
                                style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'iChing',
                                    color: Colors.red))),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Creative'),
                              textAlign: TextAlign.left,
                              controller: _controllerSouthNodeText,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ])),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
