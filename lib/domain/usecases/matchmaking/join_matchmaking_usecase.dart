import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/matchmaking/matchmaking_response.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/matchmaking_repository.dart';

/// UseCase: Join matchmaking queue
/// Business logic: Must be connected to WebSocket first
class JoinMatchmakingUseCase {
  final MatchmakingRepository repository;

  JoinMatchmakingUseCase(this.repository);

  Future<Either<Failure, MatchmakingResponse>> call() async {
    // Business rule: Must be connected to WebSocket first
    if (!repository.isConnected) {
      return const Left(
        ValidationFailure(
          message: 'Please connect to WebSocket before joining matchmaking',
        ),
      );
    }

    // Join matchmaking
    return repository.joinMatchmaking();
  }
}
