import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_of_measurement.freezed.dart';
part 'unit_of_measurement.g.dart';

@freezed
abstract class UnitOfMeasurement with _$UnitOfMeasurement {
  const factory UnitOfMeasurement({
    @JsonKey(ignore: true) @Default('') String uid,
    @Default('') String code,
    @Default('') String description,
  }) = _UnitOfMeasurement;

  factory UnitOfMeasurement.create({
    required String code,
    required String description,
  }) {
    return UnitOfMeasurement(
      code: code,
      description: description,
    );
  }

  factory UnitOfMeasurement.fromJson(Map<String, dynamic> json) =>
      _$UnitOfMeasurementFromJson(json);

  factory UnitOfMeasurement.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> document) {
    return _$UnitOfMeasurementFromJson(document.data()!)
        .copyWith(uid: document.id);
  }
}
