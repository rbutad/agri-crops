import 'package:agricrops/constants/firestore_collection_constant.dart';
import 'package:agricrops/models/farmers_association/farmers_association.dart';
import 'package:agricrops/utilities/global_utiility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FarmersAssociationService {
  static FarmersAssociationService get instance => FarmersAssociationService();

  Stream<QuerySnapshot<Map<String, dynamic>>> getFarmersAssociations() {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.farmersAssociation)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getFarmersAssociationDetail(
    String uid,
  ) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.farmersAssociation)
        .doc(uid)
        .snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>>
      getFarmersAssociationDetailFuture(
    String uid,
  ) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.farmersAssociation)
        .doc(uid)
        .get();
  }

  Future<List<FarmersAssociation>> searchFarmerAssociation(String association) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.farmersAssociation)
        .where('name_lowercase', isGreaterThanOrEqualTo: association)
        .get()
        .then((snapshot) => snapshot.docs
            .map((document) => FarmersAssociation.fromDocument(document))
            .toList());
  }

  Future<void> saveFarmersAssociation(
    FarmersAssociation farmersAssociation,
  ) async {
    await firebaseFirestore
        .collection(FirestoreCollectionConstant.farmersAssociation)
        .doc()
        .set(farmersAssociation.toJson())
        .catchError((error) => Future.error(error));
  }

  Future<void> removeAssociation(String associationUid) async {
    await firebaseFirestore
        .collection(FirestoreCollectionConstant.farmersAssociation)
        .doc(associationUid)
        .delete()
        .catchError((error) => Future.error(error));
  }
}
