import 'dart:async';

import 'package:finallyicanlearn/logic/hdsubstructure.dart';
import 'package:finallyicanlearn/models/astrologyjsonmap.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AstrologyServices {
  static Future<List> getAstrology(DateTime _userDateTime) async {
    List _planetsSubStructureList = [];

    //DateTime _now = DateTime.now();
    //DateTime _userDateTime = DateTime.now();
    print ('Now: $_userDateTime');

    String _formattedDate = DateFormat('yyyy-MM-dd').format(_userDateTime);
    String _formattedTime = DateFormat.Hms().format(_userDateTime);


    //int _caculatedangle = 88;
    //final int _sunangleinminutes = 4;
    //int _caculatedminutes;
    //int _caculateddays;
    //int _calculatedesignminutes = 352;
    //DateTime _designDateTime;

    //_designDateTime = _userDateTime.subtract(Duration(minutes: _calculatedesignminutes));
    //print ('Design: $_designDateTime');

    //String _designformattedDate = DateFormat('yyyy-MM-dd').format(_designdt);
    //String _designformattedTime = DateFormat('yyyy-MM-dd').format(_designdt);

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
        _plutoSubStructure = '',
        _sunBodySubStructure = '',
        _earthBodySubStructure = '',
        _moonBodySubStructure = '',
        _mercuryBodySubStructure = '',
        _venusBodySubStructure = '',
        _marsBodySubStructure = '',
        _jupiterBodySubStructure = '',
        _saturnBodySubStructure = '',
        _uranusBodySubStructure = '',
        _neptuneBodySubStructure = '',
        _plutoBodySubStructure = '';

    //List<String> _planetsSubStructureList;
    final String uri_ = "http://localhost:3000/horoscope?time=" +
        _formattedDate +
        "T" +
        _formattedTime +
        "Z&latitude=" +
        _latitude.toString() +
        "&longitude=" +
        _longitude.toString();
    final Astrology astrology;
    try {
      var response = await http.get(Uri.parse(uri_));
      //var response  = await http.get(Uri.parse("http://localhost:3000/horoscope?time=1993-08-06T20:50:00Z&latitude=-33.41167&longitude=-70.66647"));
      astrology = astrologyFromJson(response.body);

      _sunlongitude = astrology.data.astros.sun.position.longitude;
      _sunSubStructure = hdSubStructure(_sunlongitude);

      _sunlongitude < 180
          ? _earthlongitude = _sunlongitude + 180
          : _earthlongitude = _sunlongitude - 180;
      _earthSubStructure = hdSubStructure(_earthlongitude);

      _moonlongitude = astrology.data.astros.moon.position.longitude;
      _mercurylongitude = astrology.data.astros.mercury.position.longitude;
      _venuslongitude = astrology.data.astros.venus.position.longitude;
      _marslongitude = astrology.data.astros.mars.position.longitude;
      _jupiterlongitude = astrology.data.astros.jupiter.position.longitude;
      _saturnlongitude = astrology.data.astros.saturn.position.longitude;
      _uranuslongitude = astrology.data.astros.uranus.position.longitude;
      _neptunelongitude = astrology.data.astros.neptune.position.longitude;
      _plutolongitude = astrology.data.astros.pluto.position.longitude;

      _moonSubStructure = hdSubStructure(_moonlongitude);
      _mercurySubStructure = hdSubStructure(_mercurylongitude);
      _venusSubStructure = hdSubStructure(_venuslongitude);
      _marsSubStructure = hdSubStructure(_marslongitude);
      _jupiterSubStructure = hdSubStructure(_jupiterlongitude);
      _saturnSubStructure = hdSubStructure(_saturnlongitude);
      _uranusSubStructure = hdSubStructure(_uranuslongitude);
      _neptuneSubStructure = hdSubStructure(_neptunelongitude);
      _plutoSubStructure = hdSubStructure(_plutolongitude);

      // XXX EDIT
      // BODY CALCULATION NOT FINISHED

      _sunlongitude < 88
          ? _sunlongitude = _sunlongitude - 88 + 360
          : _sunlongitude = _sunlongitude - 88;
      _earthlongitude < 88
          ? _earthlongitude = _earthlongitude - 88 + 360
          : _earthlongitude = _earthlongitude - 88;
      _moonlongitude < 88
          ? _moonlongitude = _moonlongitude - 88 + 360
          : _moonlongitude = _moonlongitude - 88;
      _mercurylongitude < 88
          ? _mercurylongitude = _mercurylongitude - 88 + 360
          : _mercurylongitude = _mercurylongitude - 88;
      _venuslongitude < 88
          ? _venuslongitude = _venuslongitude - 88 + 360
          : _venuslongitude = _venuslongitude - 88;
      _jupiterlongitude < 88
          ? _jupiterlongitude = _jupiterlongitude - 88 + 360
          : _jupiterlongitude = _jupiterlongitude - 88;
      _saturnlongitude < 88
          ? _saturnlongitude = _saturnlongitude - 88 + 360
          : _saturnlongitude = _saturnlongitude - 88;
      _uranuslongitude < 88
          ? _uranuslongitude = _uranuslongitude - 88 + 360
          : _uranuslongitude = _uranuslongitude - 88;
      _neptunelongitude < 88
          ? _neptunelongitude = _neptunelongitude - 88 + 360
          : _neptunelongitude = _neptunelongitude - 88;
      _plutolongitude < 88
          ? _plutolongitude = _plutolongitude - 88 + 360
          : _plutolongitude = _plutolongitude - 88;


      _sunBodySubStructure = hdSubStructure(_sunlongitude);
      _earthBodySubStructure = hdSubStructure(_earthlongitude);
      _moonBodySubStructure = hdSubStructure(_moonlongitude);
      _mercuryBodySubStructure = hdSubStructure(_mercurylongitude);
      _venusBodySubStructure = hdSubStructure(_venuslongitude);
      _marsBodySubStructure = hdSubStructure(_marslongitude);
      _jupiterBodySubStructure = hdSubStructure(_jupiterlongitude);
      _saturnBodySubStructure = hdSubStructure(_saturnlongitude);
      _uranusBodySubStructure = hdSubStructure(_uranuslongitude);
      _neptuneBodySubStructure = hdSubStructure(_neptunelongitude);
      _plutoBodySubStructure = hdSubStructure(_plutolongitude);

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
}