import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tracking/activate_task_response.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/tracking_repository.dart';

/// UseCase for activating a task
/// Contains business logic for task activation
class ActivateTaskUseCase {
  final TrackingRepository repository;

  ActivateTaskUseCase(this.repository);

  Future<Either<Failure, ActivateTaskResponse>> call(String taskId) async {
    // Business logic: Validate task ID
    if (taskId.isEmpty) {
      return const Left(ValidationFailure(message: 'Task ID cannot be empty'));
    }

    // Call repository to activate task
    final result = await repository.activateTask(taskId);

    return result.fold((failure) => Left(failure), (response) {
      // Business logic: Save session ID to local storage for offline handling
      // This would be done via a local storage service
      // For now, we'll just return the response
      return Right(response);
    });
  }
}
