import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tracking/stop_session_result.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/tracking_repository.dart';

/// UseCase for stopping a tracking session
/// Contains business logic for session stopping
class StopSessionUseCase {
  final TrackingRepository repository;

  StopSessionUseCase(this.repository);

  Future<Either<Failure, StopSessionResult>> call(String sessionId) async {
    // Business logic: Validate session ID
    if (sessionId.isEmpty) {
      return const Left(
        ValidationFailure(message: 'Session ID cannot be empty'),
      );
    }

    // Call repository to stop session
    final result = await repository.stopSession(sessionId);

    return result.fold((failure) => Left(failure), (stopResult) {
      // Business logic: Clear session from local storage
      // This would be done via a local storage service
      // For now, we'll just return the result
      return Right(stopResult);
    });
  }
}
