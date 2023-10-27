import 'package:auto_size_text/auto_size_text.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:flutter/material.dart';

class RotateSilence extends StatefulWidget {
  const RotateSilence({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSilenceState();
  }
}

class _RotateSilenceState extends State<RotateSilence> {
  final String _title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          title: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 15,
                foregroundImage: AssetImage(titlesicon[1]),
              ),
              AutoSizeText(_title,style: TextStyle(color: Colors.white)),
            ],
          ),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(
                Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black),
      backgroundColor: Colors.redAccent,
      body: const SizedBox ()
    );
  }
}
