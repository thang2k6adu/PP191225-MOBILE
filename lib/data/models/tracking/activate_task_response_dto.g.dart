// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activate_task_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivateTaskResponseDto _$ActivateTaskResponseDtoFromJson(
  Map<String, dynamic> json,
) => _ActivateTaskResponseDto(
  task: TaskDto.fromJson(json['task'] as Map<String, dynamic>),
  session: TrackingSessionDto.fromJson(json['session'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivateTaskResponseDtoToJson(
  _ActivateTaskResponseDto instance,
) => <String, dynamic>{'task': instance.task, 'session': instance.session};
