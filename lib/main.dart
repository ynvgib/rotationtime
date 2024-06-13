import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle_list/circle_list.dart';
import 'package:finallyicanlearn/models/lists.dart';
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
import 'package:finallyicanlearn/services/telegram_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:sweph/sweph.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

// github project link
// https://www.github.com/ynvgib/rotationtime

// flutter build windows
// flutter build web --web-renderer canvaskit --no-tree-shake-icons
// firebase deploy
// flutter build apk --no-tree-shake-icons

// for new project
// flutter create --platforms=windows .

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

class RotateHome extends StatelessWidget {
  RotateHome({Key? key}) : super(key: key);

  //final String _title = maintitle
  final String _title = 'כותרת',
      beidontknowsite = 'rotation-time.web.app',
      githubrotatesite = 'www.github.com/ynvgib/rotationtime',
  githubproject = 'Github Project';
  //final List<String> _titles = subtitles;


  final Uri beidontknowurl = Uri.parse('https://rotation-time.web.app/'),
      githubrotateurl = Uri.parse('https://www.github.com/ynvgib/rotationtime');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, pdfroutes[4]);
                  },
                  icon: Image.asset('assets/camog/mcdog.png',
                  ),
                tooltip: pdftitle[4],
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, pdfroutes[3]);
                  },
                  icon: Image.asset('assets/coins/dog.png',
                  ),
                tooltip: pdftitle[3],
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, pdfroutes[2]);
                  },
                  icon: Image.asset('assets/camog/mcdog.png',
                  ),
                tooltip: pdftitle[2],
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, pdfroutes[1]);
                  },
                  icon: Image.asset('assets/coins/dog.png',
                  ),
                tooltip: pdftitle[1],
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, pdfroutes[0]);
                },
                icon: Image.asset('assets/coins/cameldog.png',
                ),
                tooltip: pdftitle[0],
              ),
            ],
          )
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              const Divider(
                color: Colors.white,
                thickness: 5,
              ),
              const SizedBox(height: 10),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width / 2.3,
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(4, 4),
                          blurRadius: 20,
                          spreadRadius: 1),
                      BoxShadow(
                          color: Colors.white,
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
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.blueGrey,
                              offset: Offset(4, 4),
                              blurRadius: 20,
                              spreadRadius: 1),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1),
                        ]),
                    child: const FittedBox(
                      fit: BoxFit.fitHeight,
                      child: AutoSizeText(
                        'בים',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 2.3,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.blueGrey,
                              offset: Offset(4, 4),
                              blurRadius: 20,
                              spreadRadius: 1),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1),
                        ]),
                    child: const FittedBox(
                      fit: BoxFit.fitHeight,
                      child: AutoSizeText(
                        'ערכה הוא',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 5,
              ),
              CircleList(
                innerRadius: 1,
                outerRadius: MediaQuery.of(context).size.height / 4,
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
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(maincoins[index]),
                                    colorFilter: ColorFilter.mode(
                                      Colors.white.withOpacity(1.0),
                                      BlendMode.modulate,
                                    ))),
                          ),
                          CircularText(
                            children: [
                              TextItem(
                                  space: 10,
                                  startAngle: titlesangle[index],
                                  text: Text(
                                    //subtitles[index], hebsub
                                    maintxt[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          color: Colors
                                              .transparent, // Choose the color of the shadow
                                          blurRadius:
                                              1.0, // Adjust the blur radius for the shadow effect
                                          offset: Offset(2.0,
                                              2.0), // Set the horizontal and vertical offset for the shadow
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                            radius: 150,
                            position: CircularTextPosition.outside,
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
              const Divider(
                color: Colors.white,
                thickness: 5,
              ),
              SizedBox(height: 10),
              Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  //idk
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(mplants[4]),)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, mainroutes[4]);
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(mplants[3]),)),
                    ),
                      onTap: () {
                        Navigator.pushNamed(context, mainroutes[3]);
                      },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(mplants[2]),)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, mainroutes[2]);
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(mplants[1]),)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, mainroutes[1]);
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(mplants[0]),)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, mainroutes[0]);
                    },
                  ),
                ],
              ),
              Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 20,
                    child: AutoSizeText(bimnamesheb[4],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 20,
                    child: AutoSizeText(bimnamesheb[3],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 20,
                    child: AutoSizeText(bimnamesheb[2],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 20,
                    child: AutoSizeText(bimnamesheb[1],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 20,
                    child: AutoSizeText(bimnamesheb[0],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  //idk
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(titlesicon[4]),)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, mainroutes[4]);
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(titlesicon[3]),)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, mainroutes[3]);
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(titlesicon[2]),)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, mainroutes[2]);
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(titlesicon[1]),)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, mainroutes[1]);
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(titlesicon[0]),)),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, mainroutes[0]);
                    },
                  ),
                ],
              ),
              Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 20,
                    child: AutoSizeText(titlesname_heb[4],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 20,
                    child: AutoSizeText(titlesname_heb[3],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 20,
                    child: AutoSizeText(titlesname_heb[2],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 20,
                    child: AutoSizeText(titlesname_heb[1],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 20,
                    child: AutoSizeText(titlesname_heb[0],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 10,
                    child: AutoSizeText(titlesname[4],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 10,
                    child: AutoSizeText(titlesname[3],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 10,
                    child: AutoSizeText(titlesname[2],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 10,
                    child: AutoSizeText(titlesname[1],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 10,
                    child: AutoSizeText(titlesname[0],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white,
                thickness: 5,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child:
                ElevatedButton(
                  onPressed: () => launchUrl(beidontknowurl),
                  child: Text(beidontknowsite,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 5,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child:
                ElevatedButton(
                  onPressed: () => launchUrl(githubrotateurl),
                  child: Text(githubproject,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 5,
              ),
              const AutoSizeText(
                'aO#P@',
                minFontSize: 20,
                maxFontSize: 50,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'iChing',
                ),
              ),
              const SizedBox(height: 10)
            ]),
      ),
    );
  }
}