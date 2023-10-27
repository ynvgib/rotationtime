import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
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
  final String _title = subtitles[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          toolbarHeight: 40,
          title: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(_title, textAlign: TextAlign.left,
                //maxFontSize: 15,
              style: TextStyle(color: Colors.white),),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 15,
                foregroundImage: AssetImage(titlesicon[0]),
              ),
            ],
          ),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(
                Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.grey),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          AutoSizeTextField(
              maxFontSize: 30,
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: '?'),
                textAlign: TextAlign.center,
                controller: _controllerComplexText,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
          const SizedBox(
            height: 30.0,
          ),
          AutoSizeTextField(
              maxFontSize: 30,
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: '!'),
                textAlign: TextAlign.center,
                controller: _controllerSimpleText,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
          const SizedBox(
            height: 30.0,
          ),
          AutoSizeTextField(
              maxFontSize: 30,
                readOnly: false,
                decoration: const InputDecoration.collapsed(hintText: '.'),
                textAlign: TextAlign.center,
                controller: _controllerSimpleText,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontFamily: 'iChing',
                    fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30.0,
          ),
          const Divider(thickness: 5, color: Colors.black),
          const AutoSizeText('I don\'t know',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          const Divider(thickness: 5, color: Colors.black),
          const AutoSizeText('Meditation',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          const Divider(thickness: 5, color: Colors.black),
          const Text(
            '#',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'iChing',
            ),
          ),

        ],
      ),
    );
  }
}
