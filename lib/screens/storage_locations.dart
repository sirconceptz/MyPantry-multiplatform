import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_pantry_flutter_app/screens/new_storage_location.dart';

import '../models/storage_location.dart';
import '../utils/database_helper.dart';
import '../widgets/platform_widget.dart';
import '../widgets/storage_location_widget.dart';
import 'new_product.dart';

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
          children: [
            Expanded(
                child: Center(
                  child: FutureBuilder<List<StorageLocation>?>(
                    future: DatabaseHelper.observeAllStorageLocations(),
                    builder: (context, AsyncSnapshot<List<StorageLocation>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) => StorageLocationWidget(
                                storageLocation: snapshot.data![index],
                                onTap: () async {
                                },
                                longPress: () {},
                              ));
                        }
                      } else {
                        return Text(AppLocalizations.of(context)!.noStorageLocations);
                      }
                      return Text(AppLocalizations.of(context)!.noStorageLocations);
                    },
                  ),
                ))
          ],
        ));
  }

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
                title: NewStorageLocation.title,
                fullscreenDialog: true,
                builder: (context) => const NewStorageLocation(),
              ),
            );
          },
        )),
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
