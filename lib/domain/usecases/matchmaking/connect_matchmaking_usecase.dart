import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/matchmaking_repository.dart';

/// UseCase: Connect to matchmaking WebSocket
/// Business logic: Must connect before joining matchmaking
class ConnectMatchmakingUseCase {
  final MatchmakingRepository repository;

  ConnectMatchmakingUseCase(this.repository);

  Future<Either<Failure, void>> call(String token) async {
    // Validation: token must not be empty
    if (token.isEmpty) {
      return const Left(
        ValidationFailure(message: 'Token is required to connect'),
      );
    }

    // Business logic: Check if already connected
    if (repository.isConnected) {
      return const Right(null);
    }

    // Connect to WebSocket
    return repository.connectWebSocket(token);
  }
}
