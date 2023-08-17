import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'screens/filter_product.dart';
import 'screens/my_pantry.dart';
import 'screens/new_product.dart';
import 'screens/own_categories.dart';
import 'screens/scan_product.dart';
import 'screens/settings.dart';
import 'screens/storage_locations.dart';
import 'widgets/platform_widget.dart';

void main() => runApp(const MyPantryApp());

class MyPantryApp extends StatelessWidget {
  const MyPantryApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      title: "My Pantry",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      darkTheme: ThemeData.dark(),
      builder: (context, child) {
        return CupertinoTheme(
          data: const CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      home: const PlatformAdaptingHomePage(),
    );
  }
}

class PlatformAdaptingHomePage extends StatefulWidget {
  const PlatformAdaptingHomePage({super.key});

  @override
  State<PlatformAdaptingHomePage> createState() =>
      _PlatformAdaptingHomePageState();
}

class _PlatformAdaptingHomePageState extends State<PlatformAdaptingHomePage> {
  Widget _buildAndroidHomePage(BuildContext context) {
    return MyPantry(androidDrawer: _AndroidDrawer());
  }

  Widget _buildIosHomePage(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.myPantry,
            icon: MyPantry.iosIcon,
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.scanProduct,
            icon: ScanProduct.iosIcon,
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.ownCategories,
            icon: OwnCategories.iosIcon,
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.storageLocations,
            icon: StorageLocations.iosIcon,
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.settings,
            icon: Settings.iosIcon,
          ),
        ],
      ),
      tabBuilder: (context, index) {
        assert(index <= 4 && index >= 0, 'Unexpected tab index: $index');
        return switch (index) {
          0 => CupertinoTabView(
              defaultTitle: AppLocalizations.of(context)!.myPantry,
              builder: (context) => MyPantry(androidDrawer: _AndroidDrawer()),
            ),
          1 => CupertinoTabView(
              defaultTitle: AppLocalizations.of(context)!.scanProduct,
              builder: (context) =>
                  ScanProduct(androidDrawer: _AndroidDrawer()),
            ),
          2 => CupertinoTabView(
              defaultTitle: AppLocalizations.of(context)!.ownCategories,
              builder: (context) =>
                  OwnCategories(androidDrawer: _AndroidDrawer()),
            ),
          3 => CupertinoTabView(
              defaultTitle: AppLocalizations.of(context)!.storageLocations,
              builder: (context) =>
                  StorageLocations(androidDrawer: _AndroidDrawer()),
            ),
          4 => CupertinoTabView(
              defaultTitle: AppLocalizations.of(context)!.settings,
              builder: (context) => Settings(androidDrawer: _AndroidDrawer()),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidHomePage,
      iosBuilder: _buildIosHomePage,
    );
  }
}

class _AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lightBlueAccent, Colors.blue, Colors.blueAccent],
            )),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)!.myPantry,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(AppLocalizations.of(context)!.whatDoYouWantToDo),
                ],
              ),
            ),
          ),
          ListTile(
            leading: MyPantry.androidIcon,
            title: Text(AppLocalizations.of(context)!.myPantry),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyPantry(androidDrawer: _AndroidDrawer())));
            },
          ),
          ListTile(
            leading: NewProduct.androidIcon,
            title: Text(AppLocalizations.of(context)!.newProduct),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewProduct(androidDrawer: _AndroidDrawer())));
            },
          ),
          ListTile(
            leading: ScanProduct.androidIcon,
            title: Text(AppLocalizations.of(context)!.scanProduct),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ScanProduct(androidDrawer: _AndroidDrawer())));
            },
          ),
          ListTile(
            leading: OwnCategories.androidIcon,
            title: Text(AppLocalizations.of(context)!.ownCategories),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OwnCategories(androidDrawer: _AndroidDrawer())));
            },
          ),
          ListTile(
            leading: StorageLocations.androidIcon,
            title: Text(AppLocalizations.of(context)!.storageLocations),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          StorageLocations(androidDrawer: _AndroidDrawer())));
            },
          ),
          ListTile(
            leading: FilterProduct.androidIcon,
            title: Text(AppLocalizations.of(context)!.filterProduct),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FilterProduct(androidDrawer: _AndroidDrawer())));
            },
          ),
          // Long drawer contents are often segmented.
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          ListTile(
            leading: Settings.androidIcon,
            title: Text(AppLocalizations.of(context)!.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Settings(androidDrawer: _AndroidDrawer())));
            },
          ),
        ],
      ),
    );
  }
}
