import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class RotateIsog extends StatefulWidget {
  const RotateIsog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateIsog();
  }
}

class _RotateIsog extends State<RotateIsog> {
  final TextEditingController _controllerSimpleText = TextEditingController(),
      _controllerComplexText = TextEditingController();
  //final String _title = subtitles[2];
  //final String _title = subtitles_heb[2];
  final String _title = 'isog';

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  List<int>? _documentBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          title: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(_title,
                  textAlign: TextAlign.left,
                  //maxFontSize: 15,
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
          leading: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black87),
      backgroundColor: Colors.white,
      body: SfPdfViewer.asset(
        'assets/pdf/isofgeng.pdf',
        enableTextSelection: true,
      )
    );
  }
}
