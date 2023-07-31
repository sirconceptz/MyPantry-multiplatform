import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pantry_flutter_app/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'my_pantry.dart';

class StorageLocations extends StatefulWidget {
  static const title = 'Storage locations';
  static const androidIcon = Icon(Icons.list);
  static const iosIcon = Icon(CupertinoIcons.list_bullet);

  const StorageLocations({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<StorageLocations> createState() => _StorageLocationsState();
}

class _StorageLocationsState extends State<StorageLocations> {

  Widget _buildBody(BuildContext context) {
    return Material(
        child: Column(
          children: [Expanded(
              child: Center(
                child: Text(AppLocalizations.of(context)!.storageLocations),
              ))
          ],
        )
    );  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.storageLocations),
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
      child: _buildBody(context)
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