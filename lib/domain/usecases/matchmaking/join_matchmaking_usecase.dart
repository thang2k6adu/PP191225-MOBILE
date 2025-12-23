import 'package:jt291_flutter_mobile/core/utils/either.dart';
import 'package:jt291_flutter_mobile/domain/entities/matchmaking/matchmaking_response.dart';
import 'package:jt291_flutter_mobile/domain/failures/failures.dart';
import 'package:jt291_flutter_mobile/domain/repositories/matchmaking_repository.dart';

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
