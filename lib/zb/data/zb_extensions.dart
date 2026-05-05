// --- LOGIC LAYER (The Math) ---
import 'package:finallyicanlearn/zb/data/zb_classes.dart';
import 'package:finallyicanlearn/zb/data/zb_data.dart';

extension ZBWalletLogicExt on ZBWallet {
  ZBWallet get getwalletsub {
    // print("DEBUG getwalletsub: planet=$planet incoming lon=$longitude");

    final double lon = longitude ?? 0.0;

    // 1. THE SHIFT: Aligning Tropical 0° to the start of the Mandala (Gate 41)
    double shifted = lon + 58.0;
    while (shifted >= 360) shifted -= 360;
    while (shifted < 0) shifted += 360;

    // 2. THE PERCENTAGE: The core driver for all substructures
    double percentage = shifted / 360;

    // 3. THE MAPPING: Convert linear index (0-63) to Actual Gate Number (1-64)
    int listIndex = (percentage * 64).floor();

    // Retrieve the Gate ID from your ZBData list.
    final int actualGate = ZBData.order41WalletStartWheel[listIndex];

    // 4. SUBSTRUCTURE: Precise multipliers (384, 2304, 13824, 69120)
    int line = ((percentage * 384) % 6).floor() + 1;
    int color = ((percentage * 2304) % 6).floor() + 1;
    int tone = ((percentage * 13824) % 6).floor() + 1;
    int base = ((percentage * 69120) % 5).floor() + 1;

    // 5. DATA PRESERVATION:
    // Carry over the Zodiac data that was calculated in the Service.
    // Without these lines, the UI defaults to Aries (Index 0).
    return ZBWallet(
      wallet: actualGate,
      longitude: lon,
      planet: planet,
      note: line,
      hdcolor: color,
      hdtone: tone,
      hdbase: base,
      zodiacid: zodiacid, // 🚀 Passed from the original object
      zodiacsign: zodiacsign, // 🚀 Passed from the original object
      walletstate: line,
    );
  }
}

// --- STORY LAYER (The Narrative) ---
extension ZBWalletStoryExt on ZBWallet {
  ZBWallet get getwalletsentence {
    final template = ZBData.getzbwallets.firstWhere(
      (w) => w.wallet == wallet,
      orElse: () => this,
    );

    if (template == this) return this;

    return ZBWallet(
      wallet: wallet,
      longitude: longitude,
      planet: planet,
      note: note,
      hdcolor: hdcolor,
      hdtone: hdtone,
      hdbase: hdbase,
      walletstate: walletstate,

      // 🚀 CRITICAL: Carry over the calculated zodiac info
      // This prevents the "null" you saw in the debug logs
      zodiacid: zodiacid,
      zodiacsign: zodiacsign,

      // Database template data
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
