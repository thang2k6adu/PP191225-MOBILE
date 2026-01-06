import 'package:pp191225/data/datasources/remote/video_call_remote_datasource.dart';
import 'package:pp191225/data/models/video_call/match_found_event_dto.dart';
import 'package:pp191225/data/services/livekit_service.dart';
import 'package:pp191225/data/services/socket_service.dart';

/// VideoCall Remote Data Source Implementation
/// Implements WebSocket and LiveKit functionality
class VideoCallRemoteDataSourceImpl implements VideoCallRemoteDataSource {
  final SocketService socketService;
  final LiveKitService liveKitService;

  VideoCallRemoteDataSourceImpl({
    required this.socketService,
    required this.liveKitService,
  });

  @override
  void connectWebSocket(String url, String token) {
    socketService.connect(url, token);
  }

  @override
  void disconnectWebSocket() {
    socketService.disconnect();
  }

  @override
  void joinMatchmaking({String? userName}) {
    socketService.joinMatchmaking(userName: userName);
  }

  @override
  void cancelMatchmaking() {
    socketService.cancelMatchmaking();
  }

  @override
  void leaveRoom(String roomId) {
    socketService.leaveRoom(roomId);
  }

  @override
  Stream<MatchFoundEventDto> get onMatchFound {
    return socketService.onMatchFound.map((data) {
      return MatchFoundEventDto.fromJson(data);
    });
  }

  @override
  Stream<Map<String, dynamic>> get onQueueJoined => socketService.onQueueJoined;

  @override
  Stream<Map<String, dynamic>> get onOpponentDisconnected =>
      socketService.onOpponentDisconnected;

  @override
  Stream<Map<String, dynamic>> get onOpponentLeft => socketService.onOpponentLeft;

  @override
  bool get isWebSocketConnected => socketService.isConnected;

  @override
  Future<void> connectToLiveKitRoom(String url, String token) async {
    await liveKitService.connect(url, token);
  }

  @override
  Future<void> disconnectFromLiveKitRoom() async {
    await liveKitService.disconnect();
  }

  @override
  Future<void> toggleCamera() async {
    await liveKitService.toggleCamera();
  }

  @override
  Future<void> toggleMicrophone() async {
    await liveKitService.toggleMicrophone();
  }

  @override
  Future<void> switchCamera() async {
    await liveKitService.switchCamera();
  }

  @override
  bool isCameraEnabled() {
    return liveKitService.isCameraEnabled();
  }

  @override
  bool isMicrophoneEnabled() {
    return liveKitService.isMicrophoneEnabled();
  }

  @override
  bool get isLiveKitConnected => liveKitService.isConnected;

  @override
  Future<bool> requestPermissions() async {
    return await liveKitService.requestPermissions();
  }

  @override
  Future<bool> checkPermissions() async {
    return await liveKitService.checkPermissions();
  }

  @override
  dynamic getLiveKitRoom() {
    return liveKitService.room;
  }
}
