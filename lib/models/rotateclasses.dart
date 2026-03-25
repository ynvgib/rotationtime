import 'dart:math';
import 'package:finallyicanlearn/zb/data/zb_listdb.dart';
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

  Hexagram({
    this.name,
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
    this.planet,
  });
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

  HexagramSentence({
    this.adjective,
    this.subject,
    this.verb,
    this.adverb,
    this.sentence,
  });
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

  HDChannel({
    this.id,
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
    this.color,
  });
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

  CityTime({
    this.city,
    this.cityAscii,
    this.lat,
    this.lng,
    this.pop,
    this.country,
    this.iso2,
    this.iso3,
    this.province,
    this.timezone,
  });

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
      size.width / 4,
      size.height,
      size.width / 2,
      size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height * 0.6,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

// The Unified Center Model
class HDCenter {
  String? id, name, adaptname;
  int? state; // 0: Open, 1: Simple, 2: Complex

  HDCenter({this.id, this.name, this.adaptname, this.state});
}
