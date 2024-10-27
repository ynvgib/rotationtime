import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:flutter/material.dart';

class RotateIDK extends StatefulWidget {
  const RotateIDK({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateIDKState();
  }
}

class _RotateIDKState extends State<RotateIDK> {
  final TextEditingController _controlleriDogText = TextEditingController(),
      _controllerCamelText = TextEditingController();
  //final String _title = subtitles[0];
  final String _title = subtitles_heb[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          title: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 15,
                foregroundImage: AssetImage(fullkitheimglst[8]),
              ),
              const SizedBox(width: 10),
              AutoSizeText(
                '?אני לא יודעת גופוף', textAlign: TextAlign.left,
                //maxFontSize: 15,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.grey),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              height: 215,
              width: 215,
              //margin: const EdgeInsets.only(right: 235, top: 35),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/camog/snoopyq.gif'),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/camog/snoopyempty.png'),
                    fit: BoxFit.scaleDown,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            const Divider(thickness: 5, color: Colors.black),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/minmax/minmicex.png'),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controlleriDogText.text = '!מיקי כלב לא יודע';
                  },
                ),
                const SizedBox(width: 10),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(newminmaxcoins[0]),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controllerCamelText.text = '?עוד מיני שאלה';
                  },
                ),

              ],
            ),
            const Divider(thickness: 5, color: Colors.black),
            AutoSizeTextField(
                maxFontSize: 30,
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: '?מיני שאלה'),
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
                decoration: const InputDecoration.collapsed(
                    hintText: '!ערכה היא לא יודעת'),
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
                        image: AssetImage(fullkitheimglst[9]),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controlleriDogText.text = '!ערך כלב היא לא יודעת';
                  },
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(fullkitheimglst[8]),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controllerCamelText.text = '?ערכה הוא עו"ד גמל';
                  },
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/kithe/kitidkm.png'),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controlleriDogText.text = '!ערכה היא לא יודעת';
                  },
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(fullkitheimglst[10]),
                        fit: BoxFit.scaleDown,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controllerCamelText.text = '?ערכה היא שאלה';
                  },
                ),
              ],
            ),
            const Divider(thickness: 5, color: Colors.black),

            const AutoSizeText('XIO Ido Not Know',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            const Divider(thickness: 5, color: Colors.black),
            const Divider(thickness: 5, color: Colors.black),
            const AutoSizeText('!?גמלכלב',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            const Divider(thickness: 5, color: Colors.black),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child:    const Text(
                    '#',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontFamily: 'iChing',
                    ),
                  ),
                  onTap: () {
                    _controlleriDogText.text = '!אני לא יודעת מדיטציה';
                  },
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 4.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(mcameldog[0]),
                        fit: BoxFit.fitHeight,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controlleriDogText.text = '!גמלכלב';
                  },
                ),
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 4.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(mcameldog[2]),
                        fit: BoxFit.fitHeight,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controlleriDogText.text = '!ווף ווף גוף גוף';
                  },
                ),
                InkWell(
                  child:     Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 4.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(mcameldog[1]),
                        fit: BoxFit.fitHeight,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  onTap: () {
                    _controlleriDogText.text = '!גמל גמל גמל';
                  },
                ),

              ],
            ),
            const Divider(thickness: 5, color: Colors.black),
            const AutoSizeText('אני לא יודעת מדיטציה',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/minmax/minmicidk.png'),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            const AutoSizeText('מיק היא מיני מדיטציה',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/kithe/kitidkm.png'),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            const AutoSizeText('ערכה היא מדיטציה',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            const Divider(thickness: 5, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
