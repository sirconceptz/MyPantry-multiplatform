import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/product.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "mypantry.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async =>
        await db.execute(
          'CREATE TABLE Product(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name NOT NULL, expirationDate TEXT, productionDate TEXT, composition TEXT, healingProperties TEXT, dosage TEXT, weight INTEGER, volume INTEGER, isVege INTEGER, isBio INTEGER, hasSugar INTEGER, hasSalt INTEGER, taste TEXT);',
        ),
        version: _version);
  }

  static Future<int> addProduct(Product product) async {
    final db = await _getDB();
    return await db.insert("Product", product.toMap());
  }

  static Future<int> updateProduct(Product product) async {
    final db = await _getDB();
    return await db.update("Product", product.toMap(), where: 'id = ?',
        whereArgs: [product.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteProduct(Product product) async {
    final db = await _getDB();
    return await db.delete("Product", where: 'id = ?', whereArgs: [product.id]);
  }

  static Future<List<Product>?> observeAllProducts() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Product");
    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (i) {
      return Product(
          id: maps[i]['id'],
          name: maps[i]['name'],
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
          taste: maps[i]['taste']
      );
    });
  }
}