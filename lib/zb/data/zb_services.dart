import 'package:finallyicanlearn/zb/data/zb_listdb.dart';
import 'package:sweph/sweph.dart';
import 'package:finallyicanlearn/zb/data/zb_classes.dart';
import 'package:finallyicanlearn/zb/data/zb_extensions.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

class ZBAssetLoader with AssetLoader {
  @override
  Future<Uint8List> load(String assetPath) async {
    // 1. Remove any leading slash that might cause a File-Not-Found on Android
    final String key =
        assetPath.startsWith('/') ? assetPath.substring(1) : assetPath;

    // debugPrint("ZB_DEBUG: Loader attempting to fetch: $key");

    try {
      final byteData = await rootBundle.load(key);
      // debugPrint(
      //     "ZB_DEBUG: Successfully loaded $key (${byteData.lengthInBytes} bytes)");
      return byteData.buffer.asUint8List();
    } catch (e) {
      // debugPrint(
      //     "ZB_DEBUG: ERROR - Could not find asset: $key. Check pubspec.yaml!");
      rethrow;
    }
  }
}

abstract class ZBExternalService {
  /// The 12 primary bodies we fetch from the Ephemeris.
  /// We exclude Earth and South Node because they are calculated mirrors.
  static const List<String> _fetchPlanetNames = [
    'Sun',
    'North Node',
    'Moon',
    'Mercury',
    'Venus',
    'Mars',
    'Jupiter',
    'Saturn',
    'Uranus',
    'Neptune',
    'Pluto',
    'Chiron'
  ];

  // Change List<int> to List<HeavenlyBody>
  static const List<HeavenlyBody> _fetchPlanetBodies = [
    HeavenlyBody.SE_SUN,
    HeavenlyBody.SE_TRUE_NODE,
    HeavenlyBody.SE_MOON,
    HeavenlyBody.SE_MERCURY,
    HeavenlyBody.SE_VENUS,
    HeavenlyBody.SE_MARS,
    HeavenlyBody.SE_JUPITER,
    HeavenlyBody.SE_SATURN,
    HeavenlyBody.SE_URANUS,
    HeavenlyBody.SE_NEPTUNE,
    HeavenlyBody.SE_PLUTO,
    HeavenlyBody.SE_CHIRON,
  ];

  /// MASTER FETCH: Sweph -> ZBWallets
  /// Use this for both Personality and Design calculations.

  /// Finds the Design Time (88 degrees before Birth Sun)
  static double _calculateJulianDay(DateTime now) {
    final utc = now; // Ensure this is UTC if required by your UI logic
    final double hours = utc.hour +
        (utc.minute / 60.0) +
        (utc.second / 3600.0) +
        (utc.millisecond / 3600000.0);

    return Sweph.swe_julday(
      utc.year,
      utc.month,
      utc.day,
      hours,
      CalendarType.SE_GREG_CAL,
    );
  }

  static Future<DateTime> getDesignTime(DateTime birthTime) async {
    final pData = await fetchWalletsForTime(birthTime);
    if (pData.isEmpty) return birthTime;

    double pSunLon = pData[0].longitude!;
    double targetLong = (pSunLon - 88.0) % 360;
    if (targetLong < 0) targetLong += 360;

    DateTime currentGuess = birthTime.subtract(const Duration(days: 90));

    // Refinement steps
    currentGuess = await _refineToTarget(currentGuess, targetLong,
        HeavenlyBody.SE_SUN, const Duration(days: 1), 0.5);
    currentGuess = await _refineToTarget(currentGuess, targetLong,
        HeavenlyBody.SE_SUN, const Duration(hours: 1), 0.05);
    currentGuess = await _refineToTarget(currentGuess, targetLong,
        HeavenlyBody.SE_SUN, const Duration(minutes: 1), 0.0005);
    currentGuess = await _refineToTarget(currentGuess, targetLong,
        HeavenlyBody.SE_SUN, const Duration(seconds: 1), 0.000005);

    return currentGuess;
  }

  static Future<DateTime> _refineToTarget(DateTime start, double target,
      HeavenlyBody body, Duration step, double tolerance) async {
    DateTime current = start;
    double lastGap = 999.0;

    while (true) {
      final jd = _calculateJulianDay(current);

      // ✅ FIXED: Changed SE_SUN to 'body' so it refines Saturn, Chiron, etc.
      final res = Sweph.swe_calc_ut(jd, body, SwephFlag.SEFLG_SWIEPH);
      double currentLon = res.longitude;

      double gap = target - currentLon;

      while (gap > 180) {
        gap -= 360;
      }
      while (gap < -180) {
        gap += 360;
      }

      if (gap.abs() < tolerance) break;

      if (gap.abs() > lastGap.abs()) {
        if (gap > 0) {
          current = current.subtract(step);
        } else {
          current = current.add(step);
        }
        break;
      }

      lastGap = gap;

      if (gap > 0) {
        current = current.add(step);
      } else {
        current = current.subtract(step);
      }
    }
    return current;
  }

  // Update this line to accept 3 arguments
  static ZBWallet _buildWallet(String name, double lon, int zodiacId) {
    // 1. Create the 'Raw' wallet with the longitude AND the passed zodiacId
    final rawwallet = ZBWallet(
      wallet: 0,
      longitude: lon,
      planet: name,
      zodiacid: zodiacId, // Now correctly populated
      zodiacsign: zodiacSwephlist[zodiacId], // Map to string name
    );

    // 2. Run extensions for Gate/Line/Story
    return rawwallet.getwalletsub.getwalletsentence;
  }

  /// MASTER FETCH: Sweph -> ZBWallets
  static Future<List<ZBWallet>> fetchWalletsForTime(DateTime time) async {
    final jd = _calculateJulianDay(time);
    List<ZBWallet> wallets = [];

    try {
      for (int i = 0; i < _fetchPlanetBodies.length; i++) {
        // 1. Get raw position
        final res = Sweph.swe_calc_ut(
            jd, _fetchPlanetBodies[i], SwephFlag.SEFLG_SWIEPH);

        // 2. Get Zodiac ID using SplitDegFlags (Moved here to keep Service logic together)
        final planetDSP = Sweph.swe_split_deg(
          res.longitude,
          SplitDegFlags.SE_SPLIT_DEG_ZODIACAL,
        );

        // 3. Pass both longitude AND the pre-calculated Zodiac ID to the builder
        wallets.add(_buildWallet(
          _fetchPlanetNames[i],
          res.longitude,
          planetDSP.sign, // Pass the 0-11 index
        ));
      }

      _injectMirrors(wallets);
    } catch (e) {
      return [];
    }

    return wallets;
  }

  static void _injectMirrors(List<ZBWallet> list) {
    // 1. Earth is Sun (Index 0) + 180°
    double lonEarth = (list[0].longitude! + 180) % 360;

    // Calculate Zodiac ID for Earth
    int earthZodiac =
        Sweph.swe_split_deg(lonEarth, SplitDegFlags.SE_SPLIT_DEG_ZODIACAL).sign;

    // Pass all 3 arguments: name, longitude, and zodiacId
    list.insert(1, _buildWallet('Earth', lonEarth, earthZodiac));

    // 2. South Node is North Node (Now at Index 2) + 180°
    double lonSN = (list[2].longitude! + 180) % 360;

    // Calculate Zodiac ID for South Node
    int snZodiac =
        Sweph.swe_split_deg(lonSN, SplitDegFlags.SE_SPLIT_DEG_ZODIACAL).sign;

    // Pass all 3 arguments: name, longitude, and zodiacId
    list.insert(3, _buildWallet('South Node', lonSN, snZodiac));
  }

  static Future<ZBPhase> getStep(DateTime birth, List<ZBWallet> natal) async {
    final now = DateTime.now();

    // 1. Saturn Return (~29 yrs)
    final saturns = await findCycleWindows(
      body: HeavenlyBody.SE_SATURN,
      targetLon: natal[9].longitude!,
      searchStart: birth.add(const Duration(days: 365 * 28)),
    );
    if (saturns.isEmpty || now.isBefore(saturns.first)) return ZBPhase.youth;

    // 2. Uranus Opposition (~42 yrs)
    double uOpp = (natal[10].longitude! + 180) % 360;
    final uranusOpp = await findCycleWindows(
      body: HeavenlyBody.SE_URANUS,
      targetLon: uOpp,
      searchStart: birth.add(const Duration(days: 365 * 38)),
    );
    if (uranusOpp.isEmpty || now.isBefore(uranusOpp.first))
      return ZBPhase.prime;

    // 3. Chiron Return (~50 yrs)
    final chirons = await findCycleWindows(
      body: HeavenlyBody.SE_CHIRON,
      targetLon: natal[13].longitude!,
      searchStart: birth.add(const Duration(days: 365 * 48)),
    );
    if (chirons.isEmpty || now.isBefore(chirons.first)) return ZBPhase.wisdom;

    return ZBPhase.elder;
  }

  static Future<List<DateTime>> findCycleWindows({
    required HeavenlyBody body,
    required double targetLon,
    required DateTime searchStart,
    Duration scanWindow = const Duration(days: 365 * 2),
  }) async {
    List<DateTime> results = [];
    DateTime current = searchStart;
    DateTime end = searchStart.add(scanWindow);
    double? lastGap;

    Duration step = (body == HeavenlyBody.SE_MOON)
        ? const Duration(hours: 1)
        : const Duration(days: 1);

    while (current.isBefore(end)) {
      final jd = _calculateJulianDay(current);
      final res = Sweph.swe_calc_ut(jd, body, SwephFlag.SEFLG_SWIEPH);
      double gap = (res.longitude - targetLon);

      while (gap > 180) {
        gap -= 360;
      }
      while (gap < -180) {
        gap += 360;
      }

      if (lastGap != null && (lastGap.isNegative != gap.isNegative)) {
        DateTime exact = await _refineToTarget(
          current.subtract(step),
          targetLon,
          body,
          const Duration(minutes: 1),
          0.000005,
        );
        results.add(exact);
      }
      lastGap = gap;
      current = current.add(step);
    }
    return results;
  }
}

abstract class ZBCycleService extends ZBExternalService {
  /// Calculates planetary returns or oppositions.
}

enum ZBPhase { youth, prime, wisdom, elder }
