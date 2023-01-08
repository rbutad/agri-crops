import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/models/crops/crop_price/crop_price.dart';
import 'package:agricrops/models/unit_of_measurement/unit_of_measurement.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/crop_provider.dart';
import 'package:agricrops/providers/uom_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class CropPriceDialog extends StatefulWidget {
  final ValueChanged<CropPrice> onAddCropPrice;

  const CropPriceDialog({Key? key, required this.onAddCropPrice})
      : super(key: key);

  @override
  State<CropPriceDialog> createState() => _CropPriceDialogState();
}

class _CropPriceDialogState extends State<CropPriceDialog> {
  final _cropPriceFormKey = GlobalKey<FormState>();

  TextEditingController uomController = TextEditingController();
  TextEditingController uomUidController = TextEditingController();
  TextEditingController uomCodeController = TextEditingController();
  TextEditingController availableQtyController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void dispose() {
    uomController.dispose();
    uomUidController.dispose();
    uomCodeController.dispose();
    availableQtyController.dispose();
    priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _cropPriceFormKey,
      child: AlertDialog(
        title: const Text('Crop Price'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TypeAheadFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textFieldConfiguration: TextFieldConfiguration(
                controller: uomController,
                decoration:
                    const InputDecoration(labelText: 'Unit of Measurement'),
                textInputAction: TextInputAction.next,
              ),
              onSuggestionSelected: (UnitOfMeasurement uom) {
                uomController.text = '${uom.description} (${uom.code})';
                uomUidController.text = uom.uid;
                uomCodeController.text = uom.code;
              },
              itemBuilder: (context, UnitOfMeasurement uom) => ListTile(
                title: Text('${uom.description} (${uom.code})'),
              ),
              suggestionsCallback: (uomQuery) {
                return context
                    .read<UomProvider>()
                    .searchUom(uomQuery: uomQuery);
              },
              transitionBuilder: (context, suggestionBox, controller) =>
                  suggestionBox,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Select a Unit of Measurement';
                }

                return null;
              },
              hideOnError: true,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: availableQtyController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration:
                        const InputDecoration(labelText: 'Available Qty'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Quantity is required';
                      }

                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: priceController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(labelText: 'Price'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Price is required';
                      }

                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Add Price'),
            onPressed: () {
              if (_cropPriceFormKey.currentState!.validate()) {
                _cropPriceFormKey.currentState!.save();

                context
                    .read<CropProvider>()
                    .isCropPriceExists(uomCodeController.text.trim())
                    .then((isCropPriceExists) {
                  if (isCropPriceExists) {
                    _showCropPriceExistsDialog();
                    return;
                  }

                  widget.onAddCropPrice(
                    CropPrice.create(
                      cropUid: '',
                      uomUid: uomUidController.text.trim(),
                      uom: uomController.text.trim(),
                      availableQty:
                          int.parse(availableQtyController.text.trim()),
                      price: double.parse(priceController.text.trim()),
                      isDefaultPrice: false,
                      createdBy: context.read<AuthProvider>().user!.uid,
                    ),
                  );

                  _clearFields();
                });
              }
            },
          ),
          TextButton(
            child: const Text(
              'Close',
              style: TextStyle(color: kRed),
            ),
            onPressed: () {
              _clearFields();

              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  void _clearFields() {
    uomController.clear();
    uomUidController.clear();
    uomCodeController.clear();
    availableQtyController.clear();
    priceController.clear();
  }

  void _showCropPriceExistsDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Crop Price Exists!'),
        content: const Text(
            'The pricing for selected UOM is already exists. Please select another UOM to be priced.'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Ok'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
