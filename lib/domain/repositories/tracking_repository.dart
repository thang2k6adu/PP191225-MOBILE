import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tracking/activate_task_response.dart';
import 'package:pp191225/domain/entities/tracking/progress_response.dart';
import 'package:pp191225/domain/entities/tracking/stop_session_result.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';
import 'package:pp191225/domain/failures/failures.dart';

/// Repository interface for tracking operations
/// This defines the contract that the data layer must implement
abstract class TrackingRepository {
  /// Activate a task and create a new tracking session
  Future<Either<Failure, ActivateTaskResponse>> activateTask(String taskId);

  /// Pause an active tracking session
  Future<Either<Failure, TrackingSession>> pauseSession(String sessionId);

  /// Resume a paused tracking session
  Future<Either<Failure, TrackingSession>> resumeSession(String sessionId);

  /// Stop a tracking session
  Future<Either<Failure, StopSessionResult>> stopSession(String sessionId);

  /// Get progress and session history for a task
  Future<Either<Failure, ProgressResponse>> getProgress(String taskId);
}
