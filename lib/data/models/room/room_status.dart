import 'package:freezed_annotation/freezed_annotation.dart';

enum RoomStatus {
  @JsonValue('WAITING')
  waiting,
  @JsonValue('ACTIVE')
  active,
  @JsonValue('CLOSED')
  closed,
}
