import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/matchmaking_repository.dart';

/// UseCase: Leave current room
class LeaveRoomUseCase {
  final MatchmakingRepository repository;

  LeaveRoomUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return repository.leaveRoom();
  }
}
