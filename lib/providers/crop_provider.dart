import 'package:agricrops/models/crops/crop/crop.dart';
import 'package:agricrops/models/crops/crop_price/crop_price.dart';
import 'package:agricrops/services/crop_service.dart';
import 'package:agricrops/services/order_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CropProvider extends ChangeNotifier {
  final CropService cropService;
  final OrderService orderService;

  XFile? _imageFile;
  XFile? get imageFile => _imageFile;

  late String _pickImageError = '';
  String get pickImageError => _pickImageError;

  final List<CropPrice> _cropPrices = [];
  List<CropPrice> get cropPrices => _cropPrices;

  CropProvider(this.cropService, this.orderService);

  Stream<List<Crop>> getCrops(String userUid) {
    final crops = cropService.getCrops(userUid).map((snapshot) =>
        snapshot.docs.map((document) => Crop.fromDocument(document)).toList());

    return crops;
  }

  Stream<Crop> getCropDetail(String cropUid) {
    return cropService
        .getCropDetail(cropUid)
        .map((document) => Crop.fromDocument(document));
  }

  Stream<List<CropPrice>> getCropPrices(String cropUid) {
    return cropService.getCropPrices(cropUid).map((snapshot) => snapshot.docs
        .map((document) => CropPrice.fromDocument(document))
        .toList());
  }

  Stream<List<Crop>> getAllCropsForBuyer() {
    var crops = cropService.getAllCropsForBuyer().map((snapshot) =>
        snapshot.docs.map((document) => Crop.fromDocument(document)).toList());

    crops = crops
        .asyncMap((crops) => Future.wait(crops.map<Future<Crop>>((crop) async {
              var pricesSnapshot =
                  await cropService.getDefaultCropPriceFuture(crop.uid);

              var price = pricesSnapshot.docs
                  .map((snapshot) => CropPrice.fromJson(snapshot.data()))
                  .toList()
                  .first;

              return crop.copyWith(
                  cropDefaultPrice: price.price, cropDefaultUom: price.uom);
            })));

    return crops;
  }

  void addCropPrice(CropPrice cropPrice) {
    _cropPrices.add(cropPrice);
    notifyListeners();
  }

  bool hasCropPrices() {
    return _cropPrices.isNotEmpty;
  }

  void setImage({required XFile imageFile}) {
    _imageFile = imageFile;
    notifyListeners();
  }

  void setImageError({required dynamic error}) {
    _pickImageError = error;
    notifyListeners();
  }

  void clearImage() {
    _imageFile = null;
    notifyListeners();
  }

  void clearImageAndError() {
    _imageFile = null;
    _pickImageError = '';
    notifyListeners();
  }

  Future<void> saveCrop({required Crop crop}) async {
    String imageUrl = '';

    if (_imageFile != null) {
      imageUrl = await cropService.uploadImage(imageFile: _imageFile!);
    }

    if (imageUrl.isNotEmpty) {
      crop = crop.copyWith(imageUrl: imageUrl);
    }

    cropService.saveCrop(crop: crop).then((cropUid) {
      final prices = _cropPrices
          .map((cropPrice) => cropPrice.copyWith(
                cropUid: cropUid,
              ))
          .toList();

      cropService.saveCropPrices(prices).then((_) {
        _cropPrices.clear();
        notifyListeners();
      });
    }).catchError((error) {
      debugPrint(error);
      throw Exception(error);
    });
  }

  Future<bool> isCropPriceExists(String uom) {
    final cropPrice = _cropPrices.where(
      (cropPrice) => cropPrice.uom.toLowerCase() == uom.toLowerCase(),
    );

    return Future.value(cropPrice.isNotEmpty);
  }

  Future<void> deleteCrop(String cropUid) async {
    cropService
        .deleteCrop(cropUid)
        .then((_) async => await cropService.deleteCropPrices(cropUid))
        .catchError((error) {
      debugPrint(error);
      throw Exception(error);
    });
  }
}
