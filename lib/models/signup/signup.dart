import 'package:agricrops/enums/role_enum.dart';
import 'package:agricrops/enums/user_status_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup.freezed.dart';

@freezed
abstract class SignUp with _$SignUp {
  const factory SignUp({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String email,
    @Default('') String password,
    @Default(Role.buyer) Role role,
    @Default(UserStatus.pending) UserStatus status,
    @Default('') String associationUid,
  }) = _SignUp;

  factory SignUp.create({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required Role role,
    required UserStatus status,
    String associationUid = '',
  }) {
    return SignUp(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      role: role,
      status: status,
      associationUid: associationUid,
    );
  }
}
