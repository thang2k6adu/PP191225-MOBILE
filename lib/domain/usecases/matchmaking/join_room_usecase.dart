import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/matchmaking_repository.dart';

/// UseCase: Join a matched room
/// Business logic: Must have a valid roomId
class JoinRoomUseCase {
  final MatchmakingRepository repository;

  JoinRoomUseCase(this.repository);

  Future<Either<Failure, void>> call(String roomId) async {
    // Validation: roomId must not be empty
    if (roomId.isEmpty) {
      return const Left(ValidationFailure(message: 'Room ID is required'));
    }

    // Business rule: Must be connected to WebSocket
    if (!repository.isConnected) {
      return const Left(ValidationFailure(message: 'WebSocket not connected'));
    }

    return repository.joinRoom(roomId);
  }
}
