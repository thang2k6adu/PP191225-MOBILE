/// Match data entity
class MatchData {
  final String roomId;
  final String opponentId;
  final String? opponentName;

  const MatchData({
    required this.roomId,
    required this.opponentId,
    this.opponentName,
  });
}
