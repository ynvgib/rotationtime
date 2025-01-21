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
  int? typeid;

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
      adaptname,
      coin,
      description,
      circuitry,
      circuit,
      stream,
      sentence;

  HDChannel(
      {this.id,
      this.firstcenter,
      this.secondcenter,
      this.name,
      this.adaptname,
      this.coin,
      this.description,
      this.circuitry,
      this.circuit,
      this.stream,
      this.sentence});
}

class hdCenter {
  String? id, name, adaptname;
  int? state;
  hdCenter({this.id, this.name, this.adaptname, this.state});
}

class Cube extends StatelessWidget {
  const Cube({Key? key}) : super(key: key);

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
            child: CircleAvatar(
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
            color: Colors.red,
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
            color: Colors.green,
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
            color: Colors.yellow,
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
            color: Colors.black,
            child: CircleAvatar(
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
              color: Colors.indigoAccent, child: CircleAvatar(
            //radius: 15,
            backgroundColor: Colors.transparent,
            foregroundImage: AssetImage(coins4lst[0]),
          ),),
        ),
      ],
    );
  }
}
