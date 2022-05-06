import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/rotations/rotatechart.dart';
import 'package:finallyicanlearn/rotations/rotatehexagrams.dart';
import 'package:finallyicanlearn/rotations/rotateidontknowlines.dart';
import 'package:finallyicanlearn/rotations/rotateone.dart';
import 'package:finallyicanlearn/rotations/rotateplanets.dart';
import 'package:finallyicanlearn/rotations/rotatesilence.dart';
import 'package:finallyicanlearn/rotations/rotatesimplehd.dart';
import 'package:finallyicanlearn/rotations/rotationsimpleone.dart';
import 'package:flutter/material.dart';

void main() => runApp(const RotateEnglish());

class RotateEnglish extends StatelessWidget {
  const RotateEnglish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => HomePageEN(),
        '/rotatesilence': (ctx) => const RotateSilence(),
        '/rotatesimpleone': (ctx) => const RotateSimpleOne(),
        '/rotateidklines': (ctx) => const RotateIDKlines(),
        '/rotatehexagramtable': (ctx) => const RotateHexagramTable(),
        '/rotatecomplexone': (ctx) => const RotateOneHexagram(),
        '/rotateplanets': (ctx) => const RotatePlanets(),
        '/rotatechart': (ctx) => const RotateChart(),
        '/rotatesimplehd': (ctx) => const RotateSimpleHD(),
      },
    );
  }
}

class HomePageEN extends StatelessWidget {
  HomePageEN({Key? key}) : super(key: key);

  final String _title = maintitleEN;
  final List<String> _titles = titlesEN,
      _mainroutes = mainroutes;

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
          width: 500,
          margin: const EdgeInsets.all(10.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              _title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.grey[100],
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
        Expanded(
            child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          children: <Widget>[
            MappingItemEN(_titles.last, _mainroutes.last),
            MappingItemEN(_titles[1], _mainroutes[1]),
            MappingItemEN(_titles[2], _mainroutes[2]),
            MappingItemEN(_titles[5], _mainroutes[5]),
            MappingItemEN(_titles[3], _mainroutes[3]),
            MappingItemEN(_titles[4], _mainroutes[4]),

            //MappingItemEN(_titles[6], _mainroutes[6]),
            MappingItemEN(_titles.first, _mainroutes.first),

          ],
        )),
        Row(children: [
          Expanded(
            child: Container(
              height: 50,
              width: 500,
              margin: const EdgeInsets.all(20.0),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'BE.BREATH.EARN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
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
          ),
          Expanded(
            child: Container(
              height: 50,
              width: 500,
              margin: const EdgeInsets.all(20.0),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'www.beidontknow.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
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
          ),
          Expanded(
            child: Container(
              height: 50,
              width: 500,
              margin: const EdgeInsets.all(20.0),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'I Don\'t Know Meditation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
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
          ),
        ]),
      ]),
    );
  }
}

class MappingItemEN extends StatelessWidget {
  final String title;
  final String route;
  const MappingItemEN(this.title, this.route, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        height: 40,
        margin: const EdgeInsets.all(5.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
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
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 300.0,
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
