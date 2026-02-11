import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:flutter/material.dart';

class RotateSilence extends StatefulWidget {
  const RotateSilence({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSilenceState();
  }
}

class _RotateSilenceState extends State<RotateSilence> {
  final String _title = '';

  String mainSilence = ".שתיקה";
  bool isMainSilence = true;

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
                foregroundImage: AssetImage(coins4lst[3]),
              ),
            ],
          ),
          leading: IconButton(
            iconSize: 25,
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.red.withValues(alpha: 0.5)),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 30),
            const AutoSizeText('.',
                textAlign: TextAlign.center,
                minFontSize: 50,
                maxFontSize: 70,
                style: TextStyle(color: Colors.red)),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/camog/zbredog2.png',
                  ),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            const AutoSizeText(' @',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'iChing',
                    fontSize: 80,
                    color: Colors.red,
                    fontWeight: FontWeight.normal)),
            // const AutoSizeText('silence .שתיקה',
            // textAlign: TextAlign.center,
            // minFontSize: 90,
            // maxFontSize: 100,
            // style: TextStyle(color: Colors.red)),
            InkWell(
              child: AutoSizeText(
                //'זמן סיבוב',
                mainSilence,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
              onTap: () {
                isMainSilence = !isMainSilence;
                setState(() {
                  isMainSilence == true
                      ? mainSilence = ".שתיקה"
                      : mainSilence = "silence.";
                });
              },
            ),
            const Divider(
              color: Colors.black,
              thickness: 5,
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    coins4lst[3],
                  ),
                  fit: BoxFit.scaleDown,
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }
}
