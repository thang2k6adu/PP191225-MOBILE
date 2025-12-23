/// Matchmaking user state enum
enum MatchmakingState {
  idle,
  waiting,
  inRoom,
}

extension MatchmakingStateX on MatchmakingState {
  String get value {
    switch (this) {
      case MatchmakingState.idle:
        return 'IDLE';
      case MatchmakingState.waiting:
        return 'WAITING';
      case MatchmakingState.inRoom:
        return 'IN_ROOM';
    }
  }

  static MatchmakingState fromString(String value) {
    switch (value.toUpperCase()) {
      case 'IDLE':
        return MatchmakingState.idle;
      case 'WAITING':
        return MatchmakingState.waiting;
      case 'IN_ROOM':
        return MatchmakingState.inRoom;
      default:
        return MatchmakingState.idle;
    }
  }
}
