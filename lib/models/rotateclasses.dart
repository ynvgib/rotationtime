import 'dart:math';

import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:flutter/material.dart';

class Hexagram {
  String? name,
      hex,
      gatename,
      linename,
      colorname,
      tonename,
      basename,
      gateline,
      gatelinecolor,
      gatelinecolortone,
      gatelinecolortonebase,
      zodiacsign,
      planet;
  int? gate, line, color, tone, base, zodiacid;
  double? longitude;

  Hexagram(
      {this.name,
      this.hex,
      this.gate,
      this.line,
      this.color,
      this.tone,
      this.base,
      this.gatename,
      this.linename,
      this.gateline,
      this.gatelinecolor,
      this.gatelinecolortone,
      this.gatelinecolortonebase,
      this.longitude,
      this.zodiacsign,
      this.zodiacid,
      this.planet});
}

class HumanDesign {
  String? type,
      authority,
      strategy,
      definition,
      cross,
      profile,
      sentence,
      coin,
      coinname;
  int? typeid, authid;

  HumanDesign({
    this.type,
    this.authority,
    this.strategy,
    this.definition,
    this.cross,
    this.profile,
    this.sentence,
    this.coin,
    this.coinname,
    this.typeid,
    this.authid,
  });
}

class HexagramSentence {
  String? adjective, subject, verb, adverb, sentence;

  HexagramSentence(
      {this.adjective, this.subject, this.verb, this.adverb, this.sentence});
}

class HexBase {
  int? base;
  String? basename;

  HexBase({this.base, this.basename});
}

class HexTone {
  int? tone;
  String? tonename;
  HexBase? hexBase;

  HexTone({this.tone, this.tonename, this.hexBase});
}

class HexColor {
  int? color;
  String? colorname;
  HexTone? hextone;

  HexColor({this.color, this.colorname, this.hextone});
}

class HexLine {
  int? line;
  String? linename;
  HexColor? hexcolor;

  HexLine({this.line, this.linename, this.hexcolor});
}

class HDChannel {
  String? id,
      firstcenter,
      secondcenter,
      name,
      hebname,
      zbname,
      zbhebname,
      adaptname,
      coin,
      description,
      circuitry,
      circuit,
      stream,
      sentence;

  Color? color;

  HDChannel(
      {this.id,
      this.firstcenter,
      this.secondcenter,
      this.name,
      this.hebname,
      this.adaptname,
      this.zbname,
      this.zbhebname,
      this.coin,
      this.description,
      this.circuitry,
      this.circuit,
      this.stream,
      this.sentence,
      this.color});
}

class ZBCube extends StatelessWidget {
  const ZBCube({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, -75.0, 0.0)
            ..rotateX(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.transparent,
            height: 135,
            width: 135,
            child: CircleAvatar(
              //radius: 75,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins6lst1[0]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, 75.0),
          //..rotateY(-pi / 2),
          //alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins6lst1[1]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(75.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins6lst1[3]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(-75.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins6lst1[2]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, 75.0, 0.0)
            ..rotateX(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.black,
              foregroundImage: AssetImage(coins6lst1[5]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, -75.0),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins6lst1[4]),
            ),
          ),
        ),
      ],
    );
  }
}

class Cube extends StatelessWidget {
  const Cube({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, -75.0, 0.0)
            ..rotateX(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            height: 135,
            width: 135,
            child: const CircleAvatar(
              //radius: 75,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage('assets/camog/dogswoofgoof.gif'),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, 75.0),
          //..rotateY(-pi / 2),
          //alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              //backgroundColor: Colors.black,
              foregroundImage: AssetImage(coins4lst[3]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(75.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              //backgroundColor: Colors.black,
              foregroundImage: AssetImage(coins4lst[1]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(-75.0, 0.0, 0.0)
            ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              //backgroundColor: Colors.black,
              foregroundImage: AssetImage(coins4lst[2]),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, 75.0, 0.0)
            ..rotateX(-pi / 2),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: const CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.black,
              foregroundImage: AssetImage('assets/camog/snoopyq.gif'),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, -75.0),
          alignment: Alignment.center,
          child: Container(
            height: 135,
            width: 135,
            color: Colors.transparent,
            child: CircleAvatar(
              //radius: 15,
              backgroundColor: Colors.transparent,
              foregroundImage: AssetImage(coins4lst[0]),
            ),
          ),
        ),
      ],
    );
  }
}

class Codon {
  String? name, hebname, zbname;
  int? id;
  List<int>? gates;

  Codon({this.name, this.hebname, this.zbname, this.id, this.gates});
}

class DesignForm {
  String? name, hebname, zbname, orient;
  int? id;
  List<int>? gates;
  List<String>? centers;

  DesignForm(
      {this.name,
      this.hebname,
      this.zbname,
      this.id,
      this.gates,
      this.centers,
      this.orient});
}

class CityTime {
  String? city;
  String? cityAscii;
  double? lat;
  double? lng;
  int? pop;
  String? country;
  String? iso2;
  String? iso3;
  String? province;
  String? timezone;

  CityTime(
      {this.city,
      this.cityAscii,
      this.lat,
      this.lng,
      this.pop,
      this.country,
      this.iso2,
      this.iso3,
      this.province,
      this.timezone});

  CityTime.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    cityAscii = json['city_ascii'];
    lat = json['lat'];
    lng = json['lng'];
    pop = json['pop'];
    country = json['country'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    province = json['province'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['city_ascii'] = cityAscii;
    data['lat'] = lat;
    data['lng'] = lng;
    data['pop'] = pop;
    data['country'] = country;
    data['iso2'] = iso2;
    data['iso3'] = iso3;
    data['province'] = province;
    data['timezone'] = timezone;
    return data;
  }
}

class PuddleClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.8); // Start slightly above the bottom
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height * 0.6, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class Base384Line {
  final String id; // e.g., "38.1"
  final String baseText; // Neutral line description
  final String exaltText; // (+) Text
  final String detrimText; // (-) Text
  final String exaltImg; // (+) Planet Path
  final String detrimImg; // (-) Planet Path

  Base384Line({
    required this.id,
    required this.baseText,
    required this.exaltText,
    required this.detrimText,
    required this.exaltImg,
    required this.detrimImg,
  });
}

String getZBState(String binary) {
  // We split the 6 bits into three 2-bit pairs
  // Assuming the rightmost bits are the Bottom Ring
  String ring1 = binary.substring(4, 6); // Bottom
  String ring2 = binary.substring(2, 4); // Middle
  String ring3 = binary.substring(0, 2); // Top

  String translate(String bits) {
    if (bits == '11') return "COMPLEX";
    if (bits == '10') return "Simple;";
    if (bits == '01') return "Breath,";
    return "silence."; // '00'
  }

  return "${translate(ring3)} ${translate(ring2)} ${translate(ring1)}";
}

Color getBase4Color(int index) {
  switch (index) {
    case 0:
      return Colors.blue; // 1. "COMPLEX"
    case 1:
      return Colors.green; // 2. Simple;
    case 2:
      return Colors.yellow; // 3. Breath,
    case 3:
      return Colors.red; // 4. silence.
    default:
      return Colors.black;
  }
}

Color getBase4TextColor(int index) {
  // Yellow and Green often need darker text for "Aliveness" (58)
  if (index == 1 || index == 2) return Colors.black54;
  return Colors.white;
}

void zbPop(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
}

class ZbDataModel {
  final int? id;
  final String category; // e.g., 'Human Design', 'English', 'Lyrics'
  final String subCategory; // e.g., 'Gate 64', 'Vocabulary', 'Song Title'

  // The 5 Layers of Depth
  final String idk;
  final String silence;
  final String breath;
  final String simple;
  final String complex;

  ZbDataModel({
    this.id,
    required this.category,
    this.subCategory = '',
    this.idk = '',
    this.silence = '',
    this.breath = '',
    this.simple = '',
    this.complex = '',
  });

  // Database Bridge (The "Stitcher")
  factory ZbDataModel.fromMap(Map<String, dynamic> map) {
    return ZbDataModel(
      id: map['id'],
      category: map['category'] ?? '',
      subCategory: map['sub_category'] ?? '',
      idk: map['idk'] ?? '',
      silence: map['silence'] ?? '',
      breath: map['breath'] ?? '',
      simple: map['simple'] ?? '',
      complex: map['complex'] ?? '',
    );
  }
}

// The Universal Account (The "Receipt")
class ZBAccount {
  final List<Hexagram> personality;
  final List<Hexagram> design;
  final List<HDChannel> channels;
  final List<HDCenter> centers;
  final DateTime timestamp;
  final DateTime designtimestamp; // 💡 Added this for the 88° time
  final bool isJustNow;

  ZBAccount({
    required this.personality,
    this.design = const [],
    required this.channels,
    required this.centers,
    required this.timestamp,
    required this.designtimestamp, // 💡 Now required
    this.isJustNow = false,
  });
}

// The Unified Center Model
class HDCenter {
  String? id, name, adaptname;
  int? state; // 0: Open, 1: Simple, 2: Complex

  HDCenter({this.id, this.name, this.adaptname, this.state});
}

class SearchResult {
  final String fileName;
  final String fileTitle; // 💡 The first line of the file
  final String snippet;
  final String query;
  final bool isHebrew;

  SearchResult({
    required this.fileName,
    required this.fileTitle,
    required this.snippet,
    required this.query,
    required this.isHebrew,
  });
}
