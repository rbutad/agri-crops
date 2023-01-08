import 'package:agricrops/helpers/converters/timestamp_nullable_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({
    @JsonKey(ignore: true) @Default('') String uid,
    @JsonKey(name: 'crop_uid') @Default('') String cropUid,
    @JsonKey(name: 'crop_name') @Default('') String cropName,
    @JsonKey(name: 'unit_of_measure') @Default('') String unitOfMeasure,
    @Default(0) double price,
    @Default(0) int quantity,
    @JsonKey(name: 'total_amount') @Default(0) double totalAmount,
    @JsonKey(name: 'crop_image_url') @Default('') String cropImageUrl,
    @JsonKey(name: 'crop_by') @Default('') String cropBy,
    @JsonKey(name: 'created_at')
    @TimestampNullableConverter()
        DateTime? createdAt,
    @JsonKey(name: 'created_by') @Default('') String createdBy,
    @JsonKey(name: 'updated_at')
    @TimestampNullableConverter()
        DateTime? updatedAt,
    @JsonKey(name: 'updated_by') @Default('') String updatedBy,
  }) = _Cart;

  factory Cart.create({
    required String cropUid,
    required String cropName,
    required String unitOfMeasure,
    required double price,
    required int quantity,
    required String cropImageUrl,
    required String cropBy,
    required String createdBy,
  }) {
    return Cart(
      cropUid: cropUid,
      cropName: cropName,
      unitOfMeasure: unitOfMeasure,
      price: price,
      quantity: quantity,
      totalAmount: price * quantity,
      cropImageUrl: cropImageUrl,
      cropBy: cropBy,
      createdBy: createdBy,
      createdAt: DateTime.now(),
    );
  }

  factory Cart.update({
    required String uid,
    required int quantity,
    required double price,
    required String updatedBy,
  }) {
    return Cart(
      uid: uid,
      quantity: quantity,
      totalAmount: price * quantity,
      updatedBy: updatedBy,
      updatedAt: DateTime.now(),
    );
  }

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  factory Cart.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> documentSnapshot) =>
      _$CartFromJson(documentSnapshot.data()!)
          .copyWith(uid: documentSnapshot.id);
}
