import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/product.dart';
import '../services/database_helper.dart';
import '../utils/taste.dart';
import '../widgets/platform_widget.dart';

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

  var nameController = TextEditingController();
  var expirationDateController = TextEditingController();
  var productionDateController = TextEditingController();
  var quantityController = TextEditingController();
  var compositionController = TextEditingController();
  var healingPropertiesController = TextEditingController();
  var dosageController = TextEditingController();
  var weightController = TextEditingController();
  var volumeController = TextEditingController();

  bool isVegeChecked = false;
  bool isBioChecked = false;
  bool hasSugarChecked = false;
  bool hasSaltChecked = false;

  Taste? _taste = Taste.sweet;

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      body: SingleChildScrollView(
          child: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildForm(context)),
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
            controller: nameController,
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
            controller: expirationDateController,
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
            controller: productionDateController,
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
            controller: quantityController,
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
            controller: compositionController,
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
            controller: healingPropertiesController,
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
            controller: dosageController,
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
            controller: weightController,
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
            controller: volumeController,
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
          ListTile(
            title: Text(AppLocalizations.of(context)!.sweet),
            leading: Radio<Taste>(
              value: Taste.sweet,
              groupValue: _taste,
              onChanged: (Taste? value) {
                setState(() {
                  _taste = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.sour),
            leading: Radio<Taste>(
              value: Taste.sour,
              groupValue: _taste,
              onChanged: (Taste? value) {
                setState(() {
                  _taste = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.sweetAndSour),
            leading: Radio<Taste>(
              value: Taste.sweetAndSour,
              groupValue: _taste,
              onChanged: (Taste? value) {
                setState(() {
                  _taste = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.bitter),
            leading: Radio<Taste>(
              value: Taste.bitter,
              groupValue: _taste,
              onChanged: (Taste? value) {
                setState(() {
                  _taste = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.salty),
            leading: Radio<Taste>(
              value: Taste.salty,
              groupValue: _taste,
              onChanged: (Taste? value) {
                setState(() {
                  _taste = value;
                });
              },
            ),
          ),
          Center(
              child: ElevatedButton(
            onPressed: () async {
              // Validate returns true if the form is valid, or false otherwise.
              //if (_formKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              final name = nameController.value.text;
              final expirationDate = expirationDateController.value.text;
              final productionDate = productionDateController.value.text;
              final composition = compositionController.value.text;
              final healingProperties = healingPropertiesController.value.text;
              final dosage = dosageController.value.text;
              final weight = weightController.value.text;
              final volume = volumeController.value.text;
              final isVege = isVegeChecked;
              final isBio = isBioChecked;
              final hasSugar = hasSugarChecked;
              final hasSalt = hasSaltChecked;
              final taste = _taste.toString();

              final Product product = Product(
                  id: null,
                  name: name,
                  expirationDate: expirationDate,
                  productionDate: productionDate,
                  composition: composition,
                  healingProperties: healingProperties,
                  dosage: dosage,
                  weight: int.parse(weight),
                  volume: int.parse(volume),
                  isVege: isVege,
                  isBio: isBio,
                  hasSugar: hasSugar,
                  hasSalt: hasSalt,
                  taste: taste);
              await DatabaseHelper.addProduct(product);
            }
            //}
            ,
            child: Text(AppLocalizations.of(context)!.addProduct),
          )),
        ],
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.newProduct),
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

  @override
  void initState() {
    super.initState();
  }
}
