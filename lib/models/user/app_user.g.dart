// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.buyer,
      status: $enumDecodeNullable(_$UserStatusEnumMap, json['status']) ??
          UserStatus.pending,
      associationUid: json['associationUid'] as String? ?? '',
      createdAt: const TimestampNullableConverter()
          .fromJson(json['createdAt'] as Timestamp?),
      createdBy: json['createdBy'] as String? ?? '',
      updatedAt: const TimestampNullableConverter()
          .fromJson(json['updatedAt'] as Timestamp?),
      updatedBy: json['updatedBy'] as String? ?? '',
      approvedAt: const TimestampNullableConverter()
          .fromJson(json['approvedAt'] as Timestamp?),
      approvedBy: json['approvedBy'] as String? ?? '',
      declinedAt: const TimestampNullableConverter()
          .fromJson(json['declinedAt'] as Timestamp?),
      declinedBy: json['declinedBy'] as String? ?? '',
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'role': _$RoleEnumMap[instance.role]!,
      'status': _$UserStatusEnumMap[instance.status]!,
      'associationUid': instance.associationUid,
      'createdAt':
          const TimestampNullableConverter().toJson(instance.createdAt),
      'createdBy': instance.createdBy,
      'updatedAt':
          const TimestampNullableConverter().toJson(instance.updatedAt),
      'updatedBy': instance.updatedBy,
      'approvedAt':
          const TimestampNullableConverter().toJson(instance.approvedAt),
      'approvedBy': instance.approvedBy,
      'declinedAt':
          const TimestampNullableConverter().toJson(instance.declinedAt),
      'declinedBy': instance.declinedBy,
    };

const _$RoleEnumMap = {
  Role.sysadmin: 0,
  Role.admin: 1,
  Role.farmer: 2,
  Role.buyer: 3,
};

const _$UserStatusEnumMap = {
  UserStatus.pending: 0,
  UserStatus.approved: 1,
  UserStatus.declined: 2,
};
