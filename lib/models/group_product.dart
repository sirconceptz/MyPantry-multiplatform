import 'dart:core';
import 'package:equatable/equatable.dart';

import 'package:my_pantry_flutter_app/models/product.dart';

class GroupProduct extends Equatable {
  final Product product;
  final int quantity;
  final List<int> idList;

  const GroupProduct(
      {required this.product, required this.quantity, required this.idList});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GroupProduct &&
              product == other.product &&
              quantity == other.quantity &&
              idList == other.idList;

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode ^ idList.hashCode;

  @override
  List<Object?> get props => [product, quantity, idList];
}
