// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchmaking_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchmakingResponseDto _$MatchmakingResponseDtoFromJson(
  Map<String, dynamic> json,
) => _MatchmakingResponseDto(
  room: RoomDto.fromJson(json['room'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatchmakingResponseDtoToJson(
  _MatchmakingResponseDto instance,
) => <String, dynamic>{'room': instance.room};
