// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_call_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoCallTokenDto _$VideoCallTokenDtoFromJson(Map<String, dynamic> json) =>
    _VideoCallTokenDto(
      token: json['token'] as String,
      url: json['url'] as String,
      roomId: json['roomId'] as String,
    );

Map<String, dynamic> _$VideoCallTokenDtoToJson(_VideoCallTokenDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'url': instance.url,
      'roomId': instance.roomId,
    };
