// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      totalItems: json['total_items'] as int? ?? 0,
      totalQuantity: json['total_quantity'] as int? ?? 0,
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0,
      amountDue: (json['amount_due'] as num?)?.toDouble() ?? 0,
      vatableSales: (json['vatable_sales'] as num?)?.toDouble() ?? 0,
      vatAmount: (json['vat_amount'] as num?)?.toDouble() ?? 0,
      sellerUid: json['seller_uid'] as String? ?? '',
      buyerUid: json['buyer_uid'] as String? ?? '',
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
          OrderStatus.pending,
      acceptedAt: const TimestampNullableConverter()
          .fromJson(json['accepted_at'] as Timestamp?),
      acceptedBy: json['accepted_by'] as String? ?? '',
      deliveredAt: const TimestampNullableConverter()
          .fromJson(json['delivered_at'] as Timestamp?),
      createdAt: const TimestampNullableConverter()
          .fromJson(json['created_at'] as Timestamp?),
      createdBy: json['created_by'] as String? ?? '',
      updatedAt: const TimestampNullableConverter()
          .fromJson(json['updated_at'] as Timestamp?),
      updatedBy: json['updated_by'] as String? ?? '',
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'total_items': instance.totalItems,
      'total_quantity': instance.totalQuantity,
      'total_amount': instance.totalAmount,
      'amount_due': instance.amountDue,
      'vatable_sales': instance.vatableSales,
      'vat_amount': instance.vatAmount,
      'seller_uid': instance.sellerUid,
      'buyer_uid': instance.buyerUid,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'accepted_at':
          const TimestampNullableConverter().toJson(instance.acceptedAt),
      'accepted_by': instance.acceptedBy,
      'delivered_at':
          const TimestampNullableConverter().toJson(instance.deliveredAt),
      'created_at':
          const TimestampNullableConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy,
      'updated_at':
          const TimestampNullableConverter().toJson(instance.updatedAt),
      'updated_by': instance.updatedBy,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 0,
  OrderStatus.accepted: 1,
  OrderStatus.delivered: 2,
};
