import 'package:finallyicanlearn/lists.dart';

String hdSubStructure(double _planetlongitude) {
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

  _finalSubStructure = _gate.toString() +'.' + _line.toString() + '.' + _color.toString()
  + '.' + _tone.toString() + '.' + _base.toString();

  return _finalSubStructure;
}
