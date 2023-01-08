import 'package:freezed_annotation/freezed_annotation.dart';

enum UserStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  approved,

  @JsonValue(2)
  declined
}
