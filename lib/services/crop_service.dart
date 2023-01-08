import 'dart:io';

import 'package:agricrops/constants/firestore_collection_constant.dart';
import 'package:agricrops/models/crops/crop/crop.dart';
import 'package:agricrops/models/crops/crop_price/crop_price.dart';
import 'package:agricrops/utilities/global_utiility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class CropService {
  CropService();

  Stream<QuerySnapshot<Map<String, dynamic>>> getCrops(String userUid) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.crops)
        .orderBy('name')
        .where('crop_by_uid', isEqualTo: userUid)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getCropDetail(String cropUid) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.crops)
        .doc(cropUid)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCropPrices(String cropUid) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.cropPrices)
        .where('cropUid', isEqualTo: cropUid)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllCropsForBuyer() {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.crops)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .take(10);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getDefaultCropPriceFuture(
      String cropUid) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.cropPrices)
        .where('cropUid', isEqualTo: cropUid)
        .where('is_default_price', isEqualTo: true)
        .get();
  }

  Future<String> saveCrop({required Crop crop}) async {
    var docRef =
        firebaseFirestore.collection(FirestoreCollectionConstant.crops).doc();

    await docRef.set(crop.toJson()).catchError((error) => Future.error(error));

    return docRef.id;
  }

  Future<void> saveCropPrices(List<CropPrice> cropPrices) async {
    final batch = firebaseFirestore.batch();

    for (var cropPrice in cropPrices) {
      var cropPriceDocument = firebaseFirestore
          .collection(FirestoreCollectionConstant.cropPrices)
          .doc();

      batch.set(cropPriceDocument, cropPrice.toJson());
    }

    await batch.commit().catchError((error) => Future.error(error));
  }

  Future<String> uploadImage({required XFile imageFile}) {
    final imageFileName =
        '${DateTime.now().millisecondsSinceEpoch}_${imageFile.name}';

    final imageUrl = firebaseStorage
        .ref()
        .child('crops/$imageFileName')
        .putFile(File(imageFile.path))
        .then((snapshot) => snapshot.ref.getDownloadURL());

    return imageUrl;
  }

  Future<void> deleteCrop(String cropUid) async {
    await firebaseFirestore
        .collection(FirestoreCollectionConstant.crops)
        .doc(cropUid)
        .delete()
        .catchError((error) => Future.error(error));
  }

  Future<void> deleteCropPrices(String cropUid) async {
    final batch = firebaseFirestore.batch();

    final cropPrices = await firebaseFirestore
        .collection(FirestoreCollectionConstant.cropPrices)
        .where('cropUid', isEqualTo: cropUid)
        .get()
        .then((snapshot) => snapshot.docs
            .map((document) => CropPrice.fromDocument(document))
            .toList());

    for (var cropPrice in cropPrices) {
      var document = firebaseFirestore
          .collection(FirestoreCollectionConstant.cropPrices)
          .doc(cropPrice.uid);

      batch.delete(document);
    }

    await batch.commit().catchError((error) => Future.error(error));
  }
}
