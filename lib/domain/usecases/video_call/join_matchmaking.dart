import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/video_call_repository.dart';

/// Join Matchmaking UseCase
/// Business Logic: Validates user name (optional) before joining
class JoinMatchmakingUseCase {
  final VideoCallRepository repository;

  JoinMatchmakingUseCase(this.repository);

  Either<Failure, void> call({String? userName}) {
    // Validation: If userName is provided, it must not be empty
    if (userName != null && userName.trim().isEmpty) {
      return const Left(
        ValidationFailure(message: 'User name cannot be empty'),
      );
    }

    // Validation: userName length should be reasonable (optional business rule)
    if (userName != null && userName.length > 50) {
      return const Left(
        ValidationFailure(message: 'User name is too long (max 50 characters)'),
      );
    }

    return repository.joinMatchmaking(userName: userName);
  }
}
