import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/hebrew/lists_he.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';

Hexagram getGateStructure(double planetlongitude) {
  String name = '',
      hex = '',
      gatename = '',
      linename = '',
  gateline = '',
  gatelinecolor = '',
  gatelinecolortone = '',
  gatelinecolortonebase = '';

  int gate = 1,
      line = 1,
      color = 1,
      tone = 1,
      base = 1,
      //_degrees = 0,
      //_minutes = 0,
      //_seconds = 0,
      hexfontindex = 0,
  lineindex;

  //double _decimalDegrees = 0.0;

  double exactLine = 0.0;
  double exactColor = 0.0;
  double exactTone = 0.0;
  double exactBase = 0.0;

  Hexagram gateStructure = Hexagram();

  //_decimalDegrees = _degrees + _minutes / 60 + _seconds / 3600;
  //_planetlongitude += _decimalDegrees;

  planetlongitude += 58;

  if (planetlongitude > 360) {
    planetlongitude -= 360;
  }

  double percentageThroughWheel = planetlongitude / 360;

  gate = orderHexagramsToCalulateWheel[(percentageThroughWheel * 64).floor()];

// Line
  exactLine = 384 * percentageThroughWheel;
  line = ((exactLine % 6) + 1).floor();

// Color
  exactColor = 2304 * percentageThroughWheel;
  color = ((exactColor % 6) + 1).floor();

// Tone
  exactTone = 13824 * percentageThroughWheel;
  tone = ((exactTone % 6) + 1).floor();

// Base
  exactBase = 69120 * percentageThroughWheel;
  base = ((exactBase % 5) + 1).floor();

  // get name of hexagram
  name = hexagramNames[gate];
  hexfontindex = fontHexNumbersList.indexOf(gate);
  hex = fontHexOrderList[hexfontindex];

  // get line name
  gatename = name;

  // get line name
  lineindex = idonotknowlinesList.indexOf(gate);
  lineindex = lineindex + line;
  linename = idonotknowlinesList[lineindex];

  // string gate line
  gateline = "$gate.$line";

  // string gate line color
  gatelinecolor = "$gate.$line.$color";

  // string gate line color tone
  gatelinecolortone = "$gate.$line.$color.$tone";

  // string gate line color tone base
  gatelinecolortonebase = "$gate.$line.$color.$tone.$base";


  gateStructure.name = name;
  gateStructure.hex = hex;
  gateStructure.gate = gate;
  gateStructure.line = line;
  gateStructure.color = color;
  gateStructure.tone = tone;
  gateStructure.base = base;
  gateStructure.gatename = gatename;
  gateStructure.linename = linename;
  gateStructure.gateline = gateline;
  gateStructure.gatelinecolor = gatelinecolor;
  gateStructure.gatelinecolortone = gatelinecolortone;
  gateStructure.gatelinecolortonebase = gatelinecolortonebase;


  return gateStructure;
}

HexagramSentence getGateSentence(int gate, String language) {
  String? adjective, subject, verb, adverb;
  int gateindex;
  HexagramSentence hexSentence = HexagramSentence();
  List hexchosensentenceList = [];

  adjective = 'adjective';
  subject = 'subject';
  verb = 'verb';
  adverb = 'adverb';

  switch (language) {
    case 'EN':
      hexchosensentenceList = hexSentenceList;
      break;
    case 'HE':
      hexchosensentenceList = hexSentenceHEBList;
      break;
    default:
      hexchosensentenceList = hexSentenceList;
      break;
  }

  gateindex = hexchosensentenceList.indexOf(gate);
  for (var i = 0; i < 4; i++) {
    adjective = hexchosensentenceList[gateindex + 1];
    subject = hexchosensentenceList[gateindex + 2];
    verb = hexchosensentenceList[gateindex + 3];
    adverb = hexchosensentenceList[gateindex + 4];
  }

  hexSentence.adjective = adjective;
  hexSentence.subject = subject;
  hexSentence.verb = verb;
  hexSentence.adverb = adverb;
  hexSentence.sentence = '${adjective!} ${subject!} ${verb!} ${adverb!}';


  return hexSentence;
}
