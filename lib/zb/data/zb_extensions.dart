// --- LOGIC LAYER (The Math) ---
import 'package:finallyicanlearn/zb/data/zb_classes.dart';
import 'package:finallyicanlearn/zb/data/zb_data.dart';

extension ZBWalletLogicExt on ZBWallet {
  ZBWallet get getwalletsub {
    // print("DEBUG getwalletsub: planet=$planet incoming lon=$longitude");

    final double lon = longitude ?? 0.0;

    // 1. THE SHIFT: Aligning Tropical 0° to the start of the Mandala (Gate 41)
    // Matches your old code: planetlongitude += 58
    double shifted = lon + 58.0;
    while (shifted >= 360) shifted -= 360;
    while (shifted < 0) shifted += 360;

    // 2. THE PERCENTAGE: The core driver for all substructures
    double percentage = shifted / 360;

    // 3. THE MAPPING: Convert linear index (0-63) to Actual Gate Number (1-64)
    int listIndex = (percentage * 64).floor();

    // 🚀 CRITICAL: We retrieve the Gate ID from your ZBData list.
    // This ensures Wallet 0 becomes Gate 41, and Sun/Earth are true opposites.
    final int actualGate = ZBData.orderWalletOnWheel[listIndex];

    // 4. SUBSTRUCTURE: Precise multipliers (384, 2304, 13824, 69120)
    int line = ((percentage * 384) % 6).floor() + 1;
    int color = ((percentage * 2304) % 6).floor() + 1;
    int tone = ((percentage * 13824) % 6).floor() + 1;
    int base = ((percentage * 69120) % 5).floor() + 1;

    // 5. DEBUG: Use this to verify your 1984 test (Should see Gate 55.1...)
    // print(
    //     "DEBUG: [MAP] $planet | Gate: $actualGate.$line | C:$color T:$tone B:$base | Lon: ${lon.toStringAsFixed(2)}");

    return ZBWallet(
      wallet: actualGate, // The real Gate ID for DB lookups (e.g. 55)
      longitude: lon,
      planet: planet,
      note: line,
      hdcolor: color,
      hdtone: tone,
      hdbase: base,
      walletstate: line, // Line determines the active frequency
    );
  }
}

// --- STORY LAYER (The Narrative) ---
extension ZBWalletStoryExt on ZBWallet {
  ZBWallet get getwalletsentence {
    // 1. Search the DB for the 'Story' template
    final template = ZBData.getzbwallets.firstWhere(
      (w) => w.wallet == wallet,
      orElse: () => this,
    );

    if (template == this) {
      // print("DEBUG: [Story] ❌ No DB match for Wallet $wallet");
      return this;
    }

    // print("DEBUG: [Story] ✅ Match! ${template.hdnameheb}");

    // 2. Manual Constructor: Build a new wallet from the old one + the template
    return ZBWallet(
      wallet: wallet, // Keep the ID we calculated
      longitude: longitude, // Keep the raw coordinates
      planet: planet, // Keep the name
      note: note, // Keep the line (1-6)
      hdcolor: hdcolor,
      hdtone: hdtone,
      hdbase: hdbase,
      walletstate: walletstate,
      // 🚀 INJECT THE NEW DATA FROM THE DATABASE
      hdname: template.hdname,
      hdnameheb: template.hdnameheb,
      hex: template.hex,
      adjective: template.adjective,
      subject: template.subject,
      verb: template.verb,
      adverb: template.adverb,
    );
  }
}
