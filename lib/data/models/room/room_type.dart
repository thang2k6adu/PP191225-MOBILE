import 'package:freezed_annotation/freezed_annotation.dart';

enum RoomType {
  @JsonValue('PUBLIC')
  public,
  @JsonValue('PRIVATE')
  private,
}
