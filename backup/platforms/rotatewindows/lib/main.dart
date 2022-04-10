import 'package:flutter/material.dart';

// IMPORT CLASSES IN MAIN

void main() => runApp(const MainPage());

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => const HomePage(),
            //'/multiplehexagrams': (ctx) => const RotateMultipleHexagrams(),
            //'/rotatesubnew': (ctx) => RotateSubNew(),
            //'/rotatesubstructure': (ctx) => RotateSubStructure(),
            '/datetimepicker': (ctx) => const RotateDateTime(),
            '/rotateone': (ctx) => const RotateOneHexagram(),
            //'/rotateincrosses': (ctx) => const RotateInCrosses(),
            '/hexlanguage': (ctx) => const RotateHexLanguage(),
            '/rotateplanets': (ctx) => const RotatePlanets(),
            '/rotatechart': (ctx) => const RotateChart(),
            '/rotatehexagramtable': (ctx) => const RotateHexagramTable(),
          },
        );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          child: const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'R O T A T I O N   T I M E',
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
        Expanded(
            child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          children: const <Widget>[
            //MappingItem('PICK DATE AND TIME (under development)', '/datetimepicker'),
            //MappingItem('FUTURE TEST (under development)', '/rotatesubnew'),
            //MappingItem('PLANETS PARSING (under development)', '/rotatesubstructure'),
            MappingItem('ONE HEXAGRAM', '/rotateone'),
            MappingItem('HEXAGRAM LANGUAGE', '/hexlanguage'),
            //MappingItem('MULTIPLE HEXAGRAMS', '/multiplehexagrams'),
            //MappingItem('CROSSES HEXAGRAMS', '/rotateincrosses'),
            MappingItem('ASTRO PLANETS', '/rotateplanets'),
            MappingItem('HD CHART', '/rotatechart'),
            MappingItem('HEXGRAM TABLE', '/rotatehexagramtable'),
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

class MappingItem extends StatelessWidget {
  final String title;
  final String route;
  const MappingItem(this.title, this.route, {Key? key}) : super(key: key);

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