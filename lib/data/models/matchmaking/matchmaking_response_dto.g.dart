// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchmaking_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchmakingResponseDto _$MatchmakingResponseDtoFromJson(
  Map<String, dynamic> json,
) => _MatchmakingResponseDto(
  status: json['status'] as String,
  message: json['message'] as String,
  matchData: json['matchData'] == null
      ? null
      : MatchDataDto.fromJson(json['matchData'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MatchmakingResponseDtoToJson(
  _MatchmakingResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'matchData': instance.matchData,
};

_MatchDataDto _$MatchDataDtoFromJson(Map<String, dynamic> json) =>
    _MatchDataDto(
      roomId: json['roomId'] as String,
      opponentId: json['opponentId'] as String,
      opponentName: json['opponentName'] as String?,
    );

Map<String, dynamic> _$MatchDataDtoToJson(_MatchDataDto instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'opponentId': instance.opponentId,
      'opponentName': instance.opponentName,
    };
