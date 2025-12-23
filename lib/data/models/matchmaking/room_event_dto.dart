import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_event_dto.freezed.dart';
part 'room_event_dto.g.dart';

@freezed
abstract class RoomEventDto with _$RoomEventDto {
  const factory RoomEventDto({
    String? roomId,
    required String message,
  }) = _RoomEventDto;

  factory RoomEventDto.fromJson(Map<String, dynamic> json) =>
      _$RoomEventDtoFromJson(json);
}
