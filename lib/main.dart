import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/rotations/rotatehextable.dart';
import 'package:finallyicanlearn/rotations/rotateidontknowlines.dart';
import 'package:finallyicanlearn/rotations/rotatecomplexone.dart';
import 'package:finallyicanlearn/rotations/rotateplanets.dart';
import 'package:finallyicanlearn/rotations/rotatesilence.dart';
import 'package:finallyicanlearn/rotations/rotatesimplebreath.dart';
import 'package:finallyicanlearn/rotations/rotatesimplehd.dart';
import 'package:finallyicanlearn/rotations/rotatesimplelanguage.dart';
import 'package:finallyicanlearn/rotations/rotationsimpleone.dart';
import 'package:flutter/material.dart';

void main() => runApp(RotateEnglish());

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
        _mainroutes.first: (ctx) => const RotatePlanets(),
        _mainroutes[1]: (ctx) => const RotateComplexOne(),
        _mainroutes[2]: (ctx) => const RotateSimpleHD(),
        _mainroutes[3]: (ctx) => const RotateIDKlines(),
        _mainroutes[4]: (ctx) => const RotateHexagramTable(),
        _mainroutes[5]: (ctx) => const RotateSimpleOne(),
        _mainroutes[6]: (ctx) => const RotateSimpleLanguage(),
        _mainroutes[7]: (ctx) => const RotateSimpleBreath(),
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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Container(
          child: const Text(
            'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: 'iChing',
            ),
          ),
          alignment: Alignment.center,
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 1.2,
          margin: const EdgeInsets.all(10.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              _title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
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
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width / 1.2,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              children: <Widget>[
                MappingItemEN(
                    _titles.first, _mainroutes.first, Colors.blue[900]!),
                MappingItemEN(_titles[1], _mainroutes[1], Colors.blue[800]!),
                MappingItemEN(_titles[2], _mainroutes[2], Colors.blue[700]!),
                MappingItemEN(_titles[3], _mainroutes[3], Colors.green[800]!),
                MappingItemEN(_titles[4], _mainroutes[4], Colors.green[700]!),
                MappingItemEN(_titles[5], _mainroutes[5], Colors.green[600]!),
                MappingItemEN(_titles[6], _mainroutes[6], Colors.green[500]!),
                MappingItemEN(_titles[7], _mainroutes[7], Colors.yellow[800]!),
                MappingItemEN(_titles.last, _mainroutes.last, Colors.red[800]!),
              ],
            )),
        const SizedBox(height: 20 ,),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width / 1.2,
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
          ),
        ]),
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
        height: 35.0,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
        ),
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
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
