import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/hdlist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

Widget buildListsPopUp(BuildContext context) {
  List<String> titles4 = [
    'LIST',
    'HD',
    'ZB',
  ];
  return AlertDialog(
    //title: const Text('36 Transactions'),
    title: const Text('LIST'),
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
                Colors.white.withValues(alpha: 1.0),
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
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
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
  return SelectionArea(
    child: AlertDialog(
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
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => SelectionArea(
                        child: build384rtPop(context, hdlines384lstHeb)),
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
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        build384rtPlanetPop(context),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const SizedBox(
                  width: 60,
                  height: 60,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          backgroundColor: Colors.white,
                          foregroundImage:
                              AssetImage('assets/planets/sun.png')),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                          minRadius: 15,
                          maxRadius: 15,
                          backgroundColor: Colors.white,
                          foregroundImage:
                              AssetImage('assets/planets/earth.png')),
                    )
                  ]),
                ),
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
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
          child: const Text(
            'X',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
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
    title: const Text('Ido Not Now עידו לא כעט',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15)),
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
      // child: Text(revrtgodheads[ghidx]),
      child: Text(revzbgodheads[ghidx]),
    ),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 150,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Text(revrtgodheads[ghidx]),
            const SizedBox(height: 5),
            Text(revhebgodheads[ghidx]),
            const SizedBox(height: 5),
            Text(revgodheads[ghidx]),
            const SizedBox(height: 5),
            Text(revhdgodheadsnew[ghidx]),
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

Widget buildGeneralListsPop(
    BuildContext context, List<String> build4lst, String title4) {
  return AlertDialog(
    title: Text("List: $title4"),
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
    title: const Text(' Detriment Lines Exalted'),
    content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
          reverse: true,
          padding: const EdgeInsets.all(5.0),
          itemCount: 384,
          itemBuilder: (context, index) {
            // int idxline = index * 3;
            return ListTile(
              title: Flex(
                direction: Axis.vertical,
                children: [
                  SelectableText(
                    hdgateline[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SelectableText(
                    // zbchange
                    hdlines384lst[index],
                    // softWrap: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  CircleAvatar(
                      minRadius: 13,
                      maxRadius: 13,
                      backgroundColor: Colors.transparent,
                      // foregroundImage: AssetImage(hdlinesplanet[idxline + 2])),
                      foregroundImage: AssetImage(hdplanetexaltimg[index])),
                  SelectableText(
                    hdlinesexalted[index],
                    // softWrap: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                  const SelectableText(
                    '+\n-',
                    // softWrap: true,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                  SelectableText(
                    hdlinesdetriment[index],
                    // softWrap: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                  CircleAvatar(
                      minRadius: 13,
                      maxRadius: 13,
                      backgroundColor: Colors.transparent,
                      foregroundImage: AssetImage(hdplanetdetrimentimg[index])),
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

  HeadPainter(
      {
      //required this.centerstate, required this.centercolorstate
      required this.centerstate,
      required this.pickcolor});

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

  ThroatPainter({required this.centerstate, required this.pickcolor});

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

  GPainter({required this.centerstate, required this.pickcolor});

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

  SacralPainter({required this.centerstate, required this.pickcolor});

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

  RootPainter({required this.centerstate, required this.pickcolor});

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

  SolarPainter({required this.centerstate, required this.pickcolor});

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

  HeartPainter({required this.centerstate, required this.pickcolor});

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
                          colorin: colorinsimple.withValues(alpha: 1.0)),
                      SizedBox(width: 10),
                      OvalContainer(
                          colorout: coloroutbreath,
                          colorin: colorinbreath.withValues(alpha: 0.85)),
                    ])),
          ),
        ],
      ),
    );
  }
}

// zodiac

// wheel spokes

// from AI code
// AI ZB
class SpokeWheel extends StatelessWidget {
  final int spokeCount;
  final Color wheelColor;
  final double size;

  const SpokeWheel({
    super.key,
    this.spokeCount = 64,
    this.wheelColor = Colors.green,
    this.size = 200,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: WheelPainter(spokeCount: spokeCount, wheelColor: wheelColor),
    );
  }
}

class WheelPainter extends CustomPainter {
  final int spokeCount;
  Color? wheelColor = Colors.black;

  WheelPainter({required this.spokeCount, this.wheelColor = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final Paint rimPaint = Paint()
      ..color = wheelColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final Paint spokePaint = Paint()
      ..color = wheelColor!
      ..strokeWidth = 2;

    // 1. Draw the Rim
    canvas.drawCircle(center, radius, rimPaint);

    // 2. Draw the Hub (Center point)
    canvas.drawCircle(
        center, radius * 0.1, rimPaint..style = PaintingStyle.fill);

    // 3. Draw the Spokes
    for (int i = 0; i < spokeCount; i++) {
      // Calculate angle for each spoke (in radians)
      double angle = (2 * math.pi / spokeCount) * i;

      // Calculate the end point of the spoke on the rim
      Offset outerPoint = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );

      canvas.drawLine(center, outerPoint, spokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ColorWheel extends StatelessWidget {
  final int spokeCount;
  final Color color;
  final double size;
  final double rotationAngle; // New: Controls the spin/tilt
  final int? centerDisplayNumber; // New: Shows the landed wallet number

  const ColorWheel({
    super.key,
    this.spokeCount = 64,
    this.color = Colors.black,
    this.size = 200,
    this.rotationAngle = math.pi / 4, // Default stable 45-degree tilt
    this.centerDisplayNumber,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: ZBFullWheelPainter(
        orderHexagramsWheel,
        rotationAngle: rotationAngle,
        centerDisplayNumber: centerDisplayNumber,
        baseColor: color,
      ),
    );
  }
}

class SpinWheel extends StatefulWidget {
  final double size;
  const SpinWheel({super.key, this.size = 350});

  @override
  // Change _SpinWheelState to SpinWheelState
  State<SpinWheel> createState() => SpinWheelState();
}

// REMOVE the underscore so it is public: SpinWheelState
class SpinWheelState extends State<SpinWheel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // double _currentAngle = math.pi / 4; // Initial 45° tilt
  double _currentAngle = 0.0; // no tils
  int? _chosenWallet;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
  }

  /// RESETS the wheel to its original 45-degree tilt
  void resetWheel() {
    if (_controller.isAnimating) _controller.stop();
    const double segmentAngle = (2 * math.pi / 64);

    // Animate back to the start over 1 second
    final resetAnim = Tween<double>(
            begin: _currentAngle, end: -(2 * math.pi / 64) / 2)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.duration = const Duration(seconds: 1);
    _controller.forward(from: 0).then((_) {
      setState(() {
        // _currentAngle = -(2 * math.pi / 64) / 2;
        _currentAngle = (segmentAngle / 2 - 0.08);

        _chosenWallet = reversedHexagramsWheel.last;
        _controller.duration =
            const Duration(seconds: 2); // Set back to spin speed
      });
    });
  }

  void startSpin(int walletPosition) {
    if (_controller.isAnimating) return;

    // 1. Map Wallet (1-64) to the physical slice (Index 0-63)
    int listIndex = (walletPosition - 1).clamp(0, 63);

    // 2. GET THE VALUE FROM THE REVERSED LIST
    // We use the reversed list to see if the alignment "snaps" into place
    int hexagramValue = reversedHexagramsWheel[listIndex];

    setState(() => _chosenWallet = null);

    const double segmentAngle = (2 * math.pi / 64);

    // 3. CCW TARGETING:
    // To pull Index N to the Arrow (12 o'clock), we rotate NEGATIVELY.
    // We subtract (segmentAngle / 2) to hit the CENTER of the slice.
    double targetInCircle =
        -(listIndex * segmentAngle) - (segmentAngle / 2) - 0.08;

    // 4. ODOMETER CALCULATION:
    double currentInCircle = _currentAngle % (2 * math.pi);
    if (currentInCircle > 0) currentInCircle -= (2 * math.pi);

    double distanceToMove = currentInCircle - targetInCircle;
    if (distanceToMove < 0) distanceToMove += (2 * math.pi);

    double totalSpinTarget = _currentAngle - (10 * math.pi) - distanceToMove;

    print("--- REVERSED TEST SPIN ---");
    print("Targeting Physical Slice: $listIndex");
    print("Hexagram Value (Reversed): $hexagramValue");

    final animation = Tween<double>(
      begin: _currentAngle,
      end: totalSpinTarget,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart));

    animation.addListener(() {
      setState(() => _currentAngle = animation.value);
    });

    _controller.forward(from: 0).then((_) {
      setState(() {
        _currentAngle = totalSpinTarget;
        _chosenWallet = hexagramValue; // Show the reversed hexagram value
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorWheel(
      size: widget.size,
      rotationAngle: _currentAngle,
      centerDisplayNumber: _chosenWallet,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ZBFullWheelPainter extends CustomPainter {
  final List<int> orderHexagramsOnWheel;
  final double rotationAngle;
  final int? centerDisplayNumber;
  final Color baseColor;

  ZBFullWheelPainter(
    this.orderHexagramsOnWheel, {
    this.rotationAngle = 0.0,
    this.centerDisplayNumber,
    this.baseColor = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // wheel tilt
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationAngle);
    canvas.translate(-center.dx, -center.dy);

    const double angleStep = -(2 * math.pi / 64);
    const double offsetTo12 = -(math.pi / 2);

    const List<Color> bottomPalette = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.yellow
    ];
    const List<Color> standardPalette = [
      Colors.red,
      Colors.yellow,
      Colors.green,
      Colors.blue
    ];
    const List<Color> reversedPalette = [
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.red
    ];

    for (int i = 0; i < 64; i++) {
      int next = (i + 1) % 64;
      final double startAngle = i * angleStep + offsetTo12;

      int bIdx = (i ~/ 16) % 4;
      int nextBIdx = (next ~/ 16) % 4;

      List<Color> currentP = (bIdx <= 1) ? reversedPalette : standardPalette;
      List<Color> nextP = (nextBIdx <= 1) ? reversedPalette : standardPalette;

      _drawGradientRing(canvas, center, radius * 0.4, 0.0, startAngle,
          angleStep, bottomPalette[bIdx], bottomPalette[nextBIdx]);

      _drawGradientRing(canvas, center, radius * 0.7, radius * 0.4, startAngle,
          angleStep, currentP[(i ~/ 4) % 4], nextP[(next ~/ 4) % 4]);

      _drawGradientRing(canvas, center, radius, radius * 0.7, startAngle,
          angleStep, currentP[i % 4], nextP[next % 4]);

      // --- NUMBERS (At the Edge) - FIXED: Pulled 2 Steps Clockwise ---
      if (i < orderHexagramsOnWheel.length) {
        // We subtract angleStep twice to move Clockwise against the CCW flow
        // effectively jumping from 'i+1' back to 'i-1'
        double correctedAngle = startAngle + (angleStep / 2) - angleStep;

        _drawNumber(canvas, center, radius + 10, correctedAngle,
            orderHexagramsOnWheel[i].toString());
      }
    }

    canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5);

    _drawInnerDashboard(canvas, center, radius);

    canvas.drawCircle(center, 5, Paint()..color = Colors.black);
    canvas.restore();

    // 4. USE centerDisplayNumber HERE
    if (centerDisplayNumber != null) {
      _drawCenterNumber(canvas, center, centerDisplayNumber.toString());
    }
  }

  // Add this helper method to draw the number in the middle
  void _drawCenterNumber(Canvas canvas, Offset center, String text) {
    // 1. Shadow with modern 'withValues'
    final Paint shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.3) // Modern syntax
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    canvas.drawCircle(center + const Offset(2, 2), 30, shadowPaint);

    // 2. Main White Circle
    canvas.drawCircle(center, 30, Paint()..color = Colors.white);

    // 3. Subtle Green Border
    canvas.drawCircle(
        center,
        30,
        Paint()
          ..color = Colors.green.withValues(alpha: 0.5) // Modern syntax
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);

    // 4. The Number
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
            color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    tp.paint(canvas, center - Offset(tp.width / 2, tp.height / 2));
  }

  void _drawGradientRing(Canvas canvas, Offset center, double outerRad,
      double innerRad, double startAngle, double sweep, Color c1, Color c2) {
    final rect = Rect.fromCircle(center: center, radius: outerRad);
    final paint = Paint()
      ..shader = SweepGradient(
              center: Alignment.center,
              colors: [c1, c2],
              transform: GradientRotation(startAngle))
          .createShader(rect);
    Path path = Path()
      ..moveTo(center.dx + innerRad * math.cos(startAngle),
          center.dy + innerRad * math.sin(startAngle))
      ..lineTo(center.dx + outerRad * math.cos(startAngle),
          center.dy + outerRad * math.sin(startAngle))
      ..arcTo(rect, startAngle, sweep, false)
      ..lineTo(center.dx + innerRad * math.cos(startAngle + sweep),
          center.dy + innerRad * math.sin(startAngle + sweep))
      ..arcTo(Rect.fromCircle(center: center, radius: innerRad),
          startAngle + sweep, -sweep, false)
      ..close();
    canvas.drawPath(path, paint);
  }

  void _drawNumber(
      Canvas canvas, Offset center, double rad, double angle, String text) {
    final tp = TextPainter(
        text: TextSpan(
            text: text,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold)),
        textDirection: TextDirection.ltr)
      ..layout();
    canvas.save();
    canvas.translate(
        center.dx + rad * math.cos(angle), center.dy + rad * math.sin(angle));
    canvas.rotate(angle + (math.pi / 2));
    tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
    canvas.restore();
  }

  // --- ZB INNER DASHBOARD LOGIC ---

  void _drawInnerDashboard(Canvas canvas, Offset center, double radius) {
    const List<String> dna = ["A", "C", "T", "G"];
    const List<String> keynotes = [
      "\"COMPLEX\"",
      "Simple;",
      "silence.",
      "Breath,"
    ];
    const double sweep = -(2 * math.pi / 4);
    const double offset = -(math.pi / 2);

    for (int i = 0; i < 4; i++) {
      double startAngle = i * sweep + offset;
      double midAngle = startAngle + (sweep / 2);

      _drawStackedLetter(canvas, center, radius * 0.25, midAngle, dna[i]);
      _drawCurvedText(
          canvas, center, radius * 0.35, startAngle, sweep, keynotes[i]);

      // REMOVED: canvas.restore(); <--- This was the error!
    }
  }

  void _drawStackedLetter(
      Canvas canvas, Offset center, double rad, double angle, String text) {
    final tp = TextPainter(
      text: TextSpan(
          text: text,
          style: const TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
      textDirection: TextDirection.ltr,
    )..layout();

    canvas.save();
    canvas.translate(
        center.dx + rad * math.cos(angle), center.dy + rad * math.sin(angle));
    tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
    canvas.restore();
  }

  void _drawCurvedText(Canvas canvas, Offset center, double rad, double start,
      double sweep, String text) {
    final double charAngleStep = sweep / (text.length + 1);

    for (int i = 0; i < text.length; i++) {
      double angle = start + (text.length - i) * charAngleStep;

      final tp = TextPainter(
        text: TextSpan(
            text: text[i],
            style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600)),
        textDirection: TextDirection.ltr,
      )..layout();

      canvas.save(); // Checkpoint for this specific letter
      canvas.translate(
          center.dx + rad * math.cos(angle), center.dy + rad * math.sin(angle));
      canvas.rotate(angle + (math.pi / 2));
      tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
      canvas.restore(); // Reset for the next letter
    }
  }

  @override
  bool shouldRepaint(covariant ZBFullWheelPainter oldDelegate) {
    return oldDelegate.rotationAngle != rotationAngle ||
        oldDelegate.centerDisplayNumber != centerDisplayNumber ||
        oldDelegate.baseColor != baseColor;
  }
}

// AI generated

// lib/models/zb_matrix.dart

class ZBMatrix {
  final int level;
  final String keynote;
  final String punctuation;
  final Color color;
  final String animal;
  final String form;
  final String logic;
  final String? type; // Human Design Type
  final String? authority; // Inner Authority

  ZBMatrix({
    required this.level,
    required this.keynote,
    required this.punctuation,
    required this.color,
    required this.animal,
    required this.form,
    required this.logic,
    this.type,
    this.authority,
  });

  static final List<ZBMatrix> base6 = [
    ZBMatrix(
      level: 1,
      keynote: "idk",
      punctuation: "",
      color: Colors.black,
      animal: "pussycat",
      form: "dot (pixel)",
      logic: "Source (Meditation)",
      authority: "spleen", // Base 6 + 1 logic
    ),
    ZBMatrix(
      level: 2,
      keynote: "silence",
      punctuation: ".",
      color: Colors.red,
      animal: "bitch",
      form: "line",
      logic: "build",
      type: "generator",
      authority: "sacral",
    ),
    ZBMatrix(
      level: 3,
      keynote: "Breath",
      punctuation: ",",
      color: Colors.yellow,
      animal: "Octopussy",
      form: "Triangle",
      logic: "use",
      type: "Projector",
      authority: "g(self)",
    ),
    ZBMatrix(
      level: 4,
      keynote: "Simple",
      punctuation: ";",
      color: Colors.green,
      animal: "Octopus",
      form: "Square",
      logic: "Think",
      type: "Reflector",
      authority: "Ajna (mind)",
    ),
    ZBMatrix(
      level: 5,
      keynote: "COMPLEX",
      punctuation: "\"",
      color: Colors.blue,
      animal: "DOG",
      form: "Pentacle",
      logic: "NEGLECT",
      type: "Manifestor",
      authority: "HEART(EGO)",
    ),
    ZBMatrix(
      level: 6,
      keynote: "zmansi",
      punctuation: "@",
      color: Colors.white,
      animal: "Camel",
      form: "Puddle (sign)",
      logic: "The Beyond",
      authority: "SOLARPLEXUS@EMOTIONS",
    ),
  ];
}

class ZBGeometryPainter {
  static void drawShape(
      Canvas canvas, Offset center, double size, int level, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    switch (level) {
      case 1: // dot (pixel) - pussycat
        canvas.drawCircle(center, size * 0.2, paint);
        break;

      case 2: // line - bitch
        canvas.drawLine(
          Offset(center.dx - size * 0.5, center.dy),
          Offset(center.dx + size * 0.5, center.dy),
          paint..style = PaintingStyle.stroke,
        );
        break;

      case 3: // Triangle - Octopussy
        _drawPath(canvas, center, size, 3, paint);
        break;

      case 4: // Square - Octopus
        _drawPath(canvas, center, size, 4, paint);
        break;

      case 5: // Pentacle - DOG
        _drawStar(canvas, center, size, 5, paint);
        break;

      case 6: // Puddle (sign) - Camel
        _drawPuddle(canvas, center, size, paint);
        break;
    }
  }

  static void _drawPath(
      Canvas canvas, Offset center, double size, int sides, Paint paint) {
    final path = Path();
    final double angle = (2 * math.pi) / sides;
    // Offset by -pi/2 to point the Triangle/Square upwards
    const double rotation = -math.pi / 2;

    path.moveTo(center.dx + size * math.cos(rotation),
        center.dy + size * math.sin(rotation));
    for (int i = 1; i <= sides; i++) {
      path.lineTo(
        center.dx + size * math.cos(i * angle + rotation),
        center.dy + size * math.sin(i * angle + rotation),
      );
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  static void _drawStar(
      Canvas canvas, Offset center, double size, int points, Paint paint) {
    final path = Path();
    final double angle = math.pi / points;
    for (int i = 0; i < 2 * points; i++) {
      double r = (i % 2 == 0) ? size : size * 0.45;
      double x = center.dx + r * math.cos(i * angle - math.pi / 2);
      double y = center.dy + r * math.sin(i * angle - math.pi / 2);
      if (i == 0)
        path.moveTo(x, y);
      else
        path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  static void _drawPuddle(
      Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();
    const int segments = 8;
    for (int i = 0; i < segments; i++) {
      double angle = i * (2 * math.pi / segments);
      // Fluid logic: varying the radius slightly per segment
      double r = size * (0.7 + 0.3 * math.sin(i * 1.5));
      double x = center.dx + r * math.cos(angle);
      double y = center.dy + r * math.sin(angle);
      if (i == 0)
        path.moveTo(x, y);
      else
        path.quadraticBezierTo(center.dx, center.dy, x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }
}

Widget buildSelectionButton(
    BuildContext context, String label, Widget dialogContent) {
  return ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) => SelectionArea(child: dialogContent),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    child: Text(label, style: const TextStyle(color: Colors.white)),
  );
}

// One function to rule them all (4, 36, 64, 384)
Widget buildBasePopUp(
    BuildContext context, String baseName, Map<String, List<String>> listsMap) {
  // Use a Builder to get a fresh local context for the Navigator
  return Builder(builder: (dialogContext) {
    return SelectionArea(
      child: AlertDialog(
        title: Text('Base $baseName - Choose Category'),
        content: SizedBox(
          width: MediaQuery.of(dialogContext).size.width * 0.7,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: listsMap.keys.map((String title) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      showDialog(
                        context: dialogContext, // Use dialogContext here
                        builder: (innerContext) => buildBaseDataList(
                            innerContext, title, listsMap[title]!),
                      );
                    },
                    child: Text(title,
                        style: const TextStyle(color: Colors.white)),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        actions: [
          TextButton(
            // Use dialogContext to ensure it pops the current AlertDialog
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('X', style: TextStyle(color: Colors.black)),
          )
        ],
      ),
    );
  });
}

Widget buildBaseDataList(
    BuildContext context, String title, List<String> data) {
  return SelectionArea(
    child: AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.4, // Shorter for Base 4
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            bool isBase4 = data.length == 4; // Only apply if it's the 4-list
            return Card(
              color: isBase4 ? getBase4Color(index) : Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: Text('${index + 1}',
                      style: TextStyle(
                          color: isBase4
                              ? getBase4TextColor(index)
                              : Colors.black)),
                ),
                title: Text(
                  data[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isBase4 ? getBase4TextColor(index) : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          },
          child: const Text('X'),
        )
      ],
    ),
  );
}

// In rotatewidgets.dart (No underscore = Global/Public)
Widget zbChannelBtn({
  required BuildContext context,
  required String label,
  required Color bg,
  required Color textCol,
  required Widget destination,
  double fontSize = 25,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (innerCtx) => SelectionArea(child: destination),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: textCol, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget zbTriadRow({
  required BuildContext context,
  required String label1,
  required Widget dest1,
  required String label2,
  required Widget dest2,
  required String label3,
  required Widget dest3,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Blue / Complex
        _zbMiniBtn(context, label1, Colors.blue, Colors.white, dest1),
        // Yellow / Breath
        _zbMiniBtn(context, label2, Colors.yellow, Colors.grey[800]!, dest2),
        // Red / Silence
        _zbMiniBtn(context, label3, Colors.red, Colors.black, dest3),
      ],
    ),
  );
}

// Compact button for the grid
Widget _zbMiniBtn(
    BuildContext context, String label, Color bg, Color textCol, Widget dest) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () => showDialog(
          context: context,
          builder: (ctx) => SelectionArea(child: dest),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: textCol, fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

Widget zbbuild36PopUp(BuildContext context) {
  return SelectionArea(
    child: AlertDialog(
      title: const Text('36 Transactions', textAlign: TextAlign.center),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9, // Wider for the grid
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Time States (Hebrew)",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              zbTriadRow(
                  context: context,
                  label1: 'מורכב',
                  dest1: _buildComplexTS(context, hdchannelcomplexList_heb),
                  label2: 'נשימה',
                  dest2: _buildBreathTS(context, hdchannelbreathList_heb),
                  label3: 'שתיקה',
                  dest3: _buildSilenceTS(context, hdchannelsilenceList_heb)),
              zbTriadRow(
                  context: context,
                  label1: 'Complex',
                  dest1: _buildComplexTS(context, hdchannelcomplexList),
                  label2: 'Breath',
                  dest2: _buildBreathTS(context, hdchannelbreathList),
                  label3: 'silence',
                  dest3: _buildSilenceTS(context, hdchannelsilenceList)),
              const Divider(thickness: 2),
              const Text("HD Types",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              zbTriadRow(
                  context: context,
                  label1: 'הגשמה',
                  dest1: _buildManifestChl(context, hdchlimpactList_he),
                  label2: 'הקרנה',
                  dest2: _buildProjectedChl(context, hdchlProjectList_he),
                  label3: 'מחול אל',
                  dest3: _buildGenerateChl(context, hdchlgenerateList_he)),
              zbTriadRow(
                  context: context,
                  label1: 'Manifest',
                  dest1: _buildManifestChl(context, hdchlimpactList),
                  label2: 'Project',
                  dest2: _buildProjectedChl(context, hdchlProjectList),
                  label3: 'Generate',
                  dest3: _buildGenerateChl(context, hdchlgenerateList)),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
          child: const Text('X'),
        )
      ],
    ),
  );
}

Widget zbbuild384PopUp(BuildContext context) {
  return Builder(builder: (dialogContext) {
    return SelectionArea(
      child: AlertDialog(
        title: const Text('Base 384'),
        content: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(dialogContext).size.width * 0.7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1. DYNAMIC: Using the global 'base384' Map from rtlists.dart
                ...base384.entries.map((entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: zbChannelBtn(
                        context: dialogContext,
                        label: entry.key,
                        bg: Colors.black,
                        textCol: Colors.white,
                        fontSize: 18,
                        destination: build384rtPop(dialogContext, entry.value),
                      ),
                    )),

                const Divider(color: Colors.black, thickness: 3, height: 30),

                // 2. THE COMPLEX GENIUS: Using the Sun/Earth Stack Helper
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: dialogContext,
                      builder: (innerCtx) => SelectionArea(
                        child: build384rtPlanetPop(innerCtx),
                      ),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: _buildSunEarthStack(), // The Reflected Helper
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (Navigator.of(dialogContext).canPop()) {
                Navigator.of(dialogContext).pop();
              }
            },
            child: const Text('X',
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
        ],
      ),
    );
  });
}

Widget _buildSunEarthStack() {
  return const SizedBox(
    width: 60,
    height: 60,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              foregroundImage: AssetImage('assets/planets/sun.png')),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              foregroundImage: AssetImage('assets/planets/earth.png')),
        )
      ],
    ),
  );
}

Widget zbbuildBasePopUp(
    BuildContext context, String title, Map<String, List<String>> dataMap) {
  return Builder(builder: (dialogContext) {
    return SelectionArea(
      child: AlertDialog(
        title: Text('Base $title'),
        content: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(dialogContext).size.width * 0.7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // THE REPLICATED DESIGN: All buttons from the Map
                ...dataMap.entries.map((entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: zbChannelBtn(
                        context: dialogContext,
                        label: entry.key,
                        bg: Colors.black,
                        textCol: Colors.white,
                        fontSize: 18,
                        // Generic list displayer for all bases
                        destination: buildBaseDataList(
                            dialogContext, entry.key, entry.value),
                      ),
                    )),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (Navigator.of(dialogContext).canPop())
                Navigator.of(dialogContext).pop();
            },
            child: const Text('X',
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ),
        ],
      ),
    );
  });
}
