import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_pantry_flutter_app/utils/database_helper.dart';
import 'dart:developer' as developer;

import '../models/group_product.dart';
import '../models/product.dart';
import '../utils/date_converter.dart';
import '../widgets/platform_widget.dart';

class ProductDetails extends StatefulWidget {
  static const title = 'Product details';
  final int productId;

  const ProductDetails({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  Future<GroupProduct?> observeGroupProduct() async {
    return DatabaseHelper.observeGroupProduct(widget.productId);
  }

  Widget _buildForm(BuildContext context) {
    var name = "";
    var mainCategory = "";
    var detailCategory = "";
    var expirationDate = "";
    var productionDate = "";
    var quantity = "";
    var composition = "";
    var healingProperties = "";
    var dosage = "";
    var weight = "";
    var volume = "";
    var isVege = "";
    var isBio = "";
    var hasSugar = "";
    var hasSalt = "";
    var taste = "";

    return FutureBuilder(
      future: observeGroupProduct(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var groupProduct = snapshot.data;
          if (groupProduct != null) {
              name = groupProduct.product.name;
              mainCategory = groupProduct.product.mainCategory;
              detailCategory = groupProduct.product.detailCategory;
              try {
                expirationDate = DateConverter.convertFromDbToShow(groupProduct.product.expirationDate);
              }
              catch(e) {
                developer.log("Expiration - not possiblet to convert");
              }
              try {
                productionDate = DateConverter.convertFromDbToShow(groupProduct.product.productionDate);
              }
              catch(e) {
                developer.log("Production date - not possiblet to convert");
              }
              quantity = groupProduct.quantity.toString();
              composition = groupProduct.product.composition;
              healingProperties = groupProduct.product.productionDate;
              dosage = groupProduct.product.dosage;
              weight = groupProduct.product.weight.toString();
              volume = groupProduct.product.volume.toString();
              isVege = groupProduct.product.isVege
                  ? AppLocalizations.of(context)!.yes
                  : AppLocalizations.of(context)!.no;
              isBio = groupProduct.product.isBio
                  ? AppLocalizations.of(context)!.yes
                  : AppLocalizations.of(context)!.no;
              hasSugar = groupProduct.product.hasSugar
                  ? AppLocalizations.of(context)!.yes
                  : AppLocalizations.of(context)!.no;
              hasSalt = groupProduct.product.hasSalt
                  ? AppLocalizations.of(context)!.yes
                  : AppLocalizations.of(context)!.no;
              taste = groupProduct.product.taste;
              return SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                            child: Column(children: [
                              Row(children: [
                                const Text("Product name"),
                                const Spacer(), // use Spacer
                                Text(name,
                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Main category"),
                                  const Spacer(), // use Spacer
                                  Text(mainCategory,
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Detail category"),
                                  const Spacer(), // use Spacer
                                  Text(detailCategory,
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Expiration date"),
                                  const Spacer(), // use Spacer
                                  Text(expirationDate,
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Production date"),
                                  const Spacer(), // use Spacer
                                  Text(productionDate,
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Quantity"),
                                  const Spacer(), // use Spacer
                                  Text(quantity,
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Composition"),
                                  const Spacer(), // use Spacer
                                  Text(composition,
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Healing properties"),
                                  const Spacer(), // use Spacer
                                  Text(healingProperties,
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Dosage"),
                                  const Spacer(), // use Spacer
                                  Text(dosage,
                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Weight"),
                                  const Spacer(), // use Spacer
                                  Text(weight,
                                      style: const TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Volume"),
                                  const Spacer(), // use Spacer
                                  Text(volume,
                                      style: const TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Is vege"),
                                  const Spacer(), // use Spacer
                                  Text(isVege,
                                      style: const TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Is bio"),
                                  const Spacer(), // use Spacer
                                  Text(isBio,
                                      style: const TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Has sugar"),
                                  const Spacer(), // use Spacer
                                  Text(hasSugar,
                                      style: const TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Has salt"),
                                  const Spacer(), // use Spacer
                                  Text(hasSalt,
                                      style: const TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  const Text("Taste"),
                                  const Spacer(), // use Spacer
                                  Text(taste,
                                      style: const TextStyle(fontWeight: FontWeight.bold))
                                ],
                              )
                            ]),
                          ))));
          }
          else
            {
              return const Center(
                child: Text("No group product"),
              );
            }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
        }
      ,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Expanded(
            child: Center(
          child: _buildForm(context),
        ))
      ],
    ));
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.productDetails),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      child: _buildBody(context),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
