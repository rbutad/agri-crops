import 'package:agricrops/helpers/converters/timestamp_nullable_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crop.freezed.dart';
part 'crop.g.dart';

@freezed
abstract class Crop with _$Crop {
  const factory Crop({
    @JsonKey(ignore: true) @Default('') String uid,
    @Default('') String name,
    @Default('') String description,
    @Default('') String imageUrl,
    @JsonKey(name: 'crop_by_uid') @Default('') String cropBy,
    @JsonKey(ignore: true) @Default(0) double cropDefaultPrice,
    @JsonKey(ignore: true) @Default('') String cropDefaultUom,
    @TimestampNullableConverter() DateTime? createdAt,
    @Default('') String createdBy,
    @TimestampNullableConverter() DateTime? updatedAt,
    @Default('') String updatedBy,
  }) = _Crop;

  factory Crop.create({
    required String name,
    String description = '',
    String imageUrl = '',
    required String cropBy,
    required String createdBy,
  }) {
    return Crop(
      name: name,
      description: description,
      imageUrl: imageUrl,
      cropBy: cropBy,
      createdBy: createdBy,
      createdAt: DateTime.now(),
    );
  }

  factory Crop.fromJson(Map<String, dynamic> json) => _$CropFromJson(json);

  factory Crop.fromDocument(DocumentSnapshot<Map<String, dynamic>> document) =>
      _$CropFromJson(document.data()!).copyWith(uid: document.id);
}
