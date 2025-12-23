import 'package:jt291_flutter_mobile/core/utils/either.dart';
import 'package:jt291_flutter_mobile/domain/entities/room/room.dart';
import 'package:jt291_flutter_mobile/domain/failures/failures.dart';
import 'package:jt291_flutter_mobile/domain/repositories/room_repository.dart';

class JoinMatchmakingUseCase {
  final RoomRepository repository;

  JoinMatchmakingUseCase(this.repository);

  Future<Either<Failure, Room>> call() async {
    // Business logic: join matchmaking queue
    // Backend will handle finding/creating room
    return repository.joinMatchmaking();
  }
}
