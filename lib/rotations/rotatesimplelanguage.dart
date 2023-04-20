import 'package:auto_size_text/auto_size_text.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:finallyicanlearn/models/lists.dart';

class RotateSimpleLanguage extends StatefulWidget {
  const RotateSimpleLanguage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSimpleLanguageState();
  }
}

class _RotateSimpleLanguageState extends State<RotateSimpleLanguage> {
  int _currenttop = 0;

  final CarouselController _controllertop = CarouselController();

  final TextEditingController _controllerbottomfirsttext =
      TextEditingController();

  final String _title = subtitlesEN[5];

  final List<String> finalhexNamesList = hexNamesList;

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
          backgroundColor: Colors.green),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar( backgroundColor: Colors.white,
                maxRadius: 100.0,
                child: CarouselSlider(
                  items: mixHexagramSlidersNew,
                  carouselController: _controllertop,
                  options: CarouselOptions(
                      autoPlay: false,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      enlargeCenterPage: true,
                      aspectRatio: 1.3,
                      onPageChanged: (indextop, reason) {
                        setState(() {
                          _currenttop = indextop;
                          _controllerbottomfirsttext.text =
                              hexNamesList[indextop];
                        });
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: AutoSizeTextField(
                        minLines: 1,
                        minFontSize: 15,
                    fullwidth: false,
                    decoration: InputDecoration.collapsed(
                        hintText: hexNamesList[0],
                        hintStyle: const TextStyle(color: Colors.grey)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _controllerbottomfirsttext,
                    readOnly: true,
                  )),
                ],
              ),
              const Divider(
                color: Colors.green,
                thickness: 5,
              ),
              Container(
                alignment: Alignment.center,
                child: const AutoSizeText(
                  'O',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 40,
                    fontFamily: 'iChing',
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
