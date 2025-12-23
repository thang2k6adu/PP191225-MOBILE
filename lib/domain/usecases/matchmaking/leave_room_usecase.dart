import 'package:jt291_flutter_mobile/core/utils/either.dart';
import 'package:jt291_flutter_mobile/domain/failures/failures.dart';
import 'package:jt291_flutter_mobile/domain/repositories/matchmaking_repository.dart';

/// UseCase: Leave current room
class LeaveRoomUseCase {
  final MatchmakingRepository repository;

  LeaveRoomUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return repository.leaveRoom();
  }
}
