import 'dart:async';

import 'package:my_pantry_flutter_app/models/own_category.dart';
import 'package:my_pantry_flutter_app/models/storage_location.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/product.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "mypantry.db";

  static const String productTableName = "Product";
  static const String ownCategoriesTableName = "OwnCategory";
  static const String storageLocationsTableName = "StorageLocation";

  static const String productTable = "CREATE TABLE Product(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL, mainCategory TEXT, detailCategory TEXT, expirationDate TEXT, productionDate TEXT, composition TEXT, healingProperties TEXT, dosage TEXT, weight INTEGER, volume INTEGER, isVege INTEGER, isBio INTEGER, hasSugar INTEGER, hasSalt INTEGER, taste TEXT);";
  static const String ownCategoriesTable = "CREATE TABLE OwnCategory(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL, description TEXT);";
  static const String storageLocationsTable = "CREATE TABLE StorageLocation(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT NOT NULL, description TEXT);";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async =>
        {
          await db.execute(productTable),
          await db.execute(ownCategoriesTable),
          await db.execute(storageLocationsTable),
        },
        version: _version);
  }

  static Future<int> addProduct(Product product) async {
    final db = await _getDB();
    return await db.insert(productTableName, product.toMap());
  }

  static Future<int> addOwnCategory(OwnCategory ownCategory) async {
    final db = await _getDB();
    return await db.insert(ownCategoriesTableName, ownCategory.toMap());
  }

  static Future<int> addStorageLocation(StorageLocation storageLocation) async {
    final db = await _getDB();
    return await db.insert(storageLocationsTableName, storageLocation.toMap());
  }

  static Future<int> updateProduct(Product product) async {
    final db = await _getDB();
    return await db.update(productTableName, product.toMap(),
        where: 'id = ?',
        whereArgs: [product.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateOwnCategory(OwnCategory ownCategory) async {
    final db = await _getDB();
    return await db.update(ownCategoriesTableName, ownCategory.toMap(),
        where: 'id = ?',
        whereArgs: [ownCategory.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateStorageLocation(StorageLocation storageLocation) async {
    final db = await _getDB();
    return await db.update(storageLocationsTableName, storageLocation.toMap(),
        where: 'id = ?',
        whereArgs: [storageLocation.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteProduct(Product product) async {
    final db = await _getDB();
    return await db.delete(productTableName, where: 'id = ?', whereArgs: [product.id]);
  }

  static Future<int> deleteOwnCategory(OwnCategory ownCategory) async {
    final db = await _getDB();
    return await db.delete(ownCategoriesTableName, where: 'id = ?', whereArgs: [ownCategory.id]);
  }

  static Future<int> deleteStorageLocation(StorageLocation storageLocation) async {
    final db = await _getDB();
    return await db.delete(storageLocationsTableName, where: 'id = ?', whereArgs: [storageLocation.id]);
  }

  static Future<List<Product>?> observeAllProducts() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query(productTableName);
    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (i) {
      return Product(
          id: maps[i]['id'],
          name: maps[i]['name'],
          mainCategory: maps[i]['mainCategory'],
          detailCategory: maps[i]['detailCategory'],
          expirationDate: maps[i]['expirationDate'],
          productionDate: maps[i]['productionDate'],
          composition: maps[i]['composition'],
          healingProperties: maps[i]['healingProperties'],
          dosage: maps[i]['dosage'],
          weight: maps[i]['weight'],
          volume: maps[i]['volume'],
          isVege: maps[i]['isVege'] == 1 ? true : false,
          isBio: maps[i]['isBio'] == 1 ? true : false,
          hasSugar: maps[i]['hasSugar'] == 1 ? true : false,
          hasSalt: maps[i]['hasSalt'] == 1 ? true : false,
          taste: maps[i]['taste']);
    });
  }

  static Future<List<OwnCategory>?> observeAllOwnCategories() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query(ownCategoriesTableName);
    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (i) {
      return OwnCategory(
          id: maps[i]['id'],
          name: maps[i]['name'],
          description: maps[i]['description']);
    });
  }

  static Future<List<StorageLocation>?> observeAllStorageLocations() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query(storageLocationsTableName);
    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (i) {
      return StorageLocation(
          id: maps[i]['id'],
          name: maps[i]['name'],
          description: maps[i]['description']);
    });
  }
}
