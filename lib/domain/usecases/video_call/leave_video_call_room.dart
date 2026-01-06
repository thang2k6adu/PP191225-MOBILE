import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/video_call_repository.dart';

/// Leave Video Call Room UseCase
/// Business Logic: Validates room ID and handles cleanup
class LeaveVideoCallRoomUseCase {
  final VideoCallRepository repository;

  LeaveVideoCallRoomUseCase(this.repository);

  Future<Either<Failure, void>> call({required String roomId}) async {
    // Validation: Room ID must not be empty
    if (roomId.trim().isEmpty) {
      return const Left(
        ValidationFailure(message: 'Room ID cannot be empty'),
      );
    }

    // Business Logic: First disconnect from video call, then leave room via WebSocket
    final disconnectResult = await repository.disconnectFromVideoCall();
    
    return disconnectResult.fold(
      (failure) => Left(failure),
      (_) {
        // After disconnecting from LiveKit, notify server via WebSocket
        return repository.leaveRoom(roomId);
      },
    );
  }
}
