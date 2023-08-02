import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/platform_widget.dart';
import 'my_pantry.dart';

class AddPhoto extends StatefulWidget {
  static const title = 'Add photo';
  static const androidIcon = Icon(Icons.add);
  static const iosIcon = Icon(CupertinoIcons.add);

  const AddPhoto({super.key});

  @override
  State<StatefulWidget> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  Widget _buildBody(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Expanded(
            child: Center(
          child: Text(AppLocalizations.of(context)!.addPhoto),
        ))
      ],
    ));
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addPhoto),
      ),
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
        child: _buildBody(context));
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
