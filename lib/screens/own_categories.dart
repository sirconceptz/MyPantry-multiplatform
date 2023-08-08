import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_pantry_flutter_app/models/own_category.dart';
import 'package:my_pantry_flutter_app/screens/new_own_category.dart';

import '../services/database_helper.dart';
import '../widgets/own_category_widget.dart';
import '../widgets/platform_widget.dart';
import 'new_product.dart';

class OwnCategories extends StatefulWidget {
  static const title = 'Own categories';
  static const androidIcon = Icon(Icons.bookmark);
  static const iosIcon = Icon(CupertinoIcons.bookmark);

  const OwnCategories({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<StatefulWidget> createState() => _OwnCategoriesState();
}

class _OwnCategoriesState extends State<OwnCategories> {
  Widget _buildBody(BuildContext context) {
    return Material(
        child: Column(
          children: [
            Expanded(
                child: Center(
                  child: FutureBuilder<List<OwnCategory>?>(
                    future: DatabaseHelper.observeAllOwnCategories(),
                    builder: (context, AsyncSnapshot<List<OwnCategory>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) => OwnCategoryWidget(
                                ownCategory: snapshot.data![index],
                                onTap: () async {
                                },
                                longPress: () {},
                              ));
                        }
                      } else {
                        return Text(AppLocalizations.of(context)!.noOwnCategories);
                      }
                      return Text(AppLocalizations.of(context)!.noOwnCategories);
                    },
                  ),
                ))
          ],
        ));
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.ownCategories),
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
            child: const Text("Edit"),
            onPressed: () {
            },
          ),
          trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: NewProduct.iosIcon,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).push<void>(
            CupertinoPageRoute(
              title: NewOwnCategory.title,
              fullscreenDialog: true,
              builder: (context) => const NewOwnCategory(),
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
