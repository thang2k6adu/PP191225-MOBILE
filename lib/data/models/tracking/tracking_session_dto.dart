import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';

part 'tracking_session_dto.freezed.dart';
part 'tracking_session_dto.g.dart';

/// TrackingSession Data Transfer Object
/// Used for JSON serialization/deserialization
@freezed
abstract class TrackingSessionDto with _$TrackingSessionDto {
  const TrackingSessionDto._();

  const factory TrackingSessionDto({
    required String id,
    required String taskId,
    required String userId,
    required DateTime startTime,
    DateTime? endTime,
    @Default(0) int duration,
    required String status, // 'active', 'paused', 'stopped'
    @Default(0) int expEarned,
    int? currentDuration, // For paused sessions - current elapsed time
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TrackingSessionDto;

  factory TrackingSessionDto.fromJson(Map<String, dynamic> json) =>
      _$TrackingSessionDtoFromJson(json);

  /// Convert DTO to Domain Entity
  TrackingSession toEntity() {
    return TrackingSession(
      id: id,
      taskId: taskId,
      userId: userId,
      startTime: startTime,
      endTime: endTime,
      duration: duration,
      status: status,
      expEarned: expEarned,
      currentDuration: currentDuration,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// Extension to convert Domain Entity to DTO
extension TrackingSessionToDto on TrackingSession {
  TrackingSessionDto toDto() {
    return TrackingSessionDto(
      id: id,
      taskId: taskId,
      userId: userId,
      startTime: startTime,
      endTime: endTime,
      duration: duration,
      status: status,
      expEarned: expEarned,
      currentDuration: currentDuration,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
