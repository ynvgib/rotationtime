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
  final TextEditingController _controllerNorthNode = TextEditingController();
  final TextEditingController _controllerSun = TextEditingController();
  final TextEditingController _controllerMoon = TextEditingController();
  final TextEditingController _controllerMars = TextEditingController();
  final TextEditingController _controllerVenus = TextEditingController();
  final TextEditingController _controllerMercury = TextEditingController();
  final TextEditingController _controllerJupiter = TextEditingController();
  final TextEditingController _controllerSaturn = TextEditingController();
  final TextEditingController _controllerUranus = TextEditingController();
  final TextEditingController _controllerNeptune = TextEditingController();
  final TextEditingController _controllerPluto = TextEditingController();
  final TextEditingController _controllerEarth = TextEditingController();
  final TextEditingController _controllerSouthNode = TextEditingController();

  String? dropdownNorthNode = hexagramslist[1];
  String? dropdownSun = hexagramslist[1];
  String? dropdownMoon = hexagramslist[1];
  String? dropdownMars = hexagramslist[1];
  String? dropdownVenus = hexagramslist[1];
  String? dropdownMercury = hexagramslist[1];
  String? dropdownJupiter = hexagramslist[1];
  String? dropdownSaturn = hexagramslist[1];
  String? dropdownUranus = hexagramslist[1];
  String? dropdownNeptune = hexagramslist[1];
  String? dropdownPluto = hexagramslist[1];
  String? dropdownEarth = hexagramslist[1];
  String? dropdownSouthNode = hexagramslist[1];
  var dropdowichingvalue = orderiChingFontHexagrams[0];
  var dropdowichingordervalue = orderHexagramsWheel[0];

  int? fontMapSun;
  String? fontMapFinalSun;
  int? fontMapNorthNode;
  String? fontMapFinalNorthNode;
  int? fontMapMoon;
  String? fontMapFinalMoon;
  int? fontMapMercury;
  String? fontMapFinalMercury;
  int? fontMapVenus;
  String? fontMapFinalVenus;
  int? fontMapMars;
  String? fontMapFinalMars;
  int? fontMapJupiter;
  String? fontMapFinalJupiter;
  int? fontMapSaturn;
  String? fontMapFinalSaturn;
  int? fontMapUranus;
  String? fontMapFinalUranus;
  int? fontMapNeptune;
  String? fontMapFinalNeptune;
  int? fontMapPluto;
  String? fontMapFinalPluto;
  int? fontMapEarth;
  String? fontMapFinalEarth;
  int? fontMapSouthNode;
  String? fontMapFinalSouthNode;

  // visibility of planets init
  bool isSunVisible = true;
  bool isEarthVisible = true;
  bool isNorthNodeVisible = true;
  bool isSouthNodeVisible = true;
  bool isMoonVisible = true;
  bool isMercuryVisible = true;
  bool isVenusVisible = true;
  bool isMarsVisible = true;
  bool isJupiterVisible = true;
  bool isSaturnVisible = true;
  bool isUranusVisible = true;
  bool isNeptuneVisible = true;
  bool isPlutoVisible = true;
  //bool _isElevated = true;

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
                    image: const DecorationImage(image: AssetImage("assets/planets/northnode.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/sun.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/moon.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/mercury.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/venus.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/mars.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/jupiter.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/saturn.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/uranus.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/neptune.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/pluto.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/earth.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: const DecorationImage(image: AssetImage("assets/planets/southnode.png")),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1
                      ),

                    ]
                ),
              ),
            ],
            isSelected: _isPlanetSelectedList,
            onPressed: (int index) {
              setState(() {
                _isPlanetSelectedList[index] = !_isPlanetSelectedList[index];
                switch (index) {
                  case 0:
                    isNorthNodeVisible = !isNorthNodeVisible;
                    break;
                  case 1:
                    isSunVisible = !isSunVisible;
                    break;
                  case 2:
                    isMoonVisible = !isMoonVisible;
                    break;
                  case 3:
                    isMercuryVisible = !isMercuryVisible;
                    break;
                  case 4:
                    isVenusVisible = !isVenusVisible;
                    break;
                  case 5:
                    isMarsVisible = !isMarsVisible;
                    break;
                  case 6:
                    isJupiterVisible = !isJupiterVisible;
                    break;
                  case 7:
                    isSaturnVisible = !isSaturnVisible;
                    break;
                  case 8:
                    isUranusVisible = !isUranusVisible;
                    break;
                  case 9:
                    isNeptuneVisible = !isNeptuneVisible;
                    break;
                  case 10:
                    isPlutoVisible = !isPlutoVisible;
                    break;
                  case 11:
                    isEarthVisible = !isEarthVisible;
                    break;
                  case 12:
                    isSouthNodeVisible = !isSouthNodeVisible;
                    break;
                  default:
                    isSunVisible = !isSunVisible;
                }
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          // 1st row
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: isSunVisible,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Row(
                      children: [
                        const CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundColor: Colors.blue,
                            foregroundImage:
                                AssetImage('assets/planets/sun.png')),
                        Container(
                            alignment: Alignment.center,
                            width: 80,
                            child: const Text("Sun",
                                style: TextStyle(fontSize: 30, color: Colors.black))),
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: dropdownSun,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (String? dropdownSunChange) {
                            setState(() {
                              dropdownSun = dropdownSunChange!;
                              fontMapSun = fontHexbyWheel.indexOf(dropdownSun!);
                              fontMapFinalSun = fontHexagramsMap[fontMapSun];
                              _controllerSun.text = fontMapFinalSun!;
                            });
                          },
                        ),
                        SizedBox(
                            width: 70,
                            child: TextField( readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                textAlign: TextAlign.left,
                                controller: _controllerSun,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'iChing',
                                    color: Colors.blue))),
                      ],
                    ),
                  ),
                ),
                Visibility(
                    visible: isNorthNodeVisible,
                    child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)),
                        child: Row(children: [
                          const CircleAvatar(
                              minRadius: 30.0,
                              maxRadius: 30.0,
                              backgroundColor: Colors.blue,
                              foregroundImage:
                                  AssetImage('assets/planets/northnode.png')),
                          Container(
                              alignment: Alignment.center,
                              width: 180,
                              child: const Text("North Node",
                                  style: TextStyle(fontSize: 30, color: Colors.black))),
                          DropdownButton(
                            underline:
                                DropdownButtonHideUnderline(child: Container()),
                            value: dropdownNorthNode,
                            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                            items: hexDropDownNumbersList,
                            onChanged: (String? dropdownNorthNodeChange) {
                              setState(() {
                                dropdownNorthNode = dropdownNorthNodeChange!;
                                fontMapNorthNode =
                                    fontHexbyWheel.indexOf(dropdownNorthNode!);
                                fontMapFinalNorthNode =
                                    fontHexagramsMap[fontMapNorthNode];
                                _controllerNorthNode.text =
                                    fontMapFinalNorthNode!;
                              });
                            },
                          ),
                          SizedBox(
                              width: 90,
                              //alignment: Alignment.center,
                              child: TextField( readOnly: true,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: 'a'),
                                  textAlign: TextAlign.right,
                                  controller: _controllerNorthNode,
                                  style: const TextStyle(
                                      fontSize: 50,
                                      fontFamily: 'iChing',
                                      color: Colors.blue))),
                        ]))),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: isMoonVisible,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.greenAccent)),
                    child: Row(children: [
                      const CircleAvatar(
                          minRadius: 30.0,
                          maxRadius: 30.0,
                          backgroundColor: Colors.green,
                          backgroundImage:
                              AssetImage('assets/planets/moon.png')),
                      Container(
                          alignment: Alignment.center,
                          width: 100,
                          child: const Text("Moon",
                              style: TextStyle(
                                fontSize: 30, color: Colors.black
                              ))),
                      DropdownButton(
                        underline:
                            DropdownButtonHideUnderline(child: Container()),
                        value: dropdownMoon,
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                        items: hexDropDownNumbersList,
                        onChanged: (String? dropdownMoonChange) {
                          setState(() {
                            dropdownMoon = dropdownMoonChange!;
                            fontMapMoon = fontHexbyWheel.indexOf(dropdownMoon!);
                            fontMapFinalMoon = fontHexagramsMap[fontMapMoon];
                            _controllerMoon.text = fontMapFinalMoon!;
                          });
                        },
                      ),
                      SizedBox(
                          width: 60,
                          child: TextField( readOnly: true,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'a'),
                              controller: _controllerMoon,
                              style: const TextStyle(
                                  fontSize: 50,
                                  fontFamily: 'iChing',
                                  color: Colors.green))),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: isMercuryVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent)),
                      child: Row(children: [
                        const CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundColor: Colors.green,
                            backgroundImage:
                                AssetImage('assets/planets/mercury.png')),
                        Container(
                            alignment: Alignment.center,
                            width: 130,
                            child: const Text("Mercury",
                                style: TextStyle(
                                  fontSize: 30, color: Colors.black
                                ))),
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: dropdownMercury,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (String? dropdownMercuryChange) {
                            setState(() {
                              dropdownMercury = dropdownMercuryChange!;
                              fontMapMercury =
                                  fontHexbyWheel.indexOf(dropdownMercury!);
                              fontMapFinalMercury =
                                  fontHexagramsMap[fontMapMercury];
                              _controllerMercury.text = fontMapFinalMercury!;
                            });
                          },
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 50,
                            alignment: Alignment.center,
                            child: TextField( readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerMercury,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'iChing',
                                    color: Colors.green))),
                      ])),
                ),
                Visibility(
                  visible: isVenusVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent)),
                      child: Row(children: [
                        const CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundColor: Colors.green,
                            backgroundImage:
                                AssetImage('assets/planets/venus.png')),
                        Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: const Text("Venus",
                                style: TextStyle(
                                  fontSize: 30, color: Colors.black
                                ))),
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: dropdownVenus,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (String? dropdownVenusdChange) {
                            setState(() {
                              dropdownVenus = dropdownVenusdChange!;
                              fontMapVenus =
                                  fontHexbyWheel.indexOf(dropdownVenus!);
                              fontMapFinalVenus =
                                  fontHexagramsMap[fontMapVenus];
                              _controllerVenus.text = fontMapFinalVenus!;
                            });
                          },
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 50,
                            alignment: Alignment.center,
                            child: TextField( readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerVenus,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'iChing',
                                    color: Colors.green))),
                      ])),
                ),

                // Mars
                Visibility(
                  visible: isMarsVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.greenAccent)),
                      child: Row(children: [
                        const CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundColor: Colors.green,
                            backgroundImage:
                                AssetImage('assets/planets/mars.png')),
                        Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: const Text("Mars",
                                style: TextStyle(
                                  fontSize: 30, color: Colors.black
                                ))),
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: dropdownMars,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (String? dropdownMarsChange) {
                            setState(() {
                              dropdownMars = dropdownMarsChange!;
                              fontMapMars =
                                  fontHexbyWheel.indexOf(dropdownMars!);
                              fontMapFinalMars = fontHexagramsMap[fontMapMars];
                              _controllerMars.text = fontMapFinalMars!;
                            });
                          },
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 50,
                            alignment: Alignment.center,
                            child: TextField( readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerMars,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'iChing',
                                    color: Colors.green))),
                      ])),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: isJupiterVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Row(children: [
                        const CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundColor: Colors.yellow,
                            backgroundImage:
                                AssetImage('assets/planets/jupiter.png')),
                        Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: const Text("Jupiter",
                                style: TextStyle(
                                  fontSize: 30, color: Colors.black
                                ))),
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: dropdownJupiter,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (String? dropdownJupiterChange) {
                            setState(() {
                              dropdownJupiter = dropdownJupiterChange!;
                              fontMapJupiter =
                                  fontHexbyWheel.indexOf(dropdownJupiter!);
                              fontMapFinalJupiter =
                                  fontHexagramsMap[fontMapJupiter];
                              _controllerJupiter.text = fontMapFinalJupiter!;
                            });
                          },
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 50,
                            alignment: Alignment.center,
                            child: TextField( readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerJupiter,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'iChing',
                                    color: Colors.yellow))),
                      ])),
                ),
                Visibility(
                  visible: isSaturnVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Row(children: [
                        const CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundColor: Colors.yellow,
                            backgroundImage:
                                AssetImage('assets/planets/saturn.png')),
                        Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: const Text("Saturn",
                                style: TextStyle(
                                  fontSize: 30, color: Colors.black
                                ))),
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: dropdownSaturn,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (String? dropdownSaturnChange) {
                            setState(() {
                              dropdownSaturn = dropdownSaturnChange!;
                              fontMapSaturn =
                                  fontHexbyWheel.indexOf(dropdownSaturn!);
                              fontMapFinalSaturn =
                                  fontHexagramsMap[fontMapSaturn];
                              _controllerSaturn.text = fontMapFinalSaturn!;
                            });
                          },
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 50,
                            alignment: Alignment.center,
                            child: TextField( readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerSaturn,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'iChing',
                                    color: Colors.yellow))),
                      ])),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: isUranusVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Row(children: [
                        const CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundColor: Colors.yellow,
                            backgroundImage:
                                AssetImage('assets/planets/uranus.png')),
                        Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: const Text("Uranus",
                                style: TextStyle(
                                  fontSize: 30, color: Colors.black
                                ))),
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: dropdownUranus,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (String? dropdownUranusChange) {
                            setState(() {
                              dropdownUranus = dropdownUranusChange!;
                              fontMapUranus =
                                  fontHexbyWheel.indexOf(dropdownUranus!);
                              fontMapFinalUranus =
                                  fontHexagramsMap[fontMapUranus];
                              _controllerUranus.text = fontMapFinalUranus!;
                            });
                          },
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 50,
                            alignment: Alignment.center,
                            child: TextField( readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerUranus,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'iChing',
                                    color: Colors.yellow))),
                      ])),
                ),
                Visibility(
                  visible: isNeptuneVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Row(children: [
                        const CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundColor: Colors.yellow,
                            backgroundImage:
                                AssetImage('assets/planets/neptune.png')),
                        Container(
                            alignment: Alignment.center,
                            width: 130,
                            child: const Text("Neptune",
                                style: TextStyle(
                                  fontSize: 30, color: Colors.black
                                ))),
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: dropdownNeptune,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (String? dropdownNeptuneChange) {
                            setState(() {
                              dropdownNeptune = dropdownNeptuneChange!;
                              fontMapNeptune =
                                  fontHexbyWheel.indexOf(dropdownNeptune!);
                              fontMapFinalNeptune =
                                  fontHexagramsMap[fontMapNeptune];
                              _controllerNeptune.text = fontMapFinalNeptune!;
                            });
                          },
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 50,
                            alignment: Alignment.center,
                            child: TextField( readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerNeptune,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'iChing',
                                    color: Colors.yellow))),
                      ])),
                ),
                Visibility(
                  visible: isPlutoVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellowAccent)),
                      child: Row(children: [
                        const CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundColor: Colors.yellow,
                            backgroundImage:
                                AssetImage('assets/planets/pluto.png')),
                        Container(
                            alignment: Alignment.center,
                            width: 100,
                            child: const Text("Pluto",
                                style: TextStyle(
                                  fontSize: 30, color: Colors.black
                                ))),
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: dropdownPluto,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (String? dropdownPlutoChange) {
                            setState(() {
                              dropdownPluto = dropdownPlutoChange!;
                              fontMapPluto =
                                  fontHexbyWheel.indexOf(dropdownPluto!);
                              fontMapFinalPluto =
                                  fontHexagramsMap[fontMapPluto];
                              _controllerPluto.text = fontMapFinalPluto!;
                            });
                          },
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 50,
                            alignment: Alignment.center,
                            child: TextField( readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerPluto,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'iChing',
                                    color: Colors.yellow))),
                      ])),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: isEarthVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.redAccent)),
                      child: Row(children: [
                        const CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundColor: Colors.red,
                            backgroundImage:
                                AssetImage('assets/planets/earth.png')),
                        Container(
                            alignment: Alignment.center,
                            width: 90,
                            child: const Text("Earth",
                                style: TextStyle(
                                  fontSize: 30, color: Colors.black
                                ))),
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: dropdownEarth,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (String? dropdownEarthChange) {
                            setState(() {
                              dropdownEarth = dropdownEarthChange!;
                              fontMapEarth =
                                  fontHexbyWheel.indexOf(dropdownEarth!);
                              fontMapFinalEarth =
                                  fontHexagramsMap[fontMapEarth];
                              _controllerEarth.text = fontMapFinalEarth!;
                            });
                          },
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 50,
                            alignment: Alignment.center,
                            child: TextField( readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerEarth,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'iChing',
                                    color: Colors.red))),
                      ])),
                ),
                Visibility(
                  visible: isSouthNodeVisible,
                  child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.redAccent)),
                      child: Row(children: [
                        const CircleAvatar(
                            minRadius: 30.0,
                            maxRadius: 30.0,
                            backgroundColor: Colors.red,
                            backgroundImage:
                                AssetImage('assets/planets/southnode.png')),
                        Container(
                            alignment: Alignment.center,
                            width: 180,
                            child: const Text("South Node",
                                style: TextStyle(
                                  fontSize: 30, color: Colors.black
                                ))),
                        DropdownButton(
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: dropdownSouthNode,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          items: hexDropDownNumbersList,
                          onChanged: (String? dropdownSouthNodeChange) {
                            setState(() {
                              dropdownSouthNode = dropdownSouthNodeChange!;
                              fontMapSouthNode =
                                  fontHexbyWheel.indexOf(dropdownSouthNode!);
                              fontMapFinalSouthNode =
                                  fontHexagramsMap[fontMapSouthNode];
                              _controllerSouthNode.text =
                                  fontMapFinalSouthNode!;
                            });
                          },
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 50,
                            alignment: Alignment.center,
                            child: TextField( readOnly: true,
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'a'),
                                controller: _controllerSouthNode,
                                style: const TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'iChing',
                                    color: Colors.red))),
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
