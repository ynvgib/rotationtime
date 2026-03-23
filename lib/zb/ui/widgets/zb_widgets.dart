import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle_list/circle_list.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/zb/data/zb_classes.dart';
import 'package:finallyicanlearn/zb/ui/zb_helpers.dart';
import 'package:finallyicanlearn/zb/data/zb_listdb.dart';
import 'package:finallyicanlearn/zb/data/zb_data.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

Widget buildListsPopUp(BuildContext context) {
  List<String> titles4 = ['LIST', 'HD', 'ZB'];
  return AlertDialog(
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
              child: Text(
                titles4[0],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, hdType4Heblst, titles4[1]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[1],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, minmax4lst, titles4[2]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[2],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
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
        child: const Text('X', style: TextStyle(color: Colors.black)),
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
    'ווף',
    //'ווף ווף גוף גוף'
  ];
  return AlertDialog(
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
              child: Text(
                titles4[0],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, hdType4Heblst, titles4[1]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[1],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, minmax4lst, titles4[2]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[2],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, minmax4Heblst, titles4[3]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[3],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, coinsEng4lst, titles4[4]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[4],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, coinsHeb4lst, titles4[5]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[5],
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, newcoinsEng4lst, titles4[6]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[6],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, newcoinsHeb4lst, titles4[7]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[7],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, bimboxHeb4lst, titles4[8]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[8],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, kithe4lst, titles4[9]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[9],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build4rtPop(context, zbwoofgoofheb, titles4[10]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles4[10],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
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
        child: const Text('X', style: TextStyle(color: Colors.black)),
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
            image: const AssetImage('assets/camog/dogdownapp.png'),
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 1.0),
              BlendMode.modulate,
            ),
          ),
        ),
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('X', style: TextStyle(color: Colors.black)),
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
    'iJudgement',
  ];
  return AlertDialog(
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
              child: Text(
                titles64[0],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, rtbbwallet65lst_heb, titles64[1]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles64[1],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => build64rtPop(
                    context,
                    rtgateswallet65lst_heb,
                    titles64[2],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles64[2],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, hdgates65lst_heb, titles64[3]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles64[3],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
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
              child: Text(
                titles64[4],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, new_hexRTNames65lst, titles64[5]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles64[5],
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, hdgates65lst, titles64[6]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles64[6],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, hdgatesdesc, titles64[7]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles64[7],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, hexNames65lst, titles64[8]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles64[8],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      build64rtPop(context, iChingEng65lst, titles64[9]),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                titles64[9],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
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
        child: const Text('X', style: TextStyle(color: Colors.black)),
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
                child: const Text(
                  'סיבוב קווים',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => SelectionArea(
                      child: build384rtPop(context, hdlines384lstHeb),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  'קווי עיצוב',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.black, thickness: 5),
              // Eng
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        build384rtPop(context, rtlines384lst),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  'Rotating Lines',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        build384rtPop(context, hdlines384lst),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  'HD Lines',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                //child: const Text('COMPLEX', style: TextStyle(color: Colors.black,fontSize: 35))),
              ),
              const SizedBox(height: 10),
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
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          backgroundColor: Colors.white,
                          foregroundImage: AssetImage('assets/planets/sun.png'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          minRadius: 15,
                          maxRadius: 15,
                          backgroundColor: Colors.white,
                          foregroundImage: AssetImage(
                            'assets/planets/earth.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
          child: const Text('X', style: TextStyle(color: Colors.black)),
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
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                rtlines390lstHeb[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '${(index / 6).floor()}.${((index - 5)) - (((index / 6).floor() - 1) * 6)}',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('X', style: TextStyle(color: Colors.black)),
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
    title: const Text(
      'Ido Not Now עידו לא כעט',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 15,
      ),
    ),
    content: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: IconButton(
                onPressed: () {
                  // We will define this Search Delegate next
                  showSearch(
                    context: context,
                    delegate: TextFileSearchDelegate(),
                  );
                },
                icon: Image.asset('assets/camog/dogatapp.gif'),
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
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
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
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('X', style: TextStyle(color: Colors.black)),
      ),
    ],
  );
}

Widget _buildWallet36Popup({
  required BuildContext context,
  required String title,
  required String filterKey,
  required String filterValue,
  required List<Map<String, dynamic>> dataList,
}) {
  // Logic to filter the master list based on your specific case-sensitive tag
  final filteredWallets = dataList.where((item) {
    return item[filterKey] == filterValue;
  }).toList();

  return AlertDialog(
    title: Text(title, textAlign: TextAlign.center),
    content: SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: filteredWallets.length,
        itemBuilder: (context, index) {
          final item = filteredWallets[index];

          // --- DYNAMIC CONTRAST LOGIC ---
          final Color bgColor = item['color'] ?? Colors.grey;
          // If background is Blue, use White text. Otherwise, use White.
          final Color textColor =
              (bgColor == Colors.blue) ? Colors.white : Colors.black;
          final Color subTextColor =
              (bgColor == Colors.blue) ? Colors.white : Colors.black;

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: bgColor,
              border: Border.all(width: 3, color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Inside itemBuilder of _buildWallet36Popup
                children: [
                  // --- THE NEW STANDARD HEADER ---
                  AutoSizeText(
                    "${item['id']} - ${item['channel']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // --- SECONDARY: The Hebrew Research (Single Source of Truth) ---
                  Text(
                    item['sentence_he'] ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500, // Medium weight for contrast
                      color: textColor,
                      fontSize: 15,
                    ),
                  ),

                  const Divider(
                    height: 20,
                    thickness: 1,
                    color: Colors.black26,
                  ),

                  // --- METADATA: BG5 Role & Rotation Note ---
                  Text(
                    "${item['bg']} | ${item['rotation_note']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight
                          .w600, // Solid weight to avoid "greyed out" look
                      color: textColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        },
        child: const Text(
          'X',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

Widget buildWalletPopUp(BuildContext context, int walletindex) {
  return AlertDialog(
    title: Center(
      //child: Text('Wallet: $wallet\n'
      child: Text(
        ' ארנק $walletindex\n'
        //'${LineSentenceList[wallet]}'),
        '${rtwallets65lst_heb[walletindex]}',
      ),
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
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                rtmix390lstHeb[walletindex * 7 + index + 1],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
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
        child: const Text('X', style: TextStyle(color: Colors.black)),
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
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('X', style: TextStyle(color: Colors.black)),
      ),
    ],
  );
}

Widget build4rtPop(
  BuildContext context,
  List<String> build4lst,
  String title4,
) {
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
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                //LineSentenceList[index],
                build4lst[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('X', style: TextStyle(color: Colors.black)),
      ),
    ],
  );
}

Widget buildGeneralListsPop(
  BuildContext context,
  List<String> build4lst,
  String title4,
) {
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
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                //LineSentenceList[index],
                build4lst[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('X', style: TextStyle(color: Colors.black)),
      ),
    ],
  );
}

Widget build64rtPop(
  BuildContext context,
  List<String> build64lst,
  String title64,
) {
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
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                //LineSentenceList[index],
                build64lst[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('X', style: TextStyle(color: Colors.black)),
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
          double linecount = 0, gateidx = 1;

          linecount = (index + 1) / 6;
          linecount = linecount.ceilToDouble();
          gateidx = (index + 1) - ((linecount - 1) * 6);

          return ListTile(
            title: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  //((index+1)/6).ceil().toString()
                  '${linecount.toInt()}.${gateidx.toInt()} (${index + 1})',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  //LineSentenceList[index],
                  build384lst[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
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
        child: const Text('X', style: TextStyle(color: Colors.black)),
      ),
    ],
  );
}

Widget build384rtPlanetPop(BuildContext context) {
  return AlertDialog(
    title: const Text('Detriment Lines Exalted'),
    content: SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView.builder(
        reverse: true,
        padding: const EdgeInsets.all(5.0),
        itemCount: 384,
        itemBuilder: (context, index) {
          // Pulling directly from your base384Mirror Map
          final String gateLabel = hdgateline[index];
          final String mainLine = ZBData.base384Mirror['Lines']?[index] ?? '';
          // Change these lines to use safe fallbacks:
          final String lessonText =
              ZBData.base384Mirror['Lesson']?[index] ?? "No Lesson";
          final String exaltedText =
              ZBData.base384Mirror['Exalted Text']?[index] ?? "";
          final String detrimentText =
              ZBData.base384Mirror['Detriment Text']?[index] ?? "";
          final String exaltImg = ZBData.base384Mirror['Exalt Planet']
                  ?[index] ??
              "assets/planets/sun.png";
          final String detrimImg = ZBData.base384Mirror['Detrim Planet']
                  ?[index] ??
              "assets/planets/earth.png";

          // Identification for our specific "Beauty" logic
          // bool is25 = gateLabel.contains("25.");
          // test
          bool is25 = gateLabel.contains("00000.");
          bool is51 = gateLabel.contains("00000.");
          // bool is51 = gateLabel.contains("51.");

          return SelectionArea(
            child: Column(
              children: [
                const SizedBox(height: 15),
                // The Gate/Line Header
                Text(
                  gateLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color:
                        is25 ? Colors.amber : (is51 ? Colors.redAccent : null),
                  ),
                ),
                // Main Line Text
                Text(
                  mainLine,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                // Lesson Text (New addition from your Map)
                Text(
                  lessonText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 10),

                // Exalted Block
                CircleAvatar(
                  minRadius: 13,
                  maxRadius: 13,
                  backgroundColor: Colors.transparent,
                  foregroundImage: AssetImage(exaltImg),
                ),
                SelectableText(exaltedText, textAlign: TextAlign.center),

                // The Pivot
                const Text(
                  '+\n-',
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 1.2, color: Colors.grey),
                ),

                // Detriment Block
                Text(detrimentText, textAlign: TextAlign.center),
                CircleAvatar(
                  minRadius: 13,
                  maxRadius: 13,
                  backgroundColor: Colors.transparent,
                  foregroundImage: AssetImage(detrimImg),
                ),

                const Divider(height: 40, thickness: 0.5),
              ],
            ),
          );
        },
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text(
          'X',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

Widget buildComplexPopUp(BuildContext context) {
  return AlertDialog(
    title: const Text('Complex', style: TextStyle(color: Colors.blue)),
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
              border: Border.all(width: 3, color: Colors.black),
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(4, 4),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                fontHexOrderList[hexagramfontindex],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontFamily: 'iChing',
                  fontWeight: FontWeight.bold,
                ),
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
        child: const Text('X', style: TextStyle(color: Colors.black)),
      ),
    ],
  );
}

Widget buildSimplePopUp(BuildContext context) {
  return AlertDialog(
    title: const Text('Simple', style: TextStyle(color: Colors.green)),
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
              border: Border.all(width: 3, color: Colors.black),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(4, 4),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                fontHexOrderList[hexagramfontindex],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontFamily: 'iChing',
                  fontWeight: FontWeight.bold,
                ),
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
        child: const Text('X', style: TextStyle(color: Colors.black)),
      ),
    ],
  );
}

Widget buildBreathPopUp(BuildContext context) {
  return AlertDialog(
    title: const Text('Breath', style: TextStyle(color: Colors.yellow)),
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
              border: Border.all(width: 3, color: Colors.black),
              color: Colors.yellow[200],
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(4, 4),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                fontHexOrderList[hexagramfontindex],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontFamily: 'iChing',
                  fontWeight: FontWeight.bold,
                ),
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
        child: const Text('X', style: TextStyle(color: Colors.black)),
      ),
    ],
  );
}

Widget buildSilencePopUp(BuildContext context) {
  return AlertDialog(
    title: const Text('Silence', style: TextStyle(color: Colors.red)),
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
              border: Border.all(width: 3, color: Colors.black),
              color: Colors.red[200],
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(4, 4),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                fontHexOrderList[hexagramfontindex],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontFamily: 'iChing',
                  fontWeight: FontWeight.bold,
                ),
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
        child: const Text('X', style: TextStyle(color: Colors.black)),
      ),
    ],
  );
}

class OvalContainer extends StatelessWidget {
  const OvalContainer({
    super.key,
    this.width = 35,
    this.height = 70,
    this.colorin = Colors.transparent,
    required this.colorout,
  });
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
        borderRadius: const BorderRadius.all(Radius.elliptical(90, 60)),
      ),
    );
  }
}

class EvolutionContainer extends StatelessWidget {
  const EvolutionContainer({
    super.key,
    this.width = 100,
    this.height = 100,
    this.colorinsilence = Colors.red,
    this.colorinbreath = Colors.yellow,
    this.colorinsimple = Colors.green,
    this.colorincomplex = Colors.green,
    this.coloroutsilence = Colors.red,
    this.coloroutbreath = Colors.yellow,
    this.coloroutsimple = Colors.green,
    this.coloroutcomplex = Colors.blue,
  });

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
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          SizedBox(
            height: height - 5,
            width: width - 5,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OvalContainer(
                  colorout: coloroutsilence,
                  colorin: colorinsilence,
                ),
                const SizedBox(width: 10),
                OvalContainer(
                  colorout: coloroutcomplex,
                  colorin: colorincomplex,
                ),
              ],
            ),
          ),
          RotationTransition(
            turns: const AlwaysStoppedAnimation(90 / 360),
            child: SizedBox(
              height: height - 5,
              width: width - 5,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OvalContainer(
                    colorout: coloroutsimple,
                    colorin: colorinsimple.withValues(alpha: 1.0),
                  ),
                  const SizedBox(width: 10),
                  OvalContainer(
                    colorout: coloroutbreath,
                    colorin: colorinbreath.withValues(alpha: 0.85),
                  ),
                ],
              ),
            ),
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
  final Color wheelColor; // Made final and non-nullable for safety

  WheelPainter({
    required this.spokeCount,
    this.wheelColor = Colors.black, // Default remains Black
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Use the final wheelColor directly—no ! needed anymore.
    final Paint rimPaint = Paint()
      ..color = wheelColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final Paint spokePaint = Paint()
      ..color = wheelColor
      ..strokeWidth = 2;

    // 1. Draw the Rim
    canvas.drawCircle(center, radius, rimPaint);

    // 2. Draw the Hub (Center point)
    // Re-using rimPaint but setting style to fill
    canvas.drawCircle(
      center,
      radius * 0.1,
      rimPaint..style = PaintingStyle.fill,
    );

    // 3. Draw the Spokes
    if (spokeCount > 0) {
      for (int i = 0; i < spokeCount; i++) {
        double angle = (2 * math.pi / spokeCount) * i;

        Offset outerPoint = Offset(
          center.dx + radius * math.cos(angle),
          center.dy + radius * math.sin(angle),
        );

        canvas.drawLine(center, outerPoint, spokePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant WheelPainter oldDelegate) {
    // CRITICAL: Repaint if the count or color changes
    return oldDelegate.spokeCount != spokeCount ||
        oldDelegate.wheelColor != wheelColor;
  }
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
    return SizedBox(
      height: size,
      width: size,
      child: ClipOval(
        child: CustomPaint(
          size: Size(size, size),
          painter: ZBFullWheelPainter(
            orderHexagramsWheel,
            rotationAngle: rotationAngle,
            centerDisplayNumber: centerDisplayNumber,
            baseColor: color,
          ),
        ),
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
    const double targetAngle = (segmentAngle / 2 - 0.08);

    // 1. Create the Tween
    final Animation<double> resetAnim = Tween<double>(
      begin: _currentAngle,
      end: targetAngle,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    // 2. ADD THE LISTENER (This makes the 'resetAnim' USED)
    resetAnim.addListener(() {
      setState(() {
        _currentAngle = resetAnim.value; // The wheel moves smoothly here
      });
    });

    _controller.duration = const Duration(seconds: 1);
    _controller.forward(from: 0).then((_) {
      setState(() {
        _currentAngle = targetAngle;
        _chosenWallet = reversedHexagramsWheel.last;
        _controller.duration = const Duration(seconds: 2);
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

    // print("--- REVERSED TEST SPIN ---");
    // print("Targeting Physical Slice: $listIndex");
    // print("Hexagram Value (Reversed): $hexagramValue");

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

    const List<Color> bottomPalette = [
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.yellow,
    ];
    const List<Color> standardPalette = [
      Colors.red,
      Colors.yellow,
      Colors.green,
      Colors.blue,
    ];
    const List<Color> reversedPalette = [
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.red,
    ];

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationAngle);
    canvas.translate(-center.dx, -center.dy);

    const double angleStep = -(2 * math.pi / 64);
    const double offsetTo12 = -(math.pi / 2);

    // 1. DRAW ALL RINGS FIRST
    for (int i = 0; i < 64; i++) {
      int next = (i + 1) % 64;
      final double startAngle = i * angleStep + offsetTo12;
      int bIdx = (i ~/ 16) % 4;
      int nextBIdx = (next ~/ 16) % 4;
      List<Color> currentP = (bIdx <= 1) ? reversedPalette : standardPalette;
      List<Color> nextP = (nextBIdx <= 1) ? reversedPalette : standardPalette;

      _drawGradientRing(
        canvas,
        center,
        radius * 0.35,
        0.0,
        startAngle,
        angleStep,
        bottomPalette[bIdx],
        bottomPalette[nextBIdx],
      );
      _drawGradientRing(
        canvas,
        center,
        radius * 0.65,
        radius * 0.35,
        startAngle,
        angleStep,
        currentP[(i ~/ 4) % 4],
        nextP[(next ~/ 4) % 4],
      );
      _drawGradientRing(
        canvas,
        center,
        radius * 0.95,
        radius * 0.65,
        startAngle,
        angleStep,
        currentP[i % 4],
        nextP[next % 4],
      );
    }

    // 2. DRAW THE DECORATION AND DASHBOARD (Under the numbers)
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
    _drawInnerDashboard(canvas, center, radius);

    // 3. DRAW THE NUMBERS LAST (Highest Layer)
    for (int i = 0; i < 64; i++) {
      if (i < orderHexagramsOnWheel.length) {
        final double startAngle = i * angleStep + offsetTo12;
        double correctedAngle = startAngle + (angleStep / 2) - angleStep;

        // NOW 0.88 or 0.90 will be perfectly visible and safe from clipping
        _drawNumber(
          canvas,
          center,
          radius * 0.95,
          correctedAngle,
          orderHexagramsOnWheel[i].toString(),
        );
      }
    }

    canvas.drawCircle(center, 5, Paint()..color = Colors.black);
    canvas.restore();

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
        ..strokeWidth = 2,
    );

    // 4. The Number
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    tp.paint(canvas, center - Offset(tp.width / 2, tp.height / 2));
  }

  void _drawGradientRing(
    Canvas canvas,
    Offset center,
    double outerRad,
    double innerRad,
    double startAngle,
    double sweep,
    Color c1,
    Color c2,
  ) {
    final rect = Rect.fromCircle(center: center, radius: outerRad);
    final paint = Paint()
      ..shader = SweepGradient(
        center: Alignment.center,
        colors: [c1, c2],
        transform: GradientRotation(startAngle),
      ).createShader(rect);
    Path path = Path()
      ..moveTo(
        center.dx + innerRad * math.cos(startAngle),
        center.dy + innerRad * math.sin(startAngle),
      )
      ..lineTo(
        center.dx + outerRad * math.cos(startAngle),
        center.dy + outerRad * math.sin(startAngle),
      )
      ..arcTo(rect, startAngle, sweep, false)
      ..lineTo(
        center.dx + innerRad * math.cos(startAngle + sweep),
        center.dy + innerRad * math.sin(startAngle + sweep),
      )
      ..arcTo(
        Rect.fromCircle(center: center, radius: innerRad),
        startAngle + sweep,
        -sweep,
        false,
      )
      ..close();
    canvas.drawPath(path, paint);
  }

  void _drawNumber(
    Canvas canvas,
    Offset center,
    double rad,
    double angle,
    String text,
  ) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    // 1. Calculate the Target (Singularity)
    double x = center.dx + rad * math.cos(angle);
    double y = center.dy + rad * math.sin(angle);
    Offset pos = Offset(x, y);

    canvas.save();
    canvas.translate(pos.dx, pos.dy);
    canvas.rotate(angle + (math.pi / 2));

    // 2. DRAW THE BUBBLE (The "Home" 444)
    // White Background (silence.)
    canvas.drawCircle(Offset.zero, 7, Paint()..color = Colors.white);
    // Black Border (Structure)
    canvas.drawCircle(
      Offset.zero,
      7.5,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.8,
    );

    // 3. PAINT THE TEXT (The Breath,)
    tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));

    canvas.restore();
  }

  // --- ZB INNER DASHBOARD LOGIC ---
  void _drawInnerDashboard(Canvas canvas, Offset center, double radius) {
    // 1. Map the specific ZBStates to the ZBFrequency objects
    // 5: COMPLEX (Blue), 4: Simple (Green), 2: silence (Red), 3: Breath (Yellow)
    final List<ZBFrequency> activeFrequencies = [
      ZBStory.getfrequency(5), // Top (12 to 9)
      ZBStory.getfrequency(4), // Left (9 to 6)
      ZBStory.getfrequency(2), // Bottom (6 to 3)
      ZBStory.getfrequency(3), // Right (3 to 12)
    ];

    const double sweep = -(2 * math.pi / 4);
    const double offset = -(math.pi / 2); // Start at 12 o'clock (Top)

    for (int i = 0; i < 4; i++) {
      double startAngle = i * sweep + offset;
      double midAngle = startAngle + (sweep / 2);

      ZBFrequency freq = activeFrequencies[i];

      // 2. The Archetype Letter (radius * 0.20)
      // Automatically extracts 'D' from 'DOG', 'O' from 'octopus', etc.
      // String letter =
      //     freq.zbanimal.isNotEmpty ? freq.zbanimal[0].toUpperCase() : '';
      String letter = zbwheeldna[i];

      _drawStackedLetter(
        canvas,
        center,
        radius * 0.20,
        midAngle,
        letter,
      );

      // 3. The Keynote Text (radius * 0.30)
      // Draws: "COMPLEX", "Simple", "silence", "Breath"
      _drawCurvedText(
        canvas,
        center,
        radius * 0.30,
        startAngle,
        sweep,
        freq.zbcoin, // The name from the Frequency registry
        freq.zbcolor, // The color from the Frequency registry
      );
    }
  }

  void _drawStackedLetter(
    Canvas canvas,
    Offset center,
    double rad,
    double angle,
    String text,
  ) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black, // Inhaling the Matrix Color
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    canvas.save();
    canvas.translate(
      center.dx + rad * math.cos(angle),
      center.dy + rad * math.sin(angle),
    );
    tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
    canvas.restore();
  }

  void _drawCurvedText(
    Canvas canvas,
    Offset center,
    double rad,
    double start,
    double sweep,
    String text,
    Color textColor,
  ) {
    final double charAngleStep = sweep / (text.length + 1);

    for (int i = 0; i < text.length; i++) {
      double angle = start + (text.length - i) * charAngleStep;

      final tp = TextPainter(
        text: TextSpan(
          text: text[i],
          style: TextStyle(
            color: Colors.black, // Font remains Black for contrast
            backgroundColor: textColor.withValues(
              alpha: 0.2,
            ), // The Matrix Color "Aura"
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      canvas.save();
      canvas.translate(
        center.dx + rad * math.cos(angle),
        center.dy + rad * math.sin(angle),
      );
      canvas.rotate(angle + (math.pi / 2));
      tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant ZBFullWheelPainter oldDelegate) {
    return oldDelegate.rotationAngle != rotationAngle ||
        oldDelegate.centerDisplayNumber != centerDisplayNumber ||
        oldDelegate.baseColor != baseColor;
  }
}

class ZBGeometryPainter {
  static void drawShape(
    Canvas canvas,
    Offset center,
    double size,
    int level,
    Color color,
  ) {
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
    Canvas canvas,
    Offset center,
    double size,
    int sides,
    Paint paint,
  ) {
    final path = Path();
    final double angle = (2 * math.pi) / sides;
    // Offset by -pi/2 to point the Triangle/Square upwards
    const double rotation = -math.pi / 2;

    path.moveTo(
      center.dx + size * math.cos(rotation),
      center.dy + size * math.sin(rotation),
    );
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
    Canvas canvas,
    Offset center,
    double size,
    int points,
    Paint paint,
  ) {
    final path = Path();
    final double angle = math.pi / points;
    for (int i = 0; i < 2 * points; i++) {
      double r = (i % 2 == 0) ? size : size * 0.45;
      double x = center.dx + r * math.cos(i * angle - math.pi / 2);
      double y = center.dy + r * math.sin(i * angle - math.pi / 2);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  static void _drawPuddle(
    Canvas canvas,
    Offset center,
    double size,
    Paint paint,
  ) {
    final path = Path();
    const int segments = 8;
    for (int i = 0; i < segments; i++) {
      double angle = i * (2 * math.pi / segments);
      // Fluid logic: varying the radius slightly per segment
      double r = size * (0.7 + 0.3 * math.sin(i * 1.5));
      double x = center.dx + r * math.cos(angle);
      double y = center.dy + r * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.quadraticBezierTo(center.dx, center.dy, x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }
}

Widget buildSelectionButton(
  BuildContext context,
  String label,
  Widget dialogContent,
) {
  return ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) => SelectionArea(child: dialogContent),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      textStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
    child: Text(label, style: const TextStyle(color: Colors.white)),
  );
}

// One function to rule them all (4, 36, 64, 384)
Widget buildBasePopUp(
  BuildContext context,
  String baseName,
  Map<String, List<String>> listsMap,
) {
  // Use a Builder to get a fresh local context for the Navigator
  return Builder(
    builder: (dialogContext) {
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        showDialog(
                          context: dialogContext, // Use dialogContext here
                          builder: (innerContext) => buildBaseDataList(
                            innerContext,
                            title,
                            listsMap[title]!,
                          ),
                        );
                      },
                      child: Text(
                        title,
                        style: const TextStyle(color: Colors.white),
                      ),
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
            ),
          ],
        ),
      );
    },
  );
}

Widget buildBaseDataList(
  BuildContext context,
  String title,
  List<String> data,
) {
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
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isBase4 ? getBase4TextColor(index) : Colors.black,
                    ),
                  ),
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
        ),
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
          color: textCol,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget zbTriadRow({
  required BuildContext context,
  required List<Map<String, dynamic>> dataList,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: dataList.map((item) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              color: item['color'] ?? Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Hebrew Label (e.g., מורכב משמות עצם)
                Text(
                  item['sentence_he'] ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11, // Smaller to fit long Hebrew strings
                  ),
                ),
                const SizedBox(height: 4),
                // English Label (e.g., COMPLEX)
                Text(
                  item['zbcoin'] ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList(),
  );
}

// Use Wrap to handle all 36 transactions without crushing them
Widget zbBuild36Grid(BuildContext context) {
  return Wrap(
    spacing: 8.0,
    runSpacing: 8.0,
    alignment: WrapAlignment.center,
    children: transaction36.map((item) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.28, // 3 columns
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: item['color'],
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Column(
            children: [
              Text(
                item['sentence_he'] ?? '',
                style: const TextStyle(fontSize: 10, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                item['zbcoin'] ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList(),
  );
}

// Compact button for the grid
Widget zbMiniBtn(
  BuildContext context,
  String label,
  Color bg,
  Color textCol,
  Widget dest,
) {
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
            color: textCol,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

Widget zbbuild36PopUp(BuildContext context) {
  return AlertDialog(
    title: const Text('36 Transactions', textAlign: TextAlign.center),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Update// COMPLEX - BLUE
          zbChannelBtn(
            context: context,
            label: 'COMPLEX BLUE',
            bg: Colors.blue,
            textCol: Colors.white, // 👈 Added missing parameter
            destination: _buildStateTransactionList(
                context, 'COMPLEX BLUE', 5, Colors.blue),
          ),

// BREATH - YELLOW
          zbChannelBtn(
            context: context,
            label: 'Breath Yellow',
            bg: Colors.yellow,
            textCol: Colors.black, // 👈 Added missing parameter
            destination: _buildStateTransactionList(
                context, 'Breath Yellow', 3, Colors.yellow),
          ),

// SILENCE - RED
          zbChannelBtn(
            context: context,
            label: 'Silence Red',
            bg: Colors.red,
            textCol: Colors.white, // 👈 Added missing parameter
            destination: _buildStateTransactionList(
                context, 'Silence Red', 2, Colors.red),
          ),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text(
          'X',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    ],
  );
}

Widget _buildStateTransactionList(
  BuildContext context,
  String title,
  int targetState,
  Color themeColor,
) {
  // Filter the 36 transactions by the state (Blue/Yellow/Red)
  final filteredList =
      ZBData.getzbtransactions.where((t) => t.zbstate == targetState).toList();

  return AlertDialog(
    title: Container(
      width: double.infinity,
      color: themeColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold)),
    ),
    content: SizedBox(
      width: double.maxFinite,
      height: 500,
      child: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final tx = filteredList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔵 The Count Circle
                  CircleAvatar(
                    backgroundColor: themeColor.withValues(alpha: 0.2),
                    child: Text(
                      '${tx.count}',
                      style: const TextStyle(
                          // color: themeColor,
                          color: Colors.transparent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // 📝 The Data Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. The ID (Unique Key)
                        Text(
                          tx.id,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            // color: Colors.blueGrey,
                            color: themeColor,
                            letterSpacing: 1.1,
                          ),
                        ),
                        const SizedBox(height: 4),

                        // 2. hebname
                        Text(
                          tx.hebname ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        // 3. zbhebname
                        Text(
                          tx.zbhebname ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        // 4. English Name
                        Text(
                          tx.name ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        // 5. Description
                        Text(
                          tx.description ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors
                                .black, // Slightly dimmed to differentiate
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          zbPop(context);
        },
        child: const Icon(Icons.close, color: Colors.black),
      ),
    ],
  );
}

// Update the signature to include a color
// Widget _buildTriadDialogContent(
//   BuildContext context,
//   String title,
//   List<String> searchLabels, // e.g., ['Complex', 'מורכב', 'Manifest', 'הגשמה']
//   Color textColor,
//   Color bgColor,
// ) {
//   // 1. Find the actual Source objects from your Registry
//   List<ZBDictionarySourceLists> matchedSources = [];

//   for (String label in searchLabels) {
//     try {
//       // Find the list where the label matches or contains your search string
//       final source = ZBData.allSources.firstWhere(
//           (s) => s.label.toLowerCase().contains(label.toLowerCase()));
//       matchedSources.add(source);
//     } catch (e) {
//       debugPrint("Could not find source for label: $label");
//     }
//   }

//   return AlertDialog(
//     backgroundColor: const Color(0xFFF0EBF4),
//     title: Container(
//       padding: const EdgeInsets.all(8),
//       color: bgColor,
//       child: Text(
//         title,
//         textAlign: TextAlign.center,
//         style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
//       ),
//     ),
//     content: SizedBox(
//       width: double.maxFinite,
//       height: 500,
//       child: ListView.builder(
//         // 🚀 Use the length of the first matched source (e.g., 12)
//         itemCount: matchedSources.isNotEmpty ? matchedSources.first.base : 0,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               title: Text(
//                 matchedSources.map((s) => s.getItem(index)).join(" | "),
//               ),
//               leading: CircleAvatar(
//                 child: Text('${index + 1}'),
//               ),
//             ),
//           );
//         },
//       ),
//     ),
//     actions: [
//       TextButton(
//           onPressed: () => Navigator.pop(context), child: const Text('X')),
//     ],
//   );
// }

Widget zbbuild384PopUp(BuildContext context) {
  return Builder(
    builder: (dialogContext) {
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
                  ...ZBData.base384.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: zbChannelBtn(
                        context: dialogContext,
                        label: entry.key,
                        bg: Colors.black,
                        textCol: Colors.white,
                        fontSize: 18,
                        destination: build384rtPop(dialogContext, entry.value),
                      ),
                    ),
                  ),

                  const Divider(color: Colors.black, thickness: 3, height: 30),

                  // 2. THE COMPLEX GENIUS: Using the Sun/Earth Stack Helper
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: dialogContext,
                        builder: (innerCtx) =>
                            SelectionArea(child: build384rtPlanetPop(innerCtx)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
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
              child: const Text(
                'X',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      );
    },
  );
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
            foregroundImage: AssetImage('assets/planets/sun.png'),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            foregroundImage: AssetImage('assets/planets/earth.png'),
          ),
        ),
      ],
    ),
  );
}

Widget zbbuildBasePopUp(
  BuildContext context,
  String title,
  Map<String, List<String>> dataMap,
) {
  return Builder(
    builder: (dialogContext) {
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
                  ...dataMap.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: zbChannelBtn(
                        context: dialogContext,
                        label: entry.key,
                        bg: Colors.black,
                        textCol: Colors.white,
                        fontSize: 18,
                        // Generic list displayer for all bases
                        destination: buildBaseDataList(
                          dialogContext,
                          entry.key,
                          entry.value,
                        ),
                      ),
                    ),
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
              child: const Text(
                'X',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      );
    },
  );
}

// Inside rotatehelpers.dart
Widget buildResetDropdown({
  required int currentValue,
  required ValueChanged<int?> onChanged,
  required List<int> items, // Added missing items parameter
}) {
  return DropdownButtonHideUnderline(
    // Removes the line for 'Grace'
    child: DropdownButton<int>(
      value: currentValue,
      // L4: Simple; - The Icon becomes the only visible 'Degree'
      icon: const Icon(Icons.timer, color: Colors.grey, size: 24),
      // This hides the '30 sec' text when the menu is closed
      selectedItemBuilder: (BuildContext context) {
        return items.map((int value) {
          return const SizedBox.shrink(); // silence. (No text shown)
        }).toList();
      },
      onChanged: onChanged,
      items: items.map((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(
            textAlign: TextAlign.center,
            value == 0 ? "ביטול איטחתול" : "ששש... $value",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ), // Visible in menu
          ),
        );
      }).toList(),
    ),
  );
}

class SearchResultTile extends StatelessWidget {
  final ZBSearchResult result;

  const SearchResultTile({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // 💡 This flips the UI for Hebrew files
      textDirection: result.isHebrew ? TextDirection.rtl : TextDirection.ltr,
      child: ListTile(
        title: Text(
          result.fileTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 1, // 💡 Forces it to stay on one line
          overflow: TextOverflow.ellipsis, // 💡 Adds "..." if it's too long
          softWrap: false, // 💡 Prevents it from trying to wrap
        ),
        subtitle: Text(
          result.snippet.replaceAll(
            '\n',
            ' ',
          ), // Ensure no line breaks in snippet
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          final String displayTitle = result.fileTitle;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FileViewScreen(
                assetPath:
                    'assets/txt/${result.isHebrew ? 'heb' : 'eng'}/${result.fileName}',
                realTitle: displayTitle,
              ),
            ),
          );
        },
      ),
    );
  }
}

class FileViewScreen extends StatelessWidget {
  final String assetPath;
  final String realTitle;

  const FileViewScreen(
      {super.key, required this.assetPath, required this.realTitle});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: rootBundle.loadString(assetPath),
      builder: (context, snapshot) {
        // We store the content here to use in the copy function
        final String content = snapshot.data ?? "";

        return Scaffold(
          appBar: AppBar(
            title: Text(realTitle),
            centerTitle: true,
            actions: [
              // 💡 Only show the button once the data has loaded
              if (snapshot.hasData)
                IconButton(
                  icon: const Icon(Icons.copy_all), // The icon from your image
                  tooltip: 'העתכל / copiole',
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: content));

                    // 🎯 Always guard the context after an 'await'
                    if (!context.mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('הוא אתה כל / you it all')),
                    );
                  },
                ),
            ],
          ),
          body: snapshot.hasData
              ? SelectionArea(
                  // 💡 Best of both worlds for Web/Linux/Android
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        content,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(fontSize: 18, height: 1.5),
                      ),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class WalletSearchDelegate extends SearchDelegate {
  // Mapping the bases to your existing data lists
  final Map<String, List<String>> allWallets = {
    // '4': base4Data,   // Your existing Base 4 list
    // '36': base36Data, // Your new 600-line consolidated map
    // '64': base64Data, // Your existing Base 64 list
    // '384': base384Data, // Your existing Base 384 list
  };

  @override
  String get searchFieldLabel => 'חפש ארנק... / Search Wallet...';

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => _buildWalletList();

  @override
  Widget buildSuggestions(BuildContext context) => _buildWalletList();

  Widget _buildWalletList() {
    List<WalletSearchResult> matches = [];

    // Search through all bases simultaneously
    allWallets.forEach((baseKey, items) {
      for (var item in items) {
        if (query.isEmpty || item.toLowerCase().contains(query.toLowerCase())) {
          matches.add(WalletSearchResult(base: baseKey, value: item));
        }
      }
    });

    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        final result = matches[index];
        return ListTile(
          // Display the Base (4, 36, etc) as a leading 'coin'
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text(
              result.base,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          title: Text(
            result.value,
            style: const TextStyle(fontFamily: 'Courier'),
          ),
          onTap: () {
            // Logic for selecting this specific wallet rotation point
            close(context, result);
          },
        );
      },
    );
  }
}

Widget buildCamelCenter() {
  final camelFreq = ZBStory.getfrequency(6);
  final camelCoin = ZBStory.getfrequency(6);

  return OverflowBox(
    maxWidth: 160, // Total space allowed for the "Popping Out" Camel
    maxHeight: 160,
    child: Stack(
      alignment: Alignment.center,
      children: [
        // 1. The Small Border Circle
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black26, // Slight dark tint looks better
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.2),
                blurRadius: 20,
              ),
            ],
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: SizedBox(
            height: 80, // Now this will actually work!
            width: 80,
            child: Image.asset(
              'assets/coins/${camelCoin.zbcoinimg}',
              fit: BoxFit.contain,
            ),
          ),
        ),
        // 2. The Large Camel (Sits on top of the circle and overlaps it)
        SizedBox(
          height: 100, // Now this will actually work!
          width: 100,
          child: Image.asset(
            'assets/camog/${camelFreq.zbanimalimg}',
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
  );
}

Widget buildOrbitLayer({
  required BuildContext context,
  required double size,
  required String imageKey,
  required String folder,
  double opacity = 1.0,
  bool isInteractive = false,
}) {
  return CircleList(
    innerRadius: 15,
    initialAngle: 0.05,
    origin: const Offset(0, 0),
    // Only the middle/bottom layers need the Camel;
    // Top layer center can be empty to let clicks pass through.
    centerWidget: isInteractive
        ? const SizedBox(width: 80, height: 80)
        : buildCamelCenter(),
    children: List.generate(5, (index) {
      final int mapIndex = index + 1;
      final freq = ZBStory.getfrequency(mapIndex);
      Widget content = Opacity(
        opacity: opacity,
        child: Image.asset(
          'assets/$folder/${freq.imageFor(imageKey)}',
          height: size,
          width: size,
          fit: BoxFit.contain,
        ),
      );

      // Only add InkWell to the sharpest, top-most layer
      if (isInteractive) {
        return InkWell(
          onTap: () => Navigator.pushNamed(context, mainroutes[index]),
          child: content,
        );
      }

      return content;
    }),
  );
}

// new gemini wheel

Color getWheelColor(int index, {required bool isInnerRing}) {
  // Logic based on the 4 Quarters of the Wheel
  // Quarter 1: Initiation (Alcyone)
  // Quarter 2: Civilization (Sirius)
  // Quarter 3: Duality (Jupiter)
  // Quarter 4: Mutation (Antares)

  int quarter = index ~/ 16;

  switch (quarter) {
    case 0:
      return isInnerRing ? Colors.red.shade800 : Colors.red.shade400;
    case 1:
      return isInnerRing ? Colors.grey.shade800 : Colors.grey.shade400;
    case 2:
      return isInnerRing ? Colors.blue.shade800 : Colors.blue.shade400;
    case 3:
      return isInnerRing ? Colors.amber.shade800 : Colors.amber.shade400;
    default:
      return Colors.black;
  }
}

class Screen {
  static double width = 0;
  static double height = 0;

  // A single function to "refresh" the values
  static void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}

class ZBMandalaWidget extends StatefulWidget {
  final List<int> walletsState;
  // Update this line to accept TWO integers (int, int)
  final Function(int, int) onTapWallet;

  const ZBMandalaWidget({
    super.key,
    required this.walletsState,
    required this.onTapWallet,
  });

  @override
  State<ZBMandalaWidget> createState() => _ZBMandalaWidgetState();
}

class _ZBMandalaWidgetState extends State<ZBMandalaWidget> {
  @override
  void didUpdateWidget(covariant ZBMandalaWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 💡 If the list reference changed, we force this specific widget to repaint
    if (oldWidget.walletsState != widget.walletsState) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("--- CHECK ZB MANDALA IS NOT REPAINTED OVER AND OVER ---");

    final double side = MediaQuery.of(context).size.shortestSide;
    const double wheelRotation = 3.85;

    // 1. ANCHORS (The "Source of Truth")
    // baseRadius starts at 12% of screen
    final double baseRadius = side * 0.12;

    // We define the actual sizes of the elements here
    final double iconSize =
        side * 0.16; // Adjusted to match your previous 65px look
    final double coinSize = side * 0.055; // Replaces the old '22'
    final double walletSize = side * 0.045; // Replaces the old '20'

    // 2. THE RADII (Distances from the center)
    // We use percentages so the gaps grow and shrink with the screen
    final double rZodiac = baseRadius + (side * 0.08);
    final double rCoin1 = rZodiac + (side * 0.13); // Replaces (+ 0.15 - 11)
    final double rCoin2 = rCoin1 + (side * 0.04) + 5; // Replaces (+ 20)
    final double rWallets = rCoin2 + (side * 0.08) - 5; // Replaces (+ 20)

    return Center(
      child: SizedBox(
        width: side,
        height: side,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 0. THE GRADIENT WHEEL (Zodiac Painter)
            CustomPaint(
              size: Size(side, side),
              painter: ZodiacWheelPainter(
                revzodiacNewGradeColorlist.cast<Color>(),
                0.0, // Set to 0.0 to fill that center white hole!
                rZodiac * 2.2,
                wheelRotation,
              ),
            ),

            // 1. ZODIAC ICONS (12 items)
            ...List.generate(12, (i) {
              double angle = wheelRotation + (i * (2 * math.pi / 12));
              return _positioned(rZodiac, angle, _buildZodiacIcon(i, iconSize));
            }),

            // 2. THE 64-ITEM RINGS (FLATTENED)
            // We use the spread operator (...) with a collection for-loop
            // This ensures every widget is a DIRECT child of the main Stack.
            for (int i = 0; i < 64; i++) ...[
              // Calculate the shared angle for the 'spoke'
              () {
                double angle = -0.82 + (i * (2 * math.pi / 64));
                return _positioned(
                  rCoin1,
                  angle,
                  _buildCoin(
                    getWalletLayerColor(i, 'bot', isReversed: true),
                    coinSize,
                  ),
                );
              }(),
              () {
                double angle = -0.8 + (i * (2 * math.pi / 64));
                return _positioned(
                  rCoin2,
                  angle,
                  _buildCoin(
                    getWalletLayerColor(i, 'mid', isReversed: true),
                    coinSize,
                  ),
                );
              }(),
              () {
                double angle = -0.8 + (i * (2 * math.pi / 64));
                // Apply the CCW shift (-0.02) and the vertical nudge (-3.0)
                return _positioned(
                  rWallets,
                  angle - 0.01,
                  _buildInteractiveWallet(i, walletSize),
                  // const Offset(0, -3.0), // The "Push Up" fix for the red section
                );
              }(),
            ],
          ],
        ),
      ),
    );
  }

  // THE POSITIONING ENGINE
  Widget _positioned(double radius, double angle, Widget child) {
    return Transform.translate(
      offset: Offset(radius * math.cos(angle), radius * math.sin(angle)),
      child: child,
    );
  }

  // Update this line to accept 'double size'
  Widget _buildZodiacIcon(int index, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          // Using your list of asset paths
          image: AssetImage(revZodiacList[index]),
          fit: BoxFit.contain,
        ),
        // Optional: helpful for debugging placement
        // border: Border.all(color: Colors.red),
      ),
    );
  }

  Widget _buildInteractiveWallet(int index, double size) {
    final int gate = reversedHexagramsWheel[index];

    // 🛡️ Safety: Fallback to 0 if the list doesn't have the gate index
    final int state =
        (gate < widget.walletsState.length) ? widget.walletsState[gate] : 0;

    // 💡 THE UNIFIED SYNC: Matches your Chart's active logic
    // Lights up for Red (2), Blue (5), and Evolution (9)
    // Stays "Dark" (Ghosted) for Transparent (0) and Simple Baseline (4)
    final bool isActive = state != 0 && state != 4;

    final Color gateFillColor = getWalletLayerColor(
      index,
      'top',
      isReversed: true,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onTapWallet(gate, state),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // 🎨 FILL: Zodiac color if active, else faint ghosted grey
            color:
                isActive ? gateFillColor : Colors.grey.withValues(alpha: 0.1),
            border: Border.all(
              // 🎨 BORDER: Solid black for planets, very light for background
              color: isActive ? Colors.black87 : Colors.black12,
              width: isActive ? 2.5 : 0.5,
            ),
          ),
          child: Center(
            child: SelectionContainer.disabled(
              child: Text(
                '$gate',
                style: TextStyle(
                  fontSize: size * 0.42,
                  // Boldness derived directly from state
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  color: (isActive &&
                          (gateFillColor == Colors.blue ||
                              gateFillColor == Colors.red))
                      ? Colors.white
                      : (isActive ? Colors.black87 : Colors.black38),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ZodiacWheelPainter extends CustomPainter {
  final List<Color> colors;
  final double innerRadius;
  final double outerRadius;
  final double startAngle; // <--- The key to alignment

  ZodiacWheelPainter(
    this.colors,
    this.innerRadius,
    this.outerRadius,
    this.startAngle,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final double sweepAngle = (2 * math.pi) / colors.length;

    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..color = colors[i].withValues(alpha: 0.8)
        ..style = PaintingStyle.fill;

      double currentStartAngle = startAngle + (i * sweepAngle);

      Path path = Path();

      // 1. Move to the inner starting point
      path.moveTo(
        center.dx + innerRadius * math.cos(currentStartAngle),
        center.dy + innerRadius * math.sin(currentStartAngle),
      );

      // 2. Draw line to the outer starting point
      path.lineTo(
        center.dx + outerRadius * math.cos(currentStartAngle),
        center.dy + outerRadius * math.sin(currentStartAngle),
      );

      // 3. Draw the outer arc
      path.arcTo(
        Rect.fromCircle(center: center, radius: outerRadius),
        currentStartAngle,
        sweepAngle,
        false,
      );

      // 4. Draw line back to the inner ending point
      path.lineTo(
        center.dx + innerRadius * math.cos(currentStartAngle + sweepAngle),
        center.dy + innerRadius * math.sin(currentStartAngle + sweepAngle),
      );

      // 5. Draw the inner arc (backwards) to close the shape
      path.arcTo(
        Rect.fromCircle(center: center, radius: innerRadius),
        currentStartAngle + sweepAngle,
        -sweepAngle,
        false,
      );

      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

Widget _buildCoin(Color color, double size) {
  return Container(
    width: size - 10,
    height: size - 10,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      // Optional: Add a subtle border to make them pop on the Linux screen
      border: Border.all(width: 1.0, color: Colors.black26),
    ),
  );
}

void zbPop(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
}

class ZBDynamicImage extends StatelessWidget {
  final int id;
  final Map<int, dynamic> map;
  final double size;
  final String fallbackAsset; // Default image if something goes wrong

  const ZBDynamicImage({
    super.key,
    required this.id,
    required this.map,
    this.size = 150,
    this.fallbackAsset = 'assets/camog/mcameline.png', // Set your default here
  });

  @override
  Widget build(BuildContext context) {
    // 1. Pull the object from the map
    final item = map[id];

    // 2. Use ?? to provide a fallback if item or imagePath is null
    final String imageToShow = item?.imagePath ?? fallbackAsset;

    return Image.asset(
      imageToShow,
      width: size,
      height: size,
      fit: BoxFit.contain,
      // Optional: Handle errors if the asset string itself is broken
      errorBuilder: (context, error, stackTrace) =>
          Icon(Icons.error, size: size),
    );
  }
}

class ZBSmartImage extends StatelessWidget {
  final int id;
  final Map<int, dynamic> dataMap;
  final double size;

  const ZBSmartImage({
    super.key,
    required this.id,
    required this.dataMap,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    final item = dataMap[id];
    final String? path = item?.zbimagePath;

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        // The 'key' tells AnimatedSwitcher the image changed so it should fade
        child: path != null
            ? Image.asset(
                path,
                key: ValueKey(path), // CRITICAL: Forces the fade on path change
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, color: Colors.grey),
              )
            : const Icon(Icons.help_outline,
                key: ValueKey('empty'), color: Colors.grey),
      ),
    );
  }
}

//

class ZBCube extends StatelessWidget {
  const ZBCube({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, -75.0, 0.0)
            ..rotateX(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.transparent,
            height: 135,
            width: 135,
            child: CircleAvatar(
              //radius: 75,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins6lst1[0]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, 75.0),
          //..rotateY(-pi / 2),
          //alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins6lst1[1]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(75.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins6lst1[3]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(-75.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins6lst1[2]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, 75.0, 0.0)
            ..rotateX(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.black,
              foregroundImage: AssetImage(coins6lst1[5]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, -75.0),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins6lst1[4]),
            ),
          ),
        ),
      ],
    );
  }
}

class ZBCubeTwo extends StatelessWidget {
  const ZBCubeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, -75.0, 0.0)
            ..rotateX(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            height: 135,
            width: 135,
            child: const CircleAvatar(
              //radius: 75,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage('assets/camog/dogswoofgoof.gif'),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, 75.0),
          //..rotateY(-pi / 2),
          //alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              //backgroundColor: Colors.black,
              foregroundImage: AssetImage(coins4lst[3]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(75.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              //backgroundColor: Colors.black,
              foregroundImage: AssetImage(coins4lst[1]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(-75.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              //backgroundColor: Colors.black,
              foregroundImage: AssetImage(coins4lst[2]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, 75.0, 0.0)
            ..rotateX(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: const CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.black,
              foregroundImage: AssetImage('assets/camog/snoopyq.gif'),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, -75.0),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins4lst[0]),
            ),
          ),
        ),
      ],
    );
  }
}

String getZBState(String binary) {
  // We split the 6 bits into three 2-bit pairs
  // Assuming the rightmost bits are the Bottom Ring
  String ring1 = binary.substring(4, 6); // Bottom
  String ring2 = binary.substring(2, 4); // Middle
  String ring3 = binary.substring(0, 2); // Top

  String translate(String bits) {
    if (bits == '11') return "COMPLEX";
    if (bits == '10') return "Simple;";
    if (bits == '01') return "Breath,";
    return "silence."; // '00'
  }

  return "${translate(ring3)} ${translate(ring2)} ${translate(ring1)}";
}

Color getBase4Color(int index) {
  switch (index) {
    case 0:
      return Colors.blue; // 1. "COMPLEX"
    case 1:
      return Colors.green; // 2. Simple;
    case 2:
      return Colors.yellow; // 3. Breath,
    case 3:
      return Colors.red; // 4. silence.
    default:
      return Colors.black;
  }
}

Color getBase4TextColor(int index) {
  // Yellow and Green often need darker text for "Aliveness" (58)
  if (index == 1 || index == 2) return Colors.black54;
  return Colors.white;
}
