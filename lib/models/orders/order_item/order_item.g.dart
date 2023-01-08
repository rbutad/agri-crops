// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderItem _$$_OrderItemFromJson(Map<String, dynamic> json) => _$_OrderItem(
      cropUid: json['crop_uid'] as String? ?? '',
      cropName: json['crop_name'] as String? ?? '',
      unitOfMeasure: json['unit_of_measure'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      vatable: (json['vatable'] as num?)?.toDouble() ?? 0,
      vat: (json['vat'] as num?)?.toDouble() ?? 0,
      lineTotal: (json['line_total'] as num?)?.toDouble() ?? 0,
      cropImageUrl: json['crop_image_url'] as String? ?? '',
      status: $enumDecodeNullable(_$OrderItemStatusEnumMap, json['status']) ??
          OrderItemStatus.pending,
      createdAt: const TimestampNullableConverter()
          .fromJson(json['created_at'] as Timestamp?),
      createdBy: json['created_by'] as String? ?? '',
      updatedAt: const TimestampNullableConverter()
          .fromJson(json['updated_at'] as Timestamp?),
      updatedBy: json['updated_by'] as String? ?? '',
    );

Map<String, dynamic> _$$_OrderItemToJson(_$_OrderItem instance) =>
    <String, dynamic>{
      'crop_uid': instance.cropUid,
      'crop_name': instance.cropName,
      'unit_of_measure': instance.unitOfMeasure,
      'price': instance.price,
      'quantity': instance.quantity,
      'vatable': instance.vatable,
      'vat': instance.vat,
      'line_total': instance.lineTotal,
      'crop_image_url': instance.cropImageUrl,
      'status': _$OrderItemStatusEnumMap[instance.status]!,
      'created_at':
          const TimestampNullableConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy,
      'updated_at':
          const TimestampNullableConverter().toJson(instance.updatedAt),
      'updated_by': instance.updatedBy,
    };

const _$OrderItemStatusEnumMap = {
  OrderItemStatus.pending: 0,
  OrderItemStatus.accepted: 1,
  OrderItemStatus.delivered: 2,
  OrderItemStatus.cancelled: 3,
};
