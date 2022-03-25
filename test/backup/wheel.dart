import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_spinwheel/flutter_spinwheel.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<Widget> getAppBarActions(BuildContext context) {
  return [
    TextButton(
      child: Icon(
        Icons.device_unknown,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/sample');
      },
    ),
    TextButton(
      child: Icon(
        Icons.insert_emoticon,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/emoji');
      },
    ),
    TextButton(
      child: Icon(
        Icons.image,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/image');
      },
    ),
  ];
}

class SpinwheelDemo extends StatefulWidget {
  @override
  _SpinwheelDemoState createState() => _SpinwheelDemoState();
}

class _SpinwheelDemoState extends State<SpinwheelDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spinwheel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/emoji',
      routes: {
        '/sample': (context) => SpinwheelSampleApp(),
        '/emoji': (context) => SpinwheelEmojiDemo(),
        '/image': (context) => SpinwheelImageDemo()
      },
    );
  }
}

class SpinwheelSampleApp extends StatefulWidget {
  @override
  _SpinwheelSampleAppState createState() => _SpinwheelSampleAppState();
}

class _SpinwheelSampleAppState extends State<SpinwheelSampleApp> {
  late List<String> questions;
  late List<List<dynamic>> choices;
  late List<String> answers;
  late int select;
  late String currentText;

  @override
  void initState() {
    super.initState();
    questions = [
      'Your first programming language?',
      'Did you own any pets?',
      'Choose any one vehicle you own from below',
    ];
    choices = [
      ['Dart', 'C', 'C++', 'Java', 'Python', 'JS', 'TS', '😠'],
      ['Yes', 'No'],
      [
        NamedImage(
          path: 'assets/complex.png',
          name: 'complex',
        ),
        NamedImage(
          path: 'assets/simple.png',
          name: 'simple',
        ),
        NamedImage(
          path: 'assets/breath.png',
          name: 'breath',
        ),
        NamedImage(
          path: 'assets/silence.png',
          name: 'silence',
        ),
      ]
    ];
    select = 0;
    answers = ['', '', ''];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text('Sample'),
          ),
          actions: getAppBarActions(context)),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(questions[index]),
                  Text(answers[index] == '😠'
                      ? '${answers[index]} None of these'
                      : answers[index]),
                  Spinwheel(
                    items: choices[index][0] is String
                        ? choices[index].cast<String>()
                        : null,
                    imageItems: choices[index][0] is NamedImage
                        ? choices[index].cast<NamedImage>()
                        : null,
                    select: select,
                    autoPlay: false,
                    hideOthers: false,
                    shouldDrawBorder: false,
                    onChanged: (val) {
                      if (mounted) {
                        setState(() {
                          answers[index] = val;
                        });
                      }
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class SpinwheelEmojiDemo extends StatefulWidget {
  @override
  _SpinwheelEmojiDemoState createState() => _SpinwheelEmojiDemoState();
}

class _SpinwheelEmojiDemoState extends State<SpinwheelEmojiDemo> {
  late List<String> items;
  late int select;
  late String currentText;

  @override
  void initState() {
    super.initState();
    items = ['🏘', '🚓', '🚛', '🏍', '🎉'];
    select = 2;
    currentText = items[select];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text('Emoji'),
          ),
          actions: getAppBarActions(context)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: Text(
              currentText,
              style: TextStyle(fontSize: 100.0),
            ),
          ),
          Spinwheel(
            items: items,
            onChanged: (val) {
              if (this.mounted) {
                setState(() {
                  currentText = val;
                });
              }
            },
            shouldHighlight: false,
            size: 150.0,
            select: 2,
            rotationDuration: 250,
            autoPlay: true,
            shouldDrawDividers: true,
          ),
        ],
      ),
    );
  }
}

class SpinwheelImageDemo extends StatefulWidget {
  @override
  _SpinwheelImageDemoState createState() => _SpinwheelImageDemoState();
}

class _SpinwheelImageDemoState extends State<SpinwheelImageDemo> {
  late List<String> carouselNames;
  late List<NamedImage> imgPack;
  late CarouselSlider carousel;
  late CarouselSlider carouseltop;
  late CarouselSlider carouselmid;
  late CarouselSlider carouselbot;
  final CarouselController _controlcarsouseltop = CarouselController();
  final CarouselController _controlcarsouselmid = CarouselController();
  final CarouselController _controlcarsouselbot = CarouselController();

  @override
  void initState() {
    super.initState();

    carouselNames = ['complex', 'simple', 'breath', 'silence'];

    imgPack = [
      NamedImage(
        path: 'assets/simple.png',
        name: carouselNames[0],
        offsetX: 1.2,
      ),
      NamedImage(
        path: 'assets/complex.png',
        name: carouselNames[1],
        offsetY: 1.7,
      ),
      NamedImage(
        path: 'assets/breath.png',
        name: carouselNames[2],
      ),
      NamedImage(
          path: 'assets/silence.png', name: carouselNames[3], offsetX: 1.2),
    ];

    // For Image example
    carouseltop = CarouselSlider(
      items: imgPack.map((img) {
        return Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.orange,
          child: Image.asset(img.path),
        );
      }).toList(),
      carouselController: _controlcarsouseltop,
      options: CarouselOptions(
        autoPlay: false,
        initialPage: 2,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
    );
    carouselmid = CarouselSlider(
      items: imgPack.map((img) {
        return Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.orange,
          child: Image.asset(img.path),
        );
      }).toList(),
      carouselController: _controlcarsouselmid,
      options: CarouselOptions(
        autoPlay: false,
        initialPage: 2,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
    );
    carouselbot = CarouselSlider(
      items: imgPack.map((img) {
        return Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.orange,
          child: Image.asset(img.path),
        );
      }).toList(),
      carouselController: _controlcarsouselbot,
      options: CarouselOptions(
        autoPlay: false,
        initialPage: 2,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Image'),
        ),
        actions: getAppBarActions(context),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Column(children: [carouseltop, carouselmid, carouselbot]),
          ),
          Expanded(
            child: Column(
              children: [
                Spinwheel(
                  size: 100.0,
                  imageItems: imgPack,
                  select: 1,
                  onChanged: (val) {
                    _controlcarsouseltop.animateToPage(
                        carouselNames.indexOf(val),
                        duration: Duration(seconds: 1),
                        curve: Curves.linear);
                  },
                  rotationDuration: 250,
                  autoPlay: true,
                  longPressToPauseAutoplay: true,
                  hideOthers: false,
                  shouldDrawDividers: true,
                  shouldDrawBorder: false,
                  shouldDrawCenterPiece: false,
                  wheelOrientation: pi / 4,
                ),
                Spinwheel(
                  size: 100.0,
                  imageItems: imgPack,
                  select: 1,
                  onChanged: (val) {
                    _controlcarsouselmid.animateToPage(
                        carouselNames.indexOf(val),
                        duration: Duration(seconds: 1),
                        curve: Curves.linear);
                  },
                  rotationDuration: 250,
                  autoPlay: true,
                  longPressToPauseAutoplay: true,
                  hideOthers: false,
                  shouldDrawDividers: true,
                  shouldDrawBorder: false,
                  shouldDrawCenterPiece: false,
                  wheelOrientation: pi / 4,
                ),
                Spinwheel(
                  size: 100.0,
                  imageItems: imgPack,
                  select: 1,
                  onChanged: (val) {
                    _controlcarsouselbot.animateToPage(
                        carouselNames.indexOf(val),
                        duration: Duration(seconds: 1),
                        curve: Curves.linear);
                  },
                  rotationDuration: 250,
                  autoPlay: true,
                  longPressToPauseAutoplay: true,
                  hideOthers: false,
                  shouldDrawDividers: true,
                  shouldDrawBorder: false,
                  shouldDrawCenterPiece: false,
                  wheelOrientation: pi / 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
