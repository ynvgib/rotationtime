// import 'package:flutter/material.dart';

// 1. TOP-LEVEL MODELS (The Blueprints)
// ---------------------------------------------------------

import 'dart:ui';
import 'package:finallyicanlearn/zb/data/zb_data.dart';
import 'package:finallyicanlearn/zb/ui/widgets/zb_cleanwidgets.dart';

class ZBFrequency {
  final int zbstate;
  final String zbcoin;
  final String zbcoinimg;
  final Color zbcolor;
  final double zbopacity;
  final String zbanimal;
  final String zbanimalimg;
  final String zbanimaldualimg;

  const ZBFrequency({
    required this.zbstate,
    required this.zbcoin,
    required this.zbcoinimg,
    required this.zbcolor,
    required this.zbopacity,
    required this.zbanimal,
    required this.zbanimalimg,
    required this.zbanimaldualimg,
  });

  String imageFor(String key) {
    switch (key) {
      case 'coinimg':
        return zbcoinimg;
      case 'animalimg':
        return zbanimalimg;
      case 'animaldualimg':
        return zbanimaldualimg;
      default:
        return '';
    }
  }

  // Inside ZBData or ZBFrequency
  static ZBFrequency getFrequencyByState(int state) {
    return ZBStory.zbfrequencies.firstWhere(
      (f) => f.zbstate == state,
      orElse: () =>
          ZBStory.zbfrequencies[0], // Default to state 0 (transparent)
    );
  }
}

/// ZBWallet: The Asset. Stores iChing/Gate/GeneKey data.
class ZBWallet {
  final int wallet; // gate
  int state;
  final bool isIntegration;

  // Story Headers
  String? hdname;
  String? hdnameheb;
  String? hddesc;
  String? ichingname;
  String? zbcoin;
  String? zbname;
  String? zbnameheb;
  String? hex;

  // Grammatical Story
  String? adjective;
  String? subject;
  String? verb;
  String? adverb;

  // Cultural
  String? chinese;

  // Circuit
  String? circuitry;
  String? circuit;
  String? stream;

  // Technical
  double? longitude;
  String? planet;
  String? notename; // linename
  int? note; // line
  int? color;
  int? tone;
  int? base;
  int? zodiacid; // 🚀 Add: Required for zodiacSwephImagelist[index]
  String? zodiacsign; // 🚀 Add: 'scorpio', etc.

  ZBWallet({
    required this.wallet,
    this.state = 0,
    this.hdname,
    this.hdnameheb,
    this.hddesc,
    this.ichingname,
    this.zbcoin,
    this.zbname,
    this.zbnameheb,
    this.hex,
    this.adjective,
    this.subject,
    this.verb,
    this.adverb,
    this.chinese,
    this.circuitry,
    this.circuit,
    this.isIntegration = false,
    this.stream,
    this.longitude,
    this.planet,
    this.note,
    this.color,
    this.tone,
    this.base,
    this.zodiacid,
    this.zodiacsign,
  });

  // 1. Gate.Line (2 variables)
  String get walletNote => "$wallet.${note ?? 1}";

  // 2. Gate.Line.Color (3 variables)
  String get walletNoteColor => "$wallet.${note ?? 1}.${color ?? 1}";

  // 3. Gate.Line.Color.Tone (4 variables)
  String get walletNoteColorTone =>
      "$wallet.${note ?? 1}.${color ?? 1}.${tone ?? 1}";

  // 4. Gate.Line.Color.Tone.Base (5 variables)
  String get walletNoteColorToneBase =>
      "$wallet.${note ?? 1}.${color ?? 1}.${tone ?? 1}.${base ?? 1}";
}

/// ZBTransaction: The Bridge. Flow between two Counters.
class ZBTransaction {
  final String id;
  int? zbstate;
  int? count;
  String? name;
  String? hebname;
  String? zbname;
  String? zbhebname;
  String? zbheblongname;
  String? adaptname;
  String? description;
  String? sentence;
  String? zbcoin;
  Color? color;

  ZBTransaction({
    required this.id,
    this.zbstate,
    this.count,
    this.name,
    this.hebname,
    this.zbname,
    this.zbhebname,
    this.zbheblongname,
    this.adaptname,
    this.description,
    this.sentence,
    this.zbcoin,
    this.color,
  });

  // --- Core Parsing ---
  int get mainWalletId => int.tryParse(id.split('.').first) ?? 0;
  int get subWalletId => int.tryParse(id.split('.').last) ?? 0;

  // --- Counter Logic ---

  // These return the String key (e.g., 'solar', 'throat')
  String get mainCounterId => ZBData.getcounterforwallet(mainWalletId);
  String get subCounterId => ZBData.getcounterforwallet(subWalletId);

  // 🛠️ FIXED: Use mainCounterId/subCounterId to look up the object in the map
  ZBCounter? get mainCounter => ZBData.counterMap[mainCounterId];
  ZBCounter? get subCounter => ZBData.counterMap[subCounterId];

  // 🚀 LOGIC: Use the 'main' prefix to denote Authority/Source
  // If the object isn't found, it falls back to displaying the ID string itself
  String get mainCounterName => mainCounter?.hebname ?? mainCounterId;
  String get subCounterName => subCounter?.hebname ?? subCounterId;

  // --- Registry Logic ---
  String? get circuitry => ZBRegistry.rgwallets[mainWalletId]?.circuitry;
  String? get circuit => ZBRegistry.rgwallets[mainWalletId]?.circuit;
  String? get stream => ZBRegistry.rgwallets[mainWalletId]?.stream;
}

/// ZBCounter: The Hub. Where energy is tallied.
class ZBCounter {
  final int id;
  final String name;
  final List<int> wallets;
  int state; // Dynamic frequency
  String? hdname;
  String? zbname;
  String? hebname;
  bool isManual;

  ZBCounter({
    required this.id,
    required this.name,
    required this.wallets,
    this.state = 0, // Default starting point is now handled here
    this.hdname,
    this.zbname,
    this.hebname,
    this.isManual = false,
  });
}

class ZBWalletPos extends ZBWallet {
  double? postop;
  double? posbottom;
  double? posleft;
  double? posright;

  ZBWalletPos({
    required super.wallet,
    this.postop,
    this.posbottom,
    this.posleft,
    this.posright,
  });
}

class ZBCounterPos extends ZBCounter {
  double? postop;
  double? posbottom;
  double? posleft;
  double? posright;
  double width;
  double height;

  ZBCounterPos({
    required super.name,
    super.wallets = const [],
    super.id = 0,
    super.state,
    super.hdname,
    super.zbname,
    this.postop,
    this.posbottom,
    this.posleft,
    this.posright,
    required this.width,
    required this.height,
  });
}

class ZBTransactionPos extends ZBTransaction {
  double? startx;
  double? starty;
  double? endx;
  double? endy;
  double? angle;
  double? length;

  ZBTransactionPos({
    required super.id,
    super.name,
    super.hebname,
    super.zbname,
    super.zbhebname,
    super.adaptname,
    super.description,
    super.sentence,
    super.zbcoin,
    super.color,
    this.startx,
    this.starty,
    this.endx,
    this.endy,
    this.angle,
    this.length,
  });
}

class ZBType {
  final int id;
  final String type;
  final String? typeheb;
  final String? zbname;
  final String? zbnameheb;
  final String? strategy;
  final String? zbstrategy;
  final String? strategyheb;
  final String? zbstrategyheb;
  final String? zbsentence;
  final String? zbsentenceheb;
  final String? zbimagePath;

  const ZBType({
    required this.id,
    required this.type,
    this.typeheb,
    this.zbname,
    this.zbnameheb,
    this.strategy,
    this.zbstrategy,
    this.strategyheb,
    this.zbstrategyheb,
    this.zbsentence,
    this.zbsentenceheb,
    this.zbimagePath,
  });
}

class ZBAuthority {
  final int id;
  final String authority;
  final String? authheb;
  final String? zbname;
  final String? zbnameheb;
  final Color? color;
  final String? zbimagePath; // Added to match the generic widget logic

  const ZBAuthority({
    required this.id,
    required this.authority,
    this.authheb,
    this.zbname,
    this.zbnameheb,
    this.color,
    this.zbimagePath,
  });
}

class ZBHDSentence {
  final String sentence;
  final String sentenceheb;
  final String typeName;
  final String authName;

  ZBHDSentence({
    required this.sentence,
    required this.sentenceheb,
    required this.typeName,
    required this.authName,
  });

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
}

// lists

class ZBDictionarySourceLists {
  final String label;
  final List<String> data;
  final int base;

  ZBDictionarySourceLists({
    required this.label,
    required this.data,
    required this.base,
  }) {
    // 🛡️ Safety Check for your Linux build
    assert(data.length >= base,
        "List '$label' length (${data.length}) is less than Base $base");
  }

  /// 🚀 The Factory: Manufactures an object from your ZBData Maps
  factory ZBDictionarySourceLists.fromEntry(
      MapEntry<String, List<String>> entry, int base) {
    List<String> validatedData = entry.value;

    // 🛡️ Automatic Padding Logic
    if (validatedData.length < base) {
      // Create a new list starting with your data,
      // then fill the rest with empty strings until it hits 'base'
      validatedData = List<String>.from(validatedData);
      while (validatedData.length < base) {
        validatedData.add("");
      }
    }

    return ZBDictionarySourceLists(
      label: entry.key,
      data: validatedData,
      base: base,
    );
  }

  /// 🔍 Safe Data Access
  String getItem(int index) {
    if (index >= 0 && index < data.length) {
      return data[index];
    }
    return "";
  }

  /// 🧠 Smart Lookup: Automatically handles the math for 4, 36, 64, or 384
  String getStructuredItem({required int wallet, int? note}) {
    int calculatedIndex;

    switch (base) {
      case 384:
        // Formula: (Gate - 1) * 6 + (Line - 1)
        // If line is null, default to 1 (index 0 for that gate)
        calculatedIndex = ((wallet - 1) * 6) + ((note ?? 1) - 1);
        break;
      case 64:
        calculatedIndex = wallet - 1;
        break;
      case 36:
        // Assuming your channels or base36 are indexed 0-35
        calculatedIndex = wallet % 36;
        break;
      case 4:
        // Map the 64 gates into 4 Quarters (16 gates per quarter)
        calculatedIndex = ((wallet - 1) / 16).floor();
        break;
      default:
        calculatedIndex = wallet - 1;
    }

    return getItem(calculatedIndex);
  }
}
