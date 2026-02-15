import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class RotateIDK extends StatefulWidget {
  const RotateIDK({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateIDKState();
  }
}

//class _RotateIDKState extends State<RotateIDK> {
class _RotateIDKState extends State<RotateIDK>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controlleriDogText = TextEditingController(),
      _controllerCamelText = TextEditingController();
  //final String _title = subtitles[0];
  final String _title = subtitles_heb[0];

  String meditationText = ".מדיטציה", camogText = '!?לא יודעת';
  bool isMeditationText = true, isCamogText = true;

  @override
  void initState() {
    super.initState();
    // Initialize any controllers if needed
  }

  @override
  void dispose() {
    // Dispose of all controllers specific to this screen
    // Example: _controllerone.dispose(); _controllertoptext.dispose(); etc.
    _controlleriDogText.dispose();
    _controllerCamelText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          title: const Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'I do not know',
                textAlign: TextAlign.left,
                minFontSize: 10,
                maxFontSize: 15,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 10),
              AutoSizeText(
                '?  אני לא יודעת',
                textAlign: TextAlign.left,
                minFontSize: 10,
                maxFontSize: 15,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Transform(
                      transform: Matrix4.rotationX(0.0),
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/camog/mcameline.png'),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 10,
                    start: 100,
                    child: Transform(
                      transform: Matrix4.rotationY(math.pi),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/camog/zbgreencamel.png'),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 40,
                    start: 150,
                    child: Transform(
                      transform: Matrix4.rotationY(math.pi),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/camog/zbluecamel.png'),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 10,
                    end: -100,
                    child: Transform(
                      transform: Matrix4.rotationY(math.pi),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/camog/zbyellowcamel.png'),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    start: 95,
                    child: Container(
                      height: 50,
                      width: 50,
                      //margin: const EdgeInsets.only(right: 235, top: 35),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/coins/rtevolutionnobg.png'),
                          fit: BoxFit.scaleDown,
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: const AutoSizeText('@',
                      textAlign: TextAlign.center,
                      minFontSize: 65,
                      maxFontSize: 75,
                      style: TextStyle(color: Colors.white)),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 150,
                        width: 150,
                        //margin: const EdgeInsets.only(right: 235, top: 35),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/camog/dogdownapp.png'),
                            fit: BoxFit.scaleDown,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 1,
                      end: 1,
                      child: Transform.rotate(
                        angle: 0.45,
                        child: Container(
                          height: 80,
                          width: 80,
                          //margin: const EdgeInsets.only(right: 235, top: 35),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/coins/rtevolutionnobg.png'),
                              fit: BoxFit.scaleDown,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(thickness: 5, color: Colors.black),
            AutoSizeTextField(
                maxFontSize: 30,
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: '?'),
                textAlign: TextAlign.center,
                controller: _controllerCamelText,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
            const SizedBox(
              height: 30.0,
            ),
            AutoSizeTextField(
                maxFontSize: 30,
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: '!'),
                textAlign: TextAlign.center,
                controller: _controlleriDogText,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
            const SizedBox(
              height: 30.0,
            ),
            AutoSizeTextField(
                maxFontSize: 30,
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: '.'),
                textAlign: TextAlign.center,
                controller: _controlleriDogText,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontFamily: 'iChing',
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30.0,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/camog/mcameline.png'),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controllerCamelText.text = 'Gamal ? קאמל';
                  },
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/camog/dogswoofgoof.gif'),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controlleriDogText.text = 'Kelev ! דוג';
                  },
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 4.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/camog/zblackcat.png'),
                        fit: BoxFit.fitHeight,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controllerCamelText.text = 'Black Pussy Cat?';
                    _controlleriDogText.text = 'Ido Not Know ! מדיטציה';
                  },
                ),
              ],
            ),
            const Divider(thickness: 5, color: Colors.black),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width / 1.5,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.blue,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1),
                    BoxShadow(
                        color: Colors.green,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1),
                  ]),
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: InkWell(
                  child: AutoSizeText(
                    //'זמן סיבוב',
                    camogText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 2.0),
                  ),
                  onTap: () {
                    isCamogText = !isCamogText;
                    setState(() {
                      isCamogText == true
                          ? camogText = "?עידו לא יודע"
                          : camogText = "Ido Not Know?";
                    });
                  },
                ),
              ),
            ),
            const Divider(thickness: 5, color: Colors.black),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width / 1.5,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.red,
                        offset: Offset(4, 4),
                        blurRadius: 20,
                        spreadRadius: 1),
                    BoxShadow(
                        color: Colors.yellow,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1),
                  ]),
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: InkWell(
                  child: AutoSizeText(
                    //'זמן סיבוב',
                    meditationText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1.5),
                  ),
                  onTap: () {
                    isMeditationText = !isMeditationText;
                    setState(() {
                      isMeditationText == true
                          ? meditationText = "!מדיטציה"
                          : meditationText = "meditation!";
                    });
                  },
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width / 3.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/coins/rtevolutionnobg.png'),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width / 3.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/camog/zblackcat.png'),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            //const Divider(thickness: 5, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
