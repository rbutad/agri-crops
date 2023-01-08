// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  @JsonKey(ignore: true)
  String get uid => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  UserStatus get status => throw _privateConstructorUsedError;
  String get associationUid => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String get associationName => throw _privateConstructorUsedError;
  @TimestampNullableConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  @TimestampNullableConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String get updatedBy => throw _privateConstructorUsedError;
  @TimestampNullableConverter()
  DateTime? get approvedAt => throw _privateConstructorUsedError;
  String get approvedBy => throw _privateConstructorUsedError;
  @TimestampNullableConverter()
  DateTime? get declinedAt => throw _privateConstructorUsedError;
  String get declinedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String uid,
      String firstName,
      String lastName,
      String email,
      Role role,
      UserStatus status,
      String associationUid,
      @JsonKey(ignore: true) String associationName,
      @TimestampNullableConverter() DateTime? createdAt,
      String createdBy,
      @TimestampNullableConverter() DateTime? updatedAt,
      String updatedBy,
      @TimestampNullableConverter() DateTime? approvedAt,
      String approvedBy,
      @TimestampNullableConverter() DateTime? declinedAt,
      String declinedBy});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  final AppUser _value;
  // ignore: unused_field
  final $Res Function(AppUser) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? associationUid = freezed,
    Object? associationName = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
    Object? approvedAt = freezed,
    Object? approvedBy = freezed,
    Object? declinedAt = freezed,
    Object? declinedBy = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      associationUid: associationUid == freezed
          ? _value.associationUid
          : associationUid // ignore: cast_nullable_to_non_nullable
              as String,
      associationName: associationName == freezed
          ? _value.associationName
          : associationName // ignore: cast_nullable_to_non_nullable
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
      approvedAt: approvedAt == freezed
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedBy: approvedBy == freezed
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String,
      declinedAt: declinedAt == freezed
          ? _value.declinedAt
          : declinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      declinedBy: declinedBy == freezed
          ? _value.declinedBy
          : declinedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String uid,
      String firstName,
      String lastName,
      String email,
      Role role,
      UserStatus status,
      String associationUid,
      @JsonKey(ignore: true) String associationName,
      @TimestampNullableConverter() DateTime? createdAt,
      String createdBy,
      @TimestampNullableConverter() DateTime? updatedAt,
      String updatedBy,
      @TimestampNullableConverter() DateTime? approvedAt,
      String approvedBy,
      @TimestampNullableConverter() DateTime? declinedAt,
      String declinedBy});
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res> extends _$AppUserCopyWithImpl<$Res>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, (v) => _then(v as _$_AppUser));

  @override
  _$_AppUser get _value => super._value as _$_AppUser;

  @override
  $Res call({
    Object? uid = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? associationUid = freezed,
    Object? associationName = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
    Object? approvedAt = freezed,
    Object? approvedBy = freezed,
    Object? declinedAt = freezed,
    Object? declinedBy = freezed,
  }) {
    return _then(_$_AppUser(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
      associationUid: associationUid == freezed
          ? _value.associationUid
          : associationUid // ignore: cast_nullable_to_non_nullable
              as String,
      associationName: associationName == freezed
          ? _value.associationName
          : associationName // ignore: cast_nullable_to_non_nullable
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
      approvedAt: approvedAt == freezed
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvedBy: approvedBy == freezed
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String,
      declinedAt: declinedAt == freezed
          ? _value.declinedAt
          : declinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      declinedBy: declinedBy == freezed
          ? _value.declinedBy
          : declinedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser implements _AppUser {
  const _$_AppUser(
      {@JsonKey(ignore: true) this.uid = '',
      this.firstName = '',
      this.lastName = '',
      this.email = '',
      this.role = Role.buyer,
      this.status = UserStatus.pending,
      this.associationUid = '',
      @JsonKey(ignore: true) this.associationName = '',
      @TimestampNullableConverter() this.createdAt,
      this.createdBy = '',
      @TimestampNullableConverter() this.updatedAt,
      this.updatedBy = '',
      @TimestampNullableConverter() this.approvedAt,
      this.approvedBy = '',
      @TimestampNullableConverter() this.declinedAt,
      this.declinedBy = ''});

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String uid;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final Role role;
  @override
  @JsonKey()
  final UserStatus status;
  @override
  @JsonKey()
  final String associationUid;
  @override
  @JsonKey(ignore: true)
  final String associationName;
  @override
  @TimestampNullableConverter()
  final DateTime? createdAt;
  @override
  @JsonKey()
  final String createdBy;
  @override
  @TimestampNullableConverter()
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final String updatedBy;
  @override
  @TimestampNullableConverter()
  final DateTime? approvedAt;
  @override
  @JsonKey()
  final String approvedBy;
  @override
  @TimestampNullableConverter()
  final DateTime? declinedAt;
  @override
  @JsonKey()
  final String declinedBy;

  @override
  String toString() {
    return 'AppUser(uid: $uid, firstName: $firstName, lastName: $lastName, email: $email, role: $role, status: $status, associationUid: $associationUid, associationName: $associationName, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy, approvedAt: $approvedAt, approvedBy: $approvedBy, declinedAt: $declinedAt, declinedBy: $declinedBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.associationUid, associationUid) &&
            const DeepCollectionEquality()
                .equals(other.associationName, associationName) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.createdBy, createdBy) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.updatedBy, updatedBy) &&
            const DeepCollectionEquality()
                .equals(other.approvedAt, approvedAt) &&
            const DeepCollectionEquality()
                .equals(other.approvedBy, approvedBy) &&
            const DeepCollectionEquality()
                .equals(other.declinedAt, declinedAt) &&
            const DeepCollectionEquality()
                .equals(other.declinedBy, declinedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(associationUid),
      const DeepCollectionEquality().hash(associationName),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(createdBy),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(updatedBy),
      const DeepCollectionEquality().hash(approvedAt),
      const DeepCollectionEquality().hash(approvedBy),
      const DeepCollectionEquality().hash(declinedAt),
      const DeepCollectionEquality().hash(declinedBy));

  @JsonKey(ignore: true)
  @override
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {@JsonKey(ignore: true) final String uid,
      final String firstName,
      final String lastName,
      final String email,
      final Role role,
      final UserStatus status,
      final String associationUid,
      @JsonKey(ignore: true) final String associationName,
      @TimestampNullableConverter() final DateTime? createdAt,
      final String createdBy,
      @TimestampNullableConverter() final DateTime? updatedAt,
      final String updatedBy,
      @TimestampNullableConverter() final DateTime? approvedAt,
      final String approvedBy,
      @TimestampNullableConverter() final DateTime? declinedAt,
      final String declinedBy}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  @JsonKey(ignore: true)
  String get uid;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  Role get role;
  @override
  UserStatus get status;
  @override
  String get associationUid;
  @override
  @JsonKey(ignore: true)
  String get associationName;
  @override
  @TimestampNullableConverter()
  DateTime? get createdAt;
  @override
  String get createdBy;
  @override
  @TimestampNullableConverter()
  DateTime? get updatedAt;
  @override
  String get updatedBy;
  @override
  @TimestampNullableConverter()
  DateTime? get approvedAt;
  @override
  String get approvedBy;
  @override
  @TimestampNullableConverter()
  DateTime? get declinedAt;
  @override
  String get declinedBy;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
