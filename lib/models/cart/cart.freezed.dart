// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  @JsonKey(ignore: true)
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'crop_uid')
  String get cropUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'crop_name')
  String get cropName => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_of_measure')
  String get unitOfMeasure => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'crop_image_url')
  String get cropImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'crop_by')
  String get cropBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @TimestampNullableConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @TimestampNullableConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by')
  String get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true)
          String uid,
      @JsonKey(name: 'crop_uid')
          String cropUid,
      @JsonKey(name: 'crop_name')
          String cropName,
      @JsonKey(name: 'unit_of_measure')
          String unitOfMeasure,
      double price,
      int quantity,
      @JsonKey(name: 'total_amount')
          double totalAmount,
      @JsonKey(name: 'crop_image_url')
          String cropImageUrl,
      @JsonKey(name: 'crop_by')
          String cropBy,
      @JsonKey(name: 'created_at')
      @TimestampNullableConverter()
          DateTime? createdAt,
      @JsonKey(name: 'created_by')
          String createdBy,
      @JsonKey(name: 'updated_at')
      @TimestampNullableConverter()
          DateTime? updatedAt,
      @JsonKey(name: 'updated_by')
          String updatedBy});
}

/// @nodoc
class _$CartCopyWithImpl<$Res> implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  final Cart _value;
  // ignore: unused_field
  final $Res Function(Cart) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? cropUid = freezed,
    Object? cropName = freezed,
    Object? unitOfMeasure = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? totalAmount = freezed,
    Object? cropImageUrl = freezed,
    Object? cropBy = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      cropUid: cropUid == freezed
          ? _value.cropUid
          : cropUid // ignore: cast_nullable_to_non_nullable
              as String,
      cropName: cropName == freezed
          ? _value.cropName
          : cropName // ignore: cast_nullable_to_non_nullable
              as String,
      unitOfMeasure: unitOfMeasure == freezed
          ? _value.unitOfMeasure
          : unitOfMeasure // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      cropImageUrl: cropImageUrl == freezed
          ? _value.cropImageUrl
          : cropImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cropBy: cropBy == freezed
          ? _value.cropBy
          : cropBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: updatedBy == freezed
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$_CartCopyWith(_$_Cart value, $Res Function(_$_Cart) then) =
      __$$_CartCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true)
          String uid,
      @JsonKey(name: 'crop_uid')
          String cropUid,
      @JsonKey(name: 'crop_name')
          String cropName,
      @JsonKey(name: 'unit_of_measure')
          String unitOfMeasure,
      double price,
      int quantity,
      @JsonKey(name: 'total_amount')
          double totalAmount,
      @JsonKey(name: 'crop_image_url')
          String cropImageUrl,
      @JsonKey(name: 'crop_by')
          String cropBy,
      @JsonKey(name: 'created_at')
      @TimestampNullableConverter()
          DateTime? createdAt,
      @JsonKey(name: 'created_by')
          String createdBy,
      @JsonKey(name: 'updated_at')
      @TimestampNullableConverter()
          DateTime? updatedAt,
      @JsonKey(name: 'updated_by')
          String updatedBy});
}

/// @nodoc
class __$$_CartCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res>
    implements _$$_CartCopyWith<$Res> {
  __$$_CartCopyWithImpl(_$_Cart _value, $Res Function(_$_Cart) _then)
      : super(_value, (v) => _then(v as _$_Cart));

  @override
  _$_Cart get _value => super._value as _$_Cart;

  @override
  $Res call({
    Object? uid = freezed,
    Object? cropUid = freezed,
    Object? cropName = freezed,
    Object? unitOfMeasure = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? totalAmount = freezed,
    Object? cropImageUrl = freezed,
    Object? cropBy = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$_Cart(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      cropUid: cropUid == freezed
          ? _value.cropUid
          : cropUid // ignore: cast_nullable_to_non_nullable
              as String,
      cropName: cropName == freezed
          ? _value.cropName
          : cropName // ignore: cast_nullable_to_non_nullable
              as String,
      unitOfMeasure: unitOfMeasure == freezed
          ? _value.unitOfMeasure
          : unitOfMeasure // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      cropImageUrl: cropImageUrl == freezed
          ? _value.cropImageUrl
          : cropImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cropBy: cropBy == freezed
          ? _value.cropBy
          : cropBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: createdBy == freezed
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: updatedBy == freezed
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cart implements _Cart {
  const _$_Cart(
      {@JsonKey(ignore: true) this.uid = '',
      @JsonKey(name: 'crop_uid') this.cropUid = '',
      @JsonKey(name: 'crop_name') this.cropName = '',
      @JsonKey(name: 'unit_of_measure') this.unitOfMeasure = '',
      this.price = 0,
      this.quantity = 0,
      @JsonKey(name: 'total_amount') this.totalAmount = 0,
      @JsonKey(name: 'crop_image_url') this.cropImageUrl = '',
      @JsonKey(name: 'crop_by') this.cropBy = '',
      @JsonKey(name: 'created_at') @TimestampNullableConverter() this.createdAt,
      @JsonKey(name: 'created_by') this.createdBy = '',
      @JsonKey(name: 'updated_at') @TimestampNullableConverter() this.updatedAt,
      @JsonKey(name: 'updated_by') this.updatedBy = ''});

  factory _$_Cart.fromJson(Map<String, dynamic> json) => _$$_CartFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String uid;
  @override
  @JsonKey(name: 'crop_uid')
  final String cropUid;
  @override
  @JsonKey(name: 'crop_name')
  final String cropName;
  @override
  @JsonKey(name: 'unit_of_measure')
  final String unitOfMeasure;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'crop_image_url')
  final String cropImageUrl;
  @override
  @JsonKey(name: 'crop_by')
  final String cropBy;
  @override
  @JsonKey(name: 'created_at')
  @TimestampNullableConverter()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'created_by')
  final String createdBy;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampNullableConverter()
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'updated_by')
  final String updatedBy;

  @override
  String toString() {
    return 'Cart(uid: $uid, cropUid: $cropUid, cropName: $cropName, unitOfMeasure: $unitOfMeasure, price: $price, quantity: $quantity, totalAmount: $totalAmount, cropImageUrl: $cropImageUrl, cropBy: $cropBy, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cart &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.cropUid, cropUid) &&
            const DeepCollectionEquality().equals(other.cropName, cropName) &&
            const DeepCollectionEquality()
                .equals(other.unitOfMeasure, unitOfMeasure) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality()
                .equals(other.cropImageUrl, cropImageUrl) &&
            const DeepCollectionEquality().equals(other.cropBy, cropBy) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.updatedBy, updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(cropUid),
      const DeepCollectionEquality().hash(cropName),
      const DeepCollectionEquality().hash(unitOfMeasure),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(cropImageUrl),
      const DeepCollectionEquality().hash(cropBy),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(updatedBy));

  @JsonKey(ignore: true)
  @override
  _$$_CartCopyWith<_$_Cart> get copyWith =>
      __$$_CartCopyWithImpl<_$_Cart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {@JsonKey(ignore: true)
          final String uid,
      @JsonKey(name: 'crop_uid')
          final String cropUid,
      @JsonKey(name: 'crop_name')
          final String cropName,
      @JsonKey(name: 'unit_of_measure')
          final String unitOfMeasure,
      final double price,
      final int quantity,
      @JsonKey(name: 'total_amount')
          final double totalAmount,
      @JsonKey(name: 'crop_image_url')
          final String cropImageUrl,
      @JsonKey(name: 'crop_by')
          final String cropBy,
      @JsonKey(name: 'created_at')
      @TimestampNullableConverter()
          final DateTime? createdAt,
      @JsonKey(name: 'created_by')
          final String createdBy,
      @JsonKey(name: 'updated_at')
      @TimestampNullableConverter()
          final DateTime? updatedAt,
      @JsonKey(name: 'updated_by')
          final String updatedBy}) = _$_Cart;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$_Cart.fromJson;

  @override
  @JsonKey(ignore: true)
  String get uid;
  @override
  @JsonKey(name: 'crop_uid')
  String get cropUid;
  @override
  @JsonKey(name: 'crop_name')
  String get cropName;
  @override
  @JsonKey(name: 'unit_of_measure')
  String get unitOfMeasure;
  @override
  double get price;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @override
  @JsonKey(name: 'crop_image_url')
  String get cropImageUrl;
  @override
  @JsonKey(name: 'crop_by')
  String get cropBy;
  @override
  @JsonKey(name: 'created_at')
  @TimestampNullableConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'created_by')
  String get createdBy;
  @override
  @JsonKey(name: 'updated_at')
  @TimestampNullableConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'updated_by')
  String get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$_CartCopyWith<_$_Cart> get copyWith => throw _privateConstructorUsedError;
}
