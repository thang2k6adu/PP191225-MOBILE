/// TrackingSession entity - Pure Dart class
/// Represents a tracking session for a task
class TrackingSession {
  final String id;
  final String taskId;
  final String userId;
  final DateTime startTime;
  final DateTime? endTime;
  final int duration; // Seconds
  final String status; // 'active', 'paused', 'stopped'
  final int expEarned; // Seconds
  final int? currentDuration; // For paused sessions - current elapsed time
  final DateTime createdAt;
  final DateTime updatedAt;

  const TrackingSession({
    required this.id,
    required this.taskId,
    required this.userId,
    required this.startTime,
    this.endTime,
    this.duration = 0,
    required this.status,
    this.expEarned = 0,
    this.currentDuration,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrackingSession &&
        other.id == id &&
        other.taskId == taskId &&
        other.userId == userId &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.duration == duration &&
        other.status == status &&
        other.expEarned == expEarned &&
        other.currentDuration == currentDuration &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        taskId.hashCode ^
        userId.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        duration.hashCode ^
        status.hashCode ^
        expEarned.hashCode ^
        currentDuration.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  TrackingSession copyWith({
    String? id,
    String? taskId,
    String? userId,
    DateTime? startTime,
    DateTime? endTime,
    int? duration,
    String? status,
    int? expEarned,
    int? currentDuration,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TrackingSession(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      userId: userId ?? this.userId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      duration: duration ?? this.duration,
      status: status ?? this.status,
      expEarned: expEarned ?? this.expEarned,
      currentDuration: currentDuration ?? this.currentDuration,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'TrackingSession(id: $id, taskId: $taskId, status: $status, duration: $duration, expEarned: $expEarned)';
  }
}
