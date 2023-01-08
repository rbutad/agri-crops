import 'package:freezed_annotation/freezed_annotation.dart';

enum OrderItemStatus {
  @JsonValue(0)
  pending,

  @JsonValue(1)
  accepted,

  @JsonValue(2)
  delivered,

  @JsonValue(3)
  cancelled
}
