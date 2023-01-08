import 'package:freezed_annotation/freezed_annotation.dart';

enum Role {
  @JsonValue(0)
  sysadmin,

  @JsonValue(1)
  admin,

  @JsonValue(2)
  farmer,

  @JsonValue(3)
  buyer,
}
