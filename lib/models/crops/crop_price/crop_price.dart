import 'package:agricrops/helpers/converters/timestamp_nullable_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crop_price.freezed.dart';
part 'crop_price.g.dart';

@freezed
abstract class CropPrice with _$CropPrice {
  const factory CropPrice({
    @JsonKey(ignore: true) @Default('') String uid,
    @Default('') String cropUid,
    @Default('') String uomUid,
    @Default('') String uom,
    @Default(0) int availableQty,
    @Default(0) double price,
    @JsonKey(name: 'is_default_price') @Default(false) bool isDefaultPrice,
    @TimestampNullableConverter() DateTime? createdAt,
    @Default('') String createdBy,
    @TimestampNullableConverter() DateTime? updatedAt,
    @Default('') String updatedBy,
  }) = _CropPrice;

  factory CropPrice.create({
    required String cropUid,
    required String uomUid,
    required String uom,
    required int availableQty,
    required double price,
    required bool isDefaultPrice,
    required String createdBy,
  }) {
    return CropPrice(
      cropUid: cropUid,
      uomUid: uomUid,
      uom: uom,
      availableQty: availableQty,
      price: price,
      isDefaultPrice: isDefaultPrice,
      createdBy: createdBy,
      createdAt: DateTime.now(),
    );
  }

  factory CropPrice.fromJson(Map<String, dynamic> json) =>
      _$CropPriceFromJson(json);

  factory CropPrice.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      _$CropPriceFromJson(document.data()!).copyWith(uid: document.id);
}
