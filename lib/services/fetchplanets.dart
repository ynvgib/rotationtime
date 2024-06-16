import 'dart:async';

import 'package:finallyicanlearn/logic/hdsubstructure.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:sweph/sweph.dart';

class PlanetsServices {
  static Future<List<CoordinatesWithSpeed>> getPlanetsGatesNow(DateTime now) async {
    final List<CoordinatesWithSpeed> cswPlanets;

    final secondsInMinutes = now.second / 60;
    final minutesInHours  = (now.minute + secondsInMinutes) / 60;
    final hours  = now.hour + minutesInHours;


    final jd = Sweph.swe_julday(now.year, now.month, now.day, hours, CalendarType.SE_GREG_CAL);


    final CoordinatesWithSpeed posSun, posEarth, posNorthnode, posSouthnode,
          posMoon, posMercury, posVenus, posMars, posJupiter,
          posSaturn, posUranus, posNeptune, posPluto, posChiron;


    //print ("time is $now");
    //print ("jd time is $jd");
    posSun = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_SUN, SwephFlag.SEFLG_SWIEPH);
    //pos_earth = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_EARTH, SwephFlag.SEFLG_SWIEPH);
    posNorthnode = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_TRUE_NODE, SwephFlag.SEFLG_SWIEPH);
    //pos_southnode = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_TRUE_NODE, SwephFlag.SEFLG_SWIEPH);
    posMoon = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_MOON, SwephFlag.SEFLG_SWIEPH);
    posMercury = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_MERCURY, SwephFlag.SEFLG_SWIEPH);
    posVenus = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_VENUS, SwephFlag.SEFLG_SWIEPH);
    posMars = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_MARS, SwephFlag.SEFLG_SWIEPH);
    posJupiter = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_JUPITER, SwephFlag.SEFLG_SWIEPH);
    posSaturn = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_SATURN, SwephFlag.SEFLG_SWIEPH);
    posUranus = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_URANUS, SwephFlag.SEFLG_SWIEPH);
    posNeptune = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_NEPTUNE, SwephFlag.SEFLG_SWIEPH);
    posPluto = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_PLUTO, SwephFlag.SEFLG_SWIEPH);
    posChiron = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_CHIRON, SwephFlag.SEFLG_SWIEPH);

    //idk
    //double printNorthNode = posNorthnode.longitude;
    //double printSun = posSun.longitude;
    //print ("Sun: $printSun");
    //print ("North Node is: $printNorthNode");

    cswPlanets = [posSun, posNorthnode, posMoon,
                    posMercury, posVenus,
                    posMars, posJupiter, posSaturn,
                    posUranus, posNeptune, posPluto, posChiron];
      //posChiron];

    return cswPlanets;
  }

  static Future<List<Hexagram>> mapPlanets(List<CoordinatesWithSpeed> mappedplanets) async {
    // based Swiss ephemeris new method

    List<Hexagram> planetsHexagramList = [];

    CoordinatesWithSpeed cwsSun = mappedplanets [0],
        cwsNorthnode = mappedplanets [1],
        cwsMoon = mappedplanets [2],
        cwsMercury = mappedplanets [3],
        cwsVenus = mappedplanets [4],
        cwsMars = mappedplanets [5],
        cwsJupiter = mappedplanets [6],
        cwsSaturn = mappedplanets [7],
        cwsUranus = mappedplanets [8],
        cwsNeptune = mappedplanets [9],
        cwsPluto = mappedplanets [10],
        cwsChiron = mappedplanets [11];

    //double _latitude = 0.0,
    //   _longitude = 0.0,
    double
        earthlongitude = 0.0,
        southnodelongitude = 0.0;

    Hexagram sunSubStructure,
        earthSubStructure,
        northnodeSubStructure,
        southnodeSubStructure,
        moonSubStructure,
        mercurySubStructure,
        venusSubStructure,
        marsSubStructure,
        jupiterSubStructure,
        saturnSubStructure,
        uranusSubStructure,
        neptuneSubStructure,
        plutoSubStructure,
        chironSubStructure;

    try {

      sunSubStructure = getGateStructure(cwsSun.longitude);

      cwsSun.longitude < 180
          ? earthlongitude = cwsSun.longitude + 180
          : earthlongitude = cwsSun.longitude - 180;
      earthSubStructure = getGateStructure(earthlongitude);

      northnodeSubStructure = getGateStructure(cwsNorthnode.longitude);

      cwsNorthnode.longitude < 180
          ? southnodelongitude = cwsNorthnode.longitude + 180
          : southnodelongitude = cwsNorthnode.longitude - 180;
      southnodeSubStructure = getGateStructure(southnodelongitude);


      moonSubStructure = getGateStructure(cwsMoon.longitude);
      mercurySubStructure = getGateStructure(cwsMercury.longitude);
      venusSubStructure = getGateStructure(cwsVenus.longitude);
      marsSubStructure = getGateStructure(cwsMars.longitude);
      jupiterSubStructure = getGateStructure(cwsJupiter.longitude);
      saturnSubStructure = getGateStructure(cwsSaturn.longitude);
      uranusSubStructure = getGateStructure(cwsUranus.longitude);
      neptuneSubStructure = getGateStructure(cwsNeptune.longitude);
      plutoSubStructure = getGateStructure(cwsPluto.longitude);
      chironSubStructure = getGateStructure(cwsChiron.longitude);

      planetsHexagramList = [
        sunSubStructure,
        earthSubStructure,
        northnodeSubStructure,
        southnodeSubStructure,
        moonSubStructure,
        mercurySubStructure,
        venusSubStructure,
        marsSubStructure,
        jupiterSubStructure,
        saturnSubStructure,
        uranusSubStructure,
        neptuneSubStructure,
        plutoSubStructure,
        chironSubStructure
      ];
    } catch (err) {
      Exception(err);
    }

    return planetsHexagramList;
  }

  static Future<List<Hexagram>> mapOtherPlanets(List<CoordinatesWithSpeed> mapotherplanets) async {
    // based Swiss ephemeris new method

    List<Hexagram> otherPlanetsList = [];

    CoordinatesWithSpeed cwsChiron = mapotherplanets [0];

    Hexagram chironSubStructure;

    try {

      chironSubStructure = getGateStructure(cwsChiron.longitude);

      otherPlanetsList = [
        chironSubStructure
      ];
    } catch (err) {
      Exception(err);
    }

    return otherPlanetsList;
  }

  static Future<DateTime> getDesignTime(DateTime nowdesign) async {
    DateTime designTime = nowdesign;
    DateTime initialDesignDays = nowdesign.subtract(const Duration(days: 88));

    List<CoordinatesWithSpeed> cwsPersonalitydata, cwsDesigndata;
    double personsunlongitude,
        requiredlongitude,
        calculatedlongitude,
        gaplongitude;

    List<double> listgaplongitude = [0.0];

    CoordinatesWithSpeed cswSun, cswSunDesign;


    // initialize design time
    designTime = initialDesignDays;

    cwsPersonalitydata = await PlanetsServices.getPlanetsGatesNow(nowdesign);

    cswSun = cwsPersonalitydata [0];

    personsunlongitude = cswSun.longitude;

    // required 88 degress
    requiredlongitude = personsunlongitude - 88;
    if (requiredlongitude < 0) {
      requiredlongitude += 360;
    }

    // align in days
    do {
      cwsDesigndata = await PlanetsServices.getPlanetsGatesNow(designTime);
      cswSunDesign = cwsDesigndata[0];
      calculatedlongitude = cswSunDesign.longitude;
      gaplongitude = requiredlongitude - calculatedlongitude;

      //print ('1: $calculatedlongitude');

      if (gaplongitude > 270) {
        gaplongitude -= 360;
      }
      else if (gaplongitude < -270)
        {
          gaplongitude += 360;
        }


      if (gaplongitude > 0) {
        designTime = designTime.add(const Duration(days: 1));
      } else if (gaplongitude < 0) {
        designTime = designTime.subtract(const Duration(days: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 1;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 1 || gaplongitude < -1);

    // align in hours
    do {
      if (gaplongitude > 0.35) {
        designTime = designTime.add(const Duration(hours: 1));

      } else if (gaplongitude < -0.35) {
        designTime = designTime.subtract(const Duration(hours: 1));
      }


      cwsDesigndata = await PlanetsServices.getPlanetsGatesNow(designTime);
      cswSunDesign = cwsDesigndata[0];
      calculatedlongitude = cswSunDesign.longitude;
      gaplongitude = requiredlongitude - calculatedlongitude;

      //print ('2: $calculatedlongitude');

      if (gaplongitude > 270) {
        gaplongitude -= 360;
      }
      else if (gaplongitude < -270)
      {
        gaplongitude += 360;
      }


      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.35;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.35 || gaplongitude < -0.35);

    // align in 10 minutes
    do {
      if (gaplongitude > 0.01) {
        designTime = designTime.add(const Duration(minutes: 10));

      } else if (gaplongitude < -0.01) {
        designTime = designTime.subtract(const Duration(minutes: 10));
      }

      cwsDesigndata = await PlanetsServices.getPlanetsGatesNow(designTime);
      cswSunDesign = cwsDesigndata[0];
      calculatedlongitude = cswSunDesign.longitude;
      gaplongitude = requiredlongitude - calculatedlongitude;

      if (gaplongitude > 270) {
        gaplongitude -= 360;
      }
      else if (gaplongitude < -270)
      {
        gaplongitude += 360;
      }


      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 3]) {
        gaplongitude = 0.01;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.01 || gaplongitude < -0.01);

    // align in 1 minute
    do {
      if (gaplongitude > 0.001) {
        designTime = designTime.add(const Duration(minutes: 1));
      } else if (gaplongitude < -0.001) {
        designTime = designTime.subtract(const Duration(minutes: 1));
      }

      cwsDesigndata = await PlanetsServices.getPlanetsGatesNow(designTime);
      cswSunDesign = cwsDesigndata[0];
      calculatedlongitude = cswSunDesign.longitude;
      gaplongitude = requiredlongitude - calculatedlongitude;

      if (gaplongitude > 270) {
        gaplongitude -= 360;
      }
      else if (gaplongitude < -270)
      {
        gaplongitude += 360;
      }


      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 3]) {
        gaplongitude = 0.001;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 0.001 || gaplongitude < -0.001);

    // align in 10 seconds
    do {
      if (gaplongitude > 0.0001) {
        designTime = designTime.add(const Duration(seconds: 10));

      } else if (gaplongitude < -0.0001) {
        designTime = designTime.subtract(const Duration(seconds: 10));
      }

      cwsDesigndata = await PlanetsServices.getPlanetsGatesNow(designTime);
      cswSunDesign = cwsDesigndata[0];
      calculatedlongitude = cswSunDesign.longitude;
      gaplongitude = requiredlongitude - calculatedlongitude;

      if (gaplongitude > 270) {
        gaplongitude -= 360;
      }
      else if (gaplongitude < -270)
      {
        gaplongitude += 360;
      }


      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 3]) {
        gaplongitude = 0.0001;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 0.0001 || gaplongitude < -0.0001);

    // align in 1 seconds
    do {
      if (gaplongitude > 0.00001) {
        designTime = designTime.add(const Duration(seconds: 1));
      } else if (gaplongitude < -0.00001) {
        designTime = designTime.subtract(const Duration(seconds: 1));
      }

      cwsDesigndata = await PlanetsServices.getPlanetsGatesNow(designTime);
      cswSunDesign = cwsDesigndata[0];
      calculatedlongitude = cswSunDesign.longitude;
      gaplongitude = requiredlongitude - calculatedlongitude;

      if (gaplongitude > 270) {
        gaplongitude -= 360;
      }
      else if (gaplongitude < -270)
      {
        gaplongitude += 360;
      }


      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 3]) {
        gaplongitude = 0.00001;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 0.00001 || gaplongitude < -0.00001);

    // align in 100 milliseconds
    do {
      if (gaplongitude > 0.000005) {
        designTime = designTime.add(const Duration(milliseconds: 100));
      } else if (gaplongitude < -0.000005) {
        designTime = designTime.subtract(const Duration(milliseconds: 100));
      }

      cwsDesigndata = await PlanetsServices.getPlanetsGatesNow(designTime);
      cswSunDesign = cwsDesigndata[0];
      calculatedlongitude = cswSunDesign.longitude;
      gaplongitude = requiredlongitude - calculatedlongitude;

      if (gaplongitude > 270) {
        gaplongitude -= 360;
      }
      else if (gaplongitude < -270)
      {
        gaplongitude += 360;
      }


      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 3]) {
        gaplongitude = 0.000007;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 0.000007 || gaplongitude < -0.000007);

    return designTime;
  }

  static Future<List<Hexagram>> getCurrentData(DateTime nowdata) async {
    List<Hexagram> planetsList = [];
    List<CoordinatesWithSpeed> planets = [];

    //DateTime newtime;

    //print ('nowdata: $nowdata');

    planets = await PlanetsServices.getPlanetsGatesNow(nowdata);
    planetsList = await PlanetsServices.mapPlanets(planets);

    return planetsList;
  }

  static Future<DateTime> getSolarReturn(DateTime nowtime, int solaryear) async {

    DateTime solarreturntime;
    //List<DateTime> planetsreturns = [];

    // 10220 = 365 days * 28 years
    DateTime initialSolarReturn = DateTime (solaryear, nowtime.month, nowtime.minute, nowtime.second);;;

    //int calcyear = nowtime.year - solaryear;
    //solarreturntime = DateTime (solaryear, nowtime.month, nowtime.minute, nowtime.second);



    List<CoordinatesWithSpeed> cwsPersonalitydata, cwsSaturnReturndata;

    double saturnlongitude,
        requiredsaturnreturnlongitude,
        calcsaturnreturnlongitude,
        gapsaturnreturnlongitude,
        gaplongitude,
        requiredlongitude;

    List<double> listgaplongitude = [0.0];

    CoordinatesWithSpeed cswSaturn, cswSaturnReturn;

    cwsPersonalitydata = await PlanetsServices.getPlanetsGatesNow(nowtime);

    //position of Saturn in List
    cswSaturn = cwsPersonalitydata [7];

    saturnlongitude = cswSaturn.longitude;

    // add 28 years to Saturn Return
    cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(initialSolarReturn);
    cswSaturnReturn = cwsSaturnReturndata [7];
    calcsaturnreturnlongitude = cswSaturnReturn.longitude;

    requiredlongitude = saturnlongitude;

    solarreturntime = initialSolarReturn;

    // align in months
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(days: 30));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(days: 30));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 30;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 30 || gaplongitude < -30);

    // align in weeks
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('weeks: $calcsaturnreturnlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(days: 7));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(days: 7));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 7;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 7 || gaplongitude < -7);

    // align in days
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('days: $calcsaturnreturnlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(days: 1));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(days: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 1;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 1 || gaplongitude < -1);

    // align in hours
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('hours: $saturnlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(hours: 1));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(hours: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.35;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.35 || gaplongitude < -0.35);

    // align in 10 minutes
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('1: $calculatedlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(minutes: 10));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(minutes: 10));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.01;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.01 || gaplongitude < -0.01);

    // align in 1 minute
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('1: $calculatedlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(minutes: 1));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(minutes: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.001;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.001 || gaplongitude < -0.001);

    // align in 10 seconds
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('1: $calculatedlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(seconds: 10));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(seconds: 10));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.0001;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 0.0001 || gaplongitude < -0.0001);

    // align in 1 seconds
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('1: $calculatedlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(seconds: 1));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(seconds: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.00001;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 0.00001 || gaplongitude < -0.00001);

    // align in 100 milliseconds
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('1: $calculatedlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(milliseconds: 100));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(milliseconds: 10));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.000007;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 0.000007 || gaplongitude < -0.000007);

    return solarreturntime;
  }

  static Future<DateTime> getSaturnReturn(DateTime nowtime) async {

    DateTime solarreturntime, uranusoppositiontime, kironreturntime;
    //List<DateTime> planetsreturns = [];

    // 10220 = 365 days * 28 years
    DateTime initialSaturnReturn = nowtime.add(const Duration(days: 10220));

    List<CoordinatesWithSpeed> cwsPersonalitydata, cwsSaturnReturndata;

    double saturnlongitude,
        requiredsaturnreturnlongitude,
        calcsaturnreturnlongitude,
        gapsaturnreturnlongitude,
        gaplongitude,
        requiredlongitude;

    List<double> listgaplongitude = [0.0];

    CoordinatesWithSpeed cswSaturn, cswSaturnReturn;

    cwsPersonalitydata = await PlanetsServices.getPlanetsGatesNow(nowtime);

    //position of Saturn in List
    cswSaturn = cwsPersonalitydata [7];

    saturnlongitude = cswSaturn.longitude;

    // add 28 years to Saturn Return
    cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(initialSaturnReturn);
    cswSaturnReturn = cwsSaturnReturndata [7];
    calcsaturnreturnlongitude = cswSaturnReturn.longitude;

    requiredlongitude = saturnlongitude;

    solarreturntime = initialSaturnReturn;

    // align in months
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(days: 30));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(days: 30));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 30;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 30 || gaplongitude < -30);

    // align in weeks
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('weeks: $calcsaturnreturnlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(days: 7));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(days: 7));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 7;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 7 || gaplongitude < -7);

    // align in days
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('days: $calcsaturnreturnlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(days: 1));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(days: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 1;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 1 || gaplongitude < -1);

    // align in hours
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('hours: $saturnlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(hours: 1));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(hours: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.35;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.35 || gaplongitude < -0.35);

    // align in 10 minutes
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('1: $calculatedlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(minutes: 10));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(minutes: 10));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.01;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.01 || gaplongitude < -0.01);

    // align in 1 minute
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('1: $calculatedlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(minutes: 1));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(minutes: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.001;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.001 || gaplongitude < -0.001);

    // align in 10 seconds
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('1: $calculatedlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(seconds: 10));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(seconds: 10));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.0001;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 0.0001 || gaplongitude < -0.0001);

    // align in 1 seconds
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('1: $calculatedlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(seconds: 1));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(seconds: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.00001;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 0.00001 || gaplongitude < -0.00001);

    // align in 100 milliseconds
    do {
      cwsSaturnReturndata = await PlanetsServices.getPlanetsGatesNow(solarreturntime);
      cswSaturnReturn = cwsSaturnReturndata [7];
      calcsaturnreturnlongitude = cswSaturnReturn.longitude;
      gapsaturnreturnlongitude = saturnlongitude - calcsaturnreturnlongitude;
      gaplongitude = gapsaturnreturnlongitude;

      //print ('1: $calculatedlongitude');

      if (gaplongitude > 0) {
        solarreturntime = solarreturntime.add(const Duration(milliseconds: 100));
      } else if (gaplongitude < 0) {
        solarreturntime = solarreturntime.subtract(const Duration(milliseconds: 10));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.000007;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 0.000007 || gaplongitude < -0.000007);


    return solarreturntime;
  }

  static Future<DateTime> getUranusOpposition(DateTime nowtime) async {

    DateTime saturnreturntime, uranusoppositiontime, kironreturntime;
    //List<DateTime> planetsreturns = [];

    // 10220 = 365 days * 28 years
    int uranusdays = 365 * 38;
    DateTime initialUranusOpp = nowtime.add(Duration(days: uranusdays));

    List<CoordinatesWithSpeed> cwsPersonalitydata, cwsUranusOppdata;

    double uranuslong, uranusOpplong,
        reqUranusOpplong,
        calcUranusOpplong,
        gapUranusOpplong,
        gaplongitude,
        requiredlongitude;

    List<double> listgaplongitude = [0.0];

    CoordinatesWithSpeed cswUranus, cswUranusOpp;

    cwsPersonalitydata = await PlanetsServices.getPlanetsGatesNow(nowtime);

    //position of Uranus in List
    cswUranus = cwsPersonalitydata [8];

    uranuslong = cswUranus.longitude;
    reqUranusOpplong = uranuslong - 180;

    if (reqUranusOpplong < 0) {
      reqUranusOpplong += 360;
    }


    // add 38 years to Uranus Opposition
    cwsUranusOppdata = await PlanetsServices.getPlanetsGatesNow(initialUranusOpp);
    cswUranusOpp = cwsUranusOppdata [8];
    calcUranusOpplong = cswUranusOpp.longitude;

    requiredlongitude = reqUranusOpplong;

    uranusoppositiontime = initialUranusOpp;


    // align in months
    do {
      cwsUranusOppdata = await PlanetsServices.getPlanetsGatesNow(uranusoppositiontime);
      cswUranusOpp = cwsUranusOppdata [8];
      calcUranusOpplong = cswUranusOpp.longitude;
      gapUranusOpplong = requiredlongitude - calcUranusOpplong;
      gaplongitude = gapUranusOpplong;

      if (gaplongitude > 0) {
        uranusoppositiontime = uranusoppositiontime.add(const Duration(days: 30));
      } else if (gaplongitude < 0) {
        uranusoppositiontime = uranusoppositiontime.subtract(const Duration(days: 30));
      }

      print ('month: $gaplongitude');

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 1;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 1 || gaplongitude < -1);

    // align in weeks
    do {
      cwsUranusOppdata = await PlanetsServices.getPlanetsGatesNow(uranusoppositiontime);
      cswUranusOpp = cwsUranusOppdata [8];
      calcUranusOpplong = cswUranusOpp.longitude;
      gapUranusOpplong = requiredlongitude - calcUranusOpplong;
      gaplongitude = gapUranusOpplong;


      if (gaplongitude > 0) {
        uranusoppositiontime = uranusoppositiontime.add(const Duration(days: 7));
      } else if (gaplongitude < 0) {
        uranusoppositiontime = uranusoppositiontime.subtract(const Duration(days: 7));
      }

      print ('weeks: $gaplongitude');

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.068;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 0.068 || gaplongitude < -0.068);

    // align in days
    do {
      cwsUranusOppdata = await PlanetsServices.getPlanetsGatesNow(uranusoppositiontime);
      cswUranusOpp = cwsUranusOppdata [8];
      calcUranusOpplong = cswUranusOpp.longitude;
      gapUranusOpplong = requiredlongitude - calcUranusOpplong;
      gaplongitude = gapUranusOpplong;


      if (gaplongitude > 0) {
        uranusoppositiontime = uranusoppositiontime.add(const Duration(days: 1));
      } else if (gaplongitude < 0) {
        uranusoppositiontime = uranusoppositiontime.subtract(const Duration(days: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 1;
        listgaplongitude = [0.0];
      }
    } while (gaplongitude > 1 || gaplongitude < -1);

    // align in hours
    do {
      cwsUranusOppdata = await PlanetsServices.getPlanetsGatesNow(uranusoppositiontime);
      cswUranusOpp = cwsUranusOppdata [8];
      calcUranusOpplong = cswUranusOpp.longitude;
      gapUranusOpplong = requiredlongitude - calcUranusOpplong;
      gaplongitude = gapUranusOpplong;


      if (gaplongitude > 0) {
        uranusoppositiontime = uranusoppositiontime.add(const Duration(hours: 1));
      } else if (gaplongitude < 0) {
        uranusoppositiontime = uranusoppositiontime.subtract(const Duration(hours: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.35;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.35 || gaplongitude < -0.35);

    // align in 10 minutes
    do {
      cwsUranusOppdata = await PlanetsServices.getPlanetsGatesNow(uranusoppositiontime);
      cswUranusOpp = cwsUranusOppdata [8];
      calcUranusOpplong = cswUranusOpp.longitude;
      gapUranusOpplong = requiredlongitude - calcUranusOpplong;
      gaplongitude = gapUranusOpplong;


      if (gaplongitude > 0) {
        uranusoppositiontime = uranusoppositiontime.add(const Duration(minutes: 10));
      } else if (gaplongitude < 0) {
        uranusoppositiontime = uranusoppositiontime.subtract(const Duration(minutes: 10));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.01;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.01 || gaplongitude < -0.01);

    // align in 1 minute
    do {
      cwsUranusOppdata = await PlanetsServices.getPlanetsGatesNow(uranusoppositiontime);
      cswUranusOpp = cwsUranusOppdata [8];
      calcUranusOpplong = cswUranusOpp.longitude;
      gapUranusOpplong = requiredlongitude - calcUranusOpplong;
      gaplongitude = gapUranusOpplong;


      if (gaplongitude > 0) {
        uranusoppositiontime = uranusoppositiontime.add(const Duration(minutes: 1));
      } else if (gaplongitude < 0) {
        uranusoppositiontime = uranusoppositiontime.subtract(const Duration(minutes: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.001;
        listgaplongitude = [0.0];
      }


    } while (gaplongitude > 0.001 || gaplongitude < -0.001);

    // align in 10 seconds
    do {
      cwsUranusOppdata = await PlanetsServices.getPlanetsGatesNow(uranusoppositiontime);
      cswUranusOpp = cwsUranusOppdata [8];
      calcUranusOpplong = cswUranusOpp.longitude;
      gapUranusOpplong = requiredlongitude - calcUranusOpplong;
      gaplongitude = gapUranusOpplong;

      if (gaplongitude > 0) {
        uranusoppositiontime = uranusoppositiontime.add(const Duration(seconds: 10));
      } else if (gaplongitude < 0) {
        uranusoppositiontime = uranusoppositiontime.subtract(const Duration(seconds: 10));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.0001;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.0001 || gaplongitude < -0.0001);

    // align in 1 seconds
    do {
      cwsUranusOppdata = await PlanetsServices.getPlanetsGatesNow(uranusoppositiontime);
      cswUranusOpp = cwsUranusOppdata [8];
      calcUranusOpplong = cswUranusOpp.longitude;
      gapUranusOpplong = requiredlongitude - calcUranusOpplong;
      gaplongitude = gapUranusOpplong;


      if (gaplongitude > 0) {
        uranusoppositiontime = uranusoppositiontime.add(const Duration(seconds: 1));
      } else if (gaplongitude < 0) {
        uranusoppositiontime = uranusoppositiontime.subtract(const Duration(seconds: 1));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.00001;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.00001 || gaplongitude < -0.00001);

    // align in 100 milliseconds
    do {
      cwsUranusOppdata = await PlanetsServices.getPlanetsGatesNow(uranusoppositiontime);
      cswUranusOpp = cwsUranusOppdata [8];
      calcUranusOpplong = cswUranusOpp.longitude;
      gapUranusOpplong = requiredlongitude - calcUranusOpplong;
      gaplongitude = gapUranusOpplong;


      if (gaplongitude > 0) {
        uranusoppositiontime = uranusoppositiontime.add(const Duration(milliseconds: 100));
      } else if (gaplongitude < 0) {
        uranusoppositiontime = uranusoppositiontime.subtract(const Duration(milliseconds: 100));
      }

      // avoid loop
      listgaplongitude.add(gaplongitude);
      if (listgaplongitude.length > 3 &&
          listgaplongitude.last ==
              listgaplongitude[listgaplongitude.length - 2]) {
        gaplongitude = 0.000007;
        listgaplongitude = [0.0];
      }

    } while (gaplongitude > 0.000007 || gaplongitude < -0.000007);



    return uranusoppositiontime;
  }
}
