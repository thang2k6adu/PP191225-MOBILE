import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/tracking_repository.dart';

/// UseCase for resuming a tracking session
/// Contains business logic for session resuming
class ResumeSessionUseCase {
  final TrackingRepository repository;

  ResumeSessionUseCase(this.repository);

  Future<Either<Failure, TrackingSession>> call(String sessionId) async {
    // Business logic: Validate session ID
    if (sessionId.isEmpty) {
      return const Left(
        ValidationFailure(message: 'Session ID cannot be empty'),
      );
    }

    // Call repository to resume session
    return await repository.resumeSession(sessionId);
  }
}
