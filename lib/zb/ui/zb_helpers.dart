import 'dart:convert';
import 'package:finallyicanlearn/models/rotateclasses.dart';
import 'package:finallyicanlearn/zb/data/zb_listdb.dart';
import 'package:finallyicanlearn/zb/data/zb_classes.dart';
import 'package:finallyicanlearn/zb/data/providers/zb_db_providers.dart';
import 'package:finallyicanlearn/zb/data/zb_data.dart';
import 'package:finallyicanlearn/zb/data/zb_moderatelist.dart';
import 'package:finallyicanlearn/zb/data/zb_services.dart';
import 'package:finallyicanlearn/zb/ui/widgets/zb_cleanwidgets.dart';
import 'package:finallyicanlearn/zb/ui/widgets/zb_widgets.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

bool _isFullScreen = false;
int userDefinedSeconds = 0; // 640;
Timer? forceResetTimer;

void toggleFullScreen() async {
  _isFullScreen = !_isFullScreen;
  await windowManager.setFullScreen(_isFullScreen); // The L5 Transition
}

// L3: Breath, - Pass 'seconds' as a parameter from the user's choice
void showResetAlert(BuildContext context, int seconds) {
  // L1: idk (Black) - The "Aha;" Fix: If it's 0 (Off), we remain silent.
  if (seconds == 0) return;

  // Cancel any existing 'Breath' before starting a new rotation
  forceResetTimer?.cancel();

  // L4: Simple; - Use the dynamic Duration instead of hard-coded 30
  forceResetTimer = Timer(Duration(seconds: seconds), () {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
    hibernateEngine();
  });

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => AlertDialog(
      title: const Text('Reset אתחול'),
      content: Text(
        "אתחול מתבצע בעוד $seconds שניות\nReset in $seconds seconds",
      ),
      actions: [
        TextButton(
          onPressed: () {
            forceResetTimer?.cancel();
            Navigator.of(ctx).pop();
          },
          child: const Text("X"),
        ),
      ],
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey mainStateKey = GlobalKey();

void hibernateEngine() {
  // We use the 'navigatorKey' to sail back to the Home Screen
  navigatorKey.currentState?.pushNamedAndRemoveUntil('/', (route) => false);

  // print("The White Camel has returned to the 'silence.' of the Beginning.");
}

// L3: Breath, - The Global Listener for every screen 'Rotation'
// L3: Breath, - The Global Listener in your helpers
class MyRouteObserver extends NavigatorObserver {
  // A 'Simple;' callback to notify the UI
  final VoidCallback onNavigation;

  MyRouteObserver({required this.onNavigation});

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    onNavigation(); // Triggers the reset in main.dart
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    onNavigation(); // Triggers the reset when going back
  }
}

// code consolidation

void consolidateWalletsToConsole() {
  // 1. Create a local copy of your base map to work on
  /// Pass any of your old List<String> and the name of the new key you want in the map.
  List<Map<String, dynamic>> mergeListIntoMap({
    required List<Map<String, dynamic>> targetMap,
    required List<String> sourceList,
    required String newKeyName,
  }) {
    // We create a copy to avoid mutating the original until we are ready
    List<Map<String, dynamic>> updatedMap = List.from(targetMap);

    for (int i = 0; i < sourceList.length; i += 2) {
      // Ensure we don't go out of bounds if a list has an odd number of items
      if (i + 1 < sourceList.length) {
        String id = sourceList[i];
        String value = sourceList[i + 1];

        for (var entry in updatedMap) {
          if (entry['id'] == id) {
            entry[newKeyName] = value;
          }
        }
      }
    }

    // Optional: Print the result to console so you can copy the new Map code
    debugPrint("--- UPDATED MAP WITH KEY: $newKeyName ---");
    for (var entry in updatedMap) {
      debugPrint("  $entry,");
    }

    return updatedMap;
  }
}

/// Consolidated Utility to merge fragmented lists into wallets36
void performOneTimeConsolidation() {
  // We use a local copy to avoid mutating the original
  List<Map<String, dynamic>> master = List.from(transaction36);

  void merge(List<String> source, String newKey) {
    for (int i = 0; i < source.length; i += 2) {
      if (i + 1 < source.length) {
        String id = source[i];
        String rawValue = source[i + 1];

        // 1. Clean the ID prefix
        String cleanValue =
            rawValue.contains(': ') ? rawValue.split(': ').last : rawValue;

        // 2. Escape single quotes for Dart code generation
        // This turns "One's" into "One\'s"
        String escapedValue = cleanValue.replaceAll("'", "\\'");

        for (var entry in master) {
          if (entry['id'] == id) {
            entry[newKey] = escapedValue.trim();
          }
        }
      }
    }
  }

  // --- MERGING ALL YOUR SOURCE LISTS ---
  merge(hdchannelRotationList, 'rotation_note');
  merge(hdchannelsilenceList, 'silence_en');
  merge(hdchlgenerateList, 'generate_en');
  merge(hdchlgenerateList_he, 'generate_he');
  merge(hdchannelsilenceList_heb, 'silence_he');
  merge(hdchannelsentenceList_eng, 'sentence_en');
  merge(hdchannelsentenceList, 'sentence_he');
  merge(hdchannelsentenceList_temp, 'sentence_temp');

  // --- OUTPUT TO VS CODE DEBUG CONSOLE ---
  debugPrint("/// COPY START ///");
  debugPrint("final List<Map<String, dynamic>> wallets36 = [");

  for (var entry in master) {
    // We convert the Color object to a string so it doesn't require an import
    String colorStr = "Colors.grey";
    if (entry['color'] == Colors.red) colorStr = "Colors.red";
    if (entry['color'] == Colors.blue) colorStr = "Colors.blue";
    if (entry['color'] == Colors.yellow) colorStr = "Colors.yellow";
    if (entry['color'] == Colors.green) colorStr = "Colors.green";

    // Build the string manually to ensure it looks like clean Dart code
    String mapString = "  {\n"
        "    'id': '${entry['id']}',\n"
        "    'type': '${entry['type']}',\n"
        "    'zbcoin': '${entry['zbcoin']}',\n"
        "    'color': $colorStr,\n"
        "    'channel': '${entry['channel']}',\n"
        "    'design': '${entry['design']}',\n"
        "    'bg': '${entry['bg']}',\n"
        "    'verb': '${entry['verb']}',\n"
        "    'maincenter': '${entry['maincenter']}',\n"
        "    'subcenter': '${entry['subcenter']}',\n"
        "    'rotation_note': '${entry['rotation_note'] ?? ''}',\n"
        "    'generate_he': '${entry['generate_he'] ?? ''}',\n"
        "    'silence_he': '${entry['silence_he'] ?? ''}',\n"
        "    'sentence_en': '${entry['sentence_en'] ?? ''}',\n"
        "    'sentence_he': '${entry['sentence_he'] ?? ''}',\n"
        "  },";

    debugPrint(mapString);
  }

  debugPrint("];");
  debugPrint("/// COPY END ///");
}

void autoStandardizeFiles() async {
  // Update this to the exact folder path on your computer
  final directory = Directory('assets/txt/heb');

  if (!await directory.exists()) {
    print('❌ Directory not found!');
    return;
  }

  final List<FileSystemEntity> files = await directory.list().toList();

  for (var entity in files) {
    if (entity is File && entity.path.endsWith('.txt')) {
      String oldFullPath = entity.path;
      String oldFileName = oldFullPath.split(Platform.pathSeparator).last;

      // 1. Identify Language
      bool isHeb = RegExp(r'[\u0590-\u05FF]').hasMatch(oldFileName);
      String suffix = isHeb ? '_he' : '_en';

      // 2. Clean Name: Remove .txt, replace spaces/special chars with underscores
      String cleanBase = oldFileName
          .replaceAll('.txt', '')
          .trim()
          .replaceAll(
            RegExp(r'[^\u0590-\u05FFa-zA-Z0-9]'),
            '_',
          ) // Replace non-alphanumeric with _
          .replaceAll(RegExp(r'_+'), '_'); // Collapse multiple underscores

      // 3. Final Name: title_lang.txt
      String newFileName = '${cleanBase}$suffix.txt';
      String newFullPath =
          '${directory.path}${Platform.pathSeparator}$newFileName';

      // 4. Rename on Disk
      if (oldFullPath != newFullPath) {
        await entity.rename(newFullPath);
        print('✅ Renamed: $oldFileName -> $newFileName');
      }
    }
  }
  print('✨ 206+ files standardized!');
}

void performFinalBilingualStitch() {
  List<Map<String, dynamic>> master = List.from(transaction36);

  String findAndClean(List<String> list, String id) {
    int idx = list.indexOf(id);
    if (idx != -1 && idx + 1 < list.length) {
      String raw = list[idx + 1];
      String cleaned = raw.contains(': ') ? raw.split(': ').last : raw;
      return cleaned.trim().replaceAll("'", "\\'");
    }
    return "";
  }

  debugPrint("/// COPY START ///");
  debugPrint("final List<Map<String, dynamic>> transaction36_new = [");

  for (var entry in master) {
    String id = entry['id'];

    // 1. Prepare safe strings with manual quotes
    String sEn = findAndClean(new_rtransaction36Englst, id);
    String sHe = findAndClean(rtransaction36Heblst, id);
    String rEn = findAndClean(upd_rtransaction36Englst, id);
    String rHe = (entry['silence_he'] ?? "").replaceAll("'", "\\'");

    // 2. Map ZB-Coin Pair
    Map<String, String> coinMap = {
      'silence': 'שתיקה',
      'breath': 'נשימה',
      'COMPLEX': 'מורכב',
    };
    String zEn = entry['zbcoin'] ?? 'silence';
    String zHe = coinMap[zEn] ?? '';

    // 3. Simple Color Mapping (to avoid that long MaterialColor string)
    String colorName = "Colors.blue";
    if (entry['color'] == Colors.red) colorName = "Colors.red";
    if (entry['color'] == Colors.yellow) colorName = "Colors.yellow";
    if (entry['color'] == Colors.green) colorName = "Colors.green";

    // 4. Build the Output with explicit quotes ''
    debugPrint("  {");
    debugPrint("    'id': '$id',");
    debugPrint("    'color': $colorName,");
    debugPrint("    'zbcoin': ['$zEn', '$zHe'],");
    debugPrint("    'sentence': ['$sEn', '$sHe'],");
    debugPrint("    'rotation': ['$rEn', '$rHe'],");
    debugPrint("    'channel': '${entry['channel']}',");
    debugPrint("  },");
  }

  debugPrint("];");
  debugPrint("/// COPY END ///");
}

// String _getColorName(dynamic color) {
//   if (color == Colors.blue) return 'blue';
//   if (color == Colors.yellow) return 'yellow';
//   if (color == Colors.red) return 'red';
//   return 'grey';
// }

class ZBHelpers {
  static Future<ZBAccount> generateAccount(
    DateTime targetTime, {
    bool isNow = false,
  }) async {
    // 1. TIMING LOGIC
    DateTime calculationTime = isNow ? DateTime.now() : targetTime;

    // 2. PLANETARY FETCH (Personality & Design)
    List<ZBWallet> pList = [];
    try {
      pList = await ZBExternalService.fetchWalletsForTime(calculationTime)
          .timeout(const Duration(seconds: 2));
      // print("DEBUG: COMPLEX Fetch PEACEFUL. Count: ${pList.length}"); // 👈 Add
    } catch (e) {
      // print("DEBUG: COMPLEX Fetch ANGRY or TIMED OUT: $e"); // 👈 Add
      pList = _generateEmptyWallets(14);
    }

    DateTime dTime = await ZBExternalService.getDesignTime(calculationTime);
    List<ZBWallet> dList = [];
    try {
      dList = await ZBExternalService.fetchWalletsForTime(dTime)
          .timeout(const Duration(seconds: 2));
      // print("DEBUG: silence Fetch SATISFIED. Count: ${dList.length}"); // 👈 Add
    } catch (e) {
      // print("DEBUG: silence Fetch FRUSTRATED or TIMED OUT: $e"); //
      dList = _generateEmptyWallets(14);
    }

    final List<ZBWallet> pList13 = pList.take(13).toList();
    final List<ZBWallet> dList13 = dList.take(13).toList();

    // 3. LOGIC ENGINE (Now uses ONLY the 13 standard bodies)
    final List<ZBTransaction> activeTransactions =
        ZBLogic.calcActiveTransactions(pList13, dList13);

    final List<ZBCounter> activeCounters =
        ZBLogic.calcActiveCounter(activeTransactions);

    // // debugPrint('=== activeTransactions (${activeTransactions.length}) ===');
    // for (final tx in activeTransactions) {
    //   debugPrint(
    //       '  tx:${tx.id} state:${tx.zbstate} main:${tx.mainCounterId} sub:${tx.subCounterId}');
    // }

    // debugPrint('=== activeCounters (${activeCounters.length}) ===');
    // for (final c in activeCounters) {
    //   debugPrint('  counter:${c.name} id:${c.id} state:${c.state}');
    // }
    // debugPrint('==========================================');

    // 4. STRATEGY & AUTHORITY ANALYSIS
    // Now this analysis is "Clean" because it only sees the 13 planets
    final analysisMap = ZBLogic.zbstrategyauthority(
      zbtransactions: activeTransactions,
      counters: activeCounters,
    );

    // 5. DATA MAPPING (Strings to IDs)
    // final String resType = analysisMap['type'] ?? '';
    final String resSubtype = analysisMap['subtype'] ?? '';
    // final String resAuth = analysisMap['authority'] ?? '';
    final String resSubAuth = analysisMap['subauthority'] ?? '';
    final String resStrategy = analysisMap['strategy'] ?? '';

    // 5. DATA MAPPING (Strings to IDs with DEBUG)
    final String resType = (analysisMap['type'] ?? '').trim();
    final String resAuth = (analysisMap['authority'] ?? '').trim();

    // 🕵️ DEBUG LOGS - Check your VS Code Console!
    // print("--------------------------------------------------");
    // print("📊 LOGIC RESULTS for ${targetTime.toIso8601String()}");
    // print("🔎 Raw Type from Logic: '$resType'");
    // print("🔎 Raw Auth from Logic: '$resAuth'");

    int tId = 1; // Default fallback
    try {
      final matchedType = ZBData.getTypeMap.values.firstWhere(
        (t) =>
            t.type.toLowerCase() == resType.toLowerCase() ||
            t.typeheb == resType,
      );
      tId = matchedType.id;
      // print("✅ Matched Type ID: $tId (${matchedType.type})");
    } catch (e) {
      // print("❌ TYPE MATCH FAILED: No match found for '$resType' in getTypeMap");
    }

    int aId = 6; // Default fallback
    try {
      final matchedAuth = ZBData.getAuthMap.values.firstWhere(
        (a) =>
            a.authority.toLowerCase() == resAuth.toLowerCase() ||
            a.authheb == resAuth,
      );
      aId = matchedAuth.id;
      // print("✅ Matched Auth ID: $aId (${matchedAuth.authority})");
    } catch (e) {
      // print("❌ AUTH MATCH FAILED: No match found for '$resAuth' in getAuthMap");
    }
    // print("--------------------------------------------------");

    final String resDefinition = activeTransactions.isEmpty
        ? 'None'
        : ZBLogic.getDefinition(activeTransactions);

    final zbsentence = ZBLogic.findZBStrategy(resType, resAuth);

    // 6. FINAL RETURN (The Unified ZBAccount)

    return ZBAccount(
      zbpersonality: pList,
      zbdesign: dList,
      zbtransactions: activeTransactions,
      zbcounters: activeCounters,
      timestamp: calculationTime,
      designtimestamp: dTime,
      isJustNow: isNow,
      // HD Heavy Data
      type: resType,
      subtype: resSubtype,
      authority: resAuth,
      subauthority: resSubAuth,
      strategy: resStrategy,
      definition: resDefinition,
      sentence: zbsentence.sentenceheb,
      typeid: tId,
      authid: aId,
    );
  }

  static List<ZBWallet> _generateEmptyWallets(int count) {
    // Ensuring the fallback creates the correct object type
    return List.generate(count, (i) => ZBWallet(wallet: 0, planet: 'Empty'));
  }
}

// --- SEARCH ENGINE LOGIC ---
// --- DATA HOLDER ---
// import 'rtlists.dart'; // Ensure your script-generated lists are accessible

class TextFileSearchDelegate extends SearchDelegate {
  // 1. Point these to your script-generated lists in rtlists.dart
  final List<String> hebtxtFiles = TxtFilesList.hebFiles;
  final List<String> engtxtFiles = TxtFilesList.engFiles;

  // 💡 ADD THESE TWO LINES HERE:
  // Future<List<SearchResult>>? _lastSearch;
  // String? _lastQuery;

  @override
  String get searchFieldLabel => 'חיפוש... / Search...';

  // --- REQUIRED OVERRIDES ---

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '', // Clears the search bar
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null), // Closes the search
    );
  }

  @override
  Widget buildResults(BuildContext context) => _searchInFiles();

  @override
  Widget buildSuggestions(BuildContext context) {
    // 💡 REMOVED: The manual if (query.isEmpty) block that was showing filenames.
    // 🎯 NOW: Both states use the same engine that handles titles and RTL.
    return _searchInFiles();
  }

  // 💡 Add this variable to your TextFileSearchDelegate class to cache the initial list
  Future<List<ZBSearchResult>>? _browseFuture;

  Widget _searchInFiles() {
    // 1. Define which "Future" to use
    // If the query is empty, we use (or create) the cached _browseFuture.
    // If the user is typing, we create a fresh search Future.
    final Future<List<ZBSearchResult>> activeFuture = query.isEmpty
        ? (_browseFuture ??= _performSearch(""))
        : _performSearch(query);

    return FutureBuilder<List<ZBSearchResult>>(
      future: activeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            !snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final results = snapshot.data ?? [];

        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final result = results[index];
            // This uses your custom tile with the 'fileTitle' (currently "כותרת בדיקה 123")
            return SearchResultTile(result: result);
          },
        );
      },
    );
  }

  Future<List<ZBSearchResult>> _performSearch(String searchTerm) async {
    List<ZBSearchResult> hits = [];
    final bool isInitialBrowse = searchTerm.isEmpty;

    final allFiles = [
      ...hebtxtFiles.map((f) => 'assets/txt/heb/$f'),
      ...engtxtFiles.map((f) => 'assets/txt/eng/$f'),
    ];

    for (String path in allFiles) {
      try {
        // 1. Load the actual file content
        String content = await rootBundle.loadString(path);

        // 2. Use your getTitle logic (First non-empty line)
        // 🎯 Clean call to your helper
        String realTitle = getTitle(content);

        // 3. Fallback: If the file is somehow empty, use the filename
        if (realTitle.isEmpty) {
          realTitle = path.split('/').last;
        }

        // 4. Filter Logic
        if (isInitialBrowse ||
            content.toLowerCase().contains(searchTerm.toLowerCase())) {
          bool isHeb = path.contains('/heb/');

          hits.add(
            ZBSearchResult(
              fileName: path.split('/').last,
              fileTitle: realTitle, // 🎯 Dynamic Title achieved!
              snippet: isInitialBrowse ? "" : _getSnippet(content, searchTerm),
              query: searchTerm,
              isHebrew: isHeb,
            ),
          );
        }
      } catch (e) {
        debugPrint("Error reading $path: $e");
      }
    }
    return hits;
  }
}

String getTitle(String content, {String? path}) {
  final realTitle = content
      .split('\n')
      .firstWhere((l) => l.trim().isNotEmpty, orElse: () => "")
      .trim();

  // If the first line is empty, use the filename from the path,
  // or a final fallback string.
  return realTitle.isNotEmpty
      ? realTitle
      : (path?.split('/').last ?? "Untitled");
}

String _getSnippet(String content, String query) {
  if (query.isEmpty) return "";

  final String lowercaseContent = content.toLowerCase();
  final String lowercaseQuery = query.toLowerCase();
  final int matchIndex = lowercaseContent.indexOf(lowercaseQuery);

  if (matchIndex == -1) return "";

  // 💡 Determine how much text to show around the match
  const int contextWindow = 30;
  final int start = (matchIndex - contextWindow).clamp(0, content.length);
  final int end = (matchIndex + query.length + contextWindow).clamp(
    0,
    content.length,
  );

  String snippet = content.substring(start, end).replaceAll('\n', ' ');

  // Add ellipses if we've cut the text
  if (start > 0) snippet = "...$snippet";
  if (end < content.length) snippet = "$snippet...";

  return snippet;
}

// Simple helper class for results
class WalletSearchResult {
  final String base;
  final String value;
  WalletSearchResult({required this.base, required this.value});
}

class DebugHelper {
  /// Pulls the stats from the ZmansiDbProvider singleton and prints them
  static Future<void> printMigrationReport() async {
    // We access the .db singleton you defined in your provider
    // Note: You will still need one import at the top for ZmansiDbProvider
    // so the compiler knows where the class is located!
    final stats = await ZmansiDbProvider.db.getDatabaseStats();

    debugPrint("═══ DATABASE MIGRATION REPORT ═══");

    if (stats.isEmpty) {
      debugPrint("❌ Table is EMPTY. Migration failed or didn't run.");
      return;
    }

    int totalItems = 0;

    for (var row in stats) {
      final count = row['record_count'] as int;
      totalItems += count;

      debugPrint(
        "📍 Group: ${row['source_group'].toString().padRight(12)} | Count: ${count.toString().padLeft(5)} | Type: ${row['layer_state']}",
      );
    }

    debugPrint("─────────────────────────────────");
    debugPrint("📊 TOTAL RECORDS MIGRATED: $totalItems");
    debugPrint("═════════════════════════════════");
  }
}

class TimeServices {
  static Future<DateTime> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    DateTime? pickedDate = DateTime.now();

    pickedDate = await showDatePicker(
      locale: const Locale("he"),
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1781),
      lastDate: DateTime(2222),
    );

    if (pickedDate == null) {
      selectedDate = DateTime.now();
    } else {
      selectedDate = pickedDate;
    }
    return selectedDate;
  }

  static Future<TimeOfDay> selectTime(BuildContext context) async {
    TimeOfDay selectedtime = TimeOfDay.now();
    final TimeOfDay? newTime = await showTimePicker(
      helpText: 'זמן לבחור',
      cancelText: 'ביטול',
      confirmText: 'אישור',
      hourLabelText: 'שעות',
      minuteLabelText: 'דקות',
      context: context,
      initialTime: selectedtime,
    );

    selectedtime = newTime ?? TimeOfDay.now();

    return selectedtime;
  }
}

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}

Future<CityTime> readJsonCityTime() async {
  var data = json.decode(json.encode('assets/json/cityMap'));
  //List<dynamic> data = json.decode(json.encode('assets/json/cityMap.json'));
  //List<CityTime> ct = data.map((json) => CityTime.fromJson(json)).toList();
  CityTime ct = CityTime.fromJson(jsonDecode(data));
  // print(ct.city);
  return ct;
}

class TextCache {
  static final TextCache _instance = TextCache._internal();
  factory TextCache() => _instance;
  TextCache._internal();

  // Maps filePath -> fullFileContent
  final Map<String, String> _storage = {};
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  /// Loads all files into RAM. Use this once at app startup.
  Future<void> prefetch(List<String> paths) async {
    if (_isLoaded) return;

    for (var path in paths) {
      try {
        // Direct RAM injection
        _storage[path] = await rootBundle.loadString(path);
      } catch (e) {
        print("Error caching $path: $e");
      }
    }
    _isLoaded = true;
  }

  String? get(String path) => _storage[path];

  List<String> get allPaths => _storage.keys.toList();
}

class SearchHelper {
  /// 1. The "Inhaler": Pumps all files into TxtFilesList.cache
  static Future<void> initializeCache() async {
    TxtFilesList.cache.clear();

    // Helper to process a list with a specific folder prefix
    Future<void> loadFolder(List<String> files, String folder) async {
      for (String fileName in files) {
        try {
          // Construct the full asset path
          final fullPath = 'assets/txt/$folder/$fileName';

          // We still use the fileName (or fullPath) as the key for your search logic
          TxtFilesList.cache[fileName] = await rootBundle.loadString(fullPath);
        } catch (e) {
          // print("Error caching $fileName from $folder: $e");
        }
      }
    }

    // Load both folders
    await loadFolder(TxtFilesList.hebFiles, 'heb');
    await loadFolder(TxtFilesList.engFiles, 'eng');
  }

  /// 2. The "Engine": Searches the RAM instead of the disk
  static List<Map<String, String>> search(String query) {
    final List<Map<String, String>> matches = [];
    final cleanQuery = query.toLowerCase().trim();
    final allPaths = [...TxtFilesList.hebFiles, ...TxtFilesList.engFiles];

    for (String path in allPaths) {
      final content = TxtFilesList.cache[path];
      if (content == null) continue;

      if (cleanQuery.isEmpty) {
        // Browse Mode: Grab the first non-empty line
        String firstLine = content
            .split('\n')
            .firstWhere((l) => l.trim().isNotEmpty, orElse: () => "Empty");
        matches.add({'path': path, 'title': firstLine, 'type': 'browse'});
      } else if (content.toLowerCase().contains(cleanQuery)) {
        // Search Mode
        matches.add({
          'path': path,
          'title': path.split('/').last,
          'snippet': _extractSnippet(content, cleanQuery),
          'type': 'match',
        });
      }
    }
    return matches;
  }

  static String _extractSnippet(String text, String query) {
    int idx = text.toLowerCase().indexOf(query);
    int start = (idx - 40).clamp(0, text.length);
    int end = (idx + query.length + 40).clamp(0, text.length);
    return "...${text.substring(start, end)}...";
  }
}

class RotationTimerProvider extends ChangeNotifier {
  int _secondsRemaining = 0;
  bool _timerActive = false;
  Timer? _visualCountdown;

  int get secondsRemaining => _secondsRemaining;
  bool get isTimerActive => _timerActive;

  RotationTimerProvider() {
    _secondsRemaining = userDefinedSeconds;
    startVisualTimer();
  }

  void resetTimer() {
    _secondsRemaining = userDefinedSeconds;
    notifyListeners();
  }

  void startVisualTimer() {
    _visualCountdown?.cancel();
    if (userDefinedSeconds == 0) {
      _secondsRemaining = 0;
      _timerActive = false;
      notifyListeners();
      return;
    }

    _secondsRemaining = userDefinedSeconds;
    _timerActive = true;

    _visualCountdown = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (userDefinedSeconds == 0) {
        timer.cancel();
        return;
      }

      if (_timerActive && _secondsRemaining > 0) {
        _secondsRemaining--;
        notifyListeners(); // Only listeners rebuild now
      } else if (_secondsRemaining <= 0) {
        hibernateEngine();
        _secondsRemaining = userDefinedSeconds;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _visualCountdown?.cancel();
    super.dispose();
  }
}

// hd helpers
final List<String> hdgateline = List.generate(384, (index) {
  int gate = (index ~/ 6) + 1;
  int line = (index % 6) + 1;
  return '$gate.$line';
});

// 4. THE SHARED GRADIENT GENERATOR
List<Color> generateBridgeGradients() {
  List<Color> gradients = [];
  for (int i = 0; i < 12; i++) {
    int startGate = (i * (64 / 12)).floor();
    int endGate = ((i + 1) * (64 / 12)).floor() - 1;

    Color colorStart = getWalletLayerColor(startGate, 'bot', isReversed: true);
    Color colorEnd = (endGate < 64)
        ? getWalletLayerColor(endGate, 'bot', isReversed: true)
        : getWalletLayerColor(0, 'bot', isReversed: true);

    if (colorStart != colorEnd) {
      gradients.add(colorStart);
      gradients.add(colorEnd);
    } else {
      gradients.add(colorStart);
      // Swapping hardcoded list for the math function on the 'mid' layer
      gradients.add(getWalletLayerColor(startGate, 'mid', isReversed: true));
    }
  }
  return gradients;
}

// 1. THE SHARED PALETTE
final List<Color> _palette = [
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.red,
];

// 2. THE BASE MATHEMATICAL LISTS
// These represent the "DNA" of your wheel.
final List<Color> botcoincolor = List.generate(64, (i) => _palette[i ~/ 16]);

final List<Color> midcoincolor = List.generate(64, (i) {
  List<Color> currentPalette = i < 32 ? _palette : _palette.reversed.toList();
  return currentPalette[(i ~/ 4) % 4];
});

final List<Color> topcoincolor = List.generate(64, (i) {
  List<Color> currentPalette = i < 32 ? _palette : _palette.reversed.toList();
  return currentPalette[i % 4];
});

class FontPickerHelper extends StatefulWidget {
  final Function(String) onFontChanged;
  final String initialFont;

  const FontPickerHelper({
    super.key,
    required this.onFontChanged,
    this.initialFont = 'System',
  });

  @override
  State<FontPickerHelper> createState() => _FontPickerHelperState();
}

class _FontPickerHelperState extends State<FontPickerHelper> {
  late String _selectedFont;

  // Add the names exactly as defined in your pubspec.yaml
  final List<String> _availableFonts = [
    'System',
    'Symbola',
    'Astromoony',
    'ZmansiGothic',
  ];

  @override
  void initState() {
    super.initState();
    _selectedFont = widget.initialFont;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedFont,
      icon: const Icon(Icons.font_download, color: Colors.blue),
      underline: Container(height: 2, color: Colors.blueAccent),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedFont = newValue;
          });
          widget.onFontChanged(newValue);
        }
      },
      items: _availableFonts.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(fontFamily: value)),
        );
      }).toList(),
    );
  }
}

class DynamicFontPicker extends StatefulWidget {
  final Function(String) onFontChanged;

  const DynamicFontPicker({super.key, required this.onFontChanged});

  @override
  State<DynamicFontPicker> createState() => _DynamicFontPickerState();
}

class _DynamicFontPickerState extends State<DynamicFontPicker> {
  List<String> _fonts = ['System']; // Default
  String _selectedFont = 'System';

  @override
  void initState() {
    super.initState();
    _loadFonts();
  }

  Future<void> _loadFonts() async {
    // 1. Load the manifest
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // 2. Filter for files in your fonts folder and extract the name
    final fontPaths = manifestMap.keys
        .where((String key) => key.contains('assets/fonts/'))
        .where((String key) => key.endsWith('.ttf') || key.endsWith('.otf'))
        .toList();

    // 3. Extract the Family Name
    // This assumes your font names in pubspec match your filenames
    // e.g., assets/fonts/Symbola.ttf -> Symbola
    List<String> detectedFonts = fontPaths.map((path) {
      return path.split('/').last.split('.').first;
    }).toList();

    setState(() {
      _fonts = ['System', ...detectedFonts];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_fonts.length <= 1) return const CircularProgressIndicator();

    return DropdownButton<String>(
      value: _selectedFont,
      items: _fonts.map((String font) {
        return DropdownMenuItem<String>(
          value: font,
          child: Text(font, style: TextStyle(fontFamily: font)),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() => _selectedFont = newValue);
          widget.onFontChanged(newValue);
        }
      },
    );
  }
}

class ZBAssetManager {
  /// Returns all filenames in a specific subfolder (e.g., 'assets/txt/heb/')
  static Future<List<String>> getFilesByFolder(String folderPath) async {
    // 1. Load the binary manifest
    final AssetManifest manifest = await AssetManifest.loadFromAssetBundle(
      rootBundle,
    );

    // 2. Filter for the specific directory
    // Ensure folderPath ends with a '/' (e.g., 'assets/txt/eng/')
    final List<String> assets = manifest
        .listAssets()
        .where((path) => path.startsWith(folderPath))
        .toList();

    return assets;
  }
}

class ZBGateFactory {
  /// Generates a gatestatelist based on the "Attention Level"
  static List<int> generateAttentionList({
    required List<int> activeGates, // The actual gates from the person's chart
    bool isComplexMode = false, // The "Attention" toggle
  }) {
    // Start with the empty "Arithmetic" (65 slots of 0)
    List<int> list = List.filled(65, 0);

    for (int gate in activeGates) {
      if (isComplexMode) {
        // COMPLEX: High Attention.
        // We might distinguish between Design/Personality here later.
        list[gate] = 2;
      } else {
        // SIMPLE: Grounded Attention.
        // Maybe we only show a subset or simplified state.
        list[gate] = 1;
      }
    }
    return list;
  }
}

/// Populates any 65-slot list from a planet data source
void updateWalletFromPlanets({
  required List<dynamic> planetSource,
  required List<int> targetWallet,
  int value = 1,
}) {
  // Clear the target first to ensure a "Fresh Dream"
  targetWallet.fillRange(0, 65, 0);

  for (var p in planetSource) {
    if (p.gate != null && p.gate! < 65) {
      targetWallet[p.gate!] = value;
    }
  }
}

/// The "Poetry Engine" - Combines Design and Personality into the Main Wallet
void syncMainWallet() {
  for (int i = 0; i < 65; i++) {
    int d = design64list[i];
    int p = person64list[i];

    if (d > 0 && p > 0) {
      ZBData.walletstatelist[i] = 3; // Defined in both (Purple/Striped)
    } else if (d > 0) {
      ZBData.walletstatelist[i] = 1; // Design Only (Red)
    } else if (p > 0) {
      ZBData.walletstatelist[i] = 2; // Personality Only (Black)
    } else {
      ZBData.walletstatelist[i] = 0; // Undefined (Shadow)
    }
  }
}

Color getWalletLayerColor(int index, String layer, {bool isReversed = false}) {
  // Use index 0-63
  int i = isReversed ? (63 - index) : index;

  // Base Tribe Colors (Colors4lst logic)
  // 0: Blue, 1: Green, 2: Yellow, 3: Red
  final List<Color> bgry = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.red,
  ];
  final List<Color> rygb = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
  ];

  // 1. Calculate the BOTTOM foundation (Changes every 16)
  // This determines the "Flavor" of the sector
  int botIndex = (i ~/ 16) % 4;
  Color botColor = bgry[botIndex];

  if (layer == 'bot') return botColor;

  // 2. Determine sequence behavior for Mid and Top
  // Logic: Blue/Green foundation uses BGRY, Yellow/Red uses RYGB
  bool isCoolFoundation = (botIndex == 0 || botIndex == 1); // Blue or Green
  List<Color> activeSequence = isCoolFoundation ? bgry : rygb;

  switch (layer) {
    case 'mid':
      // Changes every 4
      return activeSequence[(i ~/ 4) % 4];
    case 'top':
      // Changes every 1
      return activeSequence[i % 4];
    default:
      return Colors.transparent;
  }
}
