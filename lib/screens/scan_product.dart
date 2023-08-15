import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../widgets/platform_widget.dart';

class ScanProduct extends StatefulWidget {
  static const title = 'Scan product';
  static const androidIcon = Icon(Icons.camera_alt_outlined);
  static const iosIcon = Icon(CupertinoIcons.camera);

  const ScanProduct({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<ScanProduct> createState() => _ScanProductState();
}

class _ScanProductState extends State<ScanProduct> {

  Widget _buildBody(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Expanded(
            child: Center(
          child:
          // Column(
          //   children: [
          //     Text(AppLocalizations.of(context)!.scanProduct),
          //     ElevatedButton(
          //       onPressed: () {
          //         ;
          //       },
          //       child: const Text("Scan"),
          //     )
          //   ],
          // ),
          MobileScanner(
            //fit: BoxFit.contain,
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.normal,
              facing: CameraFacing.back,
              returnImage: true,
            ),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              //final Uint8List? image = capture.image;
              for (final barcode in barcodes) {
                debugPrint('Barcode found! ${barcode.rawValue}');
              }
            },
          )
        ))
      ],
    ));
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.scanProduct),
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
