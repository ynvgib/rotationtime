import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_list/circle_list.dart';
import 'package:finallyicanlearn/models/hdlist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:finallyicanlearn/rotations/rotatecomplex.dart';
import 'package:finallyicanlearn/rotations/rotatefitgam.dart';
import 'package:finallyicanlearn/rotations/rotatefitgamhe.dart';
import 'package:finallyicanlearn/rotations/rotateisog.dart';
import 'package:finallyicanlearn/rotations/rotateisogch.dart';
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
import 'package:sweph/sweph.dart' hide Visibility;
import 'package:url_launcher/url_launcher.dart';

// github project link
// https://www.github.com/ynvgib/rotationtime

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Sweph.init(epheAssets: [
  //  "assets/ephe/seas_18.se1",
  //  "assets/ephe/sepl_12.se1",
  //  "assets/ephe/sepl_18.se1",
  //]);

  //teledart
  //https://t.me/idonotknowbot_bot
  //await TelegramClient.init();

  runApp(const RotateMain());
}

class RotateMain extends StatelessWidget {
  const RotateMain({super.key});

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
        pdfroutes[5]: (ctx) => const RotateIsogHeCh(),
        pdfroutes[2]: (ctx) => const RotateFitGamHe(),
        pdfroutes[3]: (ctx) => const RotateFitGam(),
        pdfroutes[0]: (ctx) => const RotateIsogHe(),
        pdfroutes[1]: (ctx) => const RotateIsog(),
        pdfroutes[4]: (ctx) => const RotatePDF(),
        mainroutes[3]: (ctx) => const RotateIDK(),
        mainroutes[4]: (ctx) => const RotateComplex(),
        mainroutes[2]: (ctx) => const RotateSimple(),
        mainroutes[1]: (ctx) => const RotateBreath(),
        mainroutes[0]: (ctx) => const RotateSilence(),
      },
      theme: ThemeData(
        hoverColor: Colors.grey,
      ),
    );
  }
}

class RotateHome extends StatefulWidget {
  const RotateHome({super.key});

  @override
  State<RotateHome> createState() => _RotateHomeState();
}

class _RotateHomeState extends State<RotateHome> {
  @override
  void dispose() {
    // Dispose of CarouselSliderControllers

    super.dispose();
  }

  final String _title = 'כותרת',
      beidontknowsite = 'rotation-time.web.app',
      githubrotatesite = 'www.github.com/ynvgib/rotationtime',
      githubproject = 'Github Project';

  //final List<String> _titles = subtitles;
  final Uri beidontknowurl = Uri.parse('https://rotation-time.web.app/'),
      githubrotateurl = Uri.parse('https://www.github.com/ynvgib/rotationtime');

  Offset _offset = Offset.zero;
  // Add throttle variables

  DateTime? _lastOffsetUpdate;
  Duration _throttleDuration = Duration(milliseconds: 16); // ~60 FPS

  double screenwidth = 1, screenheight = 1;
  final CarouselSliderController _controllertop = CarouselSliderController(),
      _controllermid = CarouselSliderController(),
      _controllerbot = CarouselSliderController();

  int _currenttop = 0, _currentmid = 0, _currentbot = 0;

  String mainTitle = "זמן סיבוב", subTitle = "זמנסי גמלבן בוב";
  bool isMainTitle = true, isSubTitle = true, isFullScreen = true;

  final List<BoxShape> bordershapelist = [
    BoxShape.circle,
    BoxShape.circle,
    BoxShape.rectangle,
    BoxShape.circle,
    BoxShape.circle,
  ];

  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    //return GestureDetector(
    //  onPanUpdate: (details) {
    //   setState(() => _offset += details.delta);
    // },
    return GestureDetector(
      onPanUpdate: (details) {
        final now = DateTime.now();
        if (_lastOffsetUpdate == null ||
            now.difference(_lastOffsetUpdate!) > _throttleDuration) {
          setState(() => _offset += details.delta);
          _lastOffsetUpdate = now;
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
            height: 80,
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
                    color: Colors.white70,
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
                    color: Colors.white70,
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
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              //colors: [Colors.white, Colors.blue,Colors.green, Colors.yellow,Colors.red, Colors.black,],
              colors: [
                Colors.white,
                Colors.black,
                // Colors.pink,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 30),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: InkWell(
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors
                                        .transparent, //                   <--- border color
                                    width: 1.0,
                                  ),
                                  image: DecorationImage(
                                      //image: AssetImage(newminmaxcoins[index]),
                                      image: const AssetImage(
                                        // 'assets/mink/minkupblack.webp',
                                        'assets/camog/zblackcat.png',
                                      ),
                                      colorFilter: ColorFilter.mode(
                                        Colors.white.withValues(alpha: 1.0),
                                        BlendMode.modulate,
                                      ))),
                            ),
                            onDoubleTap: () {
                              //var tempset = [];
                              //var y = 0;
                              //var g = 0;
                              //for (var x = 0; x < 384; x = x + 6) {
                              // print('//${(x / 6).floor() + 1}');
                              // g = 0;
                              // y = ((x + 6) / 6).toInt();
                              // for (var i = 6; i > 0; i--) {
                              // g++;
                              //print('$y.$g: \'${hdlinesexalted[i + x]}\',');
                              // print(
                              // '\'${hdlinesdetriment[i + x]}\', \/\/$y.$g ');

                              // print(i);
                              //i = i - 1;
                            }
                            //x = x + 6;
                            // }

                            // setState(() {});
                            // },
                            ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.elliptical(50, 20),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(5),
                            topRight: Radius.zero,
                          ),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                //colors: [Colors.white, Colors.blue,Colors.green, Colors.yellow,Colors.red, Colors.black,],
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Colors.blue,
                                  Colors.green,
                                  Colors.yellow,
                                  Colors.red,
                                  Colors.black,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              //color: Colors.pink,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/camog/mcameline.png',
                                ),
                                fit: BoxFit.scaleDown,
                              ),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                        onDoubleTap: () {
                          //setState(() {
                          //appBarHeight = 35; // After status bar hidden, make AppBar height smaller
                          //});
                          isFullScreen = !isFullScreen;
                          isFullScreen == true
                              ? SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.manual,
                                  overlays: [SystemUiOverlay.bottom])
                              : SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.immersive);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        //borderRadius: BorderRadius.circular(25),
                        shape: BoxShape.rectangle,
                        boxShadow: [
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
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                        onTap: () {
                          isMainTitle = !isMainTitle;
                          setState(() {
                            isMainTitle == true
                                ? mainTitle = "זמן סיבוב"
                                : mainTitle = "ZB";
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
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
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 2.0),
                        ),
                        onTap: () {
                          isSubTitle = !isSubTitle;
                          setState(() {
                            isSubTitle == true
                                ? subTitle = "זמנסי גמלורוד בוב"
                                : subTitle = "zmansi PINK CAMEL bob";
                          });
                        },
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 5,
                  ),
                  Stack(
                    children: [
                      CircleList(
                        innerRadius: 45,
                        childrenPadding: 1,
                        initialAngle: 1,
                        origin: const Offset(0, 0),
                        centerWidget: Center(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors
                                          .white, //                   <--- border color
                                      width: 3.0,
                                    ),
                                    image: DecorationImage(
                                        //image: AssetImage(newminmaxcoins[index]),
                                        image: const AssetImage(
                                          // 'assets/mink/minkdanes.webp',
                                          'assets/camog/zblackcat.png',
                                        ),
                                        colorFilter: ColorFilter.mode(
                                          Colors.white.withValues(alpha: 0.0),
                                          BlendMode.modulate,
                                        ))),
                              ),
                              Visibility(
                                visible: true,
                                child: PositionedDirectional(
                                  top: 23,
                                  end: 18,
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors
                                              .transparent, //                   <--- border color
                                          width: 1.0,
                                        ),
                                        image: DecorationImage(
                                            //image: AssetImage(newminmaxcoins[index]),
                                            image: const AssetImage(
                                                'assets/camog/zblackcat.png'),
                                            colorFilter: ColorFilter.mode(
                                              Colors.white
                                                  .withValues(alpha: 1.0),
                                              BlendMode.modulate,
                                            ))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        children: List.generate(5, (index) {
                          return Tooltip(
                            message: circle_tips[index],
                            textStyle: const TextStyle(
                                fontSize: 14, color: Colors.white),
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              child: Container(
                                width: 100,
                                height: 100,
                                margin: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors
                                        .black, //                   <--- border color
                                    width: 1.0,
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  fit: StackFit.loose,
                                  children: [
                                    Visibility(
                                      visible: true,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: bordershapelist[index],
                                            border: Border.all(
                                              //color: colors5lst[index], //                   <--- border color
                                              color: coin6newcolors[
                                                  index], //                   <--- border color
                                              width: 5.0,
                                            ),
                                            image: DecorationImage(
                                                //image: AssetImage(newminmaxcoins[index]),
                                                image: AssetImage(
                                                    rotatelst[index]),
                                                colorFilter: ColorFilter.mode(
                                                  Colors.white
                                                      .withValues(alpha: 0.3),
                                                  BlendMode.modulate,
                                                ))),
                                      ),
                                    ),
                                    Visibility(
                                      visible: false,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                //image: AssetImage(newminmaxcoins[index]),
                                                image: AssetImage(
                                                    pinkrotatelst[index]),
                                                colorFilter: ColorFilter.mode(
                                                  Colors.white
                                                      .withValues(alpha: 1.0),
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
                            ),
                          );
                        }),
                      ),
                      CircleList(
                        innerRadius: 45,
                        childrenPadding: 1,
                        initialAngle: 1,
                        origin: const Offset(0, 0),
                        children: List.generate(5, (index) {
                          return Tooltip(
                            message: circle_tips[index],
                            textStyle: const TextStyle(
                                fontSize: 14, color: Colors.white),
                            child: InkWell(
                              //customBorder: const Border(),
                              child: Container(
                                width: 100,
                                height: 100,
                                margin: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Colors
                                        .transparent, //                   <--- border color
                                    width: 1.0,
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  fit: StackFit.loose,
                                  children: [
                                    Visibility(
                                      visible: true,
                                      child: PositionedDirectional(
                                        bottom: 20,
                                        //start: 1,
                                        child: Container(
                                          height: 75,
                                          width: 75,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  //image: AssetImage(newminmaxcoins[index]),
                                                  image: AssetImage(
                                                      zoonewrotatelst[index]),
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.white
                                                        .withValues(alpha: 1.0),
                                                    BlendMode.modulate,
                                                  ))),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, mainroutes[index]);
                              },
                            ),
                          );
                        }),
                      ),
                    ],
                  ),

                  const Divider(
                    color: Colors.grey,
                    thickness: 5,
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Colors.transparent,
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
                              Align(
                                alignment: AlignmentGeometry.center,
                                //start: 5,
                                //top: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/camog/mcameline.png'),
                                      fit: BoxFit.scaleDown,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ),
                              // PositionedDirectional(
                              Align(
                                alignment: AlignmentGeometry.bottomCenter,
                                //end: 5,
                                //bottom: 0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 4.5,
                                  width:
                                      MediaQuery.of(context).size.width / 4.0,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/camog/dogstwo.gif'),
                                      fit: BoxFit.scaleDown,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ),
                              // PositionedDirectional(
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
                    color: Colors.transparent,
                    thickness: 5,
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
                        child: const ZBCube()),
                  ),
                  const SizedBox(height: 75),

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
                  const SizedBox(height: 50),
                  const AutoSizeText(
                    'a@#OP',
                    minFontSize: 25,
                    maxFontSize: 50,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'iChing',
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 5,
                  ),
                  const SizedBox(height: 5),
                ]),
          ),
        ),
      ),
    );
  }
}
