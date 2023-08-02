import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/product.dart';
import '../widgets/platform_widget.dart';
import 'my_pantry.dart';

class ProductDetails extends StatelessWidget {
  static const title = 'Product details';
  final Product? product;

  const ProductDetails({Key? key, this.product}) : super(key: key);

  Widget _buildForm() {
    var name = "";
    var expirationDate = "";
    var productionDate = "";

    if (product != null) {
      name = product!.name;
      expirationDate = product!.expirationDate;
      productionDate = product!.productionDate;
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 96),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name),
          Text(expirationDate),
          Text(productionDate)
        ]));
  }

  Widget _buildBody(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Expanded(
            child: Center(
          child: _buildForm(),
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
