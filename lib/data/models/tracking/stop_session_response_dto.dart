import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/tracking/stop_session_result.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';

part 'stop_session_response_dto.freezed.dart';
part 'stop_session_response_dto.g.dart';

@freezed
abstract class StopSessionResponseDto with _$StopSessionResponseDto {
  const StopSessionResponseDto._();

  const factory StopSessionResponseDto({
    required String id,
    required String taskId,
    required String userId,
    required DateTime startTime,
    required DateTime endTime,
    required int duration,
    required String status,
    required int expEarned,
    @Default(0.0) double previousProgress,
    @Default(0.0) double progress,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StopSessionResponseDto;

  factory StopSessionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$StopSessionResponseDtoFromJson(json);

  StopSessionResult toEntity() {
    return StopSessionResult(
      session: TrackingSession(
        id: id,
        taskId: taskId,
        userId: userId,
        startTime: startTime,
        endTime: endTime,
        duration: duration,
        status: status,
        expEarned: expEarned,
        currentDuration:
            duration, // Stopped session, current duration = duration
        createdAt: createdAt,
        updatedAt: updatedAt,
      ),
      previousProgress: previousProgress,
      progress: progress,
    );
  }
}
