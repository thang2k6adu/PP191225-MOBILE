// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomEventDto _$RoomEventDtoFromJson(Map<String, dynamic> json) =>
    _RoomEventDto(
      roomId: json['roomId'] as String?,
      message: json['message'] as String,
    );

Map<String, dynamic> _$RoomEventDtoToJson(_RoomEventDto instance) =>
    <String, dynamic>{'roomId': instance.roomId, 'message': instance.message};
