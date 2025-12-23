// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomDto _$RoomDtoFromJson(Map<String, dynamic> json) => _RoomDto(
  id: json['id'] as String,
  type: $enumDecode(_$RoomTypeEnumMap, json['type']),
  status: $enumDecode(_$RoomStatusEnumMap, json['status']),
  maxMembers: (json['maxMembers'] as num).toInt(),
  members:
      (json['members'] as List<dynamic>?)
          ?.map((e) => RoomMemberDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$RoomDtoToJson(_RoomDto instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$RoomTypeEnumMap[instance.type]!,
  'status': _$RoomStatusEnumMap[instance.status]!,
  'maxMembers': instance.maxMembers,
  'members': instance.members,
};

const _$RoomTypeEnumMap = {
  RoomType.public: 'PUBLIC',
  RoomType.private: 'PRIVATE',
};

const _$RoomStatusEnumMap = {
  RoomStatus.waiting: 'WAITING',
  RoomStatus.active: 'ACTIVE',
  RoomStatus.closed: 'CLOSED',
};
