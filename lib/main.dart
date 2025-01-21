import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle_list/circle_list.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:finallyicanlearn/rotations/rotatecomplex.dart';
import 'package:finallyicanlearn/rotations/rotatefitgam.dart';
import 'package:finallyicanlearn/rotations/rotatefitgamhe.dart';
import 'package:finallyicanlearn/rotations/rotateisog.dart';
import 'package:finallyicanlearn/rotations/rotateisoghe.dart';
import 'package:finallyicanlearn/rotations/rotatepdf.dart';
import 'package:finallyicanlearn/rotations/rotatesimple.dart';
import 'package:finallyicanlearn/rotations/rotateidk.dart';
import 'package:finallyicanlearn/rotations/rotatesilence.dart';
import 'package:finallyicanlearn/rotations/rotatebreath.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sweph/sweph.dart';
import 'package:url_launcher/url_launcher.dart';

// github project link
// https://www.github.com/ynvgib/rotationtime

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Sweph.init(epheAssets: [
    "packages/sweph/assets/ephe/seas_18.se1",
  ]);

  //teledart
  //https://t.me/idonotknowbot_bot
  //await TelegramClient.init();

  runApp(const RotateMain());
}

class RotateMain extends StatelessWidget {
  const RotateMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
      supportedLocales: const [Locale('en'), Locale('he')],
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.space): const ActivateIntent(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => RotateHome(),
        pdfroutes[0]: (ctx) => const RotatePDF(),
        pdfroutes[1]: (ctx) => const RotateFitGamHe(),
        pdfroutes[2]: (ctx) => const RotateFitGam(),
        pdfroutes[3]: (ctx) => const RotateIsogHe(),
        pdfroutes[4]: (ctx) => const RotateIsog(),
        mainroutes[4]: (ctx) => const RotateComplex(),
        mainroutes[3]: (ctx) => const RotateSimple(),
        mainroutes[2]: (ctx) => const RotateBreath(),
        mainroutes[1]: (ctx) => const RotateSilence(),
        mainroutes[0]: (ctx) => const RotateIDK(),
      },
      theme: ThemeData(
        dialogBackgroundColor: Colors.white,
        hoverColor: Colors.grey,
      ),
    );
  }
}

class RotateHome extends StatefulWidget {
  const RotateHome({Key? key}) : super(key: key);

  @override
  State<RotateHome> createState() => _RotateHomeState();
}

class _RotateHomeState extends State<RotateHome> {
  //final String _title = maintitle
  final String _title = 'כותרת',
      beidontknowsite = 'rotation-time.web.app',
      githubrotatesite = 'www.github.com/ynvgib/rotationtime',
      githubproject = 'Github Project';

  //final List<String> _titles = subtitles;
  final Uri beidontknowurl = Uri.parse('https://rotation-time.web.app/'),
      githubrotateurl = Uri.parse('https://www.github.com/ynvgib/rotationtime');

  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details){
        setState(() => _offset += details.delta);
      },
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
            color: Colors.black87,
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, pdfroutes[4]);
                  },
                  icon: Image.asset(
                    'assets/camog/mcdog.png',
                  ),
                  tooltip: pdftitle[4],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, pdfroutes[3]);
                  },
                  icon: Image.asset(
                    'assets/camog/dog.png',
                  ),
                  tooltip: pdftitle[3],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, pdfroutes[2]);
                  },
                  icon: Image.asset(
                    'assets/camog/mcdog.png',
                  ),
                  tooltip: pdftitle[2],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, pdfroutes[1]);
                  },
                  icon: Image.asset(
                    'assets/camog/dog.png',
                  ),
                  tooltip: pdftitle[1],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, pdfroutes[0]);
                  },
                  icon: Image.asset(
                    'assets/coins/cameldog.png',
                  ),
                  tooltip: pdftitle[0],
                ),
              ],
            )),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                CircleList(
                  innerRadius: 1,
                  outerRadius: MediaQuery.of(context).size.height / 4.5,
                  childrenPadding: 1,
                  origin: const Offset(0, 0),
                  children: List.generate(5, (index) {
                    return InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        margin: const EdgeInsets.all(1),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.loose,
                          children: [
                            Tooltip(
                              message: woofgoofHebname[index],
                              textStyle:
                              TextStyle(fontSize: 14, color: Colors.white),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      //image: AssetImage(newminmaxcoins[index]),
                                        image: AssetImage(mainwoofgooflst[index]),
                                        colorFilter: ColorFilter.mode(
                                          Colors.white.withOpacity(1.0),
                                          BlendMode.modulate,
                                        ))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, mainroutes[index]);
                      },
                    );
                  }),
                ),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 1.5,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: const FittedBox(
                    fit: BoxFit.fitHeight,
                    child: AutoSizeText(
                      'זמן סיבוב',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width / 1.5,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blueGrey,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            spreadRadius: 1),
                        BoxShadow(
                            color: Colors.black87,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1),
                      ]),
                  child: const FittedBox(
                    fit: BoxFit.fitHeight,
                    child: AutoSizeText(
                      'מעט זמנסי בוב',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                //new cube
                SizedBox(height: 35),

                Container(height: 150, width: 150,
                  alignment: Alignment.center,
                  child: Transform(
                      transform: Matrix4.identity()
                      ..setEntry(3,2,0.001)
                      ..rotateX(_offset.dy * pi / 180)
                      ..rotateY(_offset.dx * pi / 180)
                      ..rotateZ(_offset.dx * pi / 180),
                  child: Cube()),
                ),
                // end new cube

                SizedBox(height: 40),


                const Divider(
                  color: Colors.black87,
                  thickness: 5,
                ),
                const AutoSizeText(
                  'aO#P@',
                  minFontSize: 20,
                  maxFontSize: 50,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'iChing',
                  ),
                ),
                const SizedBox(height: 10),

                Flex(direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: ElevatedButton(
                        onPressed: () {
                          launchUrl(githubrotateurl);
                        },
                        //child: Text(githubproject,
                        child: Text('קוד קוד',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: ElevatedButton(
                        onPressed: () {
                          launchUrl(beidontknowurl);
                        },
                        //child: Text(beidontknowsite,
                        child: Text('לאתר',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

              ]),
        ),
      ),
    );
  }
}
