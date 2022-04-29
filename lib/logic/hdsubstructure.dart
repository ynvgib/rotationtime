import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/lists_he.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';

String getSubStructure(double _planetlongitude) {
  int _gate = 1;
  int _line = 1;
  int _color = 1;
  int _tone = 1;
  int _base = 1;
  int _degrees = 0;
  int _minutes = 0;
  int _seconds = 0;
//double _signDegrees = 0.0;
//double _planetlongitude = 0.0;
  double _decimalDegrees = 0.0;
  double _exactLine = 0.0;
  double _exactColor = 0.0;
  double _exactTone = 0.0;
  double _exactBase = 0.0;

  String _finalSubStructure = '';

//$.each(Signs.all, function(i, iteratingSign) {
//if (iteratingSign == sign) return false; // break
//_signDegrees += 30;
//});
  //_planetlongitude = astrology.data.astros.sun.position.longitude;

  _decimalDegrees = _degrees + _minutes / 60 + _seconds / 3600;
//_signDegrees += _decimalDegrees;
  _planetlongitude += _decimalDegrees;

// Human Design gates start at Gate 41 at 02º00'00" Aquarius, so we have to adjust from 00º00'00" Aries.
// The distance is 58º00'00" exactly.
//_signDegrees += 58;
  _planetlongitude += 58;

  if (_planetlongitude > 360) {
    _planetlongitude -= 360;
  }

//if (_signDegrees > 360) {
//  _signDegrees -= 360;
// }

//double _percentageThrough = _signDegrees / 360; // e.g. 182.3705 becomes 0.5065
  double _percentageThroughWheel =
      _planetlongitude / 360; // e.g. 182.3705 becomes 0.5065

// Gate
//orderHexagramsToCalulateWheel
//var gate = gateOrder[parse.Int(_percentageThrough * 64)];

  _gate = orderHexagramsToCalulateWheel[(_percentageThroughWheel * 64).floor()];

// Line
  _exactLine = 384 * _percentageThroughWheel;
  _line = ((_exactLine % 6) + 1).floor();
//_line = (_exactLine % 6).floor();

// Color
  _exactColor = 2304 * _percentageThroughWheel;
  _color = ((_exactColor % 6) + 1).floor();
//_color = (_exactColor % 6).floor();

// Tone
  _exactTone = 13824 * _percentageThroughWheel;
  _tone = ((_exactTone % 6) + 1).floor();
//_tone = (_exactTone % 6).floor();

// Base
  _exactBase = 69120 * _percentageThroughWheel; // e.g. 46151
  _base = ((_exactBase % 5) + 1).floor();
//_base = (_exactBase % 5).floor();

  _finalSubStructure = _gate.toString() +
      '.' +
      _line.toString() +
      '.' +
      _color.toString() +
      '.' +
      _tone.toString() +
      '.' +
      _base.toString();

  return _finalSubStructure;
}

Hexagram getGateStructure(double _planetlongitude) {
  String _name = '';
  String _hex = '';
  int _gate = 1,
      _line = 1,
      _color = 1,
      _tone = 1,
      _base = 1,
      //_degrees = 0,
      //_minutes = 0,
      //_seconds = 0,
      _hexfontindex = 0;

  //double _decimalDegrees = 0.0;

  double _exactLine = 0.0;
  double _exactColor = 0.0;
  double _exactTone = 0.0;
  double _exactBase = 0.0;

  Hexagram _gateStructure = Hexagram();

  //_decimalDegrees = _degrees + _minutes / 60 + _seconds / 3600;
  //_planetlongitude += _decimalDegrees;

  _planetlongitude += 58;

  if (_planetlongitude > 360) {
    _planetlongitude -= 360;
  }

  double _percentageThroughWheel = _planetlongitude / 360;

  _gate = orderHexagramsToCalulateWheel[(_percentageThroughWheel * 64).floor()];

// Line
  _exactLine = 384 * _percentageThroughWheel;
  _line = ((_exactLine % 6) + 1).floor();

// Color
  _exactColor = 2304 * _percentageThroughWheel;
  _color = ((_exactColor % 6) + 1).floor();
//_color = (_exactColor % 6).floor();

// Tone
  _exactTone = 13824 * _percentageThroughWheel;
  _tone = ((_exactTone % 6) + 1).floor();
//_tone = (_exactTone % 6).floor();

// Base
  _exactBase = 69120 * _percentageThroughWheel; // e.g. 46151
  _base = ((_exactBase % 5) + 1).floor();
//_base = (_exactBase % 5).floor();

  // get name of hexagram
  _name = hexagramNames[_gate];
  _hexfontindex = fontHexNumbersList.indexOf(_gate);
  _hex = fontHexOrderList[_hexfontindex];

  _gateStructure.name = _name;
  _gateStructure.hex = _hex;
  _gateStructure.gate = _gate;
  _gateStructure.line = _line;
  _gateStructure.color = _color;
  _gateStructure.tone = _tone;
  _gateStructure.base = _base;

  //print ("$_name $_gate $_line $_color $_tone $_base");

  return _gateStructure;
}

HexagramSentence getGateSentence(int _gate, String _language) {
  String? _adjective, _subject, _verb, _adverb;
  int _gateindex;
  HexagramSentence _hexSentence = HexagramSentence();
  List _hexchosensentenceList = [];

  switch (_language) {
    case 'EN':
      _hexchosensentenceList = hexSentenceList;
      break;
    case 'HE':
      _hexchosensentenceList = hexSentenceHEBList;
      break;
    default:
      _hexchosensentenceList = hexSentenceList;
      break;
  }

  _gateindex = _hexchosensentenceList.indexOf(_gate);
  for (var i = 0; i < 4; i++) {
    _adjective = _hexchosensentenceList[_gateindex + 1];
    _subject = _hexchosensentenceList[_gateindex + 2];
    _verb = _hexchosensentenceList[_gateindex + 3];
    _adverb = _hexchosensentenceList[_gateindex + 4];
  }

  //switch (_language){
  // case 'EN':
  //   _hexSentence.adjective = _adjective;
  //  _hexSentence.subject = _subject;
  //  _hexSentence.verb = _verb;
  //  _hexSentence.adverb = _adverb;
  //  break;
  // case 'HE':
  //   _hexSentence.adjective = _adverb;
  //   _hexSentence.subject = _verb;
  //   _hexSentence.verb = _subject;
  //   _hexSentence.adverb = _adjective;
  //   break;
  // default:
  //  _hexchosensentenceList = hexSentenceList;
  //  break;
  // }

  _hexSentence.adjective = _adjective;
  _hexSentence.subject = _subject;
  _hexSentence.verb = _verb;
  _hexSentence.adverb = _adverb;

  return _hexSentence;
}
