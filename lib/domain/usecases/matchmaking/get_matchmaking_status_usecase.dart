import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/matchmaking/matchmaking_status.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/matchmaking_repository.dart';

/// UseCase: Get current matchmaking status
class GetMatchmakingStatusUseCase {
  final MatchmakingRepository repository;

  GetMatchmakingStatusUseCase(this.repository);

  Future<Either<Failure, MatchmakingStatus>> call() async {
    return repository.getStatus();
  }
}
