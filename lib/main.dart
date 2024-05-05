import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle_list/circle_list.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/rotations/rotatecomplex.dart';
import 'package:finallyicanlearn/rotations/rotatecomplexhd.dart';
import 'package:finallyicanlearn/rotations/rotatesimple.dart';
import 'package:finallyicanlearn/rotations/rotateidk.dart';
import 'package:finallyicanlearn/rotations/rotatesilence.dart';
import 'package:finallyicanlearn/rotations/rotatebreath.dart';
import 'package:finallyicanlearn/services/telegram_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:sweph/sweph.dart';
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
        subroutes[0]: (ctx) => const RotateComplexHD(),
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
  final String _title = 'זמן סיבוב בים',
      beidontknowsite = 'rotation-time.web.app',
      githubrotatesite = 'www.github.com/ynvgib/rotationtime',
  githubproject = 'Github Project';
  //final List<String> _titles = subtitles;

  final Uri beidontknowurl = Uri.parse('https://rotation-time.web.app/'),
      githubrotateurl = Uri.parse('https://www.github.com/ynvgib/rotationtime');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              const Divider(
                color: Colors.white,
                thickness: 5,
              ),
              const SizedBox(height: 10),
              Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
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
                        'בים',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
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
                        'זמן סיבוב',
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
                                    image: AssetImage(mplants[index]),
                                    colorFilter: ColorFilter.mode(
                                      Colors.white.withOpacity(1.0),
                                      BlendMode.modulate,
                                    ))),
                          ),
                          CircularText(
                            children: [
                              TextItem(
                                  space: 15,
                                  startAngle: titlesangle[index],
                                  text: Text(
                                    //subtitles[index], hebsub
                                    hebsub_rev[index],
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
              Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.horizontal,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(titlesicon[0]),)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(titlesicon[1]),)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(titlesicon[2]),)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(titlesicon[3]),)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(titlesicon[4]),)),
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
                  onPressed: () {
                    Navigator.pushNamed(context, subroutes[0]);
                  },
                  child: Text('הגדרה גבוהה של עיצוב אנושי',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ),  const Divider(
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