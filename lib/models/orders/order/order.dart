import 'package:agricrops/enums/order_status_enum.dart';
import 'package:agricrops/helpers/converters/timestamp_nullable_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class Order with _$Order {
  const factory Order({
    @JsonKey(ignore: true) @Default('') String uid,
    @JsonKey(name: 'total_items') @Default(0) int totalItems,
    @JsonKey(name: 'total_quantity') @Default(0) int totalQuantity,
    @JsonKey(name: 'total_amount') @Default(0) double totalAmount,
    @JsonKey(name: 'amount_due') @Default(0) double amountDue,
    @JsonKey(name: 'vatable_sales') @Default(0) double vatableSales,
    @JsonKey(name: 'vat_amount') @Default(0) double vatAmount,
    @JsonKey(name: 'seller_uid') @Default('') String sellerUid,
    @JsonKey(name: 'buyer_uid') @Default('') String buyerUid,
    @Default(OrderStatus.pending) OrderStatus status,
    @JsonKey(name: 'accepted_at')
    @TimestampNullableConverter()
        DateTime? acceptedAt,
    @JsonKey(name: 'accepted_by') @Default('') String acceptedBy,
    @JsonKey(name: 'delivered_at')
    @TimestampNullableConverter()
        DateTime? deliveredAt,
    @JsonKey(name: 'created_at')
    @TimestampNullableConverter()
        DateTime? createdAt,
    @JsonKey(name: 'created_by') @Default('') String createdBy,
    @JsonKey(name: 'updated_at')
    @TimestampNullableConverter()
        DateTime? updatedAt,
    @JsonKey(name: 'updated_by') @Default('') String updatedBy,
  }) = _Order;

  factory Order.create({
    required int totalItems,
    required int totalQuantity,
    required double totalAmount,
    required double amountDue,
    required double vatableSales,
    required double vatAmount,
    required String sellerUid,
    required String buyerUid,
    required String createdBy,
  }) {
    return Order(
      totalItems: totalItems,
      totalQuantity: totalQuantity,
      totalAmount: totalAmount,
      amountDue: amountDue,
      vatableSales: vatableSales,
      vatAmount: vatAmount,
      sellerUid: sellerUid,
      buyerUid: buyerUid,
      createdBy: createdBy,
      createdAt: DateTime.now(),
    );
  }

  factory Order.accepted({
    required String uid,
    required String acceptedBy,
    required DateTime acceptedAt,
    required String updatedBy,
  }) {
    return Order(
      uid: uid,
      status: OrderStatus.accepted,
      acceptedBy: acceptedBy,
      acceptedAt: DateTime.now(),
      updatedBy: updatedBy,
      updatedAt: DateTime.now(),
    );
  }

  factory Order.delivered({
    required String uid,
    required String updatedBy,
  }) {
    return Order(
      uid: uid,
      status: OrderStatus.delivered,
      deliveredAt: DateTime.now(),
      updatedBy: updatedBy,
      updatedAt: DateTime.now(),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  factory Order.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> documentSnapshot) =>
      _$OrderFromJson(documentSnapshot.data()!)
          .copyWith(uid: documentSnapshot.id);
}
