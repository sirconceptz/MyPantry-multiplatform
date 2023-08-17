import 'dart:core';

import '../models/group_product.dart';
import '../models/product.dart';

class GetGroupProductUseCase {
  static List<GroupProduct> getGroupProductList(List<Product> products) {
    var groupProductList = <GroupProduct>[];
    var toAddGroupProductList = <GroupProduct>[];
    var toRemoveGroupProductList = <GroupProduct>[];
    for (var i = 0; i < products.length; i++) {
      Product product = products[i];
      GroupProduct? testedGroupProduct =
          getGroupIfOnList(product, groupProductList);
      if (testedGroupProduct != null) {
        testedGroupProduct.idList.add(product.id!);
        toRemoveGroupProductList.add(testedGroupProduct);
        List<int> idList = testedGroupProduct.idList;
        idList.add(testedGroupProduct.product.id!);
        testedGroupProduct = GroupProduct(
            product: testedGroupProduct.product,
            quantity: testedGroupProduct.quantity + 1,
            idList: idList);
        toAddGroupProductList.add(testedGroupProduct);
      } else {
        GroupProduct newGroupProduct = GroupProduct(
            product: product, quantity: 1, idList: <int>[product.id!]);
        toAddGroupProductList.add(newGroupProduct);
      }
      for (var j = 0; j < toRemoveGroupProductList.length; j++) {
        groupProductList.remove(toRemoveGroupProductList[j]);
      }
      groupProductList.addAll(toAddGroupProductList);
      toAddGroupProductList.clear();
      toRemoveGroupProductList.clear();
    }

    return groupProductList;
  }

  static GroupProduct? getGroupIfOnList(
      Product product, List<GroupProduct> groupProductList) {
    GroupProduct? groupProductReturned;
    for (var i = 0; i < groupProductList.length; i++) {
      GroupProduct groupProduct = groupProductList[i];
      Product testedProduct = Product(
          id: product.id,
          name: groupProduct.product.name,
          mainCategory: groupProduct.product.mainCategory,
          detailCategory: groupProduct.product.detailCategory,
          expirationDate: groupProduct.product.expirationDate,
          productionDate: groupProduct.product.productionDate,
          composition: groupProduct.product.composition,
          healingProperties: groupProduct.product.healingProperties,
          dosage: groupProduct.product.dosage,
          weight: groupProduct.product.weight,
          volume: groupProduct.product.volume,
          isVege: groupProduct.product.isVege,
          isBio: groupProduct.product.isBio,
          hasSugar: groupProduct.product.hasSugar,
          hasSalt: groupProduct.product.hasSalt,
          taste: groupProduct.product.taste);
      if (product == testedProduct) {
        groupProductReturned = groupProduct;
      }
    }
    return groupProductReturned;
  }

  static GroupProduct? getGroupProductById(
      int productId, List<Product> products) {
    Product? product;
    List<int> idList = [];
    int quantity = 0;
    for (var i = 0; i < products.length; i++) {
      if (products[i].id == productId) {
        product = products[i];
      }
    }
    for (var i = 0; i < products.length; i++) {
      Product testedProduct = Product(
          id: productId,
          name: products[i].name,
          mainCategory: products[i].mainCategory,
          detailCategory: products[i].detailCategory,
          expirationDate: products[i].expirationDate,
          productionDate: products[i].productionDate,
          composition: products[i].composition,
          healingProperties: products[i].healingProperties,
          dosage: products[i].dosage,
          weight: products[i].weight,
          volume: products[i].volume,
          isVege: products[i].isVege,
          isBio: products[i].isBio,
          hasSugar: products[i].hasSugar,
          hasSalt: products[i].hasSalt,
          taste: products[i].taste);
      if (product == testedProduct) {
        idList.add(products[i].id!);
        quantity++;
      }
    }
    if(quantity > 0) {
      return GroupProduct(
          product: product!, quantity: quantity, idList: idList);
    }
    else {
      return null;
    }
  }
}
