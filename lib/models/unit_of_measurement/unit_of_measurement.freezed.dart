// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_of_measurement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitOfMeasurement _$UnitOfMeasurementFromJson(Map<String, dynamic> json) {
  return _UnitOfMeasurement.fromJson(json);
}

/// @nodoc
mixin _$UnitOfMeasurement {
  @JsonKey(ignore: true)
  String get uid => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitOfMeasurementCopyWith<UnitOfMeasurement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitOfMeasurementCopyWith<$Res> {
  factory $UnitOfMeasurementCopyWith(
          UnitOfMeasurement value, $Res Function(UnitOfMeasurement) then) =
      _$UnitOfMeasurementCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String uid, String code, String description});
}

/// @nodoc
class _$UnitOfMeasurementCopyWithImpl<$Res>
    implements $UnitOfMeasurementCopyWith<$Res> {
  _$UnitOfMeasurementCopyWithImpl(this._value, this._then);

  final UnitOfMeasurement _value;
  // ignore: unused_field
  final $Res Function(UnitOfMeasurement) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? code = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UnitOfMeasurementCopyWith<$Res>
    implements $UnitOfMeasurementCopyWith<$Res> {
  factory _$$_UnitOfMeasurementCopyWith(_$_UnitOfMeasurement value,
          $Res Function(_$_UnitOfMeasurement) then) =
      __$$_UnitOfMeasurementCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String uid, String code, String description});
}

/// @nodoc
class __$$_UnitOfMeasurementCopyWithImpl<$Res>
    extends _$UnitOfMeasurementCopyWithImpl<$Res>
    implements _$$_UnitOfMeasurementCopyWith<$Res> {
  __$$_UnitOfMeasurementCopyWithImpl(
      _$_UnitOfMeasurement _value, $Res Function(_$_UnitOfMeasurement) _then)
      : super(_value, (v) => _then(v as _$_UnitOfMeasurement));

  @override
  _$_UnitOfMeasurement get _value => super._value as _$_UnitOfMeasurement;

  @override
  $Res call({
    Object? uid = freezed,
    Object? code = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_UnitOfMeasurement(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitOfMeasurement implements _UnitOfMeasurement {
  const _$_UnitOfMeasurement(
      {@JsonKey(ignore: true) this.uid = '',
      this.code = '',
      this.description = ''});

  factory _$_UnitOfMeasurement.fromJson(Map<String, dynamic> json) =>
      _$$_UnitOfMeasurementFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String uid;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'UnitOfMeasurement(uid: $uid, code: $code, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnitOfMeasurement &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_UnitOfMeasurementCopyWith<_$_UnitOfMeasurement> get copyWith =>
      __$$_UnitOfMeasurementCopyWithImpl<_$_UnitOfMeasurement>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitOfMeasurementToJson(
      this,
    );
  }
}

abstract class _UnitOfMeasurement implements UnitOfMeasurement {
  const factory _UnitOfMeasurement(
      {@JsonKey(ignore: true) final String uid,
      final String code,
      final String description}) = _$_UnitOfMeasurement;

  factory _UnitOfMeasurement.fromJson(Map<String, dynamic> json) =
      _$_UnitOfMeasurement.fromJson;

  @override
  @JsonKey(ignore: true)
  String get uid;
  @override
  String get code;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_UnitOfMeasurementCopyWith<_$_UnitOfMeasurement> get copyWith =>
      throw _privateConstructorUsedError;
}
