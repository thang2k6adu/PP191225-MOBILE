import 'package:pp191225/domain/entities/matchmaking/matchmaking_state.dart';
import 'package:pp191225/domain/entities/matchmaking/room_info.dart';

/// Current matchmaking status entity
class MatchmakingStatus {
  final MatchmakingState state;
  final RoomInfo? room;

  const MatchmakingStatus({required this.state, this.room});

  bool get isIdle => state == MatchmakingState.idle;
  bool get isWaiting => state == MatchmakingState.waiting;
  bool get isInRoom => state == MatchmakingState.inRoom;
}
