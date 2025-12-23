import 'package:jt291_flutter_mobile/core/utils/either.dart';
import 'package:jt291_flutter_mobile/domain/entities/matchmaking/matchmaking_status.dart';
import 'package:jt291_flutter_mobile/domain/failures/failures.dart';
import 'package:jt291_flutter_mobile/domain/repositories/matchmaking_repository.dart';

/// UseCase: Get current matchmaking status
class GetMatchmakingStatusUseCase {
  final MatchmakingRepository repository;

  GetMatchmakingStatusUseCase(this.repository);

  Future<Either<Failure, MatchmakingStatus>> call() async {
    return repository.getStatus();
  }
}
