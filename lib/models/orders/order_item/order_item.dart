import 'package:agricrops/enums/order_item_status_enum.dart';
import 'package:agricrops/helpers/converters/timestamp_nullable_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    @JsonKey(ignore: true) @Default('') String uid,
    @JsonKey(name: 'crop_uid') @Default('') String cropUid,
    @JsonKey(name: 'crop_name') @Default('') String cropName,
    @JsonKey(name: 'unit_of_measure') @Default('') String unitOfMeasure,
    @Default(0) double price,
    @Default(0) int quantity,
    @Default(0) double vatable,
    @Default(0) double vat,
    @JsonKey(name: 'line_total') @Default(0) double lineTotal,
    @JsonKey(name: 'crop_image_url') @Default('') String cropImageUrl,
    @JsonKey(ignore: true) @Default('') String cartUid,
    @Default(OrderItemStatus.pending) OrderItemStatus status,
    @JsonKey(name: 'created_at')
    @TimestampNullableConverter()
        DateTime? createdAt,
    @JsonKey(name: 'created_by') @Default('') String createdBy,
    @JsonKey(name: 'updated_at')
    @TimestampNullableConverter()
        DateTime? updatedAt,
    @JsonKey(name: 'updated_by') @Default('') String updatedBy,
  }) = _OrderItem;

  factory OrderItem.create({
    required String cropUid,
    required String cropName,
    required String unitOfMeasure,
    required double price,
    required int quantity,
    required double vatable,
    required double vat,
    required double lineTotal,
    required String cropImageUrl,
    required String createdBy,
    required String cartUid,
  }) {
    return OrderItem(
        cropUid: cropUid,
        cropName: cropName,
        unitOfMeasure: unitOfMeasure,
        price: price,
        quantity: quantity,
        vatable: vatable,
        vat: vat,
        lineTotal: lineTotal,
        cropImageUrl: cropImageUrl,
        status: OrderItemStatus.pending,
        createdBy: createdBy,
        createdAt: DateTime.now(),
        cartUid: cartUid);
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  factory OrderItem.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> documentSnapshot) =>
      _$OrderItemFromJson(documentSnapshot.data()!)
          .copyWith(uid: documentSnapshot.id);
}
