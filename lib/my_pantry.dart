import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets.dart';

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
          children: [Expanded(
              child: Center(
                child: Text(AppLocalizations.of(context)!.myPantry),
              ))
          ],
        )
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyPantry.title),
      ),
      drawer: widget.androidDrawer,
      body: _buildBody(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
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