import 'dart:async';
import 'dart:io';
import 'package:finallyicanlearn/zb/data/zb_listdb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';

// Import your existing lists to migrate them
// import '../listdb.dart';

class ZmansiDbProvider {
  static Database? _database;
  static final ZmansiDbProvider db = ZmansiDbProvider._();

  ZmansiDbProvider._();

  Future<Database> get database async {
    // If _database exists, return it immediately.
    // If it's null, await initDB(), assign the result to _database, and then return it.
    return _database ??= await initDB();
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), "zmansi_bob.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE ZB_RotationData (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            source_group TEXT,
            item_index INTEGER,
            val_en TEXT,
            val_he TEXT UNIQUE,  -- 🔥 ADD UNIQUE HERE to enable 'INSERT OR IGNORE'
            asset_path TEXT,
            layer_state TEXT,
            metadata TEXT
          )
        ''');
      },
    );
  }

  // --- MIGRATION ENGINE ---

  Future<void> migrateLegacyLists() async {
    final dbClient = await database;

    // 1. Gatekeeper (Keep this as is)
    var count = Sqflite.firstIntValue(
      await dbClient.rawQuery('SELECT COUNT(*) FROM ZB_RotationData'),
    );
    if (count != null && count > 0) return;

    Batch batch = dbClient.batch();

    // 2. Breath Assets (Your existing logic)
    for (int i = 0; i < coins12lst.length; i++) {
      batch.insert('ZB_RotationData', {
        'source_group': 'coins12',
        'item_index': i,
        'asset_path': coins12lst[i],
        'layer_state': 'breath',
      });
    }

    // 3. The "Complex" Consolidation (The 30,000 lines)
    // We put all your Hebrew lists into one "Master List" to process
    // for (var currentList in allLists) {
    //   for (int i = 0; i < currentList.length; i++) {
    //     // 'INSERT OR IGNORE' is the SQL magic that skips duplicates
    //     // It works if you defined 'val_he' as UNIQUE in your CREATE TABLE statement
    //     batch.rawInsert('''
    //     INSERT OR IGNORE INTO ZB_RotationData
    //     (source_group, item_index, val_he, layer_state)
    //     VALUES (?, ?, ?, ?)
    //   ''', ['complex_source', i, currentList[i], 'complex']);
    //   }
    // }

    for (int listIdx = 0; listIdx < allLegacyLists.length; listIdx++) {
      final currentList = allLegacyLists[listIdx];
      String groupID = "src_$listIdx"; // Map back to your registry index

      for (int i = 0; i < currentList.length; i++) {
        batch.rawInsert(
          '''
      INSERT OR IGNORE INTO ZB_RotationData 
      (source_group, item_index, val_he, layer_state) 
      VALUES (?, ?, ?, ?)
    ''',
          [
            groupID,
            i,
            currentList[i].toString(), // Ensures safety for int/string mix
            'complex',
          ],
        );
      }
    }

    await batch.commit(noResult: true);
    debugPrint("🎯 Migration of all lists complete.");
  }

  // --- CRUD OPERATIONS ---

  Future<void> clearDatabase() async {
    final dbClient = await database;
    await dbClient.delete('ZB_RotationData');
  }

  static Future<void> testBreathLayer() async {
    final dbClient = await ZmansiDbProvider.db.database;

    // Check the total count of EVERYTHING in the DB
    var total = Sqflite.firstIntValue(
      await dbClient.rawQuery('SELECT COUNT(*) FROM ZB_RotationData'),
    );

    debugPrint("📊 ZB Engine Status: $total total rows detected.");

    // Your existing breath check...
    final List<Map<String, dynamic>> assets =
        await ZmansiDbProvider.db.getRotationByLayer('breath');

    if (assets.isNotEmpty) {
      debugPrint("✅ Breath Assets: ${assets.length} found.");
    }
  }

  Future<List<Map<String, dynamic>>> getRotationByLayer(String layer) async {
    final dbClient = await database;
    return await dbClient.query(
      'ZB_RotationData',
      where: 'layer_state = ?',
      whereArgs: [layer],
    );
  }

  /// Completely removes the database file from the device
  Future<void> deleteFullDatabase() async {
    // join and getDatabasesPath come from path and sqflite
    String path = join(await getDatabasesPath(), "zmansi_bob.db");

    await deleteDatabase(path); // This is a sqflite function
    _database = null; // Clear the memory instance

    debugPrint("🗑️ Database 'zmansi_bob.db' has been wiped from the system.");
  }

  static Future<void> checkDatabaseStatus() async {
    final dbClient = await ZmansiDbProvider.db.database;

    // 1. Get the current schema version
    int version = await dbClient.getVersion();

    // 2. Count total items across all 288 lists
    var total = Sqflite.firstIntValue(
      await dbClient.rawQuery('SELECT COUNT(*) FROM ZB_RotationData'),
    );

    debugPrint("""
    📋 --- ZMANSI DB STATUS ---
    📍 Schema Version: $version
    🔢 Total Records: $total
    ---------------------------
    """);
  }

  Future<List<Map<String, dynamic>>> searchHebrew(String query) async {
    final dbClient = await database;

    // Search for the Hebrew string within the 'val_he' column
    return await dbClient.query(
      'ZB_RotationData',
      where: 'val_he LIKE ?',
      whereArgs: ['%$query%'], // Wildcard search for partial matches
    );
  }

  // inside zb_provider.dart

  Future<List<Map<String, dynamic>>> getDatabaseStats() async {
    final dbClient = await database;

    // This query returns a list of maps containing source_group and the count
    return await dbClient.rawQuery('''
    SELECT source_group, COUNT(*) as record_count, layer_state 
    FROM ZB_RotationData 
    GROUP BY source_group 
    ORDER BY layer_state DESC
  ''');
  }

  Future<void> querySpecificGroup(String groupId) async {
    final dbClient = await database;

    // Querying the specific group you identified
    final List<Map<String, dynamic>> results = await dbClient.query(
      'ZB_RotationData',
      where: 'source_group = ?',
      whereArgs: [groupId],
    );

    if (results.isEmpty) {
      debugPrint("⚠️ No data found for group: $groupId");
      return;
    }

    debugPrint("📖 --- DATA VIEW: $groupId ---");
    for (var row in results) {
      debugPrint("ID: ${row['id']} | Index: ${row['item_index']}");
      debugPrint("HE: ${row['val_he']}");
      debugPrint("EN: ${row['val_en'] ?? 'No English'}");
      debugPrint("State: ${row['layer_state']}");
    }
    debugPrint("-------------------------------");
  }

  static Future<void> printDatabasePath() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "zmansi_bob.db");

    debugPrint("📂 DATABASE LOCATION:");
    debugPrint(path);

    // Check if it actually exists
    bool exists = await File(path).exists();
    debugPrint("Exist Status: ${exists ? '✅ FOUND' : '❌ NOT FOUND'}");
  }

  Future<Map<String, dynamic>> getNextRotationItem() async {
    final dbClient = await database;

    // Pull one random row from the entire 6164-row collection
    final List<Map<String, dynamic>> maps = await dbClient.query(
      'ZB_RotationData',
      orderBy: 'RANDOM()',
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return maps.first;
    } else {
      // Return a 'Silence' fallback if the DB is empty
      return {'val_he': '...', 'layer_state': 'silence'};
    }
  }

  // This acts as your "Digital Librarian"
  Future<List<Map<String, dynamic>>> getWalletsBySize(int size) async {
    final dbClient = await database;

    // We are asking: "Give me every item from any list that has exactly [size] items"
    return await dbClient.rawQuery(
      '''
    SELECT source_group, item_index, val_he, val_en 
    FROM ZB_RotationData 
    WHERE source_group IN (
      SELECT source_group 
      FROM ZB_RotationData 
      GROUP BY source_group 
      HAVING COUNT(*) = ?
    )
    ORDER BY source_group, item_index
  ''',
      [size],
    );
  }

  // 🏦 THE WALLET RETRIEVER
  Future<List<String>> getWalletAsList(int size) async {
    final dbClient = await database;

    // Finds the first source_group that has the exact count (e.g., 64)
    final List<Map<String, dynamic>> results = await dbClient.rawQuery(
      '''
    SELECT val_he FROM ZB_RotationData 
    WHERE source_group = (
      SELECT source_group FROM ZB_RotationData 
      GROUP BY source_group HAVING COUNT(*) = ? LIMIT 1
    )
    ORDER BY item_index ASC
  ''',
      [size],
    );

    // Converts the SQL rows back into a standard Dart List<String>
    return results.map((row) => row['val_he'] as String).toList();
  }

  // 🏦 THE WALLET RETRIEVER
  Future<List<String>> getSpecificWallet(int targetSize) async {
    final dbClient = await database;

    // This finds the first source_group that matches the size you clicked
    final List<Map<String, dynamic>> results = await dbClient.rawQuery(
      '''
    SELECT val_he FROM ZB_RotationData 
    WHERE source_group = (
      SELECT source_group FROM ZB_RotationData 
      GROUP BY source_group HAVING COUNT(*) = ? LIMIT 1
    )
    ORDER BY item_index ASC
  ''',
      [targetSize],
    );

    // Map the SQL rows back into a standard Dart List<String>
    return results.map((row) => row['val_he'] as String).toList();
  }

  Future<List<String>> getWalletByName(String groupName) async {
    final dbClient = await database;
    final List<Map<String, dynamic>> results = await dbClient.query(
      'ZB_RotationData',
      columns: ['val_he'],
      where: 'source_group = ?',
      whereArgs: [groupName],
      orderBy: 'item_index ASC',
    );
    return results.map((row) => row['val_he'] as String).toList();
  }
}
