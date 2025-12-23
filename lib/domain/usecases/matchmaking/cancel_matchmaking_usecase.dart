import 'package:jt291_flutter_mobile/core/utils/either.dart';
import 'package:jt291_flutter_mobile/domain/failures/failures.dart';
import 'package:jt291_flutter_mobile/domain/repositories/matchmaking_repository.dart';

/// UseCase: Cancel matchmaking
/// Business logic: Can only cancel if in waiting state
class CancelMatchmakingUseCase {
  final MatchmakingRepository repository;

  CancelMatchmakingUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return repository.cancelMatchmaking();
  }
}
