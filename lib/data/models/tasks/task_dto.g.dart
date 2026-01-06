// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => _TaskDto(
  id: json['id'] as String,
  name: json['name'] as String,
  estimateHours: (json['estimateHours'] as num).toDouble(),
  deadline: DateTime.parse(json['deadline'] as String),
  status: json['status'] as String,
  isActive: json['isActive'] as bool? ?? false,
  progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
  totalTimeSpent: (json['totalTimeSpent'] as num?)?.toInt() ?? 0,
  userId: json['userId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TaskDtoToJson(_TaskDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'estimateHours': instance.estimateHours,
  'deadline': instance.deadline.toIso8601String(),
  'status': instance.status,
  'isActive': instance.isActive,
  'progress': instance.progress,
  'totalTimeSpent': instance.totalTimeSpent,
  'userId': instance.userId,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
