import 'package:jt291_flutter_mobile/core/utils/either.dart';
import 'package:jt291_flutter_mobile/domain/entities/matchmaking/match_data.dart';
import 'package:jt291_flutter_mobile/domain/entities/matchmaking/matchmaking_response.dart';
import 'package:jt291_flutter_mobile/domain/entities/matchmaking/matchmaking_status.dart';
import 'package:jt291_flutter_mobile/domain/failures/failures.dart';

/// Repository interface for matchmaking
/// Defines what operations can be performed
abstract class MatchmakingRepository {
  // REST API operations
  Future<Either<Failure, MatchmakingResponse>> joinMatchmaking();
  Future<Either<Failure, void>> cancelMatchmaking();
  Future<Either<Failure, MatchmakingStatus>> getStatus();

  // WebSocket operations
  Future<Either<Failure, void>> connectWebSocket(String token);
  void disconnectWebSocket();
  bool get isConnected;

  // WebSocket event streams
  Stream<Either<Failure, MatchData>> get onMatchFound;
  Stream<Either<Failure, String>> get onOpponentDisconnected;
  Stream<Either<Failure, String>> get onOpponentLeft;
  Stream<Either<Failure, String>> get onRoomJoined;
  Stream<Either<Failure, String>> get onRoomLeft;

  // Emit events
  Future<Either<Failure, void>> joinRoom(String roomId);
  Future<Either<Failure, void>> leaveRoom();
}
