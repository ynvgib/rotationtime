import 'dart:async';

import 'package:finallyicanlearn/logic/hdsubstructure.dart';
import 'package:finallyicanlearn/models/json/astrologyjsonmap.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AstrologyServices {
  static Future<Astrology> getPlanetsGatesNow(DateTime _now) async {
    List<Hexagram> _planetsHexagramList = [];

    final Astrology astrology;
    final _utcTime = _now.toUtc();
    double _latitude = 0.0,
        _longitude = 0.0;

    String _formattedDate = DateFormat('yyyy-MM-dd').format(_utcTime);
    String _formattedTime = DateFormat.Hms().format(_utcTime);
    
    final String _uri = "http://localhost:3000/horoscope?time=" +
        _formattedDate +
        "T" +
        _formattedTime +
        "Z&latitude=" +
        _latitude.toString() +
        "&longitude=" +
        _longitude.toString();




      var response = await http.get(Uri.parse(_uri));

      astrology = astrologyFromJson(response.body);


    return astrology;
  }

  static Future<List<Hexagram>> mapPlanets(Astrology _mappedplanets) async {

    List<Hexagram> _planetsHexagramList = [];

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

    try {
      _sunlongitude = _mappedplanets.data.astros.sun.position.longitude;
      _sunSubStructure = getGateStructure(_sunlongitude);

      _sunlongitude < 180
          ? _earthlongitude = _sunlongitude + 180
          : _earthlongitude = _sunlongitude - 180;
      _earthSubStructure = getGateStructure(_earthlongitude);

      _northnodelongitude = _mappedplanets.data.astros.northnode.position.longitude;
      _northnodeSubStructure = getGateStructure(_northnodelongitude);

      _northnodelongitude < 180
          ? _southnodelongitude = _northnodelongitude + 180
          : _southnodelongitude = _northnodelongitude - 180;
      _southnodeSubStructure = getGateStructure(_southnodelongitude);

      _moonlongitude = _mappedplanets.data.astros.moon.position.longitude;
      _mercurylongitude = _mappedplanets.data.astros.mercury.position.longitude;
      _venuslongitude = _mappedplanets.data.astros.venus.position.longitude;
      _marslongitude = _mappedplanets.data.astros.mars.position.longitude;
      _jupiterlongitude = _mappedplanets.data.astros.jupiter.position.longitude;
      _saturnlongitude = _mappedplanets.data.astros.saturn.position.longitude;
      _uranuslongitude = _mappedplanets.data.astros.uranus.position.longitude;
      _neptunelongitude = _mappedplanets.data.astros.neptune.position.longitude;
      _plutolongitude = _mappedplanets.data.astros.pluto.position.longitude;


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

  static Future<DateTime> getDesignTime(DateTime _nowdesign) async{

    List<Hexagram> _planetsList = [];
    DateTime _designTime = _nowdesign;
    //DateTime _utcTime = _now.toUtc();
    DateTime _initialDesignDays = _nowdesign.subtract(const Duration(days: 88));
    Astrology _designdata;
    Astrology _personalitydata;
    double _personsunlongitude,
        _designsunlongitude,
        _requiredlongitude,
        _calculatedlongitude,
    _gaplongitude;

    int _interpolationtimes = 0;

    // initialize design time
    _designTime = _initialDesignDays;

    _personalitydata = await AstrologyServices.getPlanetsGatesNow(_nowdesign);
    _personsunlongitude = _personalitydata.data.astros.sun.position.longitude;


    // required 88 degress
    _requiredlongitude = _personsunlongitude - 88;
    if (_requiredlongitude < 0){
      _requiredlongitude += 360;
    }

    // align in days
    do{
    _designdata = await AstrologyServices.getPlanetsGatesNow(_designTime);
    _calculatedlongitude = _designdata.data.astros.sun.position.longitude;

    _gaplongitude = _requiredlongitude - _calculatedlongitude;
    //_designsunlongitude = _gaplongitude;

    if (_gaplongitude > 1){
      _designTime = _designTime.add(const Duration(days: 1));
      //print ('1 day subtracted');
      _interpolationtimes++;
    }
    else if (_gaplongitude < -1){
      _designTime = _designTime.subtract(const Duration(days: 1));
      //print ('1 day added');
      _interpolationtimes++;
    }

    }while (_gaplongitude > 1 || _gaplongitude < -1);


    // align in hours
    do{

      if (_gaplongitude > 0.35){
        _designTime = _designTime.add(const Duration(hours: 1));
        //print ('1 hour subtracted');
        _interpolationtimes++;

      }
      else if (_gaplongitude < -0.35){
        _designTime = _designTime.subtract(const Duration(hours: 1));
        //print ('1 hour added');
        _interpolationtimes++;

      }

      _designdata = await AstrologyServices.getPlanetsGatesNow(_designTime);
      _calculatedlongitude = _designdata.data.astros.sun.position.longitude;

      _gaplongitude = _requiredlongitude - _calculatedlongitude;
      //_designsunlongitude = _gaplongitude;

      //print (_requiredlongitude);
      //print (_calculatedlongitude);
      //print (_gaplongitude);

    }while (_gaplongitude > 0.35 || _gaplongitude < -0.35);

    // align in 10 minutes
    do{

      if (_gaplongitude > 0.01){
        _designTime = _designTime.add(const Duration(minutes: 10));
        //print ('10 minutes subtracted');
        _interpolationtimes++;

      }
      else if (_gaplongitude < -0.01){
        _designTime = _designTime.subtract(const Duration(minutes: 10));
        //print ('10 minutes added');
        _interpolationtimes++;
      }

      _designdata = await AstrologyServices.getPlanetsGatesNow(_designTime);
      _calculatedlongitude = _designdata.data.astros.sun.position.longitude;

      _gaplongitude = _requiredlongitude - _calculatedlongitude;
      //_designsunlongitude = _gaplongitude;

      //print (_requiredlongitude);
      //print (_calculatedlongitude);
      //print (_gaplongitude);

    }while (_gaplongitude > 0.01 || _gaplongitude < -0.01);

    // align in 1 minute
    do{

      if (_gaplongitude > 0.001){
        _designTime = _designTime.add(const Duration(minutes: 1));
        //print ('1 minutes subtracted');
        _interpolationtimes++;
      }
      else if (_gaplongitude < -0.001){
        _designTime = _designTime.subtract(const Duration(minutes: 1));
        //print ('1 minutes added');
        _interpolationtimes++;
      }

      _designdata = await AstrologyServices.getPlanetsGatesNow(_designTime);
      _calculatedlongitude = _designdata.data.astros.sun.position.longitude;

      _gaplongitude = _requiredlongitude - _calculatedlongitude;
      //_designsunlongitude = _gaplongitude;

      //print (_requiredlongitude);
      //print (_calculatedlongitude);
      //print (_gaplongitude);

    }while (_gaplongitude > 0.001 || _gaplongitude < -0.001);

    // align in 10 seconds
    do{

      if (_gaplongitude > 0.0001){
        _designTime = _designTime.add(const Duration(seconds: 10));
        //print ('10 seconds subtracted');
        _interpolationtimes++;
      }
      else if (_gaplongitude < -0.0001){
        _designTime = _designTime.subtract(const Duration(seconds: 10));
        //print ('10 seconds added');
        _interpolationtimes++;
      }

      _designdata = await AstrologyServices.getPlanetsGatesNow(_designTime);
      _calculatedlongitude = _designdata.data.astros.sun.position.longitude;

      _gaplongitude = _requiredlongitude - _calculatedlongitude;
      //_designsunlongitude = _gaplongitude;

      //print (_requiredlongitude);
      //print (_calculatedlongitude);
      //print (_gaplongitude);

    }while (_gaplongitude > 0.0001 || _gaplongitude < -0.0001);

    // align in 1 seconds
    do{

      if (_gaplongitude > 0.00001){
        _designTime = _designTime.add(const Duration(seconds: 1));
        //print ('1 seconds subtracted');
        _interpolationtimes++;
      }
      else if (_gaplongitude < -0.00001){
        _designTime = _designTime.subtract(const Duration(seconds: 1));
        //print ('1 seconds added');
        _interpolationtimes++;
      }

      _designdata = await AstrologyServices.getPlanetsGatesNow(_designTime);
      _calculatedlongitude = _designdata.data.astros.sun.position.longitude;

      _gaplongitude = _requiredlongitude - _calculatedlongitude;
      //_designsunlongitude = _gaplongitude;

      //print (_requiredlongitude);
      //print (_calculatedlongitude);
      //print (_gaplongitude);

    }while (_gaplongitude > 0.00001 || _gaplongitude < -0.00001);

    // align in 100 milliseconds
    do{

      if (_gaplongitude > 0.000005){
        _designTime = _designTime.add(const Duration(milliseconds: 100));
        //print ('100 milliseconds subtracted');
        _interpolationtimes++;
      }
      else if (_gaplongitude < -0.000005){
        _designTime = _designTime.subtract(const Duration(milliseconds: 100));
        //print ('100 milliseconds added');
        _interpolationtimes++;
      }

      _designdata = await AstrologyServices.getPlanetsGatesNow(_designTime);
      _calculatedlongitude = _designdata.data.astros.sun.position.longitude;

      _gaplongitude = _requiredlongitude - _calculatedlongitude;
      //_designsunlongitude = _gaplongitude;


    }while (_gaplongitude > 0.000007 || _gaplongitude < -0.000007);

    return _designTime;
  }

  static Future<List<Hexagram>> getCurrentData(DateTime _nowdata) async{

    List<Hexagram> _planetsList = [];
    //DateTime _designTime = _now;
    //DateTime _utcTime = _now.toUtc();
    Astrology _planets;


    _planets = await AstrologyServices.getPlanetsGatesNow(_nowdata);
    _planetsList = await AstrologyServices.mapPlanets(_planets);


    return _planetsList;
  }



}