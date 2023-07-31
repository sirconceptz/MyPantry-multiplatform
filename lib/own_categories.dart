import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pantry_flutter_app/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'my_pantry.dart';

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
          children: [Expanded(
              child: Center(
                child: Text(AppLocalizations.of(context)!.ownCategories),
              ))
          ],
        )
    );  }

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
          child: MyPantry.iosIcon,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push<void>(
              CupertinoPageRoute(
                title: MyPantry.title,
                fullscreenDialog: true,
                builder: (context) => const MyPantry(),
              ),
            );
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

  @override
  void initState() {
    super.initState();
  }
}