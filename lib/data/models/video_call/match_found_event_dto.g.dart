// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_found_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchFoundEventDto _$MatchFoundEventDtoFromJson(Map<String, dynamic> json) =>
    _MatchFoundEventDto(
      roomId: json['roomId'] as String,
      livekitToken: json['livekitToken'] as String,
      livekitUrl: json['livekitUrl'] as String,
      opponentId: json['opponentId'] as String,
      opponentName: json['opponentName'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MatchFoundEventDtoToJson(_MatchFoundEventDto instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'livekitToken': instance.livekitToken,
      'livekitUrl': instance.livekitUrl,
      'opponentId': instance.opponentId,
      'opponentName': instance.opponentName,
      'message': instance.message,
    };
