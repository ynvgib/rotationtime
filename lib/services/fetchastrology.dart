import 'dart:async';

import 'package:finallyicanlearn/logic/hdsubstructure.dart';
import 'package:finallyicanlearn/models/json/astrologyjsonmap.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AstrologyServices {
  static Future<List<Hexagram>> getPlanetsGatesNow(DateTime _now) async {
    List<Hexagram> _planetsHexagramList = [];

    final _utcTime = _now.toUtc();
    print (_now);
    print (_utcTime);

    String _formattedDate = DateFormat('yyyy-MM-dd').format(_utcTime);
    String _formattedTime = DateFormat.Hms().format(_utcTime);


    // tel aviv latitude 32.109333, and the longitude is 32.109333.

    double _latitude = 0.0,
        _longitude = 0.0,
        _sunlongitude = 0.0,
        _earthlongitude = 0.0,
        _northnodelongitude = 0.0,
        _southnodelongitude = 0.0,
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
        _northnodeSubStructure,
        _southnodeSubStructure,
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

      _northnodelongitude = astrology.data.astros.northnode.position.longitude;
      _northnodeSubStructure = getGateStructure(_northnodelongitude);

      _northnodelongitude < 180
          ? _southnodelongitude = _northnodelongitude + 180
          : _southnodelongitude = _northnodelongitude - 180;
      _southnodeSubStructure = getGateStructure(_southnodelongitude);

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
        _northnodeSubStructure,
        _southnodeSubStructure,
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