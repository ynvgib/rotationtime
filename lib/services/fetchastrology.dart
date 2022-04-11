import 'dart:async';

import 'package:finallyicanlearn/logic/hdsubstructure.dart';
import 'package:finallyicanlearn/models/astrologyjsonmap.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AstrologyServices {
  static Future<List> getAstrology(DateTime _userDateTime) async {
    List _planetsSubStructureList = [];

    //DateTime _now = DateTime.now();
    //DateTime _userDateTime = DateTime.now();
    //print ('Now: $_userDateTime');

    String _formattedDate = DateFormat('yyyy-MM-dd').format(_userDateTime);
    String _formattedTime = DateFormat.Hms().format(_userDateTime);


    String _timeDate = 'UTC ' + _formattedTime + ' ' + _formattedDate;

    double _latitude = 0.0,
        _longitude = 0.0,
        _sunlongitude = 0.0,
        _earthlongitude = 0.0,
        _moonlongitude = 0.0,
        _mercurylongitude = 0.0,
        _venuslongitude = 0.0,
        _marslongitude = 0.0,
        _jupiterlongitude = 0.0,
        _saturnlongitude = 0.0,
        _uranuslongitude = 0.0,
        _neptunelongitude = 0.0,
        _plutolongitude = 0.0;

    String _sunSubStructure = '',
        _earthSubStructure = '',
        _moonSubStructure = '',
        _mercurySubStructure = '',
        _venusSubStructure = '',
        _marsSubStructure = '',
        _jupiterSubStructure = '',
        _saturnSubStructure = '',
        _uranusSubStructure = '',
        _neptuneSubStructure = '',
        _plutoSubStructure = '';
    
    final String _uri = "http://localhost:3000/horoscope?time=" +
        _formattedDate +
        "T" +
        _formattedTime +
        "Z&latitude=" +
        _latitude.toString() +
        "&longitude=" +
        _longitude.toString();
    final Astrology astrology;
    try {
      var response = await http.get(Uri.parse(_uri));
      //var response  = await http.get(Uri.parse("http://localhost:3000/horoscope?time=1993-08-06T20:50:00Z&latitude=-33.41167&longitude=-70.66647"));
      astrology = astrologyFromJson(response.body);

      _sunlongitude = astrology.data.astros.sun.position.longitude;
      _sunSubStructure = getSubStructure(_sunlongitude);

      _sunlongitude < 180
          ? _earthlongitude = _sunlongitude + 180
          : _earthlongitude = _sunlongitude - 180;
      _earthSubStructure = getSubStructure(_earthlongitude);

      _moonlongitude = astrology.data.astros.moon.position.longitude;
      _mercurylongitude = astrology.data.astros.mercury.position.longitude;
      _venuslongitude = astrology.data.astros.venus.position.longitude;
      _marslongitude = astrology.data.astros.mars.position.longitude;
      _jupiterlongitude = astrology.data.astros.jupiter.position.longitude;
      _saturnlongitude = astrology.data.astros.saturn.position.longitude;
      _uranuslongitude = astrology.data.astros.uranus.position.longitude;
      _neptunelongitude = astrology.data.astros.neptune.position.longitude;
      _plutolongitude = astrology.data.astros.pluto.position.longitude;

      _moonSubStructure = getSubStructure(_moonlongitude);
      _mercurySubStructure = getSubStructure(_mercurylongitude);
      _venusSubStructure = getSubStructure(_venuslongitude);
      _marsSubStructure = getSubStructure(_marslongitude);
      _jupiterSubStructure = getSubStructure(_jupiterlongitude);
      _saturnSubStructure = getSubStructure(_saturnlongitude);
      _uranusSubStructure = getSubStructure(_uranuslongitude);
      _neptuneSubStructure = getSubStructure(_neptunelongitude);
      _plutoSubStructure = getSubStructure(_plutolongitude);

      _planetsSubStructureList = [
        _timeDate,
        _sunSubStructure,
        _earthSubStructure,
        _moonSubStructure,
        _mercurySubStructure,
        _venusSubStructure,
        _marsSubStructure,
        _jupiterSubStructure,
        _saturnSubStructure,
        _uranusSubStructure,
        _neptuneSubStructure,
        _plutoSubStructure,
      ];
    } catch (err) {
      Exception(err);
    }

    return _planetsSubStructureList;
  }

  static Future<List<Hexagram>> getPlanetsGatesNow(DateTime _now) async {
    List<Hexagram> _planetsHexagramList = [];

    String _formattedDate = DateFormat('yyyy-MM-dd').format(_now);
    String _formattedTime = DateFormat.Hms().format(_now);


    double _latitude = 0.0,
        _longitude = 0.0,
        _sunlongitude = 0.0,
        _earthlongitude = 0.0,
        _moonlongitude = 0.0,
        _mercurylongitude = 0.0,
        _venuslongitude = 0.0,
        _marslongitude = 0.0,
        _jupiterlongitude = 0.0,
        _saturnlongitude = 0.0,
        _uranuslongitude = 0.0,
        _neptunelongitude = 0.0,
        _plutolongitude = 0.0;

    Hexagram _sunSubStructure,
        _earthSubStructure,
        _moonSubStructure,
        _mercurySubStructure,
        _venusSubStructure,
        _marsSubStructure,
        _jupiterSubStructure,
        _saturnSubStructure,
        _uranusSubStructure,
        _neptuneSubStructure,
        _plutoSubStructure;
    
    final String _uri = "http://localhost:3000/horoscope?time=" +
        _formattedDate +
        "T" +
        _formattedTime +
        "Z&latitude=" +
        _latitude.toString() +
        "&longitude=" +
        _longitude.toString();
    final Astrology astrology;
    try {
      var response = await http.get(Uri.parse(_uri));
      print (_uri);
      astrology = astrologyFromJson(response.body);

      _sunlongitude = astrology.data.astros.sun.position.longitude;
      _sunSubStructure = getGateStructure(_sunlongitude);

      _sunlongitude < 180
          ? _earthlongitude = _sunlongitude + 180
          : _earthlongitude = _sunlongitude - 180;
      _earthSubStructure = getGateStructure(_earthlongitude);

      _moonlongitude = astrology.data.astros.moon.position.longitude;
      _mercurylongitude = astrology.data.astros.mercury.position.longitude;
      _venuslongitude = astrology.data.astros.venus.position.longitude;
      _marslongitude = astrology.data.astros.mars.position.longitude;
      _jupiterlongitude = astrology.data.astros.jupiter.position.longitude;
      _saturnlongitude = astrology.data.astros.saturn.position.longitude;
      _uranuslongitude = astrology.data.astros.uranus.position.longitude;
      _neptunelongitude = astrology.data.astros.neptune.position.longitude;
      _plutolongitude = astrology.data.astros.pluto.position.longitude;

      _moonSubStructure = getGateStructure(_moonlongitude);
      _mercurySubStructure = getGateStructure(_mercurylongitude);
      _venusSubStructure = getGateStructure(_venuslongitude);
      _marsSubStructure = getGateStructure(_marslongitude);
      _jupiterSubStructure = getGateStructure(_jupiterlongitude);
      _saturnSubStructure = getGateStructure(_saturnlongitude);
      _uranusSubStructure = getGateStructure(_uranuslongitude);
      _neptuneSubStructure = getGateStructure(_neptunelongitude);
      _plutoSubStructure = getGateStructure(_plutolongitude);


      _planetsHexagramList = [
        _sunSubStructure,
        _earthSubStructure,
        _moonSubStructure,
        _mercurySubStructure,
        _venusSubStructure,
        _marsSubStructure,
        _jupiterSubStructure,
        _saturnSubStructure,
        _uranusSubStructure,
        _neptuneSubStructure,
        _plutoSubStructure,
      ];
    } catch (err) {
      Exception(err);
    }

    return _planetsHexagramList;
  }
}