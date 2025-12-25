// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgressResponseDto _$ProgressResponseDtoFromJson(Map<String, dynamic> json) =>
    _ProgressResponseDto(
      progress: (json['progress'] as num).toDouble(),
      totalTimeSpent: (json['totalTimeSpent'] as num).toInt(),
      estimateSeconds: (json['estimateSeconds'] as num).toInt(),
      expEarned: (json['expEarned'] as num).toInt(),
      sessions:
          (json['sessions'] as List<dynamic>?)
              ?.map(
                (e) => TrackingSessionDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      currentSession: json['currentSession'] == null
          ? null
          : TrackingSessionDto.fromJson(
              json['currentSession'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ProgressResponseDtoToJson(
  _ProgressResponseDto instance,
) => <String, dynamic>{
  'progress': instance.progress,
  'totalTimeSpent': instance.totalTimeSpent,
  'estimateSeconds': instance.estimateSeconds,
  'expEarned': instance.expEarned,
  'sessions': instance.sessions,
  'currentSession': instance.currentSession,
};
