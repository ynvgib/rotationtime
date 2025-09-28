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
  final String _title = ',גופוף';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          toolbarHeight: 40,
          title: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                foregroundImage: AssetImage(coins4lst[2]),
              ),
            ],
          ),
          leading: IconButton(
            iconSize: 25,
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.yellow.withValues(alpha:0.5)),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15.0,
            ),
            AutoSizeText(',',
                textAlign: TextAlign.center,
                minFontSize: 65,
                maxFontSize: 75,
                style: TextStyle(color: Colors.yellow)),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/camog/zbyellowoctopussy2.png',
                  ),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
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
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.normal)),
            AutoSizeText(',נשימה',
                textAlign: TextAlign.center,
                minFontSize: 65,
                maxFontSize: 75,
                style: TextStyle(color: Colors.yellow)),
            Container(
              height: MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/mink/minkmmmdot.webp',
                  ),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(  'assets/mink/minkupempty.webp',
                  ),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
