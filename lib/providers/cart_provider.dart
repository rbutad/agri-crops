import 'package:agricrops/models/cart/cart.dart';
import 'package:agricrops/models/crops/crop_price/crop_price.dart';
import 'package:agricrops/models/orders/order/order.dart';
import 'package:agricrops/models/orders/order_item/order_item.dart';
import 'package:agricrops/services/cart_service.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final CartService _cartService;

  CartProvider(this._cartService);

  CropPrice? _selectedCropPrice;
  CropPrice? get selectedCropPrice => _selectedCropPrice;

  int _quantity = 1;
  int get quantity => _quantity;

  double _totalAmount = 0;
  double get totalAmount => _totalAmount;

  void setSelectedCropPrice(CropPrice cropPrice) {
    _selectedCropPrice = cropPrice;
    _totalAmount = cropPrice.price;
    _quantity = 1;

    notifyListeners();
  }

  void addQuantity(double price) {
    _quantity += 1;
    _totalAmount = price * _quantity;

    notifyListeners();
  }

  void reduceQuantity(double price) {
    _quantity -= 1;
    _totalAmount = price * _quantity;

    notifyListeners();
  }

  void clear() {
    _selectedCropPrice = null;
    _totalAmount = 0;
    _quantity = 1;

    notifyListeners();
  }

  Stream<List<Cart>> getUserCartItems(String userUid) {
    final cartItems = _cartService.getUserCartItems(userUid).map((snapshot) =>
        snapshot.docs.map((document) => Cart.fromDocument(document)).toList());

    return cartItems;
  }

  Future<void> addToCart(Cart cart) async {
    await _cartService.addToCart(cart).catchError((error) {
      debugPrint(error);
      throw Exception(error);
    });
  }

  Future<void> modifyCartItemQuantity(Cart updatedCartItem) async {
    await _cartService
        .modifyCartItemQuantity(updatedCartItem)
        .catchError((error) {
      debugPrint(error);
      throw Exception(error);
    });
  }

  Future<void> removeCartItem(String uid) async {
    await _cartService.removeCartItem(uid).catchError((error) {
      debugPrint(error);
      throw Exception(error);
    });
  }

  Future<void> orderCartItems(Order order, List<OrderItem> orderItems) async {
    await _cartService.orderCartItems(order, orderItems).catchError((error) {
      debugPrint(error);
      throw Exception(error);
    });
  }
}
