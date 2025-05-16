import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:finallyicanlearn/services/rotatewidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

// github project link
// https://www.github.com/ynvgib/rotationtime

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Sweph.init(epheAssets: [
  //  "packages/sweph/assets/ephe/seas_18.se1",
  //]);

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
        '/': (ctx) => const RotateHome(),
        pdfroutes[2]: (ctx) => const RotateFitGamHe(),
        pdfroutes[3]: (ctx) => const RotateFitGam(),
        pdfroutes[0]: (ctx) => const RotateIsogHe(),
        pdfroutes[1]: (ctx) => const RotateIsog(),
        pdfroutes[4]: (ctx) => const RotatePDF(),
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
  final String _title = 'כותרת',
      beidontknowsite = 'rotation-time.web.app',
      githubrotatesite = 'www.github.com/ynvgib/rotationtime',
      githubproject = 'Github Project';

  //final List<String> _titles = subtitles;
  final Uri beidontknowurl = Uri.parse('https://rotation-time.web.app/'),
      githubrotateurl = Uri.parse('https://www.github.com/ynvgib/rotationtime');

  Offset _offset = Offset.zero;
  double screenwidth = 1, screenheight = 1;
  final CarouselSliderController _controllertop = CarouselSliderController(),
      _controllermid = CarouselSliderController(),
      _controllerbot = CarouselSliderController();

  int _currenttop = 0, _currentmid = 0, _currentbot = 0;

  String mainTitle = "זמן סיבוב", subTitle = "זמנסי בוב";
  bool isMainTitle = true, isSubTitle = true;

  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() => _offset += details.delta);
      },
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
            height: 100,
            color: Colors.transparent,
            shape: const CircularNotchedRectangle(),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 5,
                  margin: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                      onPressed: () {
                        launchUrl(githubrotateurl);
                      },
                      icon: Image.asset(
                        'assets/camog/mcdogline.png',
                      ),
                      tooltip: 'קוד קוד Cowd Code'),
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 5,
                  margin: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: IconButton(
                      onPressed: () {
                        launchUrl(beidontknowurl);
                      },
                      icon: Image.asset(
                        'assets/camog/mcameline.png',
                      ),
                      tooltip: 'אוש איית רשת Web Spell'),
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
                              message: circle_tips[index],
                              textStyle: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        //image: AssetImage(newminmaxcoins[index]),
                                        image: AssetImage(mainmailst[index]),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.green,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            blurStyle: BlurStyle.solid,
                            spreadRadius: 4),
                        BoxShadow(
                            color: Colors.blue,
                            offset: Offset(-4, -4),
                            blurRadius: 20,
                            blurStyle: BlurStyle.solid,
                            spreadRadius: 5),
                      ]),
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: InkWell(
                      child: AutoSizeText(
                        //'זמן סיבוב',
                        mainTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            height: 1.5),
                      ),
                      onTap: () {
                        isMainTitle = !isMainTitle;
                        setState(() {
                          isMainTitle == true
                              ? mainTitle = "סיבוב לעיצוב"
                              : mainTitle = "Rotation Time";
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 1.5,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.red,
                            offset: Offset(4, 4),
                            blurRadius: 20,
                            blurStyle: BlurStyle.solid,
                            spreadRadius: 2),
                        BoxShadow(
                            color: Colors.yellow,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            blurStyle: BlurStyle.solid,
                            spreadRadius: 3),
                      ]),
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: InkWell(
                      child: AutoSizeText(
                        subTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 2.0),
                      ),
                      onTap: () {
                        isSubTitle = !isSubTitle;
                        setState(() {
                          isSubTitle == true
                              ? subTitle = "זמנסי בוב"
                              : subTitle = "Zmansi Bob";
                        });
                      },
                    ),
                  ),
                ),
                //new cube
                const SizedBox(height: 35),

                Container(
                  height: 150,
                  width: 150,
                  alignment: Alignment.center,
                  child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateX(_offset.dy * pi / 180)
                        ..rotateY(_offset.dx * pi / 180)
                        ..rotateZ(_offset.dx * pi / 180),
                      child: const Cube()),
                ),
                // end new cube

                const SizedBox(height: 40),

                const Divider(
                  color: Colors.black87,
                  thickness: 5,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight * 0.15,
                    maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: mainSlider,
                    carouselController: _controllertop,
                    options: CarouselOptions(
                        initialPage: 1,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indextop, reason) {
                          setState(() {
                            _currenttop = indextop;
                          });
                        }),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight * 0.15,
                    maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: mainSlider,
                    carouselController: _controllermid,
                    options: CarouselOptions(
                        initialPage: 1,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexmid, reason) {
                          setState(() {
                            _currentmid = indexmid;
                          });
                        }),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10,
                    minWidth: 10,
                    maxHeight: screenheight * 0.15,
                    maxWidth: screenwidth * 0.5,
                  ),
                  child: CarouselSlider(
                    //items: mixHexagramSlidersNew,
                    items: mainSlider,
                    carouselController: _controllerbot,
                    options: CarouselOptions(
                        initialPage: 1,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        aspectRatio: 1.3,
                        onPageChanged: (indexbot, reason) {
                          setState(() {
                            _currentbot = indexbot;
                          });
                        }),
                  ),
                ),
                const Divider(
                  color: Colors.black87,
                  thickness: 5,
                ),
                InkWell(
                  hoverColor: Colors.black12,
                    child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          children: [
                            PositionedDirectional(
                              end: 5,
                              bottom: 0,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width / 5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/camog/dogatapp.gif'),
                                    fit: BoxFit.scaleDown,
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                            PositionedDirectional(
                              start: 5,
                              top: 0,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 8,
                                width: MediaQuery.of(context).size.width / 6,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                    AssetImage('assets/coins/camel.png'),
                                    fit: BoxFit.scaleDown,
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          ],
                        )),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            buildBookPopUp(context),
                      );
                    }),
                const Divider(
                  color: Colors.black87,
                  thickness: 5,
                ),
                const AutoSizeText(
                  'a@#OP',
                  minFontSize: 25,
                  maxFontSize: 50,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'iChing',
                  ),
                ),
                const SizedBox(height: 10),
              ]),
        ),
      ),
    );
  }
}
