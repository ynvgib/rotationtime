import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/hdlist.dart';
import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget build384PopUp(BuildContext context) {
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
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  idonotknowOnlylinesList[index],
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

Widget build36PopUp(BuildContext context) {
  return AlertDialog(
    title: const Text('36 Transactions'),
    content: SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: 300,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildComplexTransactions(context),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildBreathTransactions(context),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text('breath', style: TextStyle(fontSize: 30, color: Colors.black87))),
          const SizedBox(height: 10,),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildSilencetransactions(context),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('silence', style: TextStyle(fontSize: 20, color: Colors.black))),
        ],
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

Widget _buildComplexTransactions(BuildContext context) {
  return AlertDialog(
    title: const Text('Complex Transactions'),
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
                    hdchannelcomplexList[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                  ),

                ],
              ),
            ),
          );},
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
    title: const Text('Breath Transactions'),
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
                    hdchannelbreathList[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black54),
                  ),

                ],
              ),
            ),
          );},
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
    title: const Text('silence Transactions'),
    content: SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView.builder(
        reverse: false,
        padding: const EdgeInsets.all(5.0),
        itemCount: hdchannelsilenceList.length,
        itemBuilder: (context, index)  {
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
                    hdchannelsilenceList[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                  ),

                ],
              ),
            ),
          );},
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
  int wallet = reversedHexagramsWheel[walletindex];
  //int walletlines = idonotknowlinesList.indexOf(wallet);
  return AlertDialog(
    title: Center(
      child: Text('Wallet: $wallet\n'
          '${LineSentenceList[wallet]}'),
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
                  idonotknowlinesList[wallet * 7 + index + 1],
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

Widget build64PopUp(BuildContext context) {
  return AlertDialog(
    title: const Text('64'),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
          reverse: true,
          padding: const EdgeInsets.all(5.0),
          itemCount: LineSentenceList.length,
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
                  LineSentenceList[index],
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

launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}