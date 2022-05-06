import 'package:finallyicanlearn/models/lists.dart';
import 'package:flutter/material.dart';

class RotateSimpleBreath extends StatefulWidget {
  const RotateSimpleBreath({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSimpleBreathState();
  }
}

class _RotateSimpleBreathState extends State<RotateSimpleBreath> {
  final TextEditingController _controllerSimpleText = TextEditingController(),
      _controllerComplexText = TextEditingController();
  final String _title = subtitlesEN[6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.grey[100],
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: TextField(
                  readOnly: false,
                  decoration:
                      const InputDecoration.collapsed(hintText: ''),
                  textAlign: TextAlign.center,
                  controller: _controllerComplexText,
                  style: const TextStyle(
                      fontSize: 50,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.normal)),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: TextField(
                  readOnly: false,
                  decoration:
                      const InputDecoration.collapsed(hintText: ''),
                  textAlign: TextAlign.center,
                  controller: _controllerSimpleText,
                  style: const TextStyle(
                      fontFamily: 'iChing',
                      fontSize: 40,
                      color: Colors.green,
                      fontWeight: FontWeight.normal)),
            ),
          ],
        ),
    );
  }
}
