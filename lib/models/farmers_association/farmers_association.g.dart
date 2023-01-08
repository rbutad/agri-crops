// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmers_association.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FarmersAssociation _$$_FarmersAssociationFromJson(
        Map<String, dynamic> json) =>
    _$_FarmersAssociation(
      name: json['name'] as String? ?? '',
      nameLowercase: json['name_lowercase'] as String? ?? '',
      address: json['address'] as String? ?? '',
      contactPerson: json['contactPerson'] as String? ?? '',
      contactNumber: json['contactNumber'] as String? ?? '',
      createdAt: const TimestampNullableConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      createdBy: json['createdBy'] as String? ?? '',
      updatedAt: const TimestampNullableConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
      updatedBy: json['updatedBy'] as String? ?? '',
    );

Map<String, dynamic> _$$_FarmersAssociationToJson(
        _$_FarmersAssociation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'name_lowercase': instance.nameLowercase,
      'address': instance.address,
      'contactPerson': instance.contactPerson,
      'contactNumber': instance.contactNumber,
      'createdAt':
          const TimestampNullableConverter().toJson(instance.createdAt),
      'createdBy': instance.createdBy,
      'updatedAt':
          const TimestampNullableConverter().toJson(instance.updatedAt),
      'updatedBy': instance.updatedBy,
    };
