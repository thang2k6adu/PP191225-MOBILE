import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/room_repository.dart';

class LeaveRoomUseCase {
  final RoomRepository repository;

  LeaveRoomUseCase(this.repository);

  Future<Either<Failure, void>> call(String roomId) async {
    // Business logic: validate room id
    if (roomId.isEmpty) {
      return const Left(ValidationFailure(message: 'Room ID is required'));
    }

    return repository.leaveRoom(roomId);
  }
}
