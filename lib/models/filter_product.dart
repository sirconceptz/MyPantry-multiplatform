import 'dart:core';

import 'package:equatable/equatable.dart';

class FilterProduct extends Equatable {
  final int? id;
  final String name;
  final String mainCategory;
  final String detailCategory;
  final String expirationDateMin;
  final String expirationDateMax;
  final String productionDateMin;
  final String productionDateMax;
  final String composition;
  final String healingProperties;
  final String dosage;
  final String storageLocation;
  final int weightMin;
  final int weightMax;
  final int volumeMin;
  final int volumeMax;
  final bool isVege;
  final bool isBio;
  final bool hasSugar;
  final bool hasSalt;
  final String taste;

  const FilterProduct(
      {required this.id,
      required this.name,
      required this.mainCategory,
      required this.detailCategory,
      required this.expirationDateMin,
      required this.expirationDateMax,
      required this.productionDateMin,
      required this.productionDateMax,
      required this.composition,
      required this.healingProperties,
      required this.dosage,
      required this.storageLocation,
      required this.weightMin,
      required this.weightMax,
      required this.volumeMin,
      required this.volumeMax,
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
        'expirationDateMin': expirationDateMin,
        'expirationDateMax': expirationDateMax,
        'productionDateMin': productionDateMin,
        'productionDateMax': productionDateMax,
        'composition': composition,
        'healingProperties': healingProperties,
        'dosage': dosage,
        'weightMin': weightMin,
        'weightMax': weightMax,
        'volumeMin': volumeMin,
        'volumeMax': volumeMax,
        'isVege': isVege == true ? 1 : 0,
        'isBio': isBio == true ? 1 : 0,
        'hasSugar': hasSugar == true ? 1 : 0,
        'hasSalt': hasSalt == true ? 1 : 0,
        'taste': taste
      };

  @override
  List<Object?> get props => [
        id,
        name,
        mainCategory,
        detailCategory,
        expirationDateMin,
        expirationDateMax,
        productionDateMin,
        productionDateMax,
        composition,
        healingProperties,
        dosage,
        weightMin,
        weightMax,
        volumeMin,
        volumeMax,
        isVege,
        isBio,
        hasSugar,
        hasSalt,
        taste
      ];
}
