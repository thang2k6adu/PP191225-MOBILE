import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tracking/progress_response.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/tracking_repository.dart';

/// UseCase for getting task progress
/// Contains business logic for progress retrieval
class GetProgressUseCase {
  final TrackingRepository repository;

  GetProgressUseCase(this.repository);

  Future<Either<Failure, ProgressResponse>> call(String taskId) async {
    // Business logic: Validate task ID
    if (taskId.isEmpty) {
      return const Left(ValidationFailure(message: 'Task ID cannot be empty'));
    }

    // Call repository to get progress
    return await repository.getProgress(taskId);
  }
}
