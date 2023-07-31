import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'my_pantry.dart';
import 'widgets.dart';

class NewProduct extends StatefulWidget {
  static const title = 'New product';
  static const androidIcon = Icon(Icons.add);
  static const iosIcon = Icon(CupertinoIcons.add);

  const NewProduct({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {

  final _formKey = GlobalKey<FormState>();
  bool isVegeChecked = false;
  bool isBioChecked = false;
  bool hasSugarChecked = false;
  bool hasSaltChecked = false;

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      body: SingleChildScrollView(child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _buildForm(context),
      )),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.productName,
              labelText: AppLocalizations.of(context)!.productName,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.expirationDate,
              labelText: AppLocalizations.of(context)!.expirationDate,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.productionDate,
              labelText: AppLocalizations.of(context)!.productionDate,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.quantity,
              labelText: AppLocalizations.of(context)!.quantity,
            ),
              keyboardType: TextInputType.number,
              validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some value';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.composition,
              labelText: AppLocalizations.of(context)!.composition,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.healingProperties,
              labelText: AppLocalizations.of(context)!.healingProperties,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.dosage,
              labelText: AppLocalizations.of(context)!.dosage,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.weight,
              labelText: AppLocalizations.of(context)!.weight,
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some value';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.volume,
              labelText: AppLocalizations.of(context)!.volume,
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some value';
              }
              return null;
            },
          ),
          CheckboxListTile(
            title: Text(AppLocalizations.of(context)!.isVege),
            value: isVegeChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isVegeChecked = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text(AppLocalizations.of(context)!.isBio),
            value: isBioChecked,
            onChanged: (bool? newValue) {
              setState(() {
                isBioChecked = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text(AppLocalizations.of(context)!.hasSugar),
            value: hasSugarChecked,
            onChanged: (bool? newValue) {
              setState(() {
                hasSugarChecked = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text(AppLocalizations.of(context)!.hasSalt),
            value: hasSaltChecked,
            onChanged: (bool? newValue) {
              setState(() {
                hasSaltChecked = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Text(AppLocalizations.of(context)!.addProduct),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(NewProduct.title),
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