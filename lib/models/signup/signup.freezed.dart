// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUp {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  UserStatus get status => throw _privateConstructorUsedError;
  String get associationUid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpCopyWith<SignUp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpCopyWith<$Res> {
  factory $SignUpCopyWith(SignUp value, $Res Function(SignUp) then) =
      _$SignUpCopyWithImpl<$Res>;
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      Role role,
      UserStatus status,
      String associationUid});
}

/// @nodoc
class _$SignUpCopyWithImpl<$Res> implements $SignUpCopyWith<$Res> {
  _$SignUpCopyWithImpl(this._value, this._then);

  final SignUp _value;
  // ignore: unused_field
  final $Res Function(SignUp) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? associationUid = freezed,
  }) {
    return _then(_value.copyWith(
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
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
abstract class _$$_SignUpCopyWith<$Res> implements $SignUpCopyWith<$Res> {
  factory _$$_SignUpCopyWith(_$_SignUp value, $Res Function(_$_SignUp) then) =
      __$$_SignUpCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      Role role,
      UserStatus status,
      String associationUid});
}

/// @nodoc
class __$$_SignUpCopyWithImpl<$Res> extends _$SignUpCopyWithImpl<$Res>
    implements _$$_SignUpCopyWith<$Res> {
  __$$_SignUpCopyWithImpl(_$_SignUp _value, $Res Function(_$_SignUp) _then)
      : super(_value, (v) => _then(v as _$_SignUp));

  @override
  _$_SignUp get _value => super._value as _$_SignUp;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? associationUid = freezed,
  }) {
    return _then(_$_SignUp(
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
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

class _$_SignUp implements _SignUp {
  const _$_SignUp(
      {this.firstName = '',
      this.lastName = '',
      this.email = '',
      this.password = '',
      this.role = Role.buyer,
      this.status = UserStatus.pending,
      this.associationUid = ''});

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
  final String password;
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
  String toString() {
    return 'SignUp(firstName: $firstName, lastName: $lastName, email: $email, password: $password, role: $role, status: $status, associationUid: $associationUid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUp &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.associationUid, associationUid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(associationUid));

  @JsonKey(ignore: true)
  @override
  _$$_SignUpCopyWith<_$_SignUp> get copyWith =>
      __$$_SignUpCopyWithImpl<_$_SignUp>(this, _$identity);
}

abstract class _SignUp implements SignUp {
  const factory _SignUp(
      {final String firstName,
      final String lastName,
      final String email,
      final String password,
      final Role role,
      final UserStatus status,
      final String associationUid}) = _$_SignUp;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get password;
  @override
  Role get role;
  @override
  UserStatus get status;
  @override
  String get associationUid;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpCopyWith<_$_SignUp> get copyWith =>
      throw _privateConstructorUsedError;
}
