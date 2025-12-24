import 'package:pp191225/data/models/room/matchmaking_response_dto.dart';
import 'package:pp191225/data/models/room/room_dto.dart';

abstract class RoomRemoteDataSource {
  /// Join matchmaking queue
  Future<MatchmakingResponseDto> joinMatchmaking();

  /// Get room info by id
  Future<RoomDto> getRoomInfo(String roomId);

  /// Leave a room
  Future<void> leaveRoom(String roomId);
}
