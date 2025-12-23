import 'package:jt291_flutter_mobile/core/utils/either.dart';
import 'package:jt291_flutter_mobile/domain/failures/failures.dart';
import 'package:jt291_flutter_mobile/domain/repositories/room_repository.dart';

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
