import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../utils/taste.dart';
import '../widgets/platform_widget.dart';

class FilterProduct extends StatefulWidget {
  static const title = 'Filter product';
  static const androidIcon = Icon(Icons.search);
  static const iosIcon = Icon(CupertinoIcons.search);

  const FilterProduct({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<FilterProduct> createState() => _FilterProductState();
}

class _FilterProductState extends State<FilterProduct> {
  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var mainCategoryValue = "one";
  var detailCategoryValue = "one";
  var expirationDateSinceController = TextEditingController();
  var expirationDateToController = TextEditingController();
  var productionDateSinceController = TextEditingController();
  var productionDateToController = TextEditingController();
  var compositionController = TextEditingController();
  var healingPropertiesController = TextEditingController();
  var dosageController = TextEditingController();
  var weightSinceController = TextEditingController();
  var weightToController = TextEditingController();
  var volumeSinceController = TextEditingController();
  var volumeToController = TextEditingController();

  bool isVegeChecked = false;
  bool isBioChecked = false;
  bool hasSugarChecked = false;
  bool hasSaltChecked = false;

  Taste? _taste = Taste.sweet;
  var mainCategories = <String>['one', 'two', 'three'];
  var detailCategories = <String>['one', 'two', 'three'];

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
          DropdownButton(
              isExpanded: true,
              enableFeedback: true,
              items:
                  mainCategories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  mainCategoryValue = value!;
                });
              }),
          DropdownButton(
              isExpanded: true,
              enableFeedback: true,
              items: detailCategories
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  detailCategoryValue = value!;
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                  child: TextFormField(
                controller: expirationDateSinceController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy.MM.dd').format(pickedDate);
                    setState(() {
                      expirationDateSinceController.text = formattedDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  //icon of text field
                  hintText: AppLocalizations.of(context)!.expirationDate,
                  labelText: AppLocalizations.of(context)!.expirationDate,
                ),
              )),
              const Text("-"),
              Flexible(
                  child: TextFormField(
                controller: expirationDateToController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy.MM.dd').format(pickedDate);
                    setState(() {
                      expirationDateToController.text = formattedDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  //icon of text field
                  hintText: AppLocalizations.of(context)!.expirationDate,
                  labelText: AppLocalizations.of(context)!.expirationDate,
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                  child: TextFormField(
                controller: productionDateSinceController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy.MM.dd').format(pickedDate);
                    setState(() {
                      productionDateSinceController.text = formattedDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  //icon of text field
                  hintText: AppLocalizations.of(context)!.productionDate,
                  labelText: AppLocalizations.of(context)!.productionDate,
                ),
              )),
              const Text("-"),
              Flexible(
                  child: TextFormField(
                controller: productionDateToController,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy.MM.dd').format(pickedDate);
                    setState(() {
                      productionDateToController.text = formattedDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  //icon of text field
                  hintText: AppLocalizations.of(context)!.productionDate,
                  labelText: AppLocalizations.of(context)!.productionDate,
                ),
              ))
            ],
          ),
          TextFormField(
            controller: compositionController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.composition,
              labelText: AppLocalizations.of(context)!.composition,
            ),
          ),
          TextFormField(
            controller: healingPropertiesController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.healingProperties,
              labelText: AppLocalizations.of(context)!.healingProperties,
            ),
          ),
          TextFormField(
            controller: dosageController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.dosage,
              labelText: AppLocalizations.of(context)!.dosage,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                  child: TextFormField(
                controller: weightSinceController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.volume,
                  labelText: AppLocalizations.of(context)!.volume,
                ),
                keyboardType: TextInputType.number,
              )),
              const Text("-"),
              Flexible(
                  child: TextFormField(
                controller: weightToController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.volume,
                  labelText: AppLocalizations.of(context)!.volume,
                ),
                keyboardType: TextInputType.number,
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                  child: TextFormField(
                controller: volumeSinceController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.volume,
                  labelText: AppLocalizations.of(context)!.volume,
                ),
                keyboardType: TextInputType.number,
              )),
              const Text("-"),
              Flexible(
                  child: TextFormField(
                controller: volumeToController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.volume,
                  labelText: AppLocalizations.of(context)!.volume,
                ),
                keyboardType: TextInputType.number,
              ))
            ],
          ),
          const Text("Properties"),
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
          const Text("Taste"),
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
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                // final name = nameController.value.text;
                // final mainCategory = mainCategoryValue;
                // final detailCategory = detailCategoryValue;
                // final expirationDate = expirationDateController.value.text;
                // final productionDate = productionDateController.value.text;
                // final composition = compositionController.value.text;
                // final healingProperties =
                //     healingPropertiesController.value.text;
                // final quantity = int.parse(quantityController.text);
                // final dosage = dosageController.value.text;
                // final weight = int.parse(weightController.value.text);
                // final volume = int.parse(volumeController.value.text);
                // final isVege = isVegeChecked;
                // final isBio = isBioChecked;
                // final hasSugar = hasSugarChecked;
                // final hasSalt = hasSaltChecked;
                // final taste = _taste.toString();
              }
            },
            child: Text(AppLocalizations.of(context)!.addProduct),
          )),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      body: SingleChildScrollView(
          child: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildForm(context)),
      )),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.filterProduct),
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
