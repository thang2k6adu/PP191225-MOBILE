// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackingSessionDto _$TrackingSessionDtoFromJson(Map<String, dynamic> json) =>
    _TrackingSessionDto(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      userId: json['userId'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      status: json['status'] as String,
      expEarned: (json['expEarned'] as num?)?.toInt() ?? 0,
      currentDuration: (json['currentDuration'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TrackingSessionDtoToJson(_TrackingSessionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'userId': instance.userId,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'duration': instance.duration,
      'status': instance.status,
      'expEarned': instance.expEarned,
      'currentDuration': instance.currentDuration,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
