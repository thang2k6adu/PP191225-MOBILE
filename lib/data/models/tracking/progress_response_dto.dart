import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/data/models/tracking/tracking_session_dto.dart';
import 'package:pp191225/domain/entities/tracking/progress_response.dart';

part 'progress_response_dto.freezed.dart';
part 'progress_response_dto.g.dart';

/// ProgressResponse Data Transfer Object
/// Contains progress statistics and session history
@freezed
abstract class ProgressResponseDto with _$ProgressResponseDto {
  const ProgressResponseDto._();

  const factory ProgressResponseDto({
    required double progress, // 0-100%
    required int totalTimeSpent, // Total seconds
    required int estimateSeconds, // Estimate in seconds
    required int expEarned, // Total EXP earned
    @Default([]) List<TrackingSessionDto> sessions,
    TrackingSessionDto? currentSession, // Active/paused session if exists
  }) = _ProgressResponseDto;

  factory ProgressResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProgressResponseDtoFromJson(json);

  /// Convert DTO to Domain Entity
  ProgressResponse toEntity() {
    return ProgressResponse(
      progress: progress,
      totalTimeSpent: totalTimeSpent,
      estimateSeconds: estimateSeconds,
      expEarned: expEarned,
      sessions: sessions.map((s) => s.toEntity()).toList(),
      currentSession: currentSession?.toEntity(),
    );
  }
}
