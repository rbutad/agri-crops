import 'package:agricrops/models/farmers_association/farmers_association.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/farmers_association_provider.dart';
import 'package:agricrops/utilities/snackbar_utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmersAssociationScreen extends StatefulWidget {
  const FarmersAssociationScreen({Key? key}) : super(key: key);

  @override
  State<FarmersAssociationScreen> createState() =>
      _FarmersAssociationScreenState();
}

class _FarmersAssociationScreenState extends State<FarmersAssociationScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController associationNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FarmersAssociationProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmers Association'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: associationNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  decoration:
                      const InputDecoration(labelText: 'Association Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Association Name can not be empty';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: addressController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  minLines: 1,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Association\'s Address can not be empty';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: contactPersonController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      const InputDecoration(labelText: 'Contact Person'),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: contactNoController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  decoration:
                      const InputDecoration(labelText: 'Contact Number'),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        _saveFarmersAssociationInformation(provider);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveFarmersAssociationInformation(FarmersAssociationProvider provider) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      final farmersAssociation = FarmersAssociation.create(
        name: associationNameController.text.trim(),
        address: addressController.text.trim(),
        contactNumber: contactNoController.text.trim(),
        contactPerson: contactPersonController.text.trim(),
        createdBy: context.read<AuthProvider>().user!.uid,
      );

      provider.saveFarmersAssociation(farmersAssociation).then((_) {
        _clearFields();
        SnackbarUtility.showSuccessSnackBar(
            'Farmers Association information has successfully saved');
      });

      Navigator.of(context).pop();
    } on FirebaseException catch (e) {
      SnackbarUtility.showDangerSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }

  void _clearFields() {
    associationNameController.clear();
    addressController.clear();
    contactPersonController.clear();
    contactNoController.clear();
  }
}
