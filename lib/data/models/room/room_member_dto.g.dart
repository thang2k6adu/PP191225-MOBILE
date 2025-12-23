// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomMemberDto _$RoomMemberDtoFromJson(Map<String, dynamic> json) =>
    _RoomMemberDto(
      userId: json['userId'] as String,
      status: $enumDecode(_$RoomMemberStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$RoomMemberDtoToJson(_RoomMemberDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'status': _$RoomMemberStatusEnumMap[instance.status]!,
    };

const _$RoomMemberStatusEnumMap = {
  RoomMemberStatus.joined: 'JOINED',
  RoomMemberStatus.ready: 'READY',
  RoomMemberStatus.left: 'LEFT',
};
