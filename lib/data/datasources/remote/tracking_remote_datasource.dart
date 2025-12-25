import 'package:pp191225/data/models/tracking/activate_task_response_dto.dart';
import 'package:pp191225/data/models/tracking/progress_response_dto.dart';
import 'package:pp191225/data/models/tracking/stop_session_response_dto.dart';
import 'package:pp191225/data/models/tracking/tracking_session_dto.dart';

/// Remote data source for tracking operations
/// Defines the contract for tracking API calls
abstract class TrackingRemoteDataSource {
  /// Activate a task and create a new tracking session
  /// POST /api/tasks/:id/activate
  Future<ActivateTaskResponseDto> activateTask(String taskId);

  /// Pause an active tracking session
  /// POST /api/tracking-sessions/:id/pause
  Future<TrackingSessionDto> pauseSession(String sessionId);

  /// Resume a paused tracking session
  /// POST /api/tracking-sessions/:id/resume
  Future<TrackingSessionDto> resumeSession(String sessionId);

  /// Stop a tracking session
  /// POST /api/tracking-sessions/:id/stop
  Future<StopSessionResponseDto> stopSession(String sessionId);

  /// Get progress and session history for a task
  /// GET /api/tracking-sessions/progress?taskId={taskId}
  Future<ProgressResponseDto> getProgress(String taskId);
}
