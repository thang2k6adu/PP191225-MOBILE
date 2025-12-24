import 'package:pp191225/data/models/tasks/task_dto.dart';

/// Remote data source for task operations
abstract class TaskRemoteDataSource {
  /// Get all tasks for the current user
  Future<List<TaskDto>> getTasks();

  /// Create a new task
  Future<TaskDto> createTask({
    required String name,
    required DateTime deadline,
    required double estimateHours,
  });
}
