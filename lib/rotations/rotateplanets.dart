import 'package:flutter/material.dart';
import 'package:finallyicanlearn/lists.dart';

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
  final TextEditingController _controllerNorthNode = TextEditingController(),
      _controllerNorthNodeText = TextEditingController(),
      _controllerSun = TextEditingController(),
      _controllerSunText = TextEditingController(),
      _controllerMoon = TextEditingController(),
      _controllerMoonText = TextEditingController(),
      _controllerMars = TextEditingController(),
      _controllerMarsText = TextEditingController(),
      _controllerVenus = TextEditingController(),
      _controllerVenusText = TextEditingController(),
      _controllerMercury = TextEditingController(),
      _controllerMercuryText = TextEditingController(),
      _controllerJupiter = TextEditingController(),
      _controllerJupiterText = TextEditingController(),
      _controllerSaturn = TextEditingController(),
      _controllerSaturnText = TextEditingController(),
      _controllerUranus = TextEditingController(),
      _controllerUranusText = TextEditingController(),
      _controllerNeptune = TextEditingController(),
      _controllerNeptuneText = TextEditingController(),
      _controllerPluto = TextEditingController(),
      _controllerPlutoText = TextEditingController(),
      _controllerEarth = TextEditingController(),
      _controllerEarthText = TextEditingController(),
      _controllerSouthNode = TextEditingController(),
      _controllerSouthNodeText = TextEditingController();

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
      fontMapSun = 1,
      fontMapNorthNode = 1,
      fontMapMoon = 1,
      fontMapMercury = 1,
      fontMapVenus = 1,
      fontMapMars = 1,
      fontMapSaturn = 1,
      fontMapJupiter = 1,
      fontMapUranus = 1,
      fontMapNeptune = 1,
      fontMapPluto = 1,
      fontMapEarth = 1,
      fontMapSouthNode = 1;

  String fontMapFinalSun = 'a',
      fontMapFinalNorthNode = 'a',
      fontMapFinalMoon = 'a',
      fontMapFinalMercury = 'a',
      fontMapFinalVenus = 'a',
      fontMapFinalMars = 'a',
      fontMapFinalJupiter = 'a',
      fontMapFinalSaturn = 'a',
      fontMapFinalUranus = 'a',
      fontMapFinalNeptune = 'a',
      fontMapFinalPluto = 'a',
      fontMapFinalEarth = 'a',
      fontMapFinalSouthNode = 'a';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Rotate Astro Planets'),
        backgroundColor: Colors.blueGrey,
        actions: [
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
                  underline: DropdownButtonHideUnderline(child: Container()),
                  value: _dropdownSun,
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black),
                  items: hexDropDownNumbersList,
                  onChanged: (int? _dropdownSunChange) {
                    setState(() {
                      _dropdownSun = _dropdownSunChange!;
                      fontMapSun = fontHexNumbersList.indexOf(_dropdownSun);
                      fontMapFinalSun = fontHexOrderList[fontMapSun];
                      _controllerSun.text = fontMapFinalSun;

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
                          fontMapNorthNode =
                              fontHexNumbersList.indexOf(_dropdownNorthNode);
                          fontMapFinalNorthNode =
                          fontHexOrderList[fontMapNorthNode];
                          _controllerNorthNode.text = fontMapFinalNorthNode;
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
                          fontMapMoon = fontHexNumbersList.indexOf(_dropdownMoon);
                          fontMapFinalMoon =
                          fontHexOrderList[fontMapMoon];
                          _controllerMoon.text = fontMapFinalMoon;
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
                          fontMapMercury =
                              fontHexNumbersList.indexOf(_dropdownMercury);
                          fontMapFinalMercury =
                          fontHexOrderList[fontMapMercury];
                          _controllerMercury.text = fontMapFinalMercury;
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
                          fontMapVenus =
                              fontHexNumbersList.indexOf(_dropdownVenus);
                          fontMapFinalVenus =
                          fontHexOrderList[fontMapVenus];
                          _controllerVenus.text = fontMapFinalVenus;

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
                          fontMapMars =
                              fontHexNumbersList.indexOf(_dropdownMars);
                          fontMapFinalMars =
                          fontHexOrderList[fontMapMars];
                          _controllerMars.text = fontMapFinalMars;

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
                          fontMapJupiter =
                              fontHexNumbersList.indexOf(_dropdownJupiter);
                          fontMapFinalJupiter =
                          fontHexOrderList[fontMapJupiter];
                          _controllerJupiter.text = fontMapFinalJupiter;

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
                          fontMapSaturn =
                              fontHexNumbersList.indexOf(_dropdownSaturn);
                          fontMapFinalSaturn =
                          fontHexOrderList[fontMapSaturn];
                          _controllerSaturn.text = fontMapFinalSaturn;

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
                          fontMapUranus =
                              fontHexNumbersList.indexOf(_dropdownUranus);
                          fontMapFinalUranus =
                          fontHexOrderList[fontMapUranus];
                          _controllerUranus.text = fontMapFinalUranus;
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
                          fontMapNeptune =
                              fontHexNumbersList.indexOf(_dropdownNeptune);
                          fontMapFinalNeptune =
                          fontHexOrderList[fontMapNeptune];
                          _controllerNeptune.text = fontMapFinalNeptune;
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
                          fontMapPluto =
                              fontHexNumbersList.indexOf(_dropdownPluto);
                          fontMapFinalPluto =
                          fontHexOrderList[fontMapPluto];
                          _controllerPluto.text = fontMapFinalPluto;
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
                          fontMapEarth =
                              fontHexNumbersList.indexOf(_dropdownEarth);
                          fontMapFinalEarth =
                          fontHexOrderList[fontMapEarth];
                          _controllerEarth.text = fontMapFinalEarth;
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
                          fontMapSouthNode =
                              fontHexNumbersList.indexOf(_dropdownSouthNode);
                          fontMapFinalSouthNode =
                          fontHexOrderList[fontMapSouthNode];
                          _controllerSouthNode.text = fontMapFinalSouthNode;
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
                            fontMapSun = fontHexNumbersList.indexOf(_dropdownSun);
                            fontMapFinalSun =
                                fontHexOrderList[fontMapSun];
                            _controllerSun.text = fontMapFinalSun;

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
                      const Expanded(
                        child: Text("Sun",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ),
                      Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'a'),
                              controller: _controllerSun,
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
                          fontMapNorthNode =
                              fontHexNumbersList.indexOf(_dropdownNorthNode);
                          fontMapFinalNorthNode =
                              fontHexOrderList[fontMapNorthNode];
                          _controllerNorthNode.text = fontMapFinalNorthNode;
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
                    const Expanded(
                      child: Text("North Node",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                    ),
                    Expanded(
                        child: TextField(
                            readOnly: true,
                            decoration:
                                const InputDecoration.collapsed(hintText: 'a'),
                            textAlign: TextAlign.right,
                            controller: _controllerNorthNode,
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
                            fontMapMoon = fontHexNumbersList.indexOf(_dropdownMoon);
                            fontMapFinalMoon =
                                fontHexOrderList[fontMapMoon];
                            _controllerMoon.text = fontMapFinalMoon;
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
                      const Expanded(
                        child: Text("Moon",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ),
                      Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'a'),
                              controller: _controllerMoon,
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
                              fontMapMercury =
                                  fontHexNumbersList.indexOf(_dropdownMercury);
                              fontMapFinalMercury =
                                  fontHexOrderList[fontMapMercury];
                              _controllerMercury.text = fontMapFinalMercury;
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
                        const Expanded(
                          child: Text("Mercury",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerMercury,
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
                              fontMapVenus =
                                  fontHexNumbersList.indexOf(_dropdownVenus);
                              fontMapFinalVenus =
                                  fontHexOrderList[fontMapVenus];
                              _controllerVenus.text = fontMapFinalVenus;

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
                        const Expanded(
                          child: Text("Venus",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerVenus,
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
                              fontMapMars =
                                  fontHexNumbersList.indexOf(_dropdownMars);
                              fontMapFinalMars =
                                  fontHexOrderList[fontMapMars];
                              _controllerMars.text = fontMapFinalMars;

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
                        const Expanded(
                          child: Text("Mars",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerMars,
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
                              fontMapJupiter =
                                  fontHexNumbersList.indexOf(_dropdownJupiter);
                              fontMapFinalJupiter =
                                  fontHexOrderList[fontMapJupiter];
                              _controllerJupiter.text = fontMapFinalJupiter;

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
                        const Expanded(
                          child: Text("Jupiter",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerJupiter,
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
                              fontMapSaturn =
                                  fontHexNumbersList.indexOf(_dropdownSaturn);
                              fontMapFinalSaturn =
                                  fontHexOrderList[fontMapSaturn];
                              _controllerSaturn.text = fontMapFinalSaturn;

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
                        const Expanded(
                          child: Text("Saturn",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerSaturn,
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
                              fontMapUranus =
                                  fontHexNumbersList.indexOf(_dropdownUranus);
                              fontMapFinalUranus =
                                  fontHexOrderList[fontMapUranus];
                              _controllerUranus.text = fontMapFinalUranus;
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
                        const Expanded(
                          child: Text("Uranus",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerUranus,
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
                              fontMapNeptune =
                                  fontHexNumbersList.indexOf(_dropdownNeptune);
                              fontMapFinalNeptune =
                                  fontHexOrderList[fontMapNeptune];
                              _controllerNeptune.text = fontMapFinalNeptune;
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
                        const Expanded(
                          child: Text("Neptune",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerNeptune,
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
                              fontMapPluto =
                                  fontHexNumbersList.indexOf(_dropdownPluto);
                              fontMapFinalPluto =
                                  fontHexOrderList[fontMapPluto];
                              _controllerPluto.text = fontMapFinalPluto;
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
                        const Expanded(
                          child: Text("Pluto",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerPluto,
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
                              fontMapEarth =
                                  fontHexNumbersList.indexOf(_dropdownEarth);
                              fontMapFinalEarth =
                                  fontHexOrderList[fontMapEarth];
                              _controllerEarth.text = fontMapFinalEarth;
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
                        const Expanded(
                          child: Text("Earth",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                          child: TextField(
                              readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'a'),
                              controller: _controllerEarth,
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
                              fontMapSouthNode =
                                  fontHexNumbersList.indexOf(_dropdownSouthNode);
                              fontMapFinalSouthNode =
                                  fontHexOrderList[fontMapSouthNode];
                              _controllerSouthNode.text = fontMapFinalSouthNode;
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
                        const Expanded(
                          child: Text("South Node",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Expanded(
                            child: TextField(
                                readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerSouthNode,
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
