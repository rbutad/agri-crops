import 'package:agricrops/constants/firestore_collection_constant.dart';
import 'package:agricrops/models/cart/cart.dart';
import 'package:agricrops/models/orders/order/order.dart';
import 'package:agricrops/models/orders/order_item/order_item.dart';
import 'package:agricrops/utilities/global_utiility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartService {
  CartService();

  static CartService get instance => CartService();

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserCartItems(String userUid) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.cart)
        .orderBy('created_at', descending: true)
        .where('created_by', isEqualTo: userUid)
        .snapshots();
  }

  Future<void> addToCart(Cart cart) async {
    await firebaseFirestore
        .collection(FirestoreCollectionConstant.cart)
        .doc()
        .set(cart.toJson())
        .catchError((error) => Future.error(error));
  }

  Future<void> modifyCartItemQuantity(Cart updatedCartItem) async {
    await firebaseFirestore
        .collection(FirestoreCollectionConstant.cart)
        .doc(updatedCartItem.uid)
        .update(
      {
        'quantity': updatedCartItem.quantity,
        'total_amount': updatedCartItem.totalAmount,
        'updated_at': updatedCartItem.updatedAt,
        'updated_by': updatedCartItem.updatedBy
      },
    ).catchError((error) => Future.error(error));
  }

  Future<void> removeCartItem(String uid) async {
    await firebaseFirestore
        .collection(FirestoreCollectionConstant.cart)
        .doc(uid)
        .delete()
        .catchError((error) => Future.error(error));
  }

  Future<void> orderCartItems(Order order, List<OrderItem> orderItems) async {
    final batch = firebaseFirestore.batch();

    final orderDocument =
        firebaseFirestore.collection(FirestoreCollectionConstant.order).doc();

    batch.set(orderDocument, order.toJson());

    for (var item in orderItems) {
      var orderItemDocument =
          orderDocument.collection(FirestoreCollectionConstant.orderItem).doc();

      var cartDocument = firebaseFirestore
          .collection(FirestoreCollectionConstant.cart)
          .doc(item.cartUid);

      batch.set(orderItemDocument, item.toJson());
      batch.delete(cartDocument);
    }

    await batch.commit().catchError((error) => Future.error(error));
  }
}
