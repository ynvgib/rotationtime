import 'package:finallyicanlearn/models/hexlineslist.dart';
import 'package:finallyicanlearn/models/lists.dart';
import 'package:finallyicanlearn/models/hebrew/lists_he.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';

Hexagram getGateStructure(double _planetlongitude) {
  String _name = '',
      _hex = '',
      _gatename = '',
      _linename = '',
      _gateline = '',
      _gatelinecolor = '',
      _gatelinecolortone = '',
      _gatelinecolortonebase = '';

  int _gate = 1,
      _line = 1,
      _color = 1,
      _tone = 1,
      _base = 1,
  //_degrees = 0,
  //_minutes = 0,
  //_seconds = 0,
      _hexfontindex = 0,
      _lineindex;

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

// Tone
  _exactTone = 13824 * _percentageThroughWheel;
  _tone = ((_exactTone % 6) + 1).floor();

// Base
  _exactBase = 69120 * _percentageThroughWheel;
  _base = ((_exactBase % 5) + 1).floor();

  // get name of hexagram
  _name = hexagramNames[_gate];
  _hexfontindex = fontHexNumbersList.indexOf(_gate);
  _hex = fontHexOrderList[_hexfontindex];

  // get line name
  _gatename = _name;

  // get line name
  _lineindex = idonotknowlinesList.indexOf(_gate);
  _lineindex = _lineindex + _line;
  _linename = idonotknowlinesList[_lineindex];

  // string gate line
  _gateline = "$_gate.$_line";

  // string gate line color
  _gatelinecolor = "$_gate.$_line.$_color";

  // string gate line color tone
  _gatelinecolortone = "$_gate.$_line.$_color.$_tone";

  // string gate line color tone base
  _gatelinecolortonebase = "$_gate.$_line.$_color.$_tone.$_base";


  _gateStructure.name = _name;
  _gateStructure.hex = _hex;
  _gateStructure.gate = _gate;
  _gateStructure.line = _line;
  _gateStructure.color = _color;
  _gateStructure.tone = _tone;
  _gateStructure.base = _base;
  _gateStructure.gatename = _gatename;
  _gateStructure.linename = _linename;
  _gateStructure.gateline = _gateline;
  _gateStructure.gatelinecolor = _gatelinecolor;
  _gateStructure.gatelinecolortone = _gatelinecolortone;
  _gateStructure.gatelinecolortonebase = _gatelinecolortonebase;


  return _gateStructure;
}

HexagramSentence getGateSentence(int _gate, String _language) {
  String? _adjective, _subject, _verb, _adverb;
  int _gateindex;
  HexagramSentence _hexSentence = HexagramSentence();
  List _hexchosensentenceList = [];

  _adjective = 'adjective';
  _subject = 'subject';
  _verb = 'verb';
  _adverb = 'adverb';

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

  _hexSentence.adjective = _adjective;
  _hexSentence.subject = _subject;
  _hexSentence.verb = _verb;
  _hexSentence.adverb = _adverb;
  _hexSentence.sentence = '${_adjective!} ${_subject!} ${_verb!} ${_adverb!}';


  return _hexSentence;
}
