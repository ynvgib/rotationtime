import 'package:flutter/material.dart';
import 'package:finallyicanlearn/models/lists.dart';

import '../models/hexlineslist.dart';

// /rotatehexwithlogic
// rotate one hexagram
class RotateIDKlines extends StatefulWidget {
  const RotateIDKlines({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateIDKlinesState();
  }
}

class _RotateIDKlinesState extends State<RotateIDKlines> {
  final String _title = subtitlesEN[3];

  final List<String> finalhexNamesList = hexNamesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: TextStyle(
            color: Colors.white ,fontSize: 20, fontWeight: FontWeight.normal),),
        leading: TextButton(
          child: const Text(
            'X',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.green,
        actions: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildEmptyChartPopUp(context),
                );
              },
              child: const Text('XIO'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold))),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView.builder(
        reverse: true,
        padding: const EdgeInsets.all(5.0),
        itemCount: idonotknowOnlylinesList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            idonotknowOnlylinesList[index],
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          leading: Text(
            (index / 6).floor().toString() +
                '.' +
                (((index - 5)) - (((index / 6).floor() - 1) * 6)).toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          trailing: Text(
            (index - 5).toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      )),
    );
  }

  Widget _buildEmptyChartPopUp(BuildContext context) {
    return AlertDialog(
      title: const Text('Human Design'),
      content: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Image.asset('assets/emptybodygraph.png'),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Image.asset('assets/emptymandala.png'),
            ),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Close',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
