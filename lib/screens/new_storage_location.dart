import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_pantry_flutter_app/models/storage_location.dart';

import '../utils/database_helper.dart';
import '../widgets/platform_widget.dart';

class NewStorageLocation extends StatefulWidget {
  static const title = 'New storage location';
  static const androidIcon = Icon(Icons.add);
  static const iosIcon = Icon(CupertinoIcons.add);

  const NewStorageLocation({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<NewStorageLocation> createState() => _NewStorageLocationState();
}

class _NewStorageLocationState extends State<NewStorageLocation> {
  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();

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

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.name,
              labelText: AppLocalizations.of(context)!.name,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.description,
              labelText: AppLocalizations.of(context)!.description,
            ),
          ),
          Center(
              child: ElevatedButton(
            onPressed: () async {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                final name = nameController.value.text;
                final description = descriptionController.value.text;

                final StorageLocation storageLocation = StorageLocation(
                    id: null,
                    name: name,
                    description: description);

                await DatabaseHelper.addStorageLocation(storageLocation);

              }
            },
            child: Text(AppLocalizations.of(context)!.save),
          )),
        ],
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.newStorageLocation),
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
