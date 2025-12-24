import 'package:pp191225/domain/entities/matchmaking/match_data.dart';

/// Matchmaking response entity
class MatchmakingResponse {
  final String status; // "WAITING" or "MATCHED"
  final String message;
  final MatchData? matchData;

  const MatchmakingResponse({
    required this.status,
    required this.message,
    this.matchData,
  });

  bool get isMatched => status == 'MATCHED';
  bool get isWaiting => status == 'WAITING';
}
