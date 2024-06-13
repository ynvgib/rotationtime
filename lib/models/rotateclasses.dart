
class Hexagram {
  String? name, hex, gatename,
      linename, colorname, tonename, basename, gateline,
  gatelinecolor, gatelinecolortone,gatelinecolortonebase;
  int? gate, line, color, tone, base;
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
  });
}

class HumanDesign {
  String? type, authority, strategy,
      definition, cross, profile, sentence, coin, coinname;

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
  });
}

class HexagramSentence {
  String? adjective, subject, verb, adverb, sentence;

  HexagramSentence({this.adjective, this.subject, this.verb, this.adverb, this.sentence});
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
  String? id,firstcenter, secondcenter, name, adaptname,
      coin,description, circuitry, circuit, stream, sentence;

  HDChannel({this.id, this.firstcenter, this.secondcenter, this.name, this.adaptname, this.coin,
    this.description, this.circuitry, this.circuit, this.stream, this.sentence});
}

