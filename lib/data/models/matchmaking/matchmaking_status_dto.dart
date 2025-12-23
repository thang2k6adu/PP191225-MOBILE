import 'package:freezed_annotation/freezed_annotation.dart';

part 'matchmaking_status_dto.freezed.dart';
part 'matchmaking_status_dto.g.dart';

@freezed
abstract class MatchmakingStatusDto with _$MatchmakingStatusDto {
  const factory MatchmakingStatusDto({
    required String state, // "IDLE", "WAITING", "IN_ROOM"
    RoomInfoDto? room,
  }) = _MatchmakingStatusDto;

  factory MatchmakingStatusDto.fromJson(Map<String, dynamic> json) =>
      _$MatchmakingStatusDtoFromJson(json);
}

@freezed
abstract class RoomInfoDto with _$RoomInfoDto {
  const factory RoomInfoDto({
    required String roomId,
    required List<String> players,
    required String createdAt,
  }) = _RoomInfoDto;

  factory RoomInfoDto.fromJson(Map<String, dynamic> json) =>
      _$RoomInfoDtoFromJson(json);
}
