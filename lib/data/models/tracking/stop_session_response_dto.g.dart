// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_session_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StopSessionResponseDto _$StopSessionResponseDtoFromJson(
  Map<String, dynamic> json,
) => _StopSessionResponseDto(
  id: json['id'] as String,
  taskId: json['taskId'] as String,
  userId: json['userId'] as String,
  startTime: DateTime.parse(json['startTime'] as String),
  endTime: DateTime.parse(json['endTime'] as String),
  duration: (json['duration'] as num).toInt(),
  status: json['status'] as String,
  expEarned: (json['expEarned'] as num).toInt(),
  previousProgress: (json['previousProgress'] as num?)?.toDouble() ?? 0.0,
  progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$StopSessionResponseDtoToJson(
  _StopSessionResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'taskId': instance.taskId,
  'userId': instance.userId,
  'startTime': instance.startTime.toIso8601String(),
  'endTime': instance.endTime.toIso8601String(),
  'duration': instance.duration,
  'status': instance.status,
  'expEarned': instance.expEarned,
  'previousProgress': instance.previousProgress,
  'progress': instance.progress,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
