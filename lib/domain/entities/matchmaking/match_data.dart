/// Match data entity
class MatchData {
  final String roomId;
  final String opponentId;
  final String? opponentName;
  final String? livekitToken;
  final String? livekitUrl;

  const MatchData({
    required this.roomId,
    required this.opponentId,
    this.opponentName,
    this.livekitToken,
    this.livekitUrl,
  });
}
