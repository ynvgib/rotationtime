import 'dart:ui' as ui;
import 'package:finallyicanlearn/zb/data/zb_listdb.dart';
import 'package:finallyicanlearn/zb/data/zb_classes.dart';
import 'package:finallyicanlearn/zb/data/zb_data.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

// ##########################################################################
// ABSTRACT CLASS GROUPS: FOR FUTURE REFACTORING
// ##########################################################################
// The Universal Account (The "Receipt")
// CALCULATION RESULT — used by RotateComplex
enum ZBTheme { zb, hd }

class ZBAccount {
  final List<ZBWallet> zbpersonality;
  final List<ZBWallet> zbdesign;
  final List<ZBTransaction> zbtransactions;
  final List<ZBCounter> zbcounters;
  final DateTime timestamp;
  final DateTime designtimestamp;
  final bool isJustNow;

  // 💡 NEW: The "Heavy" HD Data
  final String type;
  final String subtype;
  final String authority;
  final String subauthority;
  final String strategy;
  final String definition;
  final String sentence;
  final int typeid;
  final int authid;

  ZBAccount({
    required this.zbpersonality,
    this.zbdesign = const [],
    required this.zbtransactions,
    required this.zbcounters,
    required this.timestamp,
    required this.designtimestamp,
    this.isJustNow = false,
    // Add these to the constructor
    this.type = "",
    this.subtype = "",
    this.authority = "",
    this.subauthority = "",
    this.strategy = "",
    this.definition = "",
    this.sentence = "",
    this.typeid = 0,
    this.authid = 0,
  });
}

/// GROUP A: THE BODY (GEOMETRY & PATHS)
/// Use this to store the mathematical definitions of your triangles, squares, and diamonds.
abstract class ZBPaths {
  // Centralizing the math for the shapes

  static Path head(Size size) => Path()
    ..moveTo(size.width / 2, 0)
    ..lineTo(0, size.height)
    ..lineTo(size.width, size.height)
    ..close();

  static Path ajna(Size size) => Path()
    ..moveTo(size.width / 2, size.height)
    ..lineTo(0, 0)
    ..lineTo(size.width, 0)
    ..close();

  static Path throat(Size size) =>
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

  static Path self(Size size) {
    var path = Path();
    var radius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);
    for (int i = 0; i <= 4; i++) {
      double angle = (math.pi * 2 / 4) * i;
      double x = radius * math.cos(angle) + center.dx;
      double y = radius * math.sin(angle) + center.dy;
      i == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
    }
    return path..close();
  }

  static Path spleen(Size size) => Path()
    ..moveTo(size.width, size.height / 2)
    ..lineTo(0, 0)
    ..lineTo(0, size.height)
    ..close();

  static Path solar(Size size) => Path()
    ..moveTo(0, size.height / 2)
    ..lineTo(size.width, 0)
    ..lineTo(size.width, size.height)
    ..close();

  static Path heart(Size size) {
    const double apex = -5.0;
    const double rise = 7.0;
    return Path()
      ..moveTo(size.width / 2 + apex, 0)
      ..lineTo(0, size.height - rise)
      ..lineTo(size.width, size.height)
      ..close();
  }

  // You'll eventually add Throat (Rect), G-Center (Diamond), etc.
  /// Provides coordinate adjustments for specific wallets to ensure
  /// visual alignment within the chart centers and channels.
  static Offset getWalletOffset(int walletId) {
    switch (walletId) {
      case 48:
        return const Offset(-2, -4);
      case 10:
      case 20:
      case 34:
      case 57:
        // Adjustments for Integration Center alignment
        return const Offset(0, 5);
      case 5:
        // Example: vertical alignment fix for sacral path
        return const Offset(3, 0);
      default:
        return Offset.zero;
    }
  }
}

/// GROUP B: THE CIRCULATION (CHANNEL & STYLES)
abstract class ZBStyles {
  static Color getEvolutionColor(
      {required int toneDesign, required int tonePerson}) {
    int state;
    if (toneDesign > 3) {
      state = (tonePerson > 3) ? 2 : 3; // Silence (Red) or Breath (Yellow)
    } else {
      state = (tonePerson > 3) ? 4 : 5; // Simple (Green) or COMPLEX (Blue)
    }
    return ZBStory.getfrequency(state).zbcolor;
  }

  /// The Final Index Resolver for Counter Colors
  static Color getCounterColor(
    String id, {
    required int state,
    required bool isManual,
    required Color pickedColor,
    required ZBTheme zbtheme, // Pass the current state of the toggle
  }) {
    // 1. Manual Overrides (Taps in the Sandbox)
    if (isManual || state == 7) return pickedColor;
    if (state == 9) return Colors.grey;

    // 2. THE THEME FORK
    if (zbtheme == ZBTheme.hd) {
      // HD Logic: If Simple (4) or Ghost (0) -> White/Open
      if (state == 4 || state == 0) return Colors.white;

      // If Defined (Complex/Silence/Both), use HD Structural Colors
      return _getHDIdentityColor(id);
    }

    // 3. ZB Logic: Use the Frequency/Transaction Story
    return ZBStory.getfrequency(state).zbcolor;
  }

  static Color _getHDIdentityColor(String id) {
    switch (id) {
      case 'head':
      case 'self':
        return Colors.yellow;
      case 'ajna':
        return Colors.green;
      case 'solar':
      case 'throat':
      case 'root':
      case 'spleen':
        return Colors.brown;
      case 'heart':
      case 'sacral':
        return Colors.red;
      default:
        return Colors.grey.shade400;
    }
  }

  static Widget buildWalletLayout({
    required String counterId,
    required Map<String, ZBCounter> registry,
    required Widget Function(int) walletBuilder,
  }) {
    // 1. Pull the wallet list for this specific center (Head, Ajna, etc.)
    final wallets = registry[counterId]?.wallets ?? [];

    return Stack(
      clipBehavior: Clip.none,
      children: wallets.map((id) {
        // 2. Find the position configuration for this wallet ID
        final pos = ZBData.walletPositions.firstWhere(
          (p) => p.wallet == id,
          orElse: () => ZBWalletPos(wallet: id),
        );

        // 3. Return the positioned wallet
        return Positioned(
          top: pos.postop,
          bottom: pos.posbottom,
          left: pos.posleft,
          right: pos.posright,
          child: walletBuilder(id),
        );
      }).toList(),
    );
  }

  static Color setCounterColor(int state, Color pickedcolor,
      {ZBTheme theme = ZBTheme.zb, String id = ''}) {
    // If we have a theme and an ID, redirect to the new smart logic
    if (theme == ZBTheme.hd) {
      return getCounterColor(id,
          state: state,
          isManual: false,
          pickedColor: pickedcolor,
          zbtheme: theme);
    }

    // Fallback to the old list-based logic for ZB
    List<Color> countercolorlist = List.from(ZBStory.zbColors);
    countercolorlist.add(pickedcolor);

    if (state >= 0 && state < countercolorlist.length) {
      return countercolorlist[state];
    }
    return Colors.pinkAccent;
  }

  static Widget buildWalletText(int n,
      {int state = 0, ZBTheme theme = ZBTheme.zb}) {
    // Logic: States 0 (Empty) and 4 (Simple/Green) are "Open"
    final bool isOpen = (state == 0 || state == 4);

    Color circleColor;
    Color textColor;
    double opacity = 1.0;

    if (theme == ZBTheme.hd) {
      // HD MODE
      // If Open: Light Grey circle (to match HD Open Center style)
      // If Active: Solid White circle
      circleColor = isOpen
          ? Colors.transparent
          // : const ui.Color.fromARGB(255, 21, 7, 152);
          : Colors.white;
      textColor = isOpen ? Colors.black : Colors.black;
      // opacity = 1.0; // Dim the open gate numbers slightly
    } else {
      // ZB MODE
      // If Open: Transparent (it sits on the Green counter background)
      // If Active: Solid White
      circleColor = isOpen ? Colors.transparent : Colors.white;
      textColor = Colors.black;
    }

    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
        // MECHANICAL FIX:
        // 1. If we are in HD and the gate is Open, return null (No border).
        // 2. If we are in ZB and the gate is Open, return null (Floating number).
        // 3. Otherwise, draw the appropriate border for defined states.
        border: isOpen
            ? null
            : Border.all(
                color: Colors.black,
                width: theme == ZBTheme.hd ? 0.8 : 0.5,
              ),
      ),
      child: Center(
        child: Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(n < 10 ? 1.0 : 0.0, 0.0),
            child: Text(
              '$n',
              style: TextStyle(
                fontSize: 9,
                fontWeight: isOpen ? FontWeight.normal : FontWeight.bold,
                color: textColor,
                // ── THE CENTERING TRINITY ──
                height: 1.0, // Removes extra space above/below the glyph
                leadingDistribution:
                    TextLeadingDistribution.even, // Balanced distribution
                textBaseline: TextBaseline.alphabetic, // Stable baseline
              ),
            ),
          ),
        ),
      ),
    );
  }

  static List<Color> setWalletColor(int state, {ZBTheme theme = ZBTheme.zb}) {
    if (theme == ZBTheme.zb) {
      return ZBGradientColor.fromZBState(state).colors;
    } else {
      // ── THE BRIDGE: Map ZB States to HD Indices ─────────────────
      int hdKey;
      switch (state) {
        case 2:
          hdKey = 1;
          break; // ZB Silence (Red) -> HD Red
        case 5:
          hdKey = 3;
          break; // ZB Complex (Blue) -> HD Black
        case 9:
          hdKey = 2;
          break; // ZB Red/Blue Mix -> HD Red/Black Split
        case 4:
          hdKey = 4;
          break; // ZB Simple (Green) -> HD White
        default:
          hdKey = state; // Fallback for direct matches (1, 3, 4)
      }

      return (ZBGradientColor.hdStyles[hdKey] ?? ZBGradientColor.hdDefault)
          .colors;
    }
  }

  static List<ZBTransformation> buildTransformations(ZBAccount? account) {
    if (account == null ||
        account.zbdesign.isEmpty ||
        account.zbpersonality.isEmpty) {
      return [];
    }

    // 1. Extraction: Define the Source Wallets
    final ZBWallet dSun = account.zbdesign[0]; // Internal Design
    final ZBWallet pSun = account.zbpersonality[0]; // Internal Personality
    final ZBWallet dNodes = account.zbdesign[2]; // External Design
    final ZBWallet pNodes = account.zbpersonality[2]; // External Personality

    // 2. Helper: Maps the Variable to the ZBStory Frequency State
    ZBTransformation _mapToVar({
      required String id,
      required String label,
      required int zbState, // 2, 3, 4, or 5
      required ZBWallet source,
    }) {
      final freq = ZBStory.getfrequency(zbState);
      return ZBTransformation(
        id: id,
        label: label,
        // Pulling asset and color directly from the Frequency Story
        asset: 'assets/camog/${freq.zbanimalimg}',
        color: freq.zbcolor,
        arrow: ZBLogic.getTransformationArrow(source.hdtone),
        hdcolor: source.hdcolor ?? 0,
        hdtone: source.hdtone ?? 0,
        hdbase: source.hdbase ?? 0,
      );
    }

    return [
      _mapToVar(
          id: 'determination',
          label: "Determination",
          zbState: 2,
          source: dSun),
      _mapToVar(
          id: 'motivation', label: "Motivation", zbState: 5, source: pSun),
      _mapToVar(
          id: 'environment', label: "Environment", zbState: 3, source: dNodes),
      _mapToVar(
          id: 'perspective', label: "Perspective", zbState: 4, source: pNodes),
    ];
  }
}

/// GROUP D: THE SOUL (ASSET MAPPING)
/// Use this to organize image paths for animals and coins.
abstract class ZBAssets {
  // Future: static const String fullCoins = 'assets/coins/fullcoins.png';
}

/// GROUP E: THE LOGIC (COMPLEX VS SIMPLE ENGINES)
/// Use this to house the calculations for Time, Astrology, and autonomic updates.
// rotatecleanwidgets.dart

abstract class ZBLogic {
  static ZBPlanet getPlanetByIndex(int index) {
    // Simple bounds check to prevent crashes
    if (index >= 0 && index < ZBData.getzbplanets.length) {
      return ZBData.getzbplanets[index];
    }
    return ZBData.getzbplanets[0]; // Fallback to Sun
  }

  static ZBAccount? currentAccount;
  static String? _lastAccountSnapshot;

  /// The "Golden Sync": Restores the global counterMap from the account data.
  /// This clears the 'Sandbox White' (state 4) residue from RotateSimple
  /// and re-establishes the Account's planetary definition.
  static void globalSync(ZBAccount? account) {
    if (account == null) return;

    // 1. Save as current to allow main.dart to reference it during navigation

    // 2. Reset the Global Map to a neutral state (Ghost/Undefined)
    for (var counter in ZBData.counterMap.values) {
      counter.counterstate = 0;
      print('counterstate set to ${counter.counterstate} in globalSync');
      counter.isManual = false;
    }

    // 3. Re-apply Definition from Account Transactions (Channels)
    // This ensures centers like Head, Ajna, etc., get their real 2, 5, or 9 states
    for (var tx in account.zbtransactions) {
      // Only sync active frequencies (Ignore 'Simple' 4 or 'Ghost' 0)
      if (tx.zbstate != 4 && tx.zbstate != 0) {
        final int state = tx.zbstate ?? 0;

        // Update both ends of the channel in the global registry
        final String mainId = tx.mainCounterId;
        final String subId = tx.subCounterId;

        if (ZBData.counterMap.containsKey(mainId)) {
          ZBData.counterMap[mainId]!.counterstate = state;
        }
        if (ZBData.counterMap.containsKey(subId)) {
          ZBData.counterMap[subId]!.counterstate = state;
        }
      }
    }
  }

  static String? _lastAccountSignature;

  static void restoreGlobalRegistry(ZBAccount? activeAccount) {
    if (activeAccount == null) return;

    // 🕵️ SIGNATURE: Unique to this specific calculation/time
    String currentSignature =
        "${activeAccount.timestamp.toIso8601String()}_${activeAccount.designtimestamp.toIso8601String()}";

    // 🛡️ GUARD: If the key matches, DO NOT WIPE.
    // This prevents the 'Cancel' button or minor repaints from blanking the screen.
    if (currentSignature == _lastAccountSignature) {
      return;
    }

    _lastAccountSignature = currentSignature;

    // 1. Reset Global Registry (Only on real account changes)
    for (var counter in ZBData.counterMap.values) {
      // Silent check to prevent unnecessary console noise
      if (counter.counterstate != 0) {
        counter.counterstate = 0;
      }
      counter.isManual = false;
    }

    // 2. Re-apply definition
    for (var tx in activeAccount.zbtransactions) {
      final String mainId = tx.mainCounterId;
      final String subId = tx.subCounterId;
      // Fallback to 4 (Green) if zbstate is null
      final int state = tx.zbstate ?? 4;

      if (ZBData.counterMap.containsKey(mainId)) {
        ZBData.counterMap[mainId]!.counterstate = state;
      }
      if (ZBData.counterMap.containsKey(subId)) {
        ZBData.counterMap[subId]!.counterstate = state;
      }
    }
  }

  // Inside your Logic class or main State
  static void toggleCounter(String id, Color pickedColor,
      {Map<String, ZBCounter>? targetRegistry}) {
    // Use the passed registry (Sandbox) OR fall back to the global one
    final registry = targetRegistry ?? ZBData.counterMap;

    final counter = registry[id];
    if (counter != null) {
      counter.isManual = !counter.isManual;
      counter.counterstate = counter.isManual ? 7 : 4;
      // Note: The painter will use the 'pickedColor' you passed in
      // when it sees state 7.
    }
  }

  // Simplified helper for the UI to use
  static int getCounterState(String id) {
    final counter = ZBData.counterMap[id];

    // 🕵️ DEBUG: Catch the transition
    if (counter == null) {
      print('counterstate set to $counter in getCounterState');
    } else if (counter.counterstate == 0) {
      // You can uncomment this to see every "Transparent" call,
      // but the 'null' check above is usually the culprit during dialog swaps.
      // print("🔍 INFO: Counter '$id' is currently State 0 (Transparent)");
    }

    return counter?.counterstate ?? 0;
  }

  // Example of fixing the initialization
  static void initializeCounters() {
    // 1. --- FOR CENTERS ---
    final counters = [
      'head',
      'ajna',
      'throat',
      'self',
      'heart',
      'spleen',
      'solar',
      'sacral',
      'root',
    ];

    for (int i = 0; i < counters.length; i++) {
      String counterID = counters[i];

      print('counterstate set to $counterID in initializeCounters countermap');

      ZBData.counterMap.putIfAbsent(
        counterID,
        () => ZBCounter(
          id: 101 + i, // 💡 IDs 101, 102, 103...
          counterstate: 0,
          name: counterID,
          wallets: [],
        ),
      );
    }

    // 2. --- FOR GATES ---
    for (int i = 1; i <= 64; i++) {
      String walletId = 'g$i';
      ZBData.counterMap.putIfAbsent(
        walletId,
        () {
          print('counterstate set 0 in initalizeCounters by Wallet');

          return ZBCounter(
            id: i, // 💡 IDs 1, 2, 3... up to 64
            counterstate: 0,
            name: walletId,
            wallets: [],
          );
        },
      );
    }
  }

  static List<ZBTransaction> calcActiveTransactions(
      List<ZBWallet> pList, List<ZBWallet> dList) {
    // 1. Extract Gate IDs (These are already 1-64 from your service/extension)
    final Set<int> activeWallets = {
      ...pList.map((w) => w.wallet),
      ...dList.map((w) => w.wallet),
    };

    List<ZBTransaction> activeTransactions = [];

    // print("DEBUG: --- START Transaction Calculation ---");
    // print("DEBUG: Unique Wallets Found: ${activeWallets.toList()..sort()}");

    // 2. Direct Match: Check every possible Channel in your database
    for (var tx in ZBData.getzbtransactions) {
      // Check if BOTH ends of the channel are present in the wallet set
      if (activeWallets.contains(tx.mainWalletId) &&
          activeWallets.contains(tx.subWalletId)) {
        activeTransactions.add(tx);

        // print("DEBUG: [SUCCESS] Found Match: ${tx.id} (${tx.zbhebname})");
      }
    }

    // print("DEBUG: Total Matches Found: ${activeTransactions.length}");
    // print("DEBUG: --- END Transaction Calculation ---");

    // 3. Priority Sort (Existing logic)
    activeTransactions
        .sort((a, b) => (b.zbstate ?? 0).compareTo(a.zbstate ?? 0));

    return activeTransactions;
  }

  static List<ZBCounter> calcActiveCounter(List<ZBTransaction> activeTX) {
    // ✅ FIX: Create a DEEP COPY of the counters
    // This ensures resetting tempMap doesn't touch the Global Registry
    Map<String, ZBCounter> tempMap = ZBData.counterMap.map(
      (key, counter) => MapEntry(key, counter.clone()),
    );

    // Now this ONLY affects the local tempMap
    tempMap.forEach((_, c) => c.counterstate = 0);

    final Set<String> mappedIds = {};

    for (var tx in activeTX) {
      _applyLogicToMap(tempMap, tx.mainCounterId, tx.zbstate ?? 4);
      _applyLogicToMap(tempMap, tx.subCounterId, tx.zbstate ?? 4);
      mappedIds.add(tx.mainCounterId.toLowerCase());
      mappedIds.add(tx.subCounterId.toLowerCase());
    }

    // Apply the Green Fill (State 4) for non-active centers
    tempMap.forEach((id, counter) {
      if (!mappedIds.contains(id.toLowerCase())) {
        counter.counterstate = 4;
      }
    });

    return tempMap.values.toList();
  }

  /// Applies Zmansi State Logic to the Counter Map

  static void _applyLogicToMap(
      Map<String, ZBCounter> objectMap, String counterId, int newState) {
    if (counterId == 'unknown') return;

    // Find the actual object in the map
    final counter = objectMap[counterId];
    if (counter == null) return;

    // Zmansi Priority Logic:
    // Only update if the new state is "higher energy" than the current one.
    if (newState > (counter.counterstate)) {
      counter.counterstate = newState;
    }
  }

  static Map<String, String> zbstrategyauthority({
    required List<ZBTransaction> zbtransactions,
    required List<ZBCounter> counters,
  }) {
    String type = '';
    String subtype = '';
    String authority = '';
    String subauthority = '';
    String strategy = '';

    // --- 1. LOCAL HELPERS ---
    bool hasTx(String id) => zbtransactions.any((tx) => tx.id == id);

    ZBCounter getC(String key) {
      final template = ZBData.counterMap[key] ?? ZBData.defaultCounterTemplate;
      final result = counters.firstWhere(
        (c) => c.id == template.id,
        orElse: () => template,
      );
      return result;
    }

    final throat = getC('throat');
    final self = getC('self');
    final heart = getC('heart');
    final spleen = getC('spleen');
    final sacral = getC('sacral');
    final solar = getC('solar');

    // --- 2. PRIMARY STORY (Definition & Hierarchy) ---
    if (zbtransactions.isEmpty) {
      type = ZBData.getTypeMap[4]?.type ?? ''; // Reflector
      authority = ZBData.getAuthMap[7]?.authority ?? '';
    } else {
      if (solar.counterstate != 4) {
        authority = ZBData.getAuthMap[1]?.authority ?? ''; // Emotional
        if (sacral.counterstate != 4) {
          type = ZBData.getTypeMap[2]?.type ?? ''; // Generator Base
        }
      } else if (sacral.counterstate != 4) {
        authority = ZBData.getAuthMap[2]?.authority ?? ''; // Sacral
        type = ZBData.getTypeMap[2]?.type ?? '';
      } else if (spleen.counterstate != 4) {
        authority = ZBData.getAuthMap[3]?.authority ?? ''; // Splenic
      } else if (heart.counterstate != 4) {
        authority = ZBData.getAuthMap[4]?.authority ?? ''; // Ego
      } else if (self.counterstate != 4) {
        authority = ZBData.getAuthMap[5]?.authority ?? ''; // Self-Projected
        type = ZBData.getTypeMap[3]?.type ?? ''; // Projector Base
      } else {
        authority = ZBData.getAuthMap[6]?.authority ?? ''; // Mental
        type = ZBData.getTypeMap[3]?.type ?? '';
      }
    }

    if (zbtransactions.isNotEmpty) {
      // Throat Definition Check
      if (throat.counterstate == 4) {
        type = (sacral.counterstate != 4)
            ? ZBData.getTypeMap[2]?.type ?? ''
            : ZBData.getTypeMap[3]?.type ?? '';
      }

      // --- MANIFESTOR PATHS ---
      if (hasTx('22.12') || hasTx('36.35') || hasTx('21.45')) {
        type = ZBData.getTypeMap[5]?.type ?? '';
      } else if (hasTx('48.16') || hasTx('57.20')) {
        if (hasTx('44.26') ||
            hasTx('32.54') ||
            hasTx('28.38') ||
            hasTx('18.58')) {
          type = ZBData.getTypeMap[5]?.type ?? '';
        }
      }

      // Manifestor Fallback (G or Ego to Throat)
      if (type != ZBData.getTypeMap[5]?.type) {
        if (hasTx('10.20') || hasTx('7.31') || hasTx('1.8') || hasTx('13.33')) {
          if (hasTx('51.25')) {
            type = ZBData.getTypeMap[5]?.type ?? '';
          }
        }
      }

      // --- MANIFESTING GENERATOR PATHS ---
      if (sacral.counterstate == 2) {
        if (type == ZBData.getTypeMap[5]?.type) {
          type = ZBData.getTypeMap[22]?.type ?? ''; // Manifestor becomes MG
        } else if (hasTx('34.20')) {
          type = ZBData.getTypeMap[22]?.type ?? '';
        } else if (hasTx('27.50')) {
          if (hasTx('48.16') || hasTx('57.20')) {
            type = ZBData.getTypeMap[22]?.type ?? '';
          }
        } else if (hasTx('34.10') ||
            hasTx('5.15') ||
            hasTx('14.2') ||
            hasTx('29.46')) {
          if (hasTx('10.20') ||
              hasTx('7.31') ||
              hasTx('1.8') ||
              hasTx('13.33')) {
            type = ZBData.getTypeMap[22]?.type ?? '';
          }
        }
      }

      // Final Type Categorization
      if (sacral.counterstate == 2) {
        if (type != ZBData.getTypeMap[22]?.type) {
          type = ZBData.getTypeMap[2]?.type ?? ''; // Pure Generator
        }
      } else if (type != ZBData.getTypeMap[5]?.type) {
        type = ZBData.getTypeMap[3]?.type ?? ''; // Projector
      }
    }

    // --- 3. SUBTYPE & SUBAUTHORITY SPLIT ---

    // A. Subtype Mapping
    if (type == ZBData.getTypeMap[2]?.type) {
      subtype = ZBData.getTypeMap[2]?.type ?? ''; // 'generator'
    } else if (type == ZBData.getTypeMap[22]?.type) {
      subtype = ZBData.getTypeMap[22]?.type ?? ''; // 'manifesting generator'
    } else {
      subtype = type;
    }

    // B. Subauthority Mapping (Ego/Heart Refinement)
    if (authority == ZBData.getAuthMap[4]?.authority) {
      if (type == ZBData.getTypeMap[3]?.type) {
        subauthority =
            ZBData.getAuthMap[44]?.authority ?? ''; // 'ego projected'
      } else if (type == ZBData.getTypeMap[5]?.type) {
        subauthority =
            ZBData.getAuthMap[4]?.authority ?? ''; // 'ego manifested'
      } else {
        subauthority = authority;
      }
    } else {
      subauthority = authority;
    }

    // --- 4. STRATEGY ASSIGNMENT ---
    if (type == ZBData.getTypeMap[5]?.type) {
      // Manifestor
      if (authority == ZBData.getAuthMap[1]?.authority) {
        strategy = hdstrategyList[0];
      } else if (authority == ZBData.getAuthMap[3]?.authority) {
        strategy = hdstrategyList[1];
      } else {
        strategy = hdstrategyList[2];
      }
    } else if (sacral.counterstate == 2) {
      // Generator / MG
      if (authority == ZBData.getAuthMap[1]?.authority) {
        strategy = hdstrategyList[3];
      } else {
        strategy = hdstrategyList[4];
      }
    } else if (type == ZBData.getTypeMap[3]?.type) {
      // Projector
      if (authority == ZBData.getAuthMap[1]?.authority) {
        strategy = hdstrategyList[5];
      } else if (authority == ZBData.getAuthMap[3]?.authority) {
        strategy = hdstrategyList[6];
      } else if (authority == ZBData.getAuthMap[4]?.authority) {
        strategy = hdstrategyList[7];
      } else if (authority == ZBData.getAuthMap[5]?.authority) {
        strategy = hdstrategyList[8];
      } else {
        strategy = hdstrategyList[9];
      }
    } else {
      // Reflector
      strategy = hdstrategyList[10];
    }

    // debugPrint('=== zbstrategyauthority ===');
    // debugPrint('type:         $type');
    // debugPrint('subtype:      $subtype');
    // debugPrint('authority:    $authority');
    // debugPrint('subauthority: $subauthority');
    // debugPrint('strategy:     $strategy');
    // debugPrint('===========================');

    return {
      'type': type,
      'subtype': subtype,
      'authority': authority,
      'subauthority': subauthority,
      'strategy': strategy,
    };
  }

  // Private helper to keep the 'Breath' clean
  static String getDefinition(List<ZBTransaction> zbtransactions) {
    // 1. Calculate the raw number of islands
    int islandCount = calculateIslandCount(zbtransactions);

    // 2. Map that count to your human-readable list (None, Single, Split, etc.)
    // Safety check: Ensure the 'Breath' stays within the 'Body' (0-4)
    if (islandCount < 0 || islandCount >= hddefinition.length) {
      return hddefinition[0]; // Fallback to "None"
    }

    return hddefinition[islandCount];
  }

  static int calculateIslandCount(List<ZBTransaction> zbtransactions) {
    if (zbtransactions.isEmpty) return 0;

    Map<String, List<String>> graph = {};
    Set<String> definedCounters = {};

    // Build the graph using String IDs from your counterMap
    for (var tx in zbtransactions) {
      String c1 = ZBData.getcounterforwallet(tx.mainWalletId);
      String c2 = ZBData.getcounterforwallet(tx.subWalletId);

      if (c1 != 'unknown' && c2 != 'unknown') {
        definedCounters.add(c1);
        definedCounters.add(c2);

        graph.putIfAbsent(c1, () => []).add(c2);
        graph.putIfAbsent(c2, () => []).add(c1);
      }
    }

    int islandCount = 0;
    Set<String> visited = {};

    for (var counter in definedCounters) {
      if (!visited.contains(counter)) {
        islandCount++;
        _dfsIsland(counter, graph, visited);
      }
    }

    return islandCount;
  }

// Single, clean DFS that handles the String IDs
  static void _dfsIsland(
      String current, Map<String, List<String>> graph, Set<String> visited) {
    visited.add(current);
    final neighbors = graph[current];
    if (neighbors != null) {
      for (var neighbor in neighbors) {
        if (!visited.contains(neighbor)) {
          _dfsIsland(neighbor, graph, visited);
        }
      }
    }
  }

  static ZBHDSentence findZBStrategy(String type, String auth) {
    // 1. Normalize Type: "Manifesting Generator" uses "Generator" sentences
    String lookupType = type.toLowerCase().trim();
    if (lookupType == 'manifesting generator') {
      lookupType = 'generator';
    }

    // 2. Normalize Authority: "Ego Projected" uses "Ego" sentences
    String lookupAuth = auth.toLowerCase().trim();
    if (lookupAuth == 'ego projected') {
      lookupAuth = 'ego';
    }

    return ZBData.getHDSentences.firstWhere(
      (s) =>
          s.typeName.toLowerCase() == lookupType &&
          s.authName.toLowerCase() == lookupAuth,
      // 3. The "White Camel" only appears if a real logical gap exists
      orElse: () => ZBHDSentence(
        sentence: 'zmansi WHITE CAMEL bob',
        sentenceheb: 'זמנסי גמלבן בוב',
        typeName: type,
        authName: auth,
      ),
    );
  }

  /// The logic lives here in the main class
  static ZBHDSentence findMatch(String input) {
    return ZBData.getHDSentences.firstWhere(
      (s) => s.sentence == input || s.sentenceheb == input,
      orElse: () => ZBHDSentence(
        sentence: 'unknown',
        sentenceheb: 'לא ידוע',
        typeName: 'I do not know Meditation',
        authName: 'unknown',
      ),
    );
  }

  /// 🎯 Maps 1-6 Tone to Arrow Direction
  /// 1,2,3 = Left (Strategic/Active) | 4,5,6 = Right (Receptive/Passive)
  static IconData getTransformationArrow(int? tone) {
    if (tone == null || tone == 0) return Icons.help_outline;
    return tone > 3 ? Icons.arrow_circle_right : Icons.arrow_circle_left;
  }

  /// 🛰️ Processes the Account into UI-ready Transformation Objects
}

// ##########################################################################

// rotatecleanwidgets.dart

class ZBPreset {
  final String asset;
  final String tooltip;
  final VoidCallback onTap;

  const ZBPreset({
    required this.asset,
    required this.tooltip,
    required this.onTap,
  });
}

class ZBAccountChart extends StatelessWidget {
  final ZBAccount? account;
  final Function(String id)? onCounterTap;
  final Widget Function(int walletNumber) walletBuilder;
  final List<ZBPreset> presets;
  final Map<String, ZBCounter> registry;
  final List<int> walletStates;
  final Color pickedcolor;
  final ZBTheme zbtheme; // ADD

  const ZBAccountChart({
    super.key,
    this.account,
    required this.walletStates,
    required this.walletBuilder,
    required this.registry,
    this.onCounterTap,
    this.presets = const [],
    required this.pickedcolor,
    this.zbtheme = ZBTheme.zb, // ADD
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: ZBTransactionPainter(
              registry: registry,
              walletStates: walletStates,
              zbtheme: zbtheme, // ADD
            ),
          ),
        ),
        ..._buildCounters(),
        if (presets.isNotEmpty)
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              spacing: 6,
              children: presets
                  .map(
                    (p) => IconButton(
                      icon: CircleAvatar(
                        maxRadius: 20,
                        foregroundImage: AssetImage(p.asset),
                      ),
                      tooltip: p.tooltip,
                      onPressed: p.onTap,
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }

  List<Widget> _buildCounters() {
    return ZBData.counterPositions.map((pos) {
      final counter = _BaseCounter(
        width: pos.width,
        height: pos.height,
        painter: _painterForCounter(pos.name),
        onTap: () => onCounterTap?.call(pos.name),
        walletLayout: ZBStyles.buildWalletLayout(
          counterId: pos.name,
          registry: registry,
          walletBuilder: walletBuilder,
        ),
      );

      if (pos.posleft != null || pos.posright != null) {
        return Positioned(
          top: pos.postop,
          left: pos.posleft,
          right: pos.posright,
          child: counter,
        );
      }

      return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: pos.postop ?? 0.0),
          child: counter,
        ),
      );
    }).toList();
  }

  CustomPainter _painterForCounter(String id) {
    final counter = registry[id];
    final int state = counter?.counterstate ?? 0;
    final bool manual = counter?.isManual ?? false;

    if (id == "YOUR_TARGET_ID" && state == 0) {
      print('painter is setting Counter $id to 0 in _painterForCounter');
    }

    final Color color = ZBStyles.getCounterColor(
      id,
      state: state,
      isManual: manual,
      pickedColor: pickedcolor,
      zbtheme: zbtheme, // ADD
    );

    return ZBCounterPainter(
      id: id,
      state: state,
      pickColor: color,
    );
  }
}

class ZBTransactionPainter extends CustomPainter {
  final Map<String, ZBCounter> registry;
  final List<int> walletStates;
  final ZBTheme zbtheme;

  ZBTransactionPainter(
      {required this.registry,
      required this.walletStates,
      required this.zbtheme});

  bool _shouldSkip(ZBTransaction tx) {
    // 1. ALWAYS keep the main diagonal 57-20
    final bool is57to20 = (tx.mainWalletId == 57 && tx.subWalletId == 20) ||
        (tx.mainWalletId == 20 && tx.subWalletId == 57);
    if (is57to20) return false;

    // 2. ONLY allow 10 and 34 to draw spokes if they are connected to 10 or 34
    // This prevents 20 and 57 from "doubling up" on the same spokes.
    final bool mainIsAnchor = _iCenterWallets.contains(tx.mainWalletId);
    final bool subIsAnchor = _iCenterWallets.contains(tx.subWalletId);

    // If both are integration wallets but neither is 10/34, it's an internal line we skip
    if (_integrationWallets.contains(tx.mainWalletId) &&
        _integrationWallets.contains(tx.subWalletId)) {
      // Allow the spoke only if exactly one side is 10 or 34
      return !(mainIsAnchor || subIsAnchor);
    }

    return false; // Draw all other non-integration transactions normally
  }

  ({Offset p1, Offset p2}) _pointOffsets(ZBTransaction tx) {
    if (tx.mainWalletId == 48 && tx.subWalletId == 16) {
      return (p1: const Offset(-2, -4), p2: const Offset(-6, 0));
    }
    // if (tx.mainWalletId == 57 && tx.subWalletId == 20) {
    //   return (p1: const Offset(0, -8), p2: const Offset(-2, 0));
    // }
    if (tx.mainWalletId == 22 && tx.subWalletId == 12) {
      return (p1: const Offset(0, -2), p2: const Offset(2, 0));
    }
    if (tx.mainWalletId == 36 && tx.subWalletId == 35) {
      return (p1: const Offset(2, -4), p2: const Offset(6, -2));
    }

    // ajna gets offset
    // if (tx.mainWalletId == 43 && tx.subWalletId == 23) {
    //   return (p1: Offset.zero, p2: const Offset(0, 0));
    // }
    if (tx.mainWalletId == 17 && tx.subWalletId == 62) {
      return (p1: Offset.zero, p2: const Offset(0, 4));
    }
    if (tx.mainWalletId == 11 && tx.subWalletId == 56) {
      return (p1: Offset.zero, p2: const Offset(0, 4));
    }

    return (p1: Offset.zero, p2: Offset.zero);
  }

  static const List<int> _iCenterWallets = [10, 34];

  // integration field wallet ids
  static const List<int> _integrationWallets = [10, 20, 34, 57];

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Pre-calculate the meeting point for the Integration Field
    final iCenter = ZBData.integrationFieldCenter(size.width, size.height);

    final paintedWallets = <int>{}; // Track gates already drawn this frame

    for (final tx in ZBData.getzbtransactions) {
      if (_shouldSkip(tx)) continue;

      // Only paint the "Main" half if we haven't drawn this gate yet
      if (!paintedWallets.contains(tx.mainWalletId)) {
        _paintHalf(canvas, size, tx, iCenter, true);
        paintedWallets.add(tx.mainWalletId);
      }

      // Only paint the "Sub" half if we haven't drawn this gate yet
      if (!paintedWallets.contains(tx.subWalletId)) {
        _paintHalf(canvas, size, tx, iCenter, false);
        paintedWallets.add(tx.subWalletId);
      }
    }

    canvas.drawCircle(
      iCenter,
      6.0,
      Paint()
        ..color = Colors.red
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      iCenter,
      6.0,
      Paint()
        ..color = Colors.yellow
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.0,
    );
  }

  @override
  bool shouldRepaint(covariant ZBTransactionPainter oldDelegate) {
    if (oldDelegate.zbtheme != zbtheme) return true;
    if (oldDelegate.walletStates.length != walletStates.length) return true;
    for (int i = 0; i < walletStates.length; i++) {
      if (oldDelegate.walletStates[i] != walletStates[i]) return true;
    }
    return false;
  }

  void _paintHalf(
      Canvas canvas, Size size, ZBTransaction tx, Offset iCenter, bool isMain) {
    final int walletId = isMain ? tx.mainWalletId : tx.subWalletId;
    final int partnerId = isMain ? tx.subWalletId : tx.mainWalletId;
    final String counter = isMain ? tx.mainCounterId : tx.subCounterId;
    final String partnerCounter = isMain ? tx.subCounterId : tx.mainCounterId;

    // 1. GET STATE & COLORS (The Gradient Fix)
    final state = walletStates[walletId];
    final List<Color> colors = ZBStyles.setWalletColor(state, theme: zbtheme);

    // 2. Get offsets to fix the "sinking" into the gate area
    final txOffsets = _pointOffsets(tx);
    final Offset myOffset = isMain ? txOffsets.p1 : txOffsets.p2;
    final Offset partnerOffset = isMain ? txOffsets.p2 : txOffsets.p1;

    // p1: The start point at the wallet
    final p1 =
        ZBData.walletCounter(walletId, counter, size.width, size.height) +
            myOffset;

    // Determine the logical target p2
    Offset p2;
    if (walletId == 10 || walletId == 34 || walletId == 57 || walletId == 20) {
      p2 = iCenter;
    } else {
      p2 = ZBData.walletCounter(
              partnerId, partnerCounter, size.width, size.height) +
          partnerOffset;
    }

    // 3. Segment Length Logic
    Offset lineEnd;

    if (walletId == 10 || walletId == 34) {
      // REACH 100%: Go all the way to the center dot
      lineEnd = p2;
    } else if (walletId == 57 || walletId == 20) {
      // EXTENDED REACH: Go 100% (was 75%) to close the gap
      double reach = 1.0;
      lineEnd = Offset(
        p1.dx + (p2.dx - p1.dx) * reach,
        p1.dy + (p2.dy - p1.dy) * reach,
      );
    } else {
      // NORMAL CHANNELS: 50/50 default, with per-wallet overrides
      const Set<int> shortWallets = {62, 56};
      const Set<int> extendedWallets = {17, 11};
      final double reach = shortWallets.contains(walletId)
          ? 0.28
          : extendedWallets.contains(walletId)
              ? 0.65
              : walletId == 23
                  ? 0.39
                  : 0.49;
      lineEnd = Offset(
        p1.dx + (p2.dx - p1.dx) * reach,
        p1.dy + (p2.dy - p1.dy) * reach,
      );
    }

    // 4. PAINT CONFIGURATION (Handling Gradients vs Solid)
    final Paint paint = Paint()
      // ..strokeWidth = (state != 0) ? 7.0 : 2.0
      ..strokeWidth = 7.0
      ..strokeCap = StrokeCap.square;

    if (colors.length > 1) {
      paint.shader = ui.Gradient.linear(
        p1,
        p2,
        [
          colors[1], // Red
          colors[0],
          colors[1], // Blue
          colors[0],
          colors[1], // Red
          colors[0],
          colors[1], // Blue
          colors[0],
          colors[1], // Red (Starts second half)
          colors[0],
          colors[1], // Blue
          colors[0],
        ],
        // Packing more transitions into the 0.0 to 0.5 range
        const [
          0.0, 0.12, 0.13, // Stripe 1 (Red)
          0.24, 0.26, // Stripe 2 (Blue)
          0.37, 0.39, // Stripe 3 (Red)
          0.49, 0.51, // Midpoint Split
          0.75, 0.77, // (Continues on partner side...)
          1.0
        ],
      );
    } else {
      paint.color = colors.isNotEmpty ? colors[0] : Colors.transparent;
    }

    canvas.drawLine(p1, lineEnd, paint);
  }
}

class _BaseCounter extends StatelessWidget {
  final double width, height;
  final CustomPainter painter;
  final VoidCallback onTap;
  final Widget walletLayout;

  const _BaseCounter({
    required this.width,
    required this.height,
    required this.painter,
    required this.onTap,
    required this.walletLayout,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: onTap,
            child: CustomPaint(painter: painter, size: Size(width, height)),
          ),
          walletLayout,
        ],
      ),
    );
  }
}

abstract class ZBRegistry {
  static final Map<int, ZBWallet> rgwallets = {};

  // Link this directly to your source of truth
  static Map<String, ZBCounter> get rgcounters => ZBData.counterMap;

  static final Map<String, ZBTransaction> rgtransactions = {};

  static int globalFrequency = 4;

  static ZBWallet? getwallet(int n) => rgwallets[n];
  static ZBCounter? getcounter(String id) => rgcounters[id];
  static ZBTransaction? gettransaction(String id) => rgtransactions[id];

  static void resetRegistryToZB() {
    // 1. Reset the persistent Counter states
    rgcounters.forEach((id, counter) {
      counter.counterstate = 0;
      counter.isManual = false;
    });

    // 2. Wipe the Transaction 'Memory'
    rgtransactions.clear();

    // print('🧹 [RAM RESET] Global rg-variables cleared.');
  }
}

class DebugGrid extends StatelessWidget {
  final Widget child;
  final double spacing;
  final Color color;

  const DebugGrid({
    super.key,
    required this.child,
    this.spacing = 8.0,
    this.color = const Color(0x33FF0000),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _GridPainter(spacing: spacing, color: color),
      child: child,
    );
  }
}

class _GridPainter extends CustomPainter {
  final double spacing;
  final Color color;

  _GridPainter({required this.spacing, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5;

    for (double x = 0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) =>
      old.spacing != spacing || old.color != color;
}

class ZBCounterPainter extends CustomPainter {
  final String id;
  final int state;
  final Color pickColor;

  ZBCounterPainter({
    required this.id,
    required this.state,
    required this.pickColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Get the unified color from your existing Logic
    // This replaces the hardcoded 'Colors.yellow' or 'Colors.blue' in the old painters
    // final Color centerColor = ZBStyles.setCounterColor(state, pickColor);

    final Paint paint = Paint()
      // ..color = centerColor
      ..color = pickColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // 2. Fetch the Path from the ZBPaths toolbox
    // This replaces the private getTrianglePath/getDiamondPath methods
    Path path;
    switch (id) {
      case 'head':
        path = ZBPaths.head(size);
        break;
      case 'ajna':
        path = ZBPaths.ajna(size);
        break;
      case 'self':
        path = ZBPaths.self(size);
        break;
      case 'spleen':
        path = ZBPaths.spleen(size);
        break;
      case 'solar':
        path = ZBPaths.solar(size);
        break;
      case 'heart':
        path = ZBPaths.heart(size);
        break;
      case 'throat':
      case 'sacral':
      case 'root':
        path = ZBPaths.throat(size);
        break; // Squares
      default:
        path = ZBPaths.throat(size);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant ZBCounterPainter oldDelegate) {
    // Only repaint if the state changes or the user picks a new color.
    // This is much more efficient than 'return false' or 'return true'
    return oldDelegate.state != state || oldDelegate.pickColor != pickColor;
  }
}
