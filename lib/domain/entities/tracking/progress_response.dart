import 'package:pp191225/domain/entities/tracking/tracking_session.dart';

/// ProgressResponse entity
/// Contains progress statistics and session history
class ProgressResponse {
  final double progress; // 0-100%
  final int totalTimeSpent; // Total seconds
  final int estimateSeconds; // Estimate in seconds
  final int expEarned; // Total EXP earned
  final List<TrackingSession> sessions;
  final TrackingSession? currentSession; // Active/paused session if exists

  const ProgressResponse({
    required this.progress,
    required this.totalTimeSpent,
    required this.estimateSeconds,
    required this.expEarned,
    this.sessions = const [],
    this.currentSession,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProgressResponse &&
        other.progress == progress &&
        other.totalTimeSpent == totalTimeSpent &&
        other.estimateSeconds == estimateSeconds &&
        other.expEarned == expEarned &&
        other.sessions.length == sessions.length &&
        other.currentSession == currentSession;
  }

  @override
  int get hashCode {
    return progress.hashCode ^
        totalTimeSpent.hashCode ^
        estimateSeconds.hashCode ^
        expEarned.hashCode ^
        sessions.length.hashCode ^
        currentSession.hashCode;
  }

  @override
  String toString() {
    return 'ProgressResponse(progress: $progress%, totalTimeSpent: $totalTimeSpent, sessions: ${sessions.length})';
  }
}
