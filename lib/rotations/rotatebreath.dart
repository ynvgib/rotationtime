import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
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
        toolbarHeight: 40,
        title: AutoSizeText(_title, textAlign: TextAlign.left, maxFontSize: 15),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(
                Icons.close),
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
            child: AutoSizeTextField(
                minFontSize: 10,
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: 'inhale & exhale'),
                textAlign: TextAlign.center,
                controller: _controllerComplexText,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.yellow,
                    fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: AutoSizeTextField(
                minFontSize: 10,
                maxLines: 1,
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: 'P'),
                textAlign: TextAlign.center,
                controller: _controllerSimpleText,
                style: const TextStyle(
                    fontFamily: 'iChing',
                    fontSize: 30,
                    color: Colors.yellow,
                    fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }
}
