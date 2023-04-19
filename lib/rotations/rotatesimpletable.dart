import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:flutter/material.dart';

import 'package:finallyicanlearn/models/hexlineslist.dart';
//import 'package:finallyicanlearn/lists.dart';

// /about
// /indicatorNoLogic
class RotateSimpleTable extends StatefulWidget {
  const RotateSimpleTable({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSimpleTableState();
  }
}

class _RotateSimpleTableState extends State<RotateSimpleTable> {
  final String _title = subtitlesEN[3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: AutoSizeText(_title, textAlign: TextAlign.left, maxFontSize: 15),
        leading: TextButton(
          child: const Text(
            'X',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _build64PopUp(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  child: const Text('64')),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _build384PopUp(context),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  child: const Text('384')),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildComplexPopUp(context),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              child: const AutoSizeText(
                'abcdefghijklmnop',
                minFontSize: 10,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 36,
                  fontFamily: 'iChing',
                ),
              ),),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildSimplePopUp(context),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                textStyle: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold)),
            child: const AutoSizeText(
               'qrstuvwxyzABCDEF',
              minFontSize: 10,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 36,
                fontFamily: 'iChing',
              ),
            ),),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildBreathPopUp(context),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                textStyle: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold)),
            child: const AutoSizeText(
              'GHIJKLMNOPQRSTUV',
              minFontSize: 10,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 36,
                fontFamily: 'iChing',
              ),
            ),),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildSilencePopUp(context),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                textStyle: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold)),
            child: const AutoSizeText(
              'WXYZ1234567890!@',
              minFontSize: 10,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 36,
                fontFamily: 'iChing',
              ),
            ),),

        ],
      ),
    );
  }


  Widget _build384PopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('384'),
      content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: ListView.builder(
            reverse: true,
            padding: const EdgeInsets.all(2.0),
            itemCount: idonotknowOnlylinesList.length,
            itemBuilder: (context, index) => ListTile(
              title: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    (index - 5).toString(),
                    textAlign: TextAlign.center,
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    idonotknowOnlylinesList[index],
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    '${(index / 6).floor()}.${((index - 5)) - (((index / 6).floor() - 1) * 6)}',
                    textAlign: TextAlign.left,
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          )),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'X',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _build64PopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('64'),
      content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child:  ListView.builder(
            reverse: true,
            padding: const EdgeInsets.all(5.0),
            itemCount: idkHexList.length,
            itemBuilder: (context, index) => ListTile(
              title: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      index.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      idkHexList[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  ],
                ),
            ),
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'X',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildComplexPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Complex',style: TextStyle(color: Colors.blue),),
      content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child:  ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 16,
            itemBuilder: (context, index) {
              int hexagramindex = orderHexagramsWheel[index];
              int hexagramfontindex =
              fontHexNumbersList.indexOf(hexagramindex);
              return Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 5, 5),
                width: 70,
                margin: const EdgeInsets.all(2.0),
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
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      fontHexOrderList[hexagramfontindex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 50.0,
                          fontFamily: 'iChing',
                          fontWeight: FontWeight.bold),
                    )),
              );
            },
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'X',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildSimplePopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Simple', style: TextStyle(color: Colors.green),),
      content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child:  ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 16,
            itemBuilder: (context, index) {
              index = index + 16;
              int hexagramindex = orderHexagramsWheel[index];
              int hexagramfontindex =
              fontHexNumbersList.indexOf(hexagramindex);
              return Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 5, 5),
                width: 70,
                margin: const EdgeInsets.all(2.0),
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
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      fontHexOrderList[hexagramfontindex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 50.0,
                          fontFamily: 'iChing',
                          fontWeight: FontWeight.bold),
                    )),
              );
            },
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'X',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildBreathPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Breath',style: TextStyle(color: Colors.yellow),),
      content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child:  ListView.builder(
            scrollDirection: Axis.vertical,
            reverse: true,
            shrinkWrap: true,
            itemCount: 16,
            itemBuilder: (context, index) {
              index = index + 48;
              int hexagramindex = orderHexagramsWheel[index];
              int hexagramfontindex =
              fontHexNumbersList.indexOf(hexagramindex);
              return Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 5, 5),
                width: 70,
                margin: const EdgeInsets.all(2.0),
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
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      fontHexOrderList[hexagramfontindex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 50.0,
                          fontFamily: 'iChing',
                          fontWeight: FontWeight.bold),
                    )),
              );
            },
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'X',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildSilencePopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Silence',style: TextStyle(color: Colors.red),),
      content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child:  ListView.builder(
            scrollDirection: Axis.vertical,
            reverse: true,
            shrinkWrap: true,
            itemCount: 16,
            itemBuilder: (context, index) {
              index = index + 32;
              int hexagramindex = orderHexagramsWheel[index];
              int hexagramfontindex =
              fontHexNumbersList.indexOf(hexagramindex);
              return Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 5, 5),
                width: 70,
                margin: const EdgeInsets.all(2.0),
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
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      fontHexOrderList[hexagramfontindex],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 50.0,
                          fontFamily: 'iChing',
                          fontWeight: FontWeight.bold),
                    )),
              );
            },
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'X',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
