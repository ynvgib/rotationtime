import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:finallyicanlearn/models/lists.dart';

// /rotatehexwithlogic
// rotate one hexagram
class RotateSimpleOne extends StatefulWidget {
  const RotateSimpleOne({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RotateSimpleOneState();
  }
}

class _RotateSimpleOneState extends State<RotateSimpleOne> {
  int _currenttop = 0, _currentmid = 0, _currentbot = 0;
  //_hexagramVal = 0;

  final CarouselController _controllertop = CarouselController(),
      _controllermid = CarouselController(),
      _controllerbot = CarouselController();

  final String _title = subtitlesEN[5];

  final List<String> finalhexNamesList = hexNamesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            _title,
            style: const TextStyle(
                color: Colors.white ,fontSize: 20, fontWeight: FontWeight.normal),
          ),
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
          backgroundColor: Colors.green),
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                        //_hexagramVal = ((_currenttop + 1) * 100 +
                        // (_currentmid + 1) * 10 +
                        //  (_currentbot + 1));

                        //_carouselvalueindex = hexCarouselWheelOrderList.indexOf(_hexagramVal);

                        //_chosenhex =  orderHexagramsWheel[_carouselvalueindex];
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
            Expanded(
              child: CarouselSlider(
                items: mixHexagramSlidersNew,
                carouselController: _controllermid,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexmid, reason) {
                      setState(() {
                        _currentmid = indexmid;

                        //_hexagramVal = ((_currenttop + 1) * 100 +
                        // (_currentmid + 1) * 10 +
                        // (_currentbot + 1));

                        //_carouselvalueindex = hexCarouselWheelOrderList.indexOf(_hexagramVal);

                        //_chosenhex =  orderHexagramsWheel[_carouselvalueindex];
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: hexList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controllermid.jumpToPage(entry.key),
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
                            .withOpacity(_currentmid == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: CarouselSlider(
                items: mixHexagramSlidersNew,
                carouselController: _controllerbot,
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.3,
                    onPageChanged: (indexbot, reason) {
                      setState(() {
                        _currentbot = indexbot;
                        //_hexagramVal = ((_currenttop + 1) * 100 +
                        //  (_currentmid + 1) * 10 +
                        //  (_currentbot + 1));

                        //_carouselvalueindex = hexCarouselWheelOrderList.indexOf(_hexagramVal);

                        //_chosenhex =  orderHexagramsWheel[_carouselvalueindex];
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: hexList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controllerbot.jumpToPage(entry.key),
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
                            .withOpacity(_currentbot == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Expanded(
                child: Container(
              child: const Text(
                'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
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
