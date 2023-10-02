import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:sweph/sweph.dart';

// flutter build windows
// flutter build web --web-renderer canvaskit
// firebase deploy
// flutter build apk --no-tree-shake-icons

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Sweph.init(epheAssets: [
    "packages/sweph/assets/ephe/seas_18.se1",
  ]);

  //teledart
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
        mainroutes[0]: (ctx) => const RotateComplex(),
        mainroutes[1]: (ctx) => const RotateSimple(),
        mainroutes[2]: (ctx) => const RotateBreath(),
        mainroutes[3]: (ctx) => const RotateSilence(),
        mainroutes[4]: (ctx) => const RotateIDK(),
      },
    );
  }
}

class RotateHome extends StatelessWidget {
  RotateHome({Key? key}) : super(key: key);

  final String _title = maintitle;
  final List<String> _titles = subtitles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            'aO#P@',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'iChing',
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(children: [
        const Divider(color: Colors.white),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width,
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
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: AutoSizeText(
              _title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Divider(color: Colors.white),
        Expanded(
          child: ListView(
            itemExtent: MediaQuery.of(context).size.height / 7,
            children: [
              MappingItem(
                  _titles[0], mainroutes[0], Colors.blue, hexBasicMixList[0]),
              MappingItem(
                  _titles[1], mainroutes[1], Colors.green, hexBasicMixList[1]),
              MappingItem(
                  _titles[2], mainroutes[2], Colors.yellow, hexBasicMixList[2]),
              MappingItem(
                  _titles[3], mainroutes[3], Colors.red, hexBasicMixList[3]),
              MappingItem(_titles[4], mainroutes[4], Colors.white,
                  'assets/rotateicon.png'),
            ],
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Container(
              height: 25,
              width: MediaQuery.of(context).size.width / 1.2,
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
                fit: BoxFit.scaleDown,
                child: Text(
                  'www.beidontknow.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ]),
        const SizedBox(height: 10)
      ]),
    );
  }
}

class MappingItem extends StatelessWidget {
  final String title;
  final String route;
  final Color itemcolor;
  final String image;
  const MappingItem(this.title, this.route, this.itemcolor, this.image,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        height: 40.0,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, color: Colors.black, spreadRadius: 5)
                  ],
                ),
                child: CircleAvatar(backgroundImage: AssetImage(image))),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(50, 1, 1, 1),
              child: AutoSizeText(
                title,
                minFontSize: 20,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: itemcolor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
