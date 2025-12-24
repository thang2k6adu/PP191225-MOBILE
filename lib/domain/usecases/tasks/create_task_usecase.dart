import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tasks/task.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/task_repository.dart';

/// UseCase for creating a new task
/// Contains validation logic and business rules
class CreateTaskUseCase {
  final TaskRepository repository;

  CreateTaskUseCase(this.repository);

  Future<Either<Failure, Task>> call({
    required String name,
    required DateTime deadline,
    required double estimateHours,
  }) async {
    // Validation: Task name must not be empty
    if (name.trim().isEmpty) {
      return const Left(
        ValidationFailure(message: 'Task name cannot be empty'),
      );
    }

    // Validation: Deadline must be in the future
    if (deadline.isBefore(DateTime.now())) {
      return const Left(
        ValidationFailure(message: 'Deadline must be in the future'),
      );
    }

    // Validation: Estimate hours must be positive
    if (estimateHours <= 0) {
      return const Left(
        ValidationFailure(message: 'Estimate hours must be greater than 0'),
      );
    }

    return repository.createTask(
      name: name,
      deadline: deadline,
      estimateHours: estimateHours,
    );
  }
}
