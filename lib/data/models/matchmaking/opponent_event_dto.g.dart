// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opponent_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OpponentEventDto _$OpponentEventDtoFromJson(Map<String, dynamic> json) =>
    _OpponentEventDto(
      message: json['message'] as String,
      roomId: json['roomId'] as String?,
    );

Map<String, dynamic> _$OpponentEventDtoToJson(_OpponentEventDto instance) =>
    <String, dynamic>{'message': instance.message, 'roomId': instance.roomId};
