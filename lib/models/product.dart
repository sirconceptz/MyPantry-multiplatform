import 'dart:core';

class Product {
  final int? id;
  final String name;
  final String mainCategory;
  final String detailCategory;
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

  const Product(
      {required this.id,
      required this.name,
      required this.mainCategory,
      required this.detailCategory,
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
      required this.taste});

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'mainCategory': mainCategory,
        'detailCategory': detailCategory,
        'expirationDate': expirationDate,
        'productionDate': productionDate,
        'composition': composition,
        'healingProperties': healingProperties,
        'dosage': dosage,
        'weight': weight,
        'volume': volume,
        'isVege': isVege == true ? 1 : 0,
        'isBio': isBio == true ? 1 : 0,
        'hasSugar': hasSugar == true ? 1 : 0,
        'hasSalt': hasSalt == true ? 1 : 0,
        'taste': taste
      };
}
