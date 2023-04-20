import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RotateSilence extends StatefulWidget {
  const RotateSilence({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSilenceState();
  }
}

class _RotateSilenceState extends State<RotateSilence> {
  String _title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          title: AutoSizeText(_title),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(
                Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black),
      backgroundColor: Colors.redAccent,
      body: const SizedBox ()
    );
  }
}
