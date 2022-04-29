
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/lists_he.dart';
import 'package:finallyicanlearn/main.dart';
import 'package:finallyicanlearn/rotations/hebrew/rotateone_he.dart';
import 'package:finallyicanlearn/rotations/rotatechart.dart';
import 'package:finallyicanlearn/rotations/rotatehexagrams.dart';
import 'package:finallyicanlearn/rotations/rotatehexlanguage.dart';
import 'package:finallyicanlearn/rotations/rotateone.dart';
import 'package:finallyicanlearn/rotations/rotateplanets.dart';
import 'package:flutter/material.dart';

class RotateHebrew extends StatelessWidget {
  const RotateHebrew({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) =>  HomePageHE(),
        '/rotateoneHE': (ctx) => const RotateOneHexagramHE(),
        //'/hexlanguage': (ctx) => const RotateHexLanguage(),
        //'/rotatehexagramtable': (ctx) => const RotateHexagramTable(),
        //'/rotateplanets': (ctx) => const RotatePlanets(),
        //'/rotatechart': (ctx) => const RotateChart(),

      },
    );
  }
}

class HomePageHE extends StatelessWidget {
  HomePageHE({Key? key}) : super(key: key);

  //String _rotateoneitem = 'ONE HEXAGRAM';
  final String _rotateoneitem = 'הקסגרמה אחת';
  //final _title = ' ז מ ן    ל ה ת ג ל ג ל ';

  //_title = 'R O T A T I O N   T I M E';

  final String _title = maintitleHE;
  final List<String> _titles = titlesHE;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Container(
          child:
          const Text(
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
          margin: const EdgeInsets.all(20.0),
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
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              children: <Widget>[
                //MappingItem('PICK DATE AND TIME (under development)', '/datetimepicker'),
                MappingItemEN('English', '/homeEN'),
                MappingItemEN(_titles[0], '/rotateoneHE'),
                //MappingItemEN(_titles[1], '/hexlanguage'),
                //MappingItemEN(_titles[2], '/rotatehexagramtable'),
                //MappingItemEN(_titles[3], '/rotateplanets'),
                //MappingItemEN(_titles[4], '/rotatechart'),
              ],
            )),
        Row(children: [
          Expanded(
            child:
            Container(
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

class MappingItemHE extends StatelessWidget {
  final String title;
  final String route;
  const MappingItemHE(this.title, this.route, {Key? key}) : super(key: key);

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
        horizontal: 20.0,
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
