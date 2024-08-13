import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:flutter/material.dart';

class RotateBreath extends StatefulWidget {
  const RotateBreath({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateBreathState();
  }
}

class _RotateBreathState extends State<RotateBreath> {
  final TextEditingController _controllerSimpleText = TextEditingController(),
      _controllerComplexText = TextEditingController();
  //final String _title = subtitles[2];
  //final String _title = subtitles_heb[2];
  final String _title = 'נשימה';

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
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                foregroundImage: AssetImage(minmaximglst[1]),
              ),

            ],
          ),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black87),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(newminmaxcoins[2]),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            const AutoSizeText('מיני נשימה',
                textAlign: TextAlign.center,
                minFontSize: 35,
                maxFontSize: 45,
                style: TextStyle(color: Colors.yellow)),
            const AutoSizeText('ביני בינה',
                textAlign: TextAlign.center,
                minFontSize: 35,
                maxFontSize: 45,
                style: TextStyle(color: Colors.yellow)),
            const AutoSizeText('ערכה הוא',
                textAlign: TextAlign.center,
                minFontSize: 25,
                maxFontSize: 35,
                style: TextStyle(color: Colors.yellow)),
            const AutoSizeText('שאיפה נשיפה',
                textAlign: TextAlign.center,
                minFontSize: 25,
                maxFontSize: 35,
                style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 3.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(kitheimglst[1]),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: MediaQuery.of(context).size.width / 2.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(mplantspos[1]),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Transform.scale(
                  scaleX: -1,
                  scaleY: -1,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(mplantsneg[1]),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 3.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/camog/mcamelyellow.png'),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 3.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/camog/mcamelyellow.png'),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 3.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/camog/mcamelyellow.png'),
                      fit: BoxFit.scaleDown,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ],
            ),
            Center(
              child: AutoSizeTextField(
                  minFontSize: 10,
                  readOnly: false,
                  decoration: const InputDecoration.collapsed(
                      hintStyle: TextStyle(color: Colors.yellow),
                      hintText: ''),
                  textAlign: TextAlign.center,
                  controller: _controllerComplexText,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.normal)),
            ),
            const SizedBox(
              height: 30.0,
            ),

            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 3.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(titlesicon[2]),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            const Divider(thickness: 5,indent: 5, endIndent: 5,color: Colors.yellow),
            const SizedBox(height: 10,),
            AutoSizeTextField(
                minFontSize: 10,
                maxLines: 1,
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: 'P',
                    hintStyle: TextStyle(color: Colors.yellow)),
                textAlign: TextAlign.center,
                controller: _controllerSimpleText,
                style: const TextStyle(
                    fontFamily: 'iChing',
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.normal)),
            const Divider(thickness: 5,indent: 5, endIndent: 5,color: Colors.yellow),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
