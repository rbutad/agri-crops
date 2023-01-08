// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$$_CartFromJson(Map<String, dynamic> json) => _$_Cart(
      cropUid: json['crop_uid'] as String? ?? '',
      cropName: json['crop_name'] as String? ?? '',
      unitOfMeasure: json['unit_of_measure'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0,
      cropImageUrl: json['crop_image_url'] as String? ?? '',
      cropBy: json['crop_by'] as String? ?? '',
      createdAt: const TimestampNullableConverter()
          .fromJson(json['created_at'] as Timestamp?),
      createdBy: json['created_by'] as String? ?? '',
      updatedAt: const TimestampNullableConverter()
          .fromJson(json['updated_at'] as Timestamp?),
      updatedBy: json['updated_by'] as String? ?? '',
    );

Map<String, dynamic> _$$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'crop_uid': instance.cropUid,
      'crop_name': instance.cropName,
      'unit_of_measure': instance.unitOfMeasure,
      'price': instance.price,
      'quantity': instance.quantity,
      'total_amount': instance.totalAmount,
      'crop_image_url': instance.cropImageUrl,
      'crop_by': instance.cropBy,
      'created_at':
          const TimestampNullableConverter().toJson(instance.createdAt),
      'created_by': instance.createdBy,
      'updated_at':
          const TimestampNullableConverter().toJson(instance.updatedAt),
      'updated_by': instance.updatedBy,
    };
