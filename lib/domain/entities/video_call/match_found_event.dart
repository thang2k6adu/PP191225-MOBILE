/// MatchFoundEvent entity - Pure Dart class
/// Represents match found event from WebSocket
class MatchFoundEvent {
  final String roomId;
  final String livekitToken;
  final String livekitUrl;
  final String opponentId;
  final String? opponentName;
  final String? message;

  const MatchFoundEvent({
    required this.roomId,
    required this.livekitToken,
    required this.livekitUrl,
    required this.opponentId,
    this.opponentName,
    this.message,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchFoundEvent &&
          runtimeType == other.runtimeType &&
          roomId == other.roomId &&
          livekitToken == other.livekitToken &&
          livekitUrl == other.livekitUrl &&
          opponentId == other.opponentId &&
          opponentName == other.opponentName &&
          message == other.message;

  @override
  int get hashCode =>
      roomId.hashCode ^
      livekitToken.hashCode ^
      livekitUrl.hashCode ^
      opponentId.hashCode ^
      opponentName.hashCode ^
      message.hashCode;

  @override
  String toString() {
    return 'MatchFoundEvent{roomId: $roomId, livekitToken: [REDACTED], livekitUrl: $livekitUrl, opponentId: $opponentId, opponentName: $opponentName, message: $message}';
  }
}
