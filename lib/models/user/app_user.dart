import 'package:agricrops/enums/role_enum.dart';
import 'package:agricrops/enums/user_status_enum.dart';
import 'package:agricrops/helpers/converters/timestamp_nullable_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    @JsonKey(ignore: true) @Default('') String uid,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String email,
    @Default(Role.buyer) Role role,
    @Default(UserStatus.pending) UserStatus status,
    @Default('') String associationUid,
    @JsonKey(ignore: true) @Default('') String associationName,
    @TimestampNullableConverter() DateTime? createdAt,
    @Default('') String createdBy,
    @TimestampNullableConverter() DateTime? updatedAt,
    @Default('') String updatedBy,
    @TimestampNullableConverter() DateTime? approvedAt,
    @Default('') String approvedBy,
    @TimestampNullableConverter() DateTime? declinedAt,
    @Default('') String declinedBy,
  }) = _AppUser;

  factory AppUser.create({
    required String firstName,
    required String lastName,
    required String email,
    required Role role,
    required UserStatus status,
    String associationUid = '',
    required String createdBy,
  }) {
    return AppUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      role: role,
      associationUid: associationUid,
      status: status,
      createdBy: createdBy,
      createdAt: DateTime.now(),
    );
  }

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  factory AppUser.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      _$AppUserFromJson(document.data()!).copyWith(uid: document.id);
}
