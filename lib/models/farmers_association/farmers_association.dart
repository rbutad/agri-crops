import 'package:agricrops/helpers/converters/timestamp_nullable_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'farmers_association.freezed.dart';
part 'farmers_association.g.dart';

@freezed
abstract class FarmersAssociation with _$FarmersAssociation {
  const factory FarmersAssociation({
    @JsonKey(ignore: true) @Default('') String uid,
    @Default('') String name,
    @JsonKey(name: 'name_lowercase') @Default('') String nameLowercase,
    @Default('') String address,
    @Default('') String contactPerson,
    @Default('') String contactNumber,
    @TimestampNullableConverter() DateTime? createdAt,
    @Default('') String createdBy,
    @TimestampNullableConverter() DateTime? updatedAt,
    @Default('') String updatedBy,
  }) = _FarmersAssociation;

  factory FarmersAssociation.create({
    required String name,
    required String address,
    required String contactNumber,
    required String contactPerson,
    required String createdBy,
  }) {
    return FarmersAssociation(
      name: name,
      nameLowercase: name.toLowerCase(),
      address: address,
      contactPerson: contactPerson,
      contactNumber: contactNumber,
      createdAt: DateTime.now(),
      createdBy: createdBy,
    );
  }

  factory FarmersAssociation.fromJson(Map<String, dynamic> json) =>
      _$FarmersAssociationFromJson(json);

  factory FarmersAssociation.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      _$FarmersAssociationFromJson(document.data()!).copyWith(uid: document.id);
}
