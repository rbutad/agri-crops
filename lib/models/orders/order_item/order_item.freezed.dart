// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
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
  double get vatable => throw _privateConstructorUsedError;
  double get vat => throw _privateConstructorUsedError;
  @JsonKey(name: 'line_total')
  double get lineTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'crop_image_url')
  String get cropImageUrl => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String get cartUid => throw _privateConstructorUsedError;
  OrderItemStatus get status => throw _privateConstructorUsedError;
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
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res>;
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
      double vatable,
      double vat,
      @JsonKey(name: 'line_total')
          double lineTotal,
      @JsonKey(name: 'crop_image_url')
          String cropImageUrl,
      @JsonKey(ignore: true)
          String cartUid,
      OrderItemStatus status,
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
class _$OrderItemCopyWithImpl<$Res> implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  final OrderItem _value;
  // ignore: unused_field
  final $Res Function(OrderItem) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? cropUid = freezed,
    Object? cropName = freezed,
    Object? unitOfMeasure = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? vatable = freezed,
    Object? vat = freezed,
    Object? lineTotal = freezed,
    Object? cropImageUrl = freezed,
    Object? cartUid = freezed,
    Object? status = freezed,
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
      vatable: vatable == freezed
          ? _value.vatable
          : vatable // ignore: cast_nullable_to_non_nullable
              as double,
      vat: vat == freezed
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as double,
      lineTotal: lineTotal == freezed
          ? _value.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double,
      cropImageUrl: cropImageUrl == freezed
          ? _value.cropImageUrl
          : cropImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cartUid: cartUid == freezed
          ? _value.cartUid
          : cartUid // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderItemStatus,
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
abstract class _$$_OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$$_OrderItemCopyWith(
          _$_OrderItem value, $Res Function(_$_OrderItem) then) =
      __$$_OrderItemCopyWithImpl<$Res>;
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
      double vatable,
      double vat,
      @JsonKey(name: 'line_total')
          double lineTotal,
      @JsonKey(name: 'crop_image_url')
          String cropImageUrl,
      @JsonKey(ignore: true)
          String cartUid,
      OrderItemStatus status,
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
class __$$_OrderItemCopyWithImpl<$Res> extends _$OrderItemCopyWithImpl<$Res>
    implements _$$_OrderItemCopyWith<$Res> {
  __$$_OrderItemCopyWithImpl(
      _$_OrderItem _value, $Res Function(_$_OrderItem) _then)
      : super(_value, (v) => _then(v as _$_OrderItem));

  @override
  _$_OrderItem get _value => super._value as _$_OrderItem;

  @override
  $Res call({
    Object? uid = freezed,
    Object? cropUid = freezed,
    Object? cropName = freezed,
    Object? unitOfMeasure = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? vatable = freezed,
    Object? vat = freezed,
    Object? lineTotal = freezed,
    Object? cropImageUrl = freezed,
    Object? cartUid = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$_OrderItem(
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
      vatable: vatable == freezed
          ? _value.vatable
          : vatable // ignore: cast_nullable_to_non_nullable
              as double,
      vat: vat == freezed
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as double,
      lineTotal: lineTotal == freezed
          ? _value.lineTotal
          : lineTotal // ignore: cast_nullable_to_non_nullable
              as double,
      cropImageUrl: cropImageUrl == freezed
          ? _value.cropImageUrl
          : cropImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cartUid: cartUid == freezed
          ? _value.cartUid
          : cartUid // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderItemStatus,
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
class _$_OrderItem implements _OrderItem {
  const _$_OrderItem(
      {@JsonKey(ignore: true) this.uid = '',
      @JsonKey(name: 'crop_uid') this.cropUid = '',
      @JsonKey(name: 'crop_name') this.cropName = '',
      @JsonKey(name: 'unit_of_measure') this.unitOfMeasure = '',
      this.price = 0,
      this.quantity = 0,
      this.vatable = 0,
      this.vat = 0,
      @JsonKey(name: 'line_total') this.lineTotal = 0,
      @JsonKey(name: 'crop_image_url') this.cropImageUrl = '',
      @JsonKey(ignore: true) this.cartUid = '',
      this.status = OrderItemStatus.pending,
      @JsonKey(name: 'created_at') @TimestampNullableConverter() this.createdAt,
      @JsonKey(name: 'created_by') this.createdBy = '',
      @JsonKey(name: 'updated_at') @TimestampNullableConverter() this.updatedAt,
      @JsonKey(name: 'updated_by') this.updatedBy = ''});

  factory _$_OrderItem.fromJson(Map<String, dynamic> json) =>
      _$$_OrderItemFromJson(json);

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
  @JsonKey()
  final double vatable;
  @override
  @JsonKey()
  final double vat;
  @override
  @JsonKey(name: 'line_total')
  final double lineTotal;
  @override
  @JsonKey(name: 'crop_image_url')
  final String cropImageUrl;
  @override
  @JsonKey(ignore: true)
  final String cartUid;
  @override
  @JsonKey()
  final OrderItemStatus status;
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
    return 'OrderItem(uid: $uid, cropUid: $cropUid, cropName: $cropName, unitOfMeasure: $unitOfMeasure, price: $price, quantity: $quantity, vatable: $vatable, vat: $vat, lineTotal: $lineTotal, cropImageUrl: $cropImageUrl, cartUid: $cartUid, status: $status, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderItem &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.cropUid, cropUid) &&
            const DeepCollectionEquality().equals(other.cropName, cropName) &&
            const DeepCollectionEquality()
                .equals(other.unitOfMeasure, unitOfMeasure) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.vatable, vatable) &&
            const DeepCollectionEquality().equals(other.vat, vat) &&
            const DeepCollectionEquality().equals(other.lineTotal, lineTotal) &&
            const DeepCollectionEquality()
                .equals(other.cropImageUrl, cropImageUrl) &&
            const DeepCollectionEquality().equals(other.cartUid, cartUid) &&
            const DeepCollectionEquality().equals(other.status, status) &&
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
      const DeepCollectionEquality().hash(vatable),
      const DeepCollectionEquality().hash(vat),
      const DeepCollectionEquality().hash(lineTotal),
      const DeepCollectionEquality().hash(cropImageUrl),
      const DeepCollectionEquality().hash(cartUid),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(updatedBy));

  @JsonKey(ignore: true)
  @override
  _$$_OrderItemCopyWith<_$_OrderItem> get copyWith =>
      __$$_OrderItemCopyWithImpl<_$_OrderItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderItemToJson(
      this,
    );
  }
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem(
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
      final double vatable,
      final double vat,
      @JsonKey(name: 'line_total')
          final double lineTotal,
      @JsonKey(name: 'crop_image_url')
          final String cropImageUrl,
      @JsonKey(ignore: true)
          final String cartUid,
      final OrderItemStatus status,
      @JsonKey(name: 'created_at')
      @TimestampNullableConverter()
          final DateTime? createdAt,
      @JsonKey(name: 'created_by')
          final String createdBy,
      @JsonKey(name: 'updated_at')
      @TimestampNullableConverter()
          final DateTime? updatedAt,
      @JsonKey(name: 'updated_by')
          final String updatedBy}) = _$_OrderItem;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$_OrderItem.fromJson;

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
  double get vatable;
  @override
  double get vat;
  @override
  @JsonKey(name: 'line_total')
  double get lineTotal;
  @override
  @JsonKey(name: 'crop_image_url')
  String get cropImageUrl;
  @override
  @JsonKey(ignore: true)
  String get cartUid;
  @override
  OrderItemStatus get status;
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
  _$$_OrderItemCopyWith<_$_OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}
