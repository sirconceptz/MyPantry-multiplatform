import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/product.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "mypantry.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
              'CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT NOT NULL, expirationDate TEXT NOT NULL, productionDate TEXT NOT NULL, composition TEXT NOT NULL, healingProperties TEXT NOT NULL, dosage TEXT NOT NULL, weight INTEGER, volume INTEGER, isVege INTEGER, isBio INTEGER, hasSugar INTEGER, hasSalt INTEGER, taste TEXT NOT NULL);',
            ),
        version: _version);
  }

  static Future<int> addProduct(Product product) async {
    final db = await _getDB();
    return await db.insert("Product", product.toJson());
  }

  static Future<int> updateProduct(Product product) async {
    final db = await _getDB();
    return await db.update("Product", product.toJson(), where: 'id = ?', whereArgs: [product.id], conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteProduct(Product product) async {
    final db = await _getDB();
    return await db.delete("Product", where: 'id = ?', whereArgs: [product.id]);
  }

  static Future<List<Product>?> observeAllProducts() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Product");
    if(maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Product.fromJson(maps[index]));
  }
}
