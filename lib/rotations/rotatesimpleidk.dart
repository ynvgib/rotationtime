import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:finallyicanlearn/models/lists.dart';

class RotateSimpleIDK extends StatefulWidget {
  const RotateSimpleIDK({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSimpleIDKState();
  }
}

class _RotateSimpleIDKState extends State<RotateSimpleIDK> {
  int _currenttop = 0;

  final CarouselController _controllertop = CarouselController();

  final TextEditingController _controllerbottomfirsttext = TextEditingController();


  final String _title = subtitlesEN[6];

  final List<String> finalhexNamesList = hexNamesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.blueGrey),
      backgroundColor: Colors.grey[100],
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CarouselSlider(
                items: mixHexagramSlidersNew,
                carouselController: _controllertop,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indextop, reason) {
                      setState(() {
                        _currenttop = indextop;
                        _controllerbottomfirsttext.text = hexNamesList[indextop];
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: hexList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controllertop.jumpToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                            .withOpacity(_currenttop == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: finalhexNamesList[0],
                          hintStyle: const TextStyle(color: Colors.grey)),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _controllerbottomfirsttext,
                      readOnly: true,
                    )),
              ],
            ),
            Expanded(
                child: Container(
                  child: const Text(
                    'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'iChing',
                    ),
                  ),
                  alignment: Alignment.center,
                )),
          ]),
    );
  }
}
