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
          title: Text(_title),
          leading: TextButton(
            child: const Text(
              'X',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: ListView.builder(
            itemCount: reversedidklinesList.length,
            itemBuilder: (context, index) => Card(
              elevation: 6,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(reversedidklinesList[index].toString(),
                textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ),
            ),
          )),
    );
  }
}
