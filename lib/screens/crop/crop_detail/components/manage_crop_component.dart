import 'dart:io';

import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/constants/spacer_constant.dart';
import 'package:agricrops/models/crops/crop/crop.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/crop_provider.dart';
import 'package:agricrops/screens/crop/crop_detail/components/crop_price_dialog.dart';
import 'package:agricrops/utilities/snackbar_utility.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ManageCropComponent extends StatefulWidget {
  const ManageCropComponent({Key? key}) : super(key: key);

  @override
  State<ManageCropComponent> createState() => _ManageCropComponentState();
}

class _ManageCropComponentState extends State<ManageCropComponent> {
  final _cropFormKey = GlobalKey<FormState>();
  final _picker = ImagePicker();

  String? _retrieveDataError;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cropProvider = context.watch<CropProvider>();
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        cropProvider.clearImage();
        cropProvider.cropPrices.clear();
        return Future.value(true);
      },
      child: Scaffold(
        extendBodyBehindAppBar: cropProvider.imageFile != null,
        appBar: AppBar(
          backgroundColor:
              cropProvider.imageFile != null ? Colors.transparent : kGreen,
          elevation: 0,
          foregroundColor: Colors.white,
          title: cropProvider.imageFile == null
              ? const Text('Crop Detail')
              : Container(),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _cropFormKey,
            child: Column(
              children: [
                cropProvider.imageFile == null
                    ? SizedBox(
                        height: size.height * 0.05,
                      )
                    : Container(),
                _previewImage(cropProvider),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.photo),
                      label: const Text('Upload Photo'),
                      onPressed: () {
                        _takeImage(cropProvider, ImageSource.gallery);
                      },
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Take a Photo'),
                      onPressed: () {
                        _takeImage(cropProvider, ImageSource.camera);
                      },
                    ),
                    cropProvider.imageFile != null
                        ? TextButton.icon(
                            icon: const Icon(
                              Icons.delete,
                              color: kRed,
                            ),
                            label: const Text(
                              'Clear Photo',
                              style: TextStyle(color: kRed),
                            ),
                            onPressed: () {
                              cropProvider.clearImage();
                            },
                          )
                        : Container(),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: kAppPadding,
                    right: kAppPadding,
                    bottom: kAppPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Crop Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Crop name can not be empty';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        minLines: 1,
                        maxLines: 3,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Prices',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: kGreen,
                            ),
                            icon: const Icon(Icons.add),
                            label: const Text('Add Price'),
                            onPressed: () => _showCropPriceDialog(cropProvider),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: cropProvider.cropPrices.length,
                        itemBuilder: (context, index) {
                          final cropPrice = cropProvider.cropPrices[index];

                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(cropPrice.uom),
                            subtitle: Text(
                                'PHP ${cropPrice.price.toStringAsFixed(2)}'),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: kGreen,
            label: const Text('Save Crop'),
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_cropFormKey.currentState!.validate()) {
                if (cropProvider.cropPrices.isEmpty) {
                  _showNoCropPricesDialog();
                  return;
                }

                _cropFormKey.currentState!.save();
                _saveCrop(cropProvider);
              }
            }),
      ),
    );
  }

  Future<void> _takeImage(CropProvider cropProvider, ImageSource source) async {
    try {
      PermissionStatus permissionStatus;

      switch (source) {
        case ImageSource.camera:
          if (Platform.isAndroid) {
            permissionStatus = await Permission.camera.request();
          } else {
            permissionStatus = await Permission.photos.request();
          }

          break;
        case ImageSource.gallery:
          if (Platform.isAndroid) {
            permissionStatus = await Permission.storage.request();
          } else {
            permissionStatus = await Permission.photos.request();
          }

          break;
        default:
          throw Exception('Unsupported image source');
      }

      if (!permissionStatus.isGranted) {
        SnackbarUtility.showDangerSnackBar(
            'Permission not granted. Try again with permission access');
        return;
      }

      final image = await _picker.pickImage(
        source: source,
        maxHeight: 240,
        maxWidth: 240,
        imageQuality: 100,
      );

      cropProvider.setImage(imageFile: image!);
    } catch (e) {
      cropProvider.setImageError(error: 'No image selected or taken');
    }
  }

  Widget _previewImage(CropProvider cropProvider) {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }

    final imageFile = cropProvider.imageFile;
    if (imageFile != null) {
      return Semantics(
        label: 'picked_image',
        child: Image.file(
          File(imageFile.path),
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }

    final error = cropProvider.pickImageError;
    if (error.isNotEmpty) {
      return Text(
        error,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.red),
      );
    }

    return const Text(
      'You have not yet picked an image',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red),
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }

    return null;
  }

  void _saveCrop(CropProvider cropProvider) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      final crop = Crop.create(
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
        cropBy: context.read<AuthProvider>().user!.uid,
        createdBy: context.read<AuthProvider>().user!.uid,
      );

      cropProvider.saveCrop(crop: crop).then(
        (value) {
          _clearFields(cropProvider);

          SnackbarUtility.showSuccessSnackBar(
              'Your crop has successfully saved');
        },
      );

      Navigator.of(context).pop();
    } on FirebaseException catch (e) {
      SnackbarUtility.showDangerSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }

  void _showCropPriceDialog(CropProvider cropProvider) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CropPriceDialog(
        onAddCropPrice: (cropPrice) {
          cropProvider.addCropPrice(cropPrice);
        },
      ),
    );
  }

  void _showNoCropPricesDialog() {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('No Prices'),
        content: const Text(
            'There are no prices were set for this crop. Please add at lease one price.'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Ok'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  void _clearFields(CropProvider cropProvider) {
    cropProvider.clearImageAndError();

    nameController.clear();
    descriptionController.clear();
  }
}
