import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class RotatePDF extends StatefulWidget {
  const RotatePDF({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RotatePDF();
  }
}

class _RotatePDF extends State<RotatePDF> {
  final TextEditingController _controllerSimpleText = TextEditingController(),
      _controllerComplexText = TextEditingController();
  //final String _title = subtitles[2];
  //final String _title = subtitles_heb[2];
  final String _title = 'מילים';

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
          'assets/pdf/lyrics.pdf',
          enableTextSelection: true,
        ));
  }
}
