import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/rotations/rotatesimpletable.dart';
import 'package:finallyicanlearn/rotations/rotateidk.dart';
import 'package:finallyicanlearn/rotations/rotatecomplexone.dart';
import 'package:finallyicanlearn/rotations/rotatecomplexplanets.dart';
import 'package:finallyicanlearn/rotations/rotatesilence.dart';
import 'package:finallyicanlearn/rotations/rotatebreath.dart';
import 'package:finallyicanlearn/rotations/rotatecomplexio.dart';
import 'package:finallyicanlearn/rotations/rotatesimplelanguage.dart';
import 'package:finallyicanlearn/rotations/rotationsimpleone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sweph/sweph.dart';

// flutter build windows
// flutter build web --web-renderer canvaskit
// firebase deploy

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //final stopwatch = Stopwatch()..start();
  // Only load the assets you need. By default will load none
  // Bundled assets are available in Sweph.bundledEpheAssets
  await Sweph.init(epheAssets: [
    "packages/sweph/assets/ephe/seas_18.se1", // For house calc
    "packages/sweph/assets/ephe/semo_18.se1", // For house calc
  ]);

  runApp(RotateEnglish());}

class RotateEnglish extends StatelessWidget {
  RotateEnglish({Key? key}) : super(key: key);

  final List<String> _mainroutes = mainroutes;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => HomePageEN(),
        _mainroutes.first: (ctx) => const RotateComplexPlanets(),
        _mainroutes[1]: (ctx) => const RotateComplexOne(),
        _mainroutes[2]: (ctx) => const RotateCompleXIO(),
        _mainroutes[3]: (ctx) => const RotateSimpleTable(),
        _mainroutes[4]: (ctx) => const RotateSimpleOne(),
        _mainroutes[5]: (ctx) => const RotateSimpleLanguage(),
        _mainroutes[6]: (ctx) => const RotateIDK(),
        _mainroutes[7]: (ctx) => const RotateBreath(),
        _mainroutes.last: (ctx) => const RotateSilence(),
      },
    );
  }
}

class HomePageEN extends StatelessWidget {
  HomePageEN({Key? key}) : super(key: key);

  final String _title = maintitleEN;
  final List<String> _titles = subtitlesEN, _mainroutes = mainroutes;

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
        Expanded(
          child: ListView(
            itemExtent: MediaQuery.of(context).size.height / 13,
                children: [
                  MappingItemEN(
                      _titles.first, _mainroutes.first, Colors.blue[900]!),
                  MappingItemEN(_titles[1], _mainroutes[1], Colors.blue[800]!),
                  MappingItemEN(_titles[2], _mainroutes[2], Colors.blue[700]!),
                  MappingItemEN(_titles[3], _mainroutes[3], Colors.green[800]!),
                  MappingItemEN(_titles[4], _mainroutes[4], Colors.green[700]!),
                  MappingItemEN(_titles[5], _mainroutes[5], Colors.green[600]!),
                  MappingItemEN(_titles[7], _mainroutes[7], Colors.yellow[800]!),
                  MappingItemEN(_titles.last, _mainroutes.last, Colors.red[800]!),
                  MappingItemEN(_titles[6], _mainroutes[6], Colors.black),
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

class MappingItemEN extends StatelessWidget {
  final String title;
  final String route;
  final Color _color;
  const MappingItemEN(this.title, this.route, this._color, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        height: 25.0,
        decoration: BoxDecoration(
            color: _color,
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
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: AutoSizeText(
            title,
            minFontSize: 15,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
