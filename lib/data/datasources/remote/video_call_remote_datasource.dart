import 'package:pp191225/data/models/video_call/match_found_event_dto.dart';

/// VideoCall Remote Data Source
/// Handles WebSocket and LiveKit connections
abstract class VideoCallRemoteDataSource {
  /// Connect to WebSocket server
  void connectWebSocket(String url, String token);

  /// Disconnect from WebSocket server
  void disconnectWebSocket();

  /// Join matchmaking queue
  void joinMatchmaking({String? userName});

  /// Cancel matchmaking
  void cancelMatchmaking();

  /// Leave room
  void leaveRoom(String roomId);

  /// Listen to match found events
  Stream<MatchFoundEventDto> get onMatchFound;

  /// Listen to queue joined events
  Stream<Map<String, dynamic>> get onQueueJoined;

  /// Listen to opponent disconnected events
  Stream<Map<String, dynamic>> get onOpponentDisconnected;

  /// Listen to opponent left events
  Stream<Map<String, dynamic>> get onOpponentLeft;

  /// Check if WebSocket is connected
  bool get isWebSocketConnected;

  /// Connect to LiveKit room
  /// Returns Future that completes when connected
  Future<void> connectToLiveKitRoom(String url, String token);

  /// Disconnect from LiveKit room
  Future<void> disconnectFromLiveKitRoom();

  /// Toggle camera on/off
  Future<void> toggleCamera();

  /// Toggle microphone on/off
  Future<void> toggleMicrophone();

  /// Switch camera (front/back)
  Future<void> switchCamera();

  /// Check if camera is enabled
  bool isCameraEnabled();

  /// Check if microphone is enabled
  bool isMicrophoneEnabled();

  /// Check if LiveKit is connected
  bool get isLiveKitConnected;

  /// Request camera and microphone permissions
  Future<bool> requestPermissions();

  /// Check if permissions are granted
  Future<bool> checkPermissions();

  /// Get LiveKit room instance (for UI rendering)
  dynamic getLiveKitRoom();
}
