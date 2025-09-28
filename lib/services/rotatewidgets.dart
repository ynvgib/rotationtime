import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/hdlist.dart';
import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Widget build4PopUp(BuildContext context) {
  List<String> titles4 = [
    'Types',
    'טיפוסים',
    'MinMax',
    'מינימיקי',
    'Coins',
    'מטבעות',
    'New Coins',
    'מטבעות חדשים',
    'בימבוקס',
    //'Kit He',
    'Kit He',
    'ווף'
    //'ווף ווף גוף גוף'
  ];
  return AlertDialog(
    //title: const Text('36 Transactions'),
    title: const Text('4'),
    content: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, hdType4lst, titles4[0]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles4[0],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, hdType4Heblst, titles4[1]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles4[1],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build4rtPop(context, minmax4lst, titles4[2]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles4[2],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build4rtPop(context, minmax4Heblst, titles4[3]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles4[3],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build4rtPop(context, coinsEng4lst, titles4[4]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles4[4],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build4rtPop(context, coinsHeb4lst, titles4[5]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles4[5],
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
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
                      build4rtPop(context, newcoinsEng4lst, titles4[6]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles4[6],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build4rtPop(context, newcoinsHeb4lst, titles4[7]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles4[7],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build4rtPop(context, bimboxHeb4lst, titles4[8]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles4[8],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, kithe4lst, titles4[9]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles4[9],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, zbwoofgoofheb, titles4[10]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles4[10],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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

Widget buildDogPopUp(BuildContext context) {
  return AlertDialog(
    title: const Text('ב-DO-G-כל'),
    content: SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              //image: AssetImage(newminmaxcoins[index]),
              image: AssetImage('assets/camog/dogdownapp.png'),
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(1.0),
                BlendMode.modulate,
              )),
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
            const SizedBox(
              height: 10,
            ),
            //hd
            const Divider(color: Colors.black, thickness: 5),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildManifestChl(context, hdchlimpactList_he),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('הגשמה',
                    style: TextStyle(color: Colors.white, fontSize: 25))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildProjectedChl(context, hdchlProjectList_he),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                child: const Text('הקרנה',
                    style: TextStyle(color: Colors.grey, fontSize: 25))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildGenerateChl(context, hdchlgenerateList_he),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('מחול אל',
                    style: TextStyle(color: Colors.black, fontSize: 25))),
            const Divider(color: Colors.black, thickness: 5),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildManifestChl(context, hdchlimpactList),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Manifest',
                    style: TextStyle(color: Colors.white, fontSize: 25))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildProjectedChl(context, hdchlProjectList),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                child: const Text('Project',
                    style: TextStyle(color: Colors.grey, fontSize: 25))),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildGenerateChl(context, hdchlgenerateList),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Generate',
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
  List<String> titles64 = [
    'ארנקים',
    'סיבוב בים',
    'סיבוב חדש',
    'שערים',
    'Rotations',
    'New Rotations',
    'Gates',
    'Describe Gates',
    'Hexagrams',
    'iJudgement'
  ];
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
                      build64rtPop(context, rtwallets65lst_heb, titles64[0]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles64[0],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, rtbbwallet65lst_heb, titles64[1]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles64[1],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => build64rtPop(
                      context, rtgateswallet65lst_heb, titles64[2]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles64[2],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build64rtPop(context, hdgates65lst_heb, titles64[3]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles64[3],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const Divider(color: Colors.black, thickness: 5),
            // Eng
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, hexRTNames65lst, titles64[4]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles64[4],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build64rtPop(context, new_hexRTNames65lst, titles64[5]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles64[5],
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
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
                      build64rtPop(context, hdgates65lst, titles64[6]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles64[6],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build64rtPop(context, hdgatesdesc, titles64[7]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles64[7],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build64rtPop(context, hexNames65lst, titles64[8]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles64[8],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build64rtPop(context, iChingEng65lst, titles64[9]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(titles64[9],
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
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
                      build384rtPlanetPop(context),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const CircleAvatar(
                  minRadius: 30,
                  maxRadius: 30,
                  backgroundColor: Colors.white,
                  foregroundImage: AssetImage('assets/camog/mcamog.png')),
            ),
            const SizedBox(
              height: 10,
            ),
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
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build384rtPop(context, hdlines384lstHeb),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('קווי עיצוב',
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
            const SizedBox(
              height: 10,
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

Widget buildBookPopUp(BuildContext context) {
  List<String> booktitles = [
    'בחיפוש אחר גוגל',
    'In Search of Google',
    'מאי טי אל גורו גי ומטא גי',
    'From IT to Guruji and Mata G',
    'מילים Lyrics',
    'בחיפוש אחר מפות',
  ];
  return AlertDialog(
    //title: const Text('36 Transactions'),
    title: const Text('Ido Not Now עידו לא כעט', textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15)),
    content: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/camog/dogatapp.gif',
                ),
                tooltip: 'Re ID לי קרוע',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, pdfroutes[5]);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: AutoSizeText(
                booktitles[5],
                minFontSize: 15,
                maxFontSize: 25,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, pdfroutes[0]);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: AutoSizeText(
                booktitles[0],
                minFontSize: 15,
                maxFontSize: 25,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, pdfroutes[1]);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: AutoSizeText(
                booktitles[1],
                minFontSize: 15,
                maxFontSize: 25,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, pdfroutes[2]);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                child: AutoSizeText(
                  booktitles[2],
                  minFontSize: 15,
                  maxFontSize: 25,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, pdfroutes[3]);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: AutoSizeText(
                  booktitles[3],
                  minFontSize: 15,
                  maxFontSize: 25,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, pdfroutes[4]);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: AutoSizeText(
                  booktitles[4],
                  minFontSize: 15,
                  maxFontSize: 25,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
            const SizedBox(
              height: 10,
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

Widget _buildManifestChl(BuildContext context, List<String> complexlst) {
  return AlertDialog(
    title: const Text('Manifest יוזמה'),
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

Widget _buildProjectedChl(BuildContext context, List<String> breathlst) {
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

Widget _buildGenerateChl(BuildContext context, List<String> silencelst) {
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
          '${rtwallets65lst_heb[walletindex]}'),
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
                  rtmix390lstHeb[walletindex * 7 + index + 1],
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
        height: 150,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Text(revhebgodheads[ghidx]),
            const SizedBox(height: 5),
            Text(revgodheads[ghidx]),
          ],
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

Widget build4rtPop(
    BuildContext context, List<String> build4lst, String title4) {
  return AlertDialog(
    title: Text("4: $title4"),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 300,
        child: ListView.builder(
          reverse: false,
          padding: const EdgeInsets.all(5.0),
          itemCount: 4,
          itemBuilder: (context, index) => ListTile(
            title: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  (build4lst.length - index).toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(width: 5),
                Text(
                  //LineSentenceList[index],
                  build4lst[index],
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

Widget build64rtPop(
    BuildContext context, List<String> build64lst, String title64) {
  return AlertDialog(
    title: Text("64: $title64"),
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

            _linecount = (index + 1) / 6;
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

Widget build384rtPlanetPop(BuildContext context) {
  return AlertDialog(
    title: const Text('כוחה בים'),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
          reverse: true,
          padding: const EdgeInsets.all(5.0),
          itemCount: 384,
          itemBuilder: (context, index) {
            int idxline = index * 3;
            return ListTile(
              title: Flex(
                direction: Axis.vertical,
                children: [
                  CircleAvatar(
                      minRadius: 13,
                      maxRadius: 13,
                      backgroundColor: Colors.transparent,
                      foregroundImage: AssetImage(hdlinesplanet[idxline + 2])),
                  Text(
                    hdlinesplanet[idxline],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  CircleAvatar(
                      minRadius: 13,
                      maxRadius: 13,
                      backgroundColor: Colors.transparent,
                      foregroundImage: AssetImage(hdlinesplanet[idxline + 1])),
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

Widget _buildPlanetGatesPop(BuildContext context, List<Hexagram> planetLst) {
  return AlertDialog(
    title: const Text('ארנקים'),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView.builder(
          reverse: false,
          itemCount: planetLst.length,
          itemBuilder: (context, index) => ListTile(
            title: SizedBox(
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: Colors.transparent,
                      foregroundImage: AssetImage(planetsimagelist[index])),
                  Text(
                    planetLst[index].gate!.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    rtwallets65lst_heb[planetLst[index].gate!],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        )),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.close, color: Colors.black),
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
  int centerstate = 1;
  Color centercolor = Colors.green, pickcolor = Colors.orange;
  //Color centercolor = Colors.yellow;
  //int centercolorstate = 0;

  HeadPainter({
    //required this.centerstate, required this.centercolorstate
    required this.centerstate, required this.pickcolor
  });

  @override
  void paint(Canvas canvas, Size size) {
    //Color centercolor = Colors.yellow;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    //centerstate ? centercolor = Colors.yellow : centercolor = Colors.green;

    centercolor = setCenterColor(centerstate, pickcolor);

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
  int centerstate = 1;
  Color centercolor = Colors.green, pickcolor = Colors.orange;

  AjnaPainter({
    required this.centerstate,
    required this.pickcolor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.yellow;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    //centerstate ? centercolor = Colors.yellow : centercolor = Colors.green;
    centercolor = setCenterColor(centerstate, pickcolor);

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
  int centerstate = 1;
  Color centercolor = Colors.green, pickcolor = Colors.orange;

  ThroatPainter({
    required this.centerstate,
    required this.pickcolor
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );

    //Color centercolor = Color(0xff807a2b);
    Color centercolor = Colors.blue;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    //centerstate ? centercolor = Colors.blue : centercolor = Colors.green;
    centercolor = setCenterColor(centerstate, pickcolor);

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
  int centerstate = 1;

  Color pickcolor = Colors.orange;

  GPainter({
    required this.centerstate, required this.pickcolor
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.yellow;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    //var angle = (math.pi * 2) / 4;

    //centerstate ? centercolor = Colors.yellow : centercolor = Colors.green;
    centercolor = setCenterColor(centerstate, pickcolor);

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
  int centerstate = 1;
  Color pickcolor = Colors.orange;

  SacralPainter({
    required this.centerstate, required this.pickcolor
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

    //centerstate ? centercolor = Colors.red : centercolor = Colors.green;
    centercolor = setCenterColor(centerstate, pickcolor);

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
  int centerstate = 1;
  Color pickcolor = Colors.orange;

  RootPainter({
    required this.centerstate, required this.pickcolor
  });

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
    );

    //#FF7700 #AA8B00
    //Color centercolor = Color(0xffaa8b00);
    Color centercolor = Colors.yellow;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    //centerstate ? centercolor = Colors.yellow : centercolor = Colors.green;
    centercolor = setCenterColor(centerstate, pickcolor);

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
  int centerstate = 1;
  Color pickcolor = Colors.orange;

  SpleenPainter({
    required this.centerstate,
    required this.pickcolor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.yellow;
    //AA8B00
    //Color centercolor = Color(0xffaa8b00);

    //centerstate ? centercolor = Colors.yellow : centercolor = Colors.green;
    centercolor = setCenterColor(centerstate, pickcolor);

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
  int centerstate = 1;
  Color pickcolor = Colors.orange;

  SolarPainter({
    required this.centerstate, required this.pickcolor
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.blue;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    //centerstate ? centercolor = Colors.blue : centercolor = Colors.green;
    centercolor = setCenterColor(centerstate, pickcolor);

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
  int centerstate = 1;
  Color pickcolor = Colors.orange;

  HeartPainter({
    required this.centerstate,
    required this.pickcolor
  });

  @override
  void paint(Canvas canvas, Size size) {
    Color centercolor = Colors.blue;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    //centerstate ? centercolor = Colors.blue : centercolor = Colors.green;
    centercolor = setCenterColor(centerstate, pickcolor);
    //print (centerstate);

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
  // 0 - undefined , 1 - design, 2 - personality, 3 - both, 4 - transit
  VerticalGatePainter({required this.gatestate});

  @override
  void paint(Canvas canvas, Size size) {
    const p1 = Offset(0, 0);
    final p2 = Offset(0, size.height);

    //Color gatecolor1 = Colors.green;
    //Color gatecolor2 = Colors.green;
    //PaintingStyle centerstyle = PaintingStyle.fill;

    List<Color> gateColorsList = [];
    gateColorsList = setGateColor(gatestate);

    Paint paint = Paint()
      ..strokeWidth = 6
      ..shader = ui.Gradient.linear(
          const Offset(0, 4), // center
          const Offset(1, 4), // radius
          //[gatecolor1, gatecolor2],
          gateColorsList,
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

    //Color gatecolor1 = Colors.green;
    ///Color gatecolor2 = Colors.green;

    List<Color> gateColorsList = [];
    gateColorsList = setGateColor(gatestate);

    //PaintingStyle centerstyle = PaintingStyle.fill;

    Paint paint = Paint()
      ..strokeWidth = 6
      ..shader = ui.Gradient.linear(
          const Offset(0, 4), // center
          const Offset(1, 4), // radius
          //[gatecolor1, gatecolor2],
          gateColorsList,
          [0.5, 0.5],
          TileMode.clamp);

    canvas.drawLine(p1, p2, paint);
    //canvas.drawRect(rect, paint);

    //canvas.drawPath(getRectePath(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

setGateColor(int finalgatestate) {
  //int gatestate = 0;

  List<Color> gatecolorlist = [Colors.green, Colors.green];

  switch (finalgatestate) {
    case 0:
      gatecolorlist[0] = Colors.green;
      gatecolorlist[1] = Colors.green;
      break;
    case 1:
      gatecolorlist[0] = Colors.red;
      gatecolorlist[1] = Colors.red;
      break;
    case 2:
      gatecolorlist[0] = Colors.blue;
      gatecolorlist[1] = Colors.blue;
      break;
    case 3:
      gatecolorlist[0] = Colors.blue;
      gatecolorlist[1] = Colors.red;
      break;
    case 4:
      gatecolorlist[0] = Colors.yellow;
      gatecolorlist[1] = Colors.yellow;
      break;
    case 5:
      gatecolorlist[0] = Colors.black;
      gatecolorlist[1] = Colors.black;
      break;
    case 6:
      gatecolorlist[0] = Colors.white;
      gatecolorlist[1] = Colors.white;
      break;
    case 7:
      gatecolorlist[0] = Colors.white;
      gatecolorlist[1] = Colors.black;
      break;
    case 8:
      gatecolorlist[0] = Colors.red;
      gatecolorlist[1] = Colors.black;
      break;
    default:
      gatecolorlist[0] = Colors.pink;
      gatecolorlist[1] = Colors.pink;
      break;
  }

  return gatecolorlist;
}

setCenterColor(int finalcenterstate, Color pickedcolor) {
  //int gatestate = 0;

  List<Color> centercolorlist = [
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.white,
    Colors.brown,
    pickedcolor,
  ];
  Color centercolor = Colors.green;

  switch (finalcenterstate) {
    case 0:
      centercolor = centercolorlist[0];
      break;
    case 1:
      centercolor = centercolorlist[1];
      break;
    case 2:
      centercolor = centercolorlist[2];
      break;
    case 3:
      centercolor = centercolorlist[3];
      break;
    case 4:
      centercolor = centercolorlist[4];
      break;
    case 5:
      centercolor = centercolorlist[5];
      break;
    case 6:
      centercolor = centercolorlist[6];
      break;
    case 7:
      centercolor = centercolorlist[7];
      break;
    default:
      centercolor = Colors.pink;
      break;
  }

  return centercolor;
}

// end hd chart

//launchUrl(url) async {
//  if (!await launchUrl(url)) {
//    throw Exception('Could not launch $url');
//  }
//}

class OvalContainer extends StatelessWidget {
  const OvalContainer({
    Key? key,
    this.width = 35,
    this.height = 70,
    this.colorin = Colors.transparent,
    required this.colorout,
  }) : super(key: key);
  final double width;
  final double height;
  final Color colorin, colorout;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorin,
        border: Border.all(color: colorout, width: 3.0),
        borderRadius: new BorderRadius.all(Radius.elliptical(90, 60)),
      ),
    );
  }
}

class EvolutionContainer extends StatelessWidget {
  const EvolutionContainer(
      {Key? key,
      this.width = 100,
      this.height = 100,
      this.colorinsilence = Colors.red,
      this.colorinbreath = Colors.yellow,
      this.colorinsimple = Colors.green,
      this.colorincomplex = Colors.green,
      this.coloroutsilence = Colors.red,
      this.coloroutbreath = Colors.yellow,
      this.coloroutsimple = Colors.green,
      this.coloroutcomplex = Colors.blue})
      : super(key: key);

  final double width;
  final double height;
  final Color colorinsilence,
      colorinbreath,
      colorinsimple,
      colorincomplex,
      coloroutsilence,
      coloroutbreath,
      coloroutsimple,
      coloroutcomplex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: [
          Container(
              height: height - 5,
              width: width - 5,
              child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OvalContainer(
                        colorout: coloroutsilence, colorin: colorinsilence),
                    SizedBox(width: 10),
                    OvalContainer(
                        colorout: coloroutcomplex, colorin: colorincomplex),
                  ])),
          RotationTransition(
            turns: const AlwaysStoppedAnimation(90 / 360),
            child: Container(
                height: height - 5,
                width: width - 5,
                child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OvalContainer(
                          colorout: coloroutsimple,
                          colorin: colorinsimple.withOpacity(0.85)),
                      SizedBox(width: 10),
                      OvalContainer(
                          colorout: coloroutbreath,
                          colorin: colorinbreath.withOpacity(0.85)),
                    ])),
          ),
        ],
      ),
    );
  }
}

// zodiac
