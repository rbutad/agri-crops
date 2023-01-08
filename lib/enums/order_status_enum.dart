import 'package:freezed_annotation/freezed_annotation.dart';

enum OrderStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  accepted,

  @JsonValue(2)
  delivered
}
