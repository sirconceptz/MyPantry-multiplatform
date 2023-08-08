import 'dart:core';

class OwnCategory {
  final int? id;
  final String name;
  final String description;

  const OwnCategory(
      {required this.id,
      required this.name,
      required this.description});

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description
      };
}
