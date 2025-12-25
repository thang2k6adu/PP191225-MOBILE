import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/tasks/task.dart';
import 'package:pp191225/domain/entities/tracking/progress_response.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';

part 'tracking_state.freezed.dart';

/// State for tracking feature
@freezed
abstract class TrackingState with _$TrackingState {
  const factory TrackingState({
    TrackingSession? currentSession,
    Task? activeTask,
    @Default(0) int currentTime, // Current elapsed time in seconds
    @Default(false) bool isLoading,
    String? error,
    ProgressResponse? progressData,
  }) = _TrackingState;
}
