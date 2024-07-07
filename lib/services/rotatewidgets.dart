import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/hdlist.dart';
import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:finallyicanlearn/services/datetime.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';

Widget build36PopUp(BuildContext context) {
  return AlertDialog(
    //title: const Text('36 Transactions'),
    title: const Text('36'),
    content: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //heb
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildComplexTS(context, hdchannelcomplexList_heb),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('מורכב',
                    style: TextStyle(color: Colors.white, fontSize: 25))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildBreathTS(context, hdchannelbreathList_heb),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                child: const Text('נשימה',
                    style: TextStyle(color: Colors.grey, fontSize: 25))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildSilenceTS(context, hdchannelsilenceList_heb),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('שתיקה',
                    style: TextStyle(color: Colors.black, fontSize: 25))),
            const Divider(color: Colors.black, thickness: 5),
            //eng
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildComplexTS(context, hdchannelcomplexList),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Complex',
                    style: TextStyle(color: Colors.white, fontSize: 25))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildBreathTS(context, hdchannelbreathList),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                child: const Text('Breath',
                    style: TextStyle(color: Colors.grey, fontSize: 25))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildSilenceTS(context, hdchannelsilenceList),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('silence',
                    style: TextStyle(color: Colors.black, fontSize: 25))),
          ],
        ),
      ),
    ),
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

Widget build64PopUp(BuildContext context) {
  return AlertDialog(
    //title: const Text('36 Transactions'),
    title: const Text('64'),
    content: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Heb
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, rtwallets65lst_heb),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('ארנקים',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, rtbbwallet65lst_heb),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('סיבוב בים',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, rtgateswallet65lst_heb),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('סיבוב חדש',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, hdgates65lst_heb),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('שערים',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const Divider(color: Colors.black, thickness: 5),
            // Eng
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, hexRTNames65lst),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('Rotations',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, hdgates65lst),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('Gates',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, hexNames65lst),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('Hexagrams',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, new_hexRTNames65lst),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('New Rotations',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),

          ],
        ),
      ),
    ),
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

Widget build384PopUp(BuildContext context) {
  return AlertDialog(
    title: const Text('384'),
    content: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Heb
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      //build384rtPop(context, rtlines390lst_heb),
                      build384rtPop(context, rtlines384lst_heb),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('סיבוב קווים',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: Colors.black, thickness: 5),
            // Eng
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build384rtPop(context, rtlines384lst),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('Rotating Lines',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build384rtPop(context, hdlines384lst),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('HD Lines',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),

          ],
        ),
      ),
    ),
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

Widget rtlines390lsthebPop(BuildContext context) {
  return AlertDialog(
    title: const Text('384 צדדים'),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
          reverse: true,
          padding: const EdgeInsets.all(2.0),
          itemCount: 390,
          itemBuilder: (context, index) => ListTile(
            title: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  (index - 5).toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  rtlines390lstHeb[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  '${(index / 6).floor()}.${((index - 5)) - (((index / 6).floor() - 1) * 6)}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
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

Widget _buildComplexTransactions(BuildContext context) {
  return AlertDialog(
    //title: Text('Complex Transactions'),
    title: const Text('מצ"ב העברות מורכב'),
    content: SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView.builder(
        reverse: false,
        padding: const EdgeInsets.all(5.0),
        itemCount: hdchannelcomplexList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                //color: Colors.blue[100],
                color: Colors.blue,
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    hdchannelcomplexList_heb[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
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
Widget _buildBreathTransactions(BuildContext context) {
  return AlertDialog(
    //title: const Text('Breath Transactions'),
    title: const Text('העברות נשימה'),
    content: SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView.builder(
        reverse: false,
        padding: const EdgeInsets.all(5.0),
        itemCount: hdchannelbreathList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    hdchannelbreathList_heb[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
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
Widget _buildSilencetransactions(BuildContext context) {
  return AlertDialog(
    //title: const Text('silence Transactions'),
    title: const Text('העברות שתיקה'),
    content: SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView.builder(
        reverse: false,
        padding: const EdgeInsets.all(5.0),
        itemCount: hdchannelsilenceList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                width: 3,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    hdchannelsilenceList_heb[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
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

Widget _buildComplexTS(BuildContext context, List<String> complexlst) {
  return AlertDialog(
    title: const Text('COMPLEX מורכב'),
    content: SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView.builder(
        reverse: false,
        padding: const EdgeInsets.all(5.0),
        itemCount: hdchannelcomplexList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              //color: Colors.blue[100],
                color: Colors.blue,
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    complexlst[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
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
Widget _buildBreathTS(BuildContext context, List<String> breathlst) {
  return AlertDialog(
    //title: const Text('Breath Transactions'),
    title: const Text('Breath נשימה'),
    content: SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView.builder(
        reverse: false,
        padding: const EdgeInsets.all(5.0),
        itemCount: hdchannelbreathList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    breathlst[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
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
Widget _buildSilenceTS(BuildContext context, List<String> silencelst) {
  return AlertDialog(
    //title: const Text('silence Transactions'),
    title: const Text('silence שתיקה'),
    content: SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView.builder(
        reverse: false,
        padding: const EdgeInsets.all(5.0),
        itemCount: hdchannelsilenceList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
              border: Border.all(
                width: 3,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    silencelst[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
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

Widget buildWalletPopUp(BuildContext context, int walletindex) {
  return AlertDialog(
    title: Center(
      //child: Text('Wallet: $wallet\n'
      child: Text(' ארנק $walletindex\n'
          //'${LineSentenceList[wallet]}'),
          '${idkNewHebrewList[walletindex]}'),
    ),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: ListView.builder(
          reverse: true,
          padding: const EdgeInsets.all(5.0),
          itemCount: 6,
          itemBuilder: (context, index) => ListTile(
            title: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  (index + 1).toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(width: 5),
                Text(
                  idonotknowlinesList[walletindex * 7 + index + 1],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
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

Widget buildGodheadPopUp(BuildContext context, int ghidx) {
  return AlertDialog(
    title: Center(
      //child: Text('Wallet: $wallet\n'
      child: Text(revrtgodheads[ghidx]),
    ),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Text(revhebgodheads[ghidx])),
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

Widget build64rtPop(BuildContext context, List<String> build64lst) {
  return AlertDialog(
    title: const Text('64'),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
          reverse: true,
          padding: const EdgeInsets.all(5.0),
          itemCount: 65,
          itemBuilder: (context, index) => ListTile(
            title: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  index.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(width: 5),
                Text(
                  //LineSentenceList[index],
                  build64lst[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
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

Widget build384rtPop(BuildContext context, List<String> build384lst) {
  return AlertDialog(
    title: const Text('384'),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
          reverse: true,
          padding: const EdgeInsets.all(5.0),
          itemCount: build384lst.length,
          //itemCount: 390,
          itemBuilder: (context, index) {
            double _linecount = 0, _gateidx = 1;

            _linecount = (index+1) / 6;
            _linecount = _linecount.ceilToDouble();
            _gateidx = (index + 1) - ((_linecount - 1) * 6);

            return ListTile(
              title: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    //((index+1)/6).ceil().toString()
                    '${_linecount.toInt()}.${_gateidx.toInt()} (${index + 1})',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    //LineSentenceList[index],
                    build384lst[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
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

Widget buildComplexPopUp(BuildContext context) {
  return AlertDialog(
    title: const Text(
      'Complex',
      style: TextStyle(color: Colors.blue),
    ),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 16,
          itemBuilder: (context, index) {
            int hexagramindex = orderHexagramsWheel[index];
            int hexagramfontindex = fontHexNumbersList.indexOf(hexagramindex);
            return Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 5, 5),
              width: 70,
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.black,
                  ),
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

Widget buildSimplePopUp(BuildContext context) {
  return AlertDialog(
    title: const Text(
      'Simple',
      style: TextStyle(color: Colors.green),
    ),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 16,
          itemBuilder: (context, index) {
            index = index + 16;
            int hexagramindex = orderHexagramsWheel[index];
            int hexagramfontindex = fontHexNumbersList.indexOf(hexagramindex);
            return Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 5, 5),
              width: 70,
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  color: Colors.green[200],
                  border: Border.all(
                    width: 3,
                    color: Colors.black,
                  ),
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

Widget buildBreathPopUp(BuildContext context) {
  return AlertDialog(
    title: const Text(
      'Breath',
      style: TextStyle(color: Colors.yellow),
    ),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          reverse: true,
          shrinkWrap: true,
          itemCount: 16,
          itemBuilder: (context, index) {
            index = index + 48;
            int hexagramindex = orderHexagramsWheel[index];
            int hexagramfontindex = fontHexNumbersList.indexOf(hexagramindex);
            return Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 5, 5),
              width: 70,
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.black,
                  ),
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

Widget buildSilencePopUp(BuildContext context) {
  return AlertDialog(
    title: const Text(
      'Silence',
      style: TextStyle(color: Colors.red),
    ),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          reverse: true,
          shrinkWrap: true,
          itemCount: 16,
          itemBuilder: (context, index) {
            index = index + 32;
            int hexagramindex = orderHexagramsWheel[index];
            int hexagramfontindex = fontHexNumbersList.indexOf(hexagramindex);
            return Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 5, 5),
              width: 70,
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.black,
                  ),
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

// human design chart
class HeadPainter extends CustomPainter {
  bool centerstate = true;

  HeadPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.yellow;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.yellow : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(x / 2, 0)
      ..lineTo(0, y)
      ..lineTo(x, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class AjnaPainter extends CustomPainter {
  bool centerstate = true;

  AjnaPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.green;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.green : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(x / 2, y)
      ..lineTo(0, 0)
      ..lineTo(x, 0)
      ..close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ThroatPainter extends CustomPainter {
  bool centerstate = true;

  ThroatPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );

    Color centercolor = Colors.brown;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.brown : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);

    //canvas.drawPath(getRectePath(size.width, size.height), paint);
  }

  Path getRectePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x, y)
      ..moveTo(x, y)
      ..lineTo(x, 0)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class GPainter extends CustomPainter {
  bool centerstate = true;

  GPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.green;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    //var angle = (math.pi * 2) / 4;

    centerstate ? centercolor = Colors.yellow : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getDiamondPath(size.width, size.height), paint);
  }

  Path getDiamondPath(double x, double y) {
    var path = Path();
    var angle = (math.pi * 2) / 4;
    var radius = x / 2;
    var sides = 4;

    Offset center = Offset(x / 2, y / 2);

// startPoint => (100.0, 0.0)
    Offset startPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(angle * i) + center.dx;
      double y = radius * math.sin(angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SacralPainter extends CustomPainter {
  bool centerstate = true;

  SacralPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );

    Color centercolor = Colors.red;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.red : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);

    //canvas.drawPath(getRectePath(size.width, size.height), paint);
  }

  Path getRectePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x, y)
      ..moveTo(x, y)
      ..lineTo(x, 0)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class RootPainter extends CustomPainter {
  bool centerstate = true;

  RootPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );

    Color centercolor = Colors.brown;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.brown : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);

    //canvas.drawPath(getRectePath(size.width, size.height), paint);
  }

  Path getRectePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x, y)
      ..moveTo(x, y)
      ..lineTo(x, 0)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SpleenPainter extends CustomPainter {
  bool centerstate = true;

  SpleenPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.brown;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.brown : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(x, y / 2)
      ..lineTo(0, 0)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SolarPainter extends CustomPainter {
  bool centerstate = true;

  SolarPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.brown;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.brown : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y / 2)
      ..lineTo(x, 0)
      ..lineTo(x, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HeartPainter extends CustomPainter {
  bool centerstate = true;

  HeartPainter({
    required this.centerstate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.red;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    centerstate ? centercolor = Colors.red : centercolor = Colors.white;

    Paint paint = Paint()
      ..color = centercolor
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(x / 2 - 5, 0)
      ..lineTo(0, y)
      ..lineTo(x, y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class VerticalGatePainter extends CustomPainter {
  int gatestate = 0;
  // gate type
  // 0 - undefined , 1 - personality, 2 - design, 3 - both, 4 - transit
  VerticalGatePainter({required this.gatestate});

  @override
  void paint(Canvas canvas, Size size) {
    const p1 = Offset(0, 0);
    final p2 = Offset(0, size.height);

    Color gatecolor1 = Colors.white;
    Color gatecolor2 = Colors.white;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    switch (gatestate) {
      case 0:
        gatecolor1 = Colors.white;
        gatecolor2 = Colors.white;
        break;
      case 1:
        gatecolor1 = Colors.red;
        gatecolor2 = Colors.red;
        break;
      case 2:
        gatecolor1 = Colors.black;
        gatecolor2 = Colors.black;
        break;
      case 3:
        gatecolor1 = Colors.red;
        gatecolor2 = Colors.black;
        break;
      case 4:
        gatecolor1 = Color.alphaBlend(Colors.red, Colors.black);
        gatecolor2 = Colors.blue;
        break;
      default:
        gatecolor1 = Colors.pink;
        gatecolor2 = Colors.pink;
        break;
    }

    Paint paint = Paint()
      ..strokeWidth = 6
      ..shader = ui.Gradient.linear(
          const Offset(0, 4), // center
          const Offset(1, 4), // radius
          [gatecolor1, gatecolor2],
          [0.5, 0.5],
          TileMode.clamp);

    canvas.drawLine(p1, p2, paint);
    //canvas.drawRect(rect, paint);

    //canvas.drawPath(getRectePath(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HorizontalGatePainter extends CustomPainter {
  int gatestate = 0;
  // gate type
  // 0 - undefined , 1 - personality, 2 - design, 3 - both, 4 - transit
  HorizontalGatePainter({required this.gatestate});

  @override
  void paint(Canvas canvas, Size size) {
    const p1 = Offset(0, 5);
    final p2 = Offset(size.width, 5);

    Color gatecolor1 = Colors.white;
    Color gatecolor2 = Colors.white;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    switch (gatestate) {
      case 0:
        gatecolor1 = Colors.white;
        gatecolor2 = Colors.white;
        break;
      case 1:
        gatecolor1 = Colors.red;
        gatecolor2 = Colors.red;
        break;
      case 2:
        gatecolor1 = Colors.black;
        gatecolor2 = Colors.black;
        break;
      case 3:
        gatecolor1 = Colors.red;
        gatecolor2 = Colors.black;
        break;
      case 4:
        gatecolor1 = Color.alphaBlend(Colors.red, Colors.black);
        gatecolor2 = Colors.blue;
        break;
      default:
        gatecolor1 = Colors.pink;
        gatecolor2 = Colors.pink;
        break;
    }

    Paint paint = Paint()
      ..strokeWidth = 6
      ..shader = ui.Gradient.linear(
          const Offset(0, 4), // center
          const Offset(1, 4), // radius
          [gatecolor1, gatecolor2],
          [0.5, 0.5],
          TileMode.clamp);

    canvas.drawLine(p1, p2, paint);
    //canvas.drawRect(rect, paint);

    //canvas.drawPath(getRectePath(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// end hd chart

launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}