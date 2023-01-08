// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CropPrice _$$_CropPriceFromJson(Map<String, dynamic> json) => _$_CropPrice(
      cropUid: json['cropUid'] as String? ?? '',
      uomUid: json['uomUid'] as String? ?? '',
      uom: json['uom'] as String? ?? '',
      availableQty: json['availableQty'] as int? ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      isDefaultPrice: json['is_default_price'] as bool? ?? false,
      createdAt: const TimestampNullableConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      createdBy: json['createdBy'] as String? ?? '',
      updatedAt: const TimestampNullableConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
      updatedBy: json['updatedBy'] as String? ?? '',
    );

Map<String, dynamic> _$$_CropPriceToJson(_$_CropPrice instance) =>
    <String, dynamic>{
      'cropUid': instance.cropUid,
      'uomUid': instance.uomUid,
      'uom': instance.uom,
      'availableQty': instance.availableQty,
      'price': instance.price,
      'is_default_price': instance.isDefaultPrice,
      'createdAt':
          const TimestampNullableConverter().toJson(instance.createdAt),
      'createdBy': instance.createdBy,
      'updatedAt':
          const TimestampNullableConverter().toJson(instance.updatedAt),
      'updatedBy': instance.updatedBy,
    };
