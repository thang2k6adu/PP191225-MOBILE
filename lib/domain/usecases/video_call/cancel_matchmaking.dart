import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/video_call_repository.dart';

/// Cancel Matchmaking UseCase
/// Business Logic: Simple cancellation, no validation needed
class CancelMatchmakingUseCase {
  final VideoCallRepository repository;

  CancelMatchmakingUseCase(this.repository);

  Either<Failure, void> call() {
    return repository.cancelMatchmaking();
  }
}
