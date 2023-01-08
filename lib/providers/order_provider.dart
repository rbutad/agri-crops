import 'package:agricrops/enums/order_item_status_enum.dart';
import 'package:agricrops/models/orders/order/order.dart';
import 'package:agricrops/models/orders/order_item/order_item.dart';
import 'package:agricrops/services/order_service.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  final OrderService _orderService;

  OrderProvider(this._orderService);

  OrderItemStatus _itemStatus = OrderItemStatus.pending;
  OrderItemStatus get itemStatus => _itemStatus;

  Stream<List<Order>> getUserOrders(String userUid) {
    final orders = _orderService.getUserOrders(userUid).map((snapshot) =>
        snapshot.docs.map((document) => Order.fromDocument(document)).toList());

    return orders;
  }

  Stream<List<Order>> getOrdersForFarmer(String farmerUid) {
    final orders = _orderService.getOrdersForFarmer(farmerUid).map((snapshot) =>
        snapshot.docs.map((document) => Order.fromDocument(document)).toList());

    return orders;
  }

  Stream<List<OrderItem>> getOrderItems(String orderUid) {
    final orderItems = _orderService.getOrderItems(orderUid).map((snapshot) =>
        snapshot.docs
            .map((document) => OrderItem.fromDocument(document))
            .toList());

    return orderItems;
  }

  Stream<List<OrderItem>> getCropOrderedItems(String cropUid) {
    final items = _orderService.getCropOrderedItems(cropUid).map((snapshot) =>
        snapshot.docs
            .map((document) => OrderItem.fromDocument(document))
            .toList());

    return items;
  }

  Stream<List<OrderItem>> getOrderItemsByStatus() {
    final items = _orderService
        .getCustomerOrderedItemsByStatus(status: _itemStatus)
        .map((snapshot) => snapshot.docs
            .map((document) => OrderItem.fromDocument(document))
            .toList());

    return items;
  }

  void setFilterForItemStatus(OrderItemStatus itemStatus) {
    _itemStatus = itemStatus;
    notifyListeners();
  }
}
