import 'package:jt291_flutter_mobile/data/models/matchmaking/match_found_dto.dart';
import 'package:jt291_flutter_mobile/data/models/matchmaking/matchmaking_response_dto.dart';
import 'package:jt291_flutter_mobile/data/models/matchmaking/matchmaking_status_dto.dart';
import 'package:jt291_flutter_mobile/data/models/matchmaking/opponent_event_dto.dart';
import 'package:jt291_flutter_mobile/data/models/matchmaking/room_event_dto.dart';

/// Remote data source for matchmaking
/// Handles REST API + WebSocket communication
abstract class MatchmakingRemoteDataSource {
  // REST API methods
  Future<MatchmakingResponseDto> joinMatchmaking();
  Future<void> cancelMatchmaking();
  Future<MatchmakingStatusDto> getStatus();

  // WebSocket methods
  Future<void> connectWebSocket(String token);
  void disconnectWebSocket();
  bool get isConnected;

  // WebSocket event listeners
  Stream<MatchFoundDto> get onMatchFound;
  Stream<OpponentEventDto> get onOpponentDisconnected;
  Stream<OpponentEventDto> get onOpponentLeft;
  Stream<RoomEventDto> get onRoomJoined;
  Stream<RoomEventDto> get onRoomLeft;
  Stream<String> get onError;

  // WebSocket emit events
  void joinRoom(String roomId);
  void leaveRoom();
}
