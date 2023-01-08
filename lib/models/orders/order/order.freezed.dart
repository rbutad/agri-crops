// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(ignore: true)
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_items')
  int get totalItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_quantity')
  int get totalQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_due')
  double get amountDue => throw _privateConstructorUsedError;
  @JsonKey(name: 'vatable_sales')
  double get vatableSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat_amount')
  double get vatAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'seller_uid')
  String get sellerUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_uid')
  String get buyerUid => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'accepted_at')
  @TimestampNullableConverter()
  DateTime? get acceptedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'accepted_by')
  String get acceptedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivered_at')
  @TimestampNullableConverter()
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
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
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true)
          String uid,
      @JsonKey(name: 'total_items')
          int totalItems,
      @JsonKey(name: 'total_quantity')
          int totalQuantity,
      @JsonKey(name: 'total_amount')
          double totalAmount,
      @JsonKey(name: 'amount_due')
          double amountDue,
      @JsonKey(name: 'vatable_sales')
          double vatableSales,
      @JsonKey(name: 'vat_amount')
          double vatAmount,
      @JsonKey(name: 'seller_uid')
          String sellerUid,
      @JsonKey(name: 'buyer_uid')
          String buyerUid,
      OrderStatus status,
      @JsonKey(name: 'accepted_at')
      @TimestampNullableConverter()
          DateTime? acceptedAt,
      @JsonKey(name: 'accepted_by')
          String acceptedBy,
      @JsonKey(name: 'delivered_at')
      @TimestampNullableConverter()
          DateTime? deliveredAt,
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
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? totalItems = freezed,
    Object? totalQuantity = freezed,
    Object? totalAmount = freezed,
    Object? amountDue = freezed,
    Object? vatableSales = freezed,
    Object? vatAmount = freezed,
    Object? sellerUid = freezed,
    Object? buyerUid = freezed,
    Object? status = freezed,
    Object? acceptedAt = freezed,
    Object? acceptedBy = freezed,
    Object? deliveredAt = freezed,
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
      totalItems: totalItems == freezed
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      amountDue: amountDue == freezed
          ? _value.amountDue
          : amountDue // ignore: cast_nullable_to_non_nullable
              as double,
      vatableSales: vatableSales == freezed
          ? _value.vatableSales
          : vatableSales // ignore: cast_nullable_to_non_nullable
              as double,
      vatAmount: vatAmount == freezed
          ? _value.vatAmount
          : vatAmount // ignore: cast_nullable_to_non_nullable
              as double,
      sellerUid: sellerUid == freezed
          ? _value.sellerUid
          : sellerUid // ignore: cast_nullable_to_non_nullable
              as String,
      buyerUid: buyerUid == freezed
          ? _value.buyerUid
          : buyerUid // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      acceptedAt: acceptedAt == freezed
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acceptedBy: acceptedBy == freezed
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as String,
      deliveredAt: deliveredAt == freezed
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true)
          String uid,
      @JsonKey(name: 'total_items')
          int totalItems,
      @JsonKey(name: 'total_quantity')
          int totalQuantity,
      @JsonKey(name: 'total_amount')
          double totalAmount,
      @JsonKey(name: 'amount_due')
          double amountDue,
      @JsonKey(name: 'vatable_sales')
          double vatableSales,
      @JsonKey(name: 'vat_amount')
          double vatAmount,
      @JsonKey(name: 'seller_uid')
          String sellerUid,
      @JsonKey(name: 'buyer_uid')
          String buyerUid,
      OrderStatus status,
      @JsonKey(name: 'accepted_at')
      @TimestampNullableConverter()
          DateTime? acceptedAt,
      @JsonKey(name: 'accepted_by')
          String acceptedBy,
      @JsonKey(name: 'delivered_at')
      @TimestampNullableConverter()
          DateTime? deliveredAt,
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
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, (v) => _then(v as _$_Order));

  @override
  _$_Order get _value => super._value as _$_Order;

  @override
  $Res call({
    Object? uid = freezed,
    Object? totalItems = freezed,
    Object? totalQuantity = freezed,
    Object? totalAmount = freezed,
    Object? amountDue = freezed,
    Object? vatableSales = freezed,
    Object? vatAmount = freezed,
    Object? sellerUid = freezed,
    Object? buyerUid = freezed,
    Object? status = freezed,
    Object? acceptedAt = freezed,
    Object? acceptedBy = freezed,
    Object? deliveredAt = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$_Order(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      totalItems: totalItems == freezed
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: totalAmount == freezed
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      amountDue: amountDue == freezed
          ? _value.amountDue
          : amountDue // ignore: cast_nullable_to_non_nullable
              as double,
      vatableSales: vatableSales == freezed
          ? _value.vatableSales
          : vatableSales // ignore: cast_nullable_to_non_nullable
              as double,
      vatAmount: vatAmount == freezed
          ? _value.vatAmount
          : vatAmount // ignore: cast_nullable_to_non_nullable
              as double,
      sellerUid: sellerUid == freezed
          ? _value.sellerUid
          : sellerUid // ignore: cast_nullable_to_non_nullable
              as String,
      buyerUid: buyerUid == freezed
          ? _value.buyerUid
          : buyerUid // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      acceptedAt: acceptedAt == freezed
          ? _value.acceptedAt
          : acceptedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acceptedBy: acceptedBy == freezed
          ? _value.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as String,
      deliveredAt: deliveredAt == freezed
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$_Order implements _Order {
  const _$_Order(
      {@JsonKey(ignore: true)
          this.uid = '',
      @JsonKey(name: 'total_items')
          this.totalItems = 0,
      @JsonKey(name: 'total_quantity')
          this.totalQuantity = 0,
      @JsonKey(name: 'total_amount')
          this.totalAmount = 0,
      @JsonKey(name: 'amount_due')
          this.amountDue = 0,
      @JsonKey(name: 'vatable_sales')
          this.vatableSales = 0,
      @JsonKey(name: 'vat_amount')
          this.vatAmount = 0,
      @JsonKey(name: 'seller_uid')
          this.sellerUid = '',
      @JsonKey(name: 'buyer_uid')
          this.buyerUid = '',
      this.status = OrderStatus.pending,
      @JsonKey(name: 'accepted_at')
      @TimestampNullableConverter()
          this.acceptedAt,
      @JsonKey(name: 'accepted_by')
          this.acceptedBy = '',
      @JsonKey(name: 'delivered_at')
      @TimestampNullableConverter()
          this.deliveredAt,
      @JsonKey(name: 'created_at')
      @TimestampNullableConverter()
          this.createdAt,
      @JsonKey(name: 'created_by')
          this.createdBy = '',
      @JsonKey(name: 'updated_at')
      @TimestampNullableConverter()
          this.updatedAt,
      @JsonKey(name: 'updated_by')
          this.updatedBy = ''});

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String uid;
  @override
  @JsonKey(name: 'total_items')
  final int totalItems;
  @override
  @JsonKey(name: 'total_quantity')
  final int totalQuantity;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'amount_due')
  final double amountDue;
  @override
  @JsonKey(name: 'vatable_sales')
  final double vatableSales;
  @override
  @JsonKey(name: 'vat_amount')
  final double vatAmount;
  @override
  @JsonKey(name: 'seller_uid')
  final String sellerUid;
  @override
  @JsonKey(name: 'buyer_uid')
  final String buyerUid;
  @override
  @JsonKey()
  final OrderStatus status;
  @override
  @JsonKey(name: 'accepted_at')
  @TimestampNullableConverter()
  final DateTime? acceptedAt;
  @override
  @JsonKey(name: 'accepted_by')
  final String acceptedBy;
  @override
  @JsonKey(name: 'delivered_at')
  @TimestampNullableConverter()
  final DateTime? deliveredAt;
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
    return 'Order(uid: $uid, totalItems: $totalItems, totalQuantity: $totalQuantity, totalAmount: $totalAmount, amountDue: $amountDue, vatableSales: $vatableSales, vatAmount: $vatAmount, sellerUid: $sellerUid, buyerUid: $buyerUid, status: $status, acceptedAt: $acceptedAt, acceptedBy: $acceptedBy, deliveredAt: $deliveredAt, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.totalItems, totalItems) &&
            const DeepCollectionEquality()
                .equals(other.totalQuantity, totalQuantity) &&
            const DeepCollectionEquality()
                .equals(other.totalAmount, totalAmount) &&
            const DeepCollectionEquality().equals(other.amountDue, amountDue) &&
            const DeepCollectionEquality()
                .equals(other.vatableSales, vatableSales) &&
            const DeepCollectionEquality().equals(other.vatAmount, vatAmount) &&
            const DeepCollectionEquality().equals(other.sellerUid, sellerUid) &&
            const DeepCollectionEquality().equals(other.buyerUid, buyerUid) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.acceptedAt, acceptedAt) &&
            const DeepCollectionEquality()
                .equals(other.acceptedBy, acceptedBy) &&
            const DeepCollectionEquality()
                .equals(other.deliveredAt, deliveredAt) &&
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
      const DeepCollectionEquality().hash(totalItems),
      const DeepCollectionEquality().hash(totalQuantity),
      const DeepCollectionEquality().hash(totalAmount),
      const DeepCollectionEquality().hash(amountDue),
      const DeepCollectionEquality().hash(vatableSales),
      const DeepCollectionEquality().hash(vatAmount),
      const DeepCollectionEquality().hash(sellerUid),
      const DeepCollectionEquality().hash(buyerUid),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(acceptedAt),
      const DeepCollectionEquality().hash(acceptedBy),
      const DeepCollectionEquality().hash(deliveredAt),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(updatedBy));

  @JsonKey(ignore: true)
  @override
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {@JsonKey(ignore: true)
          final String uid,
      @JsonKey(name: 'total_items')
          final int totalItems,
      @JsonKey(name: 'total_quantity')
          final int totalQuantity,
      @JsonKey(name: 'total_amount')
          final double totalAmount,
      @JsonKey(name: 'amount_due')
          final double amountDue,
      @JsonKey(name: 'vatable_sales')
          final double vatableSales,
      @JsonKey(name: 'vat_amount')
          final double vatAmount,
      @JsonKey(name: 'seller_uid')
          final String sellerUid,
      @JsonKey(name: 'buyer_uid')
          final String buyerUid,
      final OrderStatus status,
      @JsonKey(name: 'accepted_at')
      @TimestampNullableConverter()
          final DateTime? acceptedAt,
      @JsonKey(name: 'accepted_by')
          final String acceptedBy,
      @JsonKey(name: 'delivered_at')
      @TimestampNullableConverter()
          final DateTime? deliveredAt,
      @JsonKey(name: 'created_at')
      @TimestampNullableConverter()
          final DateTime? createdAt,
      @JsonKey(name: 'created_by')
          final String createdBy,
      @JsonKey(name: 'updated_at')
      @TimestampNullableConverter()
          final DateTime? updatedAt,
      @JsonKey(name: 'updated_by')
          final String updatedBy}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  @JsonKey(ignore: true)
  String get uid;
  @override
  @JsonKey(name: 'total_items')
  int get totalItems;
  @override
  @JsonKey(name: 'total_quantity')
  int get totalQuantity;
  @override
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @override
  @JsonKey(name: 'amount_due')
  double get amountDue;
  @override
  @JsonKey(name: 'vatable_sales')
  double get vatableSales;
  @override
  @JsonKey(name: 'vat_amount')
  double get vatAmount;
  @override
  @JsonKey(name: 'seller_uid')
  String get sellerUid;
  @override
  @JsonKey(name: 'buyer_uid')
  String get buyerUid;
  @override
  OrderStatus get status;
  @override
  @JsonKey(name: 'accepted_at')
  @TimestampNullableConverter()
  DateTime? get acceptedAt;
  @override
  @JsonKey(name: 'accepted_by')
  String get acceptedBy;
  @override
  @JsonKey(name: 'delivered_at')
  @TimestampNullableConverter()
  DateTime? get deliveredAt;
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
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
