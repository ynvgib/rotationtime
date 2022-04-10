import 'package:flutter/material.dart';

import 'rotations/rotatehexagrams.dart';
import 'rotations/rotateone.dart';

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
            '/rotateone': (ctx) => const RotateOneHexagram(),
            '/rotateoneclean': (ctx) => const RotateOneCleanHexagram(),
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
          height: 30,
          width: 150,
          margin: const EdgeInsets.all(5.0),
          child: const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              ' R O T A T I O N   T I M E ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(5),
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
          children: const <Widget>[
            MappingItem('ONE HEXAGRAM', '/rotateoneclean'),
            MappingItem('ONE HEXAGRAM STORY', '/rotateone'),
            MappingItem('HEXGRAM TABLE', '/rotatehexagramtable'),
          ],
        )),
        Row(children: [
          Expanded(
            child:
            Container(
              height: 30,
              width: 150,
              margin: const EdgeInsets.all(2.0),

              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'BE.BREATH.EARN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5),
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
        Row(children: [

          Expanded(
            child: Container(
              height: 30,
              width: 150,
              margin: const EdgeInsets.all(2.0),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'I Don\'t Know Meditation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5),
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
        Row(children: [
          Expanded(
            child: Container(
              height: 30,
              width: 150,
              margin: const EdgeInsets.all(2.0),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'www.beidontknow.com',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5),
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
        const SizedBox(height: 15.0)
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
        horizontal: 3.0,
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
