import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_pantry_flutter_app/models/group_product.dart';
import 'package:my_pantry_flutter_app/screens/filter_product.dart';
import 'package:my_pantry_flutter_app/screens/new_product.dart';
import 'package:my_pantry_flutter_app/screens/product_details.dart';
import 'package:my_pantry_flutter_app/utils/database_helper.dart';
import 'package:my_pantry_flutter_app/widgets/group_product_widget.dart';

import '../widgets/platform_widget.dart';

class MyPantry extends StatefulWidget {
  static const title = 'My Pantry';
  static const androidIcon = Icon(Icons.list);
  static const iosIcon = Icon(CupertinoIcons.list_bullet);

  const MyPantry({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<MyPantry> createState() => _MyPantryState();
}

class _MyPantryState extends State<MyPantry> {
  Widget _buildBody(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Expanded(
            child: Center(
          child: FutureBuilder<List<GroupProduct>?>(
            future: DatabaseHelper.observeAllGroupProducts(),
            builder: (context, AsyncSnapshot<List<GroupProduct>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) =>
                          groupProductItem(snapshot.data![index]));
                }
              } else {
                return Text(AppLocalizations.of(context)!.noProducts);
              }
              return Text(AppLocalizations.of(context)!.noProducts);
            },
          ),
        ))
      ],
    ));
  }

  Widget groupProductItem(GroupProduct groupProduct) {
    return GroupProductWidget(
      groupProduct: groupProduct,
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetails(productId: groupProduct.product.id!)));
      },
      longPress: () {},
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyPantry.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push<void>(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FilterProduct(androidDrawer: widget.androidDrawer))),
        tooltip: 'Filter product',
        child: FilterProduct.androidIcon,
      ),
      drawer: widget.androidDrawer,
      body: _buildBody(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: FilterProduct.iosIcon,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push<void>(
                CupertinoPageRoute(
                  title: FilterProduct.title,
                  fullscreenDialog: true,
                  builder: (context) => const FilterProduct(),
                ),
              );
            },
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: NewProduct.iosIcon,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push<void>(
                CupertinoPageRoute(
                  title: NewProduct.title,
                  fullscreenDialog: true,
                  builder: (context) => const NewProduct(),
                ),
              );
            },
          )),
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

  @override
  void initState() {
    super.initState();
  }
}
