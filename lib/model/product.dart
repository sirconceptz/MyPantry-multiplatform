import 'dart:core';

class Product {
  final int id;
  final String name;
  final String expirationDate;
  final String productionDate;
  final String composition;
  final String healingProperties;
  final String dosage;
  final int weight;
  final int volume;
  final bool isVege;
  final bool isBio;
  final bool hasSugar;
  final bool hasSalt;
  final String taste;

  const Product({
    required this.id,
    required this.name,
    required this.expirationDate,
    required this.productionDate,
    required this.composition,
    required this.healingProperties,
    required this.dosage,
    required this.weight,
    required this.volume,
    required this.isVege,
    required this.isBio,
    required this.hasSugar,
    required this.hasSalt,
    required this.taste
  });

  factory Product.fromJson(Map<String,dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    expirationDate: json['expirationDate'],
    productionDate: json['productionDate'],
    composition: json['composition'],
    healingProperties: json['healingProperties'],
    dosage: json['dosage'],
    weight: json['weight'],
    volume: json['volume'],
    isVege: json['isVege'],
    isBio: json['isBio'],
    hasSugar: json['hasSugar'],
    hasSalt: json['hasSalt'],
    taste: json['taste']
  );

  Map<String,dynamic> toJson() => {
    'id': id,
    'name': name,
    'expirationDate': expirationDate,
    'productionDate': productionDate,
    'composition': composition,
    'healingProperties': healingProperties,
    'dosage': dosage,
    'weight': weight,
    'volume': volume,
    'isVege': isVege,
    'isBio': isBio,
    'hasSugar': hasSugar,
    'hasSalt': hasSalt,
    'taste': taste
  };
}