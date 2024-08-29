import 'package:decimal/decimal.dart';
import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/hebrew/lists_he.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/models/rtlists.dart';
import 'package:sweph/sweph.dart';

Hexagram getGateStructure(double planetlongitude) {
  String name = '',
      hex = '',
      gatename = '',
      linename = '',
  gateline = '',
  gatelinecolor = '',
  gatelinecolortone = '',
  gatelinecolortonebase = '',
  zodiacsign = '';

  int gate = 1,
      line = 1,
      color = 1,
      tone = 1,
      base = 1,
  zodiacid = 1,
      degrees = 0,
      minutes = 0,
      seconds = 0,
      hexfontindex = 0,
  lineindex;
  
  double secondsOfArc = 0.0;

  DegreeSplitData planetDSP;

  //double _decimalDegrees = 0.0;

  double exactLine = 0.0, exactColor = 0.0, exactTone = 0.0, exactBase = 0.0,
  gatelongitude = 0.0;

  Hexagram gateStructure = Hexagram();

  planetDSP = Sweph.swe_split_deg(planetlongitude, SplitDegFlags.SE_SPLIT_DEG_ZODIACAL);
  //print (planetDSP);
  zodiacid = planetDSP.sign;
  degrees = planetDSP.degrees;
  minutes = planetDSP.minutes;
  seconds = planetDSP.seconds;
  secondsOfArc = planetDSP.secondsOfArc;

  zodiacsign = zodiacSwephlist[zodiacid];

  //print (zodiacid);
  //print (zodiacSwephlist[zodiacid]);

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
  name = hdgates65lst[gate];
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

  // set longitude
  gatelongitude = planetlongitude;



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
  gateStructure.longitude = gatelongitude;
  gateStructure.zodiacid = zodiacid;
  gateStructure.zodiacsign = zodiacsign;

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
