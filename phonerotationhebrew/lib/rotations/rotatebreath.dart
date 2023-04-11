import 'package:finallyicanlearn/models/lists.dart';
import 'package:flutter/material.dart';

class RotateBreath extends StatefulWidget {
  const RotateBreath({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateBreathState();
  }
}

class _RotateBreathState extends State<RotateBreath> {
  final TextEditingController _controllerSimpleText = TextEditingController(),
      _controllerComplexText = TextEditingController();
  final String _title = subtitlesEN[7];

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
          backgroundColor: Colors.black87),
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: TextField(
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: ''),
                textAlign: TextAlign.center,
                controller: _controllerComplexText,
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.yellow,
                    fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }
}
