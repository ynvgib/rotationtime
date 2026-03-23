import 'dart:math';
// import 'package:flutter/foundation.dart'; // This defines kIsWeb
import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/zb/ui/zb_helpers.dart';
import 'package:finallyicanlearn/zb/data/zb_listdb.dart';
import 'package:finallyicanlearn/zb/ui/screens/rotations/rotatecomplex.dart';
import 'package:finallyicanlearn/zb/ui/screens/rotations/rotatefitgam.dart';
import 'package:finallyicanlearn/zb/ui/screens/rotations/rotatefitgamhe.dart';
import 'package:finallyicanlearn/zb/ui/screens/rotations/rotateisog.dart';
import 'package:finallyicanlearn/zb/ui/screens/rotations/rotateisogch.dart';
import 'package:finallyicanlearn/zb/ui/screens/rotations/rotateisoghe.dart';
import 'package:finallyicanlearn/zb/ui/screens/rotations/rotatepdf.dart';
import 'package:finallyicanlearn/zb/ui/screens/rotations/rotatesimple.dart';
import 'package:finallyicanlearn/zb/ui/screens/rotations/rotateidk.dart';
import 'package:finallyicanlearn/zb/ui/screens/rotations/rotatesilence.dart';
import 'package:finallyicanlearn/zb/ui/screens/rotations/rotatebreath.dart';
import 'package:finallyicanlearn/zb/ui/widgets/zb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
// Ensure this is in pubspec.yaml

final rotationTimer = RotationTimerProvider();

// github project link
// https://www.github.com/ynvgib/rotationtime
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SearchHelper.initializeCache();

  runApp(RotateMain());
}

class RotateMain extends StatefulWidget {
  RotateMain() : super(key: mainStateKey);

  // gatestatelist = List.filled(65, 0, growable: false);

  @override
  State<RotateMain> createState() => _RotateMainState(); // Semicolon here is OK
}

class _RotateMainState extends State<RotateMain> {
  int _secondsRemaining = 0;
  bool _timerActive = false;
  Timer? _visualCountdown;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = userDefinedSeconds;
    _startVisualTimer();
  }

  void _startVisualTimer() {
    _visualCountdown?.cancel();
    if (userDefinedSeconds == 0) {
      setState(() {
        _secondsRemaining = 0;
        _timerActive = false;
      });
      return;
    }

    setState(() {
      _secondsRemaining = userDefinedSeconds;
      _timerActive = true;
    });

    _visualCountdown = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (userDefinedSeconds == 0) {
        timer.cancel();
        return;
      }
      if (_timerActive && _secondsRemaining > 0) {
        setState(() => _secondsRemaining--);
      } else if (_secondsRemaining <= 0) {
        hibernateEngine();
        setState(() => _secondsRemaining = userDefinedSeconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.f11): () => toggleFullScreen(),
      },
      child: Focus(
        autofocus: true, // This is the 'RNA' that keeps it listening
        onKeyEvent: (node, event) {
          // Optional: Debugging to see if the 'Breath' is hitting the node
          return KeyEventResult.ignored;
        },
        child: MaterialApp(
          navigatorKey: navigatorKey,
          navigatorObservers: [
            // L4: Simple; - The Initiation of the callback
            MyRouteObserver(
              onNavigation: () {
                // 1. (Time is Neglecting Self expression) - Waiting for the frame to finish
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {
                      // L6: WHITE@ - Pulling the Global Stability (640)
                      _secondsRemaining = userDefinedSeconds;
                    });
                  }
                });
              },
            ),
          ],
          builder: (context, child) {
            return Scaffold(
              // Set global background to transparent to allow image to breathe
              backgroundColor: Colors.transparent,
              body: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      setState(() {
                        _secondsRemaining = userDefinedSeconds;
                      });
                    }
                  });
                  return false;
                },
                child: Listener(
                  behavior: HitTestBehavior.translucent,
                  onPointerHover: (_) {
                    rotationTimer.resetTimer();
                  },
                  onPointerDown: (_) {
                    rotationTimer.resetTimer();
                  },
                  child: Stack(
                    children: [
                      if (child != null) child,
                      // Using ListenableBuilder to isolate rebuilds to just this progress bar
                      ListenableBuilder(
                        listenable: rotationTimer,
                        builder: (context, _) {
                          // Hide if timer is disabled
                          if (userDefinedSeconds == 0) {
                            return const SizedBox.shrink();
                          }

                          return Visibility(
                            visible: false,
                            child: Positioned(
                              top: 0,
                              left: 0,
                              right:
                                  0, // Stretch across top for a "horizon" feel like your image
                              child: Container(
                                height: 6,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      // Cyan glow to match the "Stability & Meditation" vibe
                                      color: Colors.cyanAccent.withValues(
                                        alpha: 0.2,
                                      ),
                                      blurRadius: 15,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: LinearProgressIndicator(
                                  // Accessing time from provider instead of local state
                                  value: rotationTimer.secondsRemaining /
                                      userDefinedSeconds,
                                  backgroundColor: Colors.white.withValues(
                                    alpha: 0.05,
                                  ),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    // Semi-transparent white to mimic the camel's highlight
                                    Colors.white.withValues(alpha: 0.6),
                                  ),
                                  minHeight: 6,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
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
            mainroutes[4]: (ctx) => const RotateComplex(),
            mainroutes[3]: (ctx) => const RotateSimple(),
            mainroutes[2]: (ctx) => const RotateBreath(),
            mainroutes[1]: (ctx) => const RotateSilence(),
            mainroutes[0]: (ctx) => const RotateIDK(),
          },
          theme: ThemeData(hoverColor: Colors.grey),
        ),
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
    // final int totalLayers = ZBStory.zbcoins.length; // 6 Layers
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.f11): () => toggleFullScreen(),
      },
      child: Focus(
        autofocus: true, // L2: silence. - Ensures the app is 'listening'
        child: GestureDetector(
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
                      icon: Image.asset('assets/camog/mcdogline.png'),
                      tooltip: 'קוד קוד Cowd Code',
                    ),
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
                      icon: Image.asset('assets/camog/mcameline.png'),
                      tooltip: 'אוש איית רשת Web Spell',
                    ),
                  ),
                ],
              ),
            ),
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
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 35),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 120,
                          child: buildResetDropdown(
                            currentValue: userDefinedSeconds,
                            items: [0, 12, 30, 64, 640],
                            onChanged: (newValue) {
                              if (newValue != null) {
                                setState(() {
                                  userDefinedSeconds = newValue;
                                });
                                // L3: Breath, - Re-initiating the ONLY timer in main.dart
                                (mainStateKey.currentState as dynamic)
                                    ?._startVisualTimer();
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
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
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                mainTitle = "לא יודעת מדיטציה";
                                subTitle = "עידו לא יודע";
                              });
                            },
                            onDoubleTap: () {
                              setState(() {
                                mainTitle = "I don't know Meditation";
                                subTitle = "Ido Not Know";
                              });
                            },
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
                                    overlays: [SystemUiOverlay.bottom],
                                  )
                                : SystemChrome.setEnabledSystemUIMode(
                                    SystemUiMode.immersive,
                                  );
                            setState(() {});
                          },
                        ),
                        const SizedBox(width: 60),
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
                            spreadRadius: 4,
                          ),
                          BoxShadow(
                            color: Colors.blue,
                            offset: Offset(-4, -4),
                            blurRadius: 20,
                            blurStyle: BlurStyle.solid,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
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
                              height: 1.5,
                            ),
                          ),
                          onTap: () {
                            isMainTitle = !isMainTitle;
                            setState(() {
                              isMainTitle == true
                                  ? mainTitle = "זיבי"
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
                            spreadRadius: 2,
                          ),
                          BoxShadow(
                            color: Colors.yellow,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            blurStyle: BlurStyle.solid,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
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
                              height: 2.0,
                            ),
                          ),
                          onTap: () {
                            isSubTitle = !isSubTitle;
                            setState(() {
                              isSubTitle == true
                                  ? subTitle = "זמנסי גמלבן בוב"
                                  : subTitle = "zmansi WHY TEA CAME EL bob";
                            });
                          },
                        ),
                      ),
                    ),
                    const Divider(color: Colors.white, thickness: 5),
                    // Text('test'),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        buildOrbitLayer(
                          context: context,
                          size: 90,
                          imageKey: 'coinimg',
                          folder: 'coins',
                          opacity: 0.7,
                        ),

                        // Layer 3: The Animals (Sharp/Interactive)
                        buildOrbitLayer(
                          context: context,
                          size: 70,
                          imageKey: 'animalimg',
                          folder: 'camog',
                          isInteractive: true,
                        ),
                      ],
                    ),
                    const Divider(color: Colors.grey, thickness: 5),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.transparent, thickness: 5),
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
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: const BoxDecoration(
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
                            // PositionedDirectional(
                            Align(
                              alignment: AlignmentGeometry.bottomCenter,
                              //end: 5,
                              //bottom: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 4.5,
                                width: MediaQuery.of(context).size.width / 4.0,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/camog/dogstwo.gif',
                                    ),
                                    fit: BoxFit.scaleDown,
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                            // PositionedDirectional(
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              buildBookPopUp(context),
                        );
                      },
                    ),
                    const Divider(color: Colors.transparent, thickness: 5),
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
                        child: const ZBCube(),
                      ),
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
                        child: const ZBCubeTwo(),
                      ),
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
                    const Divider(color: Colors.black, thickness: 5),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
