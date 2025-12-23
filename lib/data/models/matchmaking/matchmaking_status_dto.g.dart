// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchmaking_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchmakingStatusDto _$MatchmakingStatusDtoFromJson(
  Map<String, dynamic> json,
) => _MatchmakingStatusDto(
  state: json['state'] as String,
  room: json['room'] == null
      ? null
      : RoomInfoDto.fromJson(json['room'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatchmakingStatusDtoToJson(
  _MatchmakingStatusDto instance,
) => <String, dynamic>{'state': instance.state, 'room': instance.room};

_RoomInfoDto _$RoomInfoDtoFromJson(Map<String, dynamic> json) => _RoomInfoDto(
  roomId: json['roomId'] as String,
  players: (json['players'] as List<dynamic>).map((e) => e as String).toList(),
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$RoomInfoDtoToJson(_RoomInfoDto instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'players': instance.players,
      'createdAt': instance.createdAt,
    };
