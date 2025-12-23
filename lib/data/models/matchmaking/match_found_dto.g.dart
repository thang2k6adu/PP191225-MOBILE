// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_found_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchFoundDto _$MatchFoundDtoFromJson(Map<String, dynamic> json) =>
    _MatchFoundDto(
      roomId: json['roomId'] as String,
      opponentId: json['opponentId'] as String,
      opponentName: json['opponentName'] as String?,
      message: json['message'] as String,
    );

Map<String, dynamic> _$MatchFoundDtoToJson(_MatchFoundDto instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'opponentId': instance.opponentId,
      'opponentName': instance.opponentName,
      'message': instance.message,
    };
