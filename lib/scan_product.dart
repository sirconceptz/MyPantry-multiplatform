import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'my_pantry.dart';
import 'widgets.dart';

class ScanProduct extends StatelessWidget {
  static const title = 'Scan product';
  static const androidIcon = Icon(Icons.camera_alt_outlined);
  static const iosIcon = Icon(CupertinoIcons.camera);

  const ScanProduct({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  Widget _buildBody(BuildContext context) {
    return Material(
        child: Column(
          children: [Expanded(
              child: Center(
                child: Text(AppLocalizations.of(context)!.scanProduct),
              ))],
        )
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.scanProduct),
      ),
      drawer: androidDrawer,
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
}