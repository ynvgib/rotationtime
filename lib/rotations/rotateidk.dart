import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:flutter/material.dart';

class RotateIDK extends StatefulWidget {
  const RotateIDK({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateIDKState();
  }
}

class _RotateIDKState extends State<RotateIDK> {
  final TextEditingController _controllerSimpleText = TextEditingController(),
      _controllerComplexText = TextEditingController();
  final String _title = subtitlesEN[6];

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
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.grey),
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: TextField(
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: '?'),
                textAlign: TextAlign.center,
                controller: _controllerComplexText,
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: TextField(
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: '!'),
                textAlign: TextAlign.center,
                controller: _controllerSimpleText,
                style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: TextField(
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: '.'),
                textAlign: TextAlign.center,
                controller: _controllerSimpleText,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontFamily: 'iChing',
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
