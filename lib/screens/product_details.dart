import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/product.dart';
import '../widgets/platform_widget.dart';

class ProductDetails extends StatelessWidget {
  static const title = 'Product details';
  final Product? product;

  const ProductDetails({Key? key, this.product}) : super(key: key);

  Widget _buildForm(BuildContext context) {
    var name = "";
    var expirationDate = "";
    var productionDate = "";
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

    if (product != null) {
      name = product!.name;
      expirationDate = product!.expirationDate;
      productionDate = product!.productionDate;
      composition = product!.composition;
      healingProperties = product!.productionDate;
      dosage = product!.productionDate;
      weight = product!.productionDate;
      volume = product!.productionDate;
      isVege = product!.isVege
          ? AppLocalizations.of(context)!.yes
          : AppLocalizations.of(context)!.no;
      isBio = product!.isBio
          ? AppLocalizations.of(context)!.yes
          : AppLocalizations.of(context)!.no;
      hasSugar = product!.hasSugar
          ? AppLocalizations.of(context)!.yes
          : AppLocalizations.of(context)!.no;
      hasSalt = product!.hasSalt
          ? AppLocalizations.of(context)!.yes
          : AppLocalizations.of(context)!.no;
      taste = product!.taste;
    }

    return SafeArea(
        top: true,
        bottom: true,
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
