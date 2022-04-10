import 'package:finallyicanlearn/lists.dart';
import 'package:flutter/material.dart';
//import 'package:finallyicanlearn/lists.dart';

// /about
// /indicatorNoLogic
class RotateHexagramTable extends StatefulWidget {
  const RotateHexagramTable({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateHexagramTableState();
  }
}

class _RotateHexagramTableState extends State<RotateHexagramTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotate Hexagram Table'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Container(
            height: 40, width: 100,
            margin: const EdgeInsets.all(5.0),
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'COMPLEX',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.blue,
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 16,
            itemBuilder: (context, index) {
              int _hexagramindex = orderHexagramsWheel[index];
              int _hexagramfontindex =
                  fontHexNumbersList.indexOf(_hexagramindex);
              return Container(
                padding: EdgeInsets.fromLTRB(15, 15, 5, 5),
                width: 100,
                margin: const EdgeInsets.all(2.0),
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      fontHexOrderList[_hexagramfontindex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 50.0,
                          fontFamily: 'iChing',
                          fontWeight: FontWeight.bold),
                    )),
                decoration: BoxDecoration(
                    color: Colors.blue[200],
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
              );
            },
          )),
          Container(
            height: 40, width: 100,
            margin: const EdgeInsets.all(5.0),
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'SIMPLE',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.green,
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 16,
                itemBuilder: (context, index) {
                  index = index + 16;
                  int _hexagramindex = orderHexagramsWheel[index];
                  int _hexagramfontindex =
                  fontHexNumbersList.indexOf(_hexagramindex);
                  return Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 5, 5),
                    width: 100,
                    margin: const EdgeInsets.all(2.0),
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          fontHexOrderList[_hexagramfontindex],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 50.0,
                              fontFamily: 'iChing',
                              fontWeight: FontWeight.bold),
                        )),
                    decoration: BoxDecoration(
                        color: Colors.green[200],
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
                  );
                },
              )),
          Container(
            height: 40, width: 200,
            margin: const EdgeInsets.all(5.0),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'I don\'t know. Meditation.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 16,
                itemBuilder: (context, index) {
                  index = index + 48;
                  int _hexagramindex = orderHexagramsWheel[index];
                  int _hexagramfontindex =
                  fontHexNumbersList.indexOf(_hexagramindex);
                  return Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 5, 5),
                    width: 100,
                    margin: const EdgeInsets.all(2.0),
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          fontHexOrderList[_hexagramfontindex],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 50.0,
                              fontFamily: 'iChing',
                              fontWeight: FontWeight.bold),
                        )),
                    decoration: BoxDecoration(
                        color: Colors.yellow[200],
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
                  );
                },
              )),
          Container(
            height: 40, width: 100,
            margin: const EdgeInsets.all(5.0),
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'breath',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.yellow,
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 16,
                itemBuilder: (context, index) {
                  index = index + 32;
                  int _hexagramindex = orderHexagramsWheel[index];
                  int _hexagramfontindex =
                  fontHexNumbersList.indexOf(_hexagramindex);
                  return Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 5, 5),
                    width: 100,
                    margin: const EdgeInsets.all(2.0),
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          fontHexOrderList[_hexagramfontindex],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 50.0,
                              fontFamily: 'iChing',
                              fontWeight: FontWeight.bold),
                        )),
                    decoration: BoxDecoration(
                        color: Colors.red[200],
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
                  );
                },
              )),
          Container(
            height: 40, width: 100,
            margin: const EdgeInsets.all(5.0),
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'silence',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.red,
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
        ],
      ),
    );
  }
}
