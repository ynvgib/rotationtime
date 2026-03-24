import 'package:sweph/sweph.dart';
import 'package:finallyicanlearn/zb/data/zb_classes.dart';
import 'package:finallyicanlearn/zb/data/zb_extensions.dart';

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
    // 🚀 CRITICAL: Swiss Ephemeris requires Universal Time (UTC)
    final utc = now;
    // final utc = now.toUtc();

    // Include milliseconds for ultra-precise iterative convergence
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

    // Start slightly before 88 days to approach from the "past"
    DateTime currentGuess = birthTime.subtract(const Duration(days: 90));

    // Step-down refinement
    currentGuess = await _refineToTarget(
        currentGuess, targetLong, const Duration(days: 1), 0.5);
    currentGuess = await _refineToTarget(
        currentGuess, targetLong, const Duration(hours: 1), 0.05);
    currentGuess = await _refineToTarget(
        currentGuess, targetLong, const Duration(minutes: 1), 0.0005);
    currentGuess = await _refineToTarget(
        currentGuess, targetLong, const Duration(seconds: 1), 0.000005);

    // print("DEBUG: Final Design Time: ${currentGuess.toIso8601String()}");
    return currentGuess;
  }

  static Future<DateTime> _refineToTarget(
      DateTime start, double target, Duration step, double tolerance) async {
    DateTime current = start;
    double lastGap = 999.0;

    while (true) {
      final jd = _calculateJulianDay(current);

      // ✅ FIX: Use HeavenlyBody.SE_SUN instead of 0
      final res =
          Sweph.swe_calc_ut(jd, HeavenlyBody.SE_SUN, SwephFlag.SEFLG_SWIEPH);
      double currentLon = res.longitude;
      // print("DEBUG: SWEPH SUN LONG: ${res.longitude}"); // 👈 Add

      double gap = target - currentLon;

      // ✅ FIX: Enclose while statements in blocks {}
      while (gap > 180) {
        gap -= 360;
      }
      while (gap < -180) {
        gap += 360;
      }

      if (gap.abs() < tolerance) break;

      // If we are moving away from the target, we passed it
      if (gap.abs() > lastGap.abs()) {
        // Back-step one unit to stay on the correct side
        if (gap > 0) {
          current = current.subtract(step);
        } else {
          current = current.add(step);
        }
        break;
      }

      lastGap = gap;

      // Move time forward or backward toward the target
      if (gap > 0) {
        current = current.add(step);
      } else {
        current = current.subtract(step);
      }
    }
    return current;
  }

  static ZBWallet _buildWallet(String name, double lon) {
    // 1. Create the 'Raw' wallet with just the longitude
    final rawwallet = ZBWallet(
      wallet: 0, // Placeholder, getwalletsub will overwrite this
      longitude: lon,
      planet: name,
    );

    // final withWallet = rawwallet.getwalletsub;
    // print("DEBUG: $name Lon: $lon -> Calculated Wallet: ${withWallet.wallet}");

    // 2. Run the extensions to calculate the Gate (walletid) and Story
    return rawwallet.getwalletsub.getwalletsentence;
  }

  /// MASTER FETCH: Sweph -> ZBWallets
  static Future<List<ZBWallet>> fetchWalletsForTime(DateTime time) async {
    // print(
    //     "DEBUG fetchWalletsForTime: input=${time.toIso8601String()} isUtc=${time.isUtc}");

    final jd = _calculateJulianDay(time);
    List<ZBWallet> wallets = [];

    try {
      // 1. Fetch the 12 Primary Positions (Sun, NN, Moon, etc.)
      for (int i = 0; i < _fetchPlanetBodies.length; i++) {
        final res = Sweph.swe_calc_ut(
            jd, _fetchPlanetBodies[i], SwephFlag.SEFLG_SWIEPH);
        // print(
        //     "DEBUG: SWEPH RES ${_fetchPlanetBodies[i]} LONG: ${res.longitude}"); // 👈 Add

        // _buildWallet must apply the +58 shift and Mandala list mapping internally
        wallets.add(_buildWallet(_fetchPlanetNames[i], res.longitude));
      }

      // 2. Pass the full list to inject mirrors at the correct indices
      _injectMirrors(wallets);
    } catch (e) {
      print("ZBExternalService Fetch Error: $e");
      return [];
    }

    return wallets;
  }

  static void _injectMirrors(List<ZBWallet> list) {
    // Earth is Sun (Index 0) + 180°
    // Using modulo 360 ensures it stays within the circle bounds
    double lonEarth = (list[0].longitude! + 180) % 360;
    list.insert(1, _buildWallet('Earth', lonEarth));

    // South Node is North Node (Now at Index 2) + 180°
    // Because Earth was inserted at [1], North Node moved from [1] to [2]
    double lonSN = (list[2].longitude! + 180) % 360;
    list.insert(3, _buildWallet('South Node', lonSN));

    // DEBUG: Verify the 180-degree axis
    // print("DEBUG: Sun Gate: ${list[0].wallet} | Earth Gate: ${list[1].wallet}");
  }
}
