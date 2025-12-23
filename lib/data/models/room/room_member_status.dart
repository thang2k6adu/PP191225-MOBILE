import 'package:freezed_annotation/freezed_annotation.dart';

enum RoomMemberStatus {
  @JsonValue('JOINED')
  joined,
  @JsonValue('READY')
  ready,
  @JsonValue('LEFT')
  left,
}
