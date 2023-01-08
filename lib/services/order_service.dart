import 'package:agricrops/constants/firestore_collection_constant.dart';
import 'package:agricrops/enums/order_item_status_enum.dart';
import 'package:agricrops/utilities/global_utiility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderService {
  static OrderService get instance => OrderService();

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserOrders(String userUid) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.order)
        .orderBy('created_at', descending: true)
        .where('buyer_uid', isEqualTo: userUid)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getOrdersForFarmer(
      String farmerUid) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.order)
        .orderBy('created_at', descending: true)
        .where('seller_uid', isEqualTo: farmerUid)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getOrderItems(String orderUid) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.order)
        .doc(orderUid)
        .collection(FirestoreCollectionConstant.orderItem)
        .orderBy('crop_name', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCropOrderedItems(
      String cropUid) {
    return firebaseFirestore
        .collectionGroup(FirestoreCollectionConstant.orderItem)
        .where('crop_uid', isEqualTo: cropUid)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCustomerOrderedItemsByStatus(
      {required OrderItemStatus status}) {
    return firebaseFirestore
        .collectionGroup(FirestoreCollectionConstant.orderItem)
        .where('status', isEqualTo: status)
        .snapshots();
  }
}
