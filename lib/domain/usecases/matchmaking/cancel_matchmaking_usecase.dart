import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/matchmaking_repository.dart';

/// UseCase: Cancel matchmaking
/// Business logic: Can only cancel if in waiting state
class CancelMatchmakingUseCase {
  final MatchmakingRepository repository;

  CancelMatchmakingUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return repository.cancelMatchmaking();
  }
}
