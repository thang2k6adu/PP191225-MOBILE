import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tasks/task.dart';
import 'package:pp191225/domain/failures/failures.dart';

/// Repository interface for task operations
/// This defines the contract that the data layer must implement
abstract class TaskRepository {
  /// Get all tasks for the current user
  Future<Either<Failure, List<Task>>> getTasks();

  /// Create a new task
  Future<Either<Failure, Task>> createTask({
    required String name,
    required DateTime deadline,
    required double estimateHours,
  });
}
