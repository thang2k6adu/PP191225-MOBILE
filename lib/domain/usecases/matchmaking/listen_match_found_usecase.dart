import 'package:jt291_flutter_mobile/domain/entities/matchmaking/match_data.dart';
import 'package:jt291_flutter_mobile/domain/repositories/matchmaking_repository.dart';

/// UseCase: Listen to match found events
/// Returns a stream of match data when a match is found
class ListenMatchFoundUseCase {
  final MatchmakingRepository repository;

  ListenMatchFoundUseCase(this.repository);

  Stream<MatchData> call() {
    print('[ListenMatchFoundUseCase] Creating stream...');
    return repository.onMatchFound
        .where((either) {
          print('[ListenMatchFoundUseCase] Received either, isRight: ${either.isRight}');
          return either.isRight;
        })
        .map((either) {
          final data = either.right;
          print('[ListenMatchFoundUseCase] Mapped to MatchData: roomId=${data.roomId}');
          return data;
        });
  }
}
