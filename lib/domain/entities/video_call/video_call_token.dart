/// VideoCallToken entity - Pure Dart class
/// Represents LiveKit access token and connection details
class VideoCallToken {
  final String token;
  final String url;
  final String roomId;

  const VideoCallToken({
    required this.token,
    required this.url,
    required this.roomId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoCallToken &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          url == other.url &&
          roomId == other.roomId;

  @override
  int get hashCode => token.hashCode ^ url.hashCode ^ roomId.hashCode;

  @override
  String toString() {
    return 'VideoCallToken{token: [REDACTED], url: $url, roomId: $roomId}';
  }
}
