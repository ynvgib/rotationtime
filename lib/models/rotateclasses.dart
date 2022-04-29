class Hexagram {
  String? name, hex;
  int? gate, line, color, tone, base;

  Hexagram({
    this.name,
    this.hex,
    this.gate,
    this.line,
    this.color,
    this.tone,
    this.base,
  });
}

class HexagramSentence {
  String? adjective, subject, verb, adverb;

  HexagramSentence({this.adjective, this.subject, this.verb, this.adverb});
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
