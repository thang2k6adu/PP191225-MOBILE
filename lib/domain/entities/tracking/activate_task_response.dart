import 'package:pp191225/domain/entities/tasks/task.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';

/// ActivateTaskResponse entity
/// Contains both task and session after activation
class ActivateTaskResponse {
  final Task task;
  final TrackingSession session;

  const ActivateTaskResponse({required this.task, required this.session});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ActivateTaskResponse &&
        other.task == task &&
        other.session == session;
  }

  @override
  int get hashCode => task.hashCode ^ session.hashCode;

  @override
  String toString() {
    return 'ActivateTaskResponse(task: ${task.name}, session: ${session.id})';
  }
}
