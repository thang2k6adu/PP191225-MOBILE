import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/room/room.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/room_repository.dart';

class JoinMatchmakingUseCase {
  final RoomRepository repository;

  JoinMatchmakingUseCase(this.repository);

  Future<Either<Failure, Room>> call() async {
    // Business logic: join matchmaking queue
    // Backend will handle finding/creating room
    return repository.joinMatchmaking();
  }
}
