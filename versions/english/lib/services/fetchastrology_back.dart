import 'dart:async';

import 'package:finallyicanlearn/logic/hdsubstructure.dart';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:sweph/sweph.dart';

class AstrologyServices {
  static Future<List<CoordinatesWithSpeed>> getPlanetsGatesNow(DateTime now) async {
    final List<CoordinatesWithSpeed> cswPlanets;

    double latitude = 0.0, longitude = 0.0;

    final secondsInMinutes = now.second / 60;
    final minutesInHours  = (now.minute + secondsInMinutes) / 60;
    final hours  = now.hour + minutesInHours;


    final jd = Sweph.swe_julday(now.year, now.month, now.day, hours, CalendarType.SE_GREG_CAL);


    final CoordinatesWithSpeed posSun, posEarth, posNorthnode, posSouthnode,
        posMoon, posMercury, posVenus, posMars, posJupiter,
        posSaturn, posUranus, posNeptune, posPluto;

    //posChiron - not added for now - 16042023


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
    //posChiron = Sweph.swe_calc_ut(jd, HeavenlyBody.SE_CHIRON, SwephFlag.SEFLG_SWIEPH);

    cswPlanets = [posSun, posNorthnode, posMoon,
      posMercury, posVenus,
      posMars, posJupiter, posSaturn,
      posUranus, posNeptune, posPluto];

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
        cwsPluto = mappedplanets [10];
    //cwsChiron = mappedplanets [11];

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
        plutoSubStructure;
    //chironSubStructure;

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
      //chironSubStructure = getGateStructure(cwsChiron.longitude);

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
        plutoSubStructure
      ];
    } catch (err) {
      Exception(err);
    }

    return planetsHexagramList;
  }

  static Future<DateTime> getDesignTime(DateTime nowdesign) async {
    DateTime designTime = nowdesign;
    DateTime initialDesignDays = nowdesign.subtract(const Duration(days: 88));
    List<CoordinatesWithSpeed> cwsDesigndata;
    List<CoordinatesWithSpeed> cwsPersonalitydata;
    double personsunlongitude,
        requiredlongitude,
        calculatedlongitude,
        gaplongitude;

    List<double> listgaplongitude = [0.0];

    CoordinatesWithSpeed cswSun, cswSunDesign;


    // initialize design time
    designTime = initialDesignDays;

    cwsPersonalitydata = await AstrologyServices.getPlanetsGatesNow(nowdesign);

    cswSun = cwsPersonalitydata [0];

    personsunlongitude = cswSun.longitude;

    // required 88 degress
    requiredlongitude = personsunlongitude - 88;
    if (requiredlongitude < 0) {
      requiredlongitude += 360;
    }

    // align in days
    do {
      cwsDesigndata = await AstrologyServices.getPlanetsGatesNow(designTime);
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


      cwsDesigndata = await AstrologyServices.getPlanetsGatesNow(designTime);
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

      cwsDesigndata = await AstrologyServices.getPlanetsGatesNow(designTime);
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

      cwsDesigndata = await AstrologyServices.getPlanetsGatesNow(designTime);
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

      cwsDesigndata = await AstrologyServices.getPlanetsGatesNow(designTime);
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

      cwsDesigndata = await AstrologyServices.getPlanetsGatesNow(designTime);
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

      cwsDesigndata = await AstrologyServices.getPlanetsGatesNow(designTime);
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

    planets = await AstrologyServices.getPlanetsGatesNow(nowdata);
    planetsList = await AstrologyServices.mapPlanets(planets);

    return planetsList;
  }
}
