import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/video_call/match_found_event.dart';
import 'package:pp191225/domain/failures/failures.dart';

/// VideoCall Repository Interface
/// Defines contracts for video call operations
abstract class VideoCallRepository {
  /// Connect to WebSocket server for matchmaking
  Either<Failure, void> connectWebSocket(String url, String token);

  /// Disconnect from WebSocket server
  void disconnectWebSocket();

  /// Join matchmaking queue
  Either<Failure, void> joinMatchmaking({String? userName});

  /// Cancel matchmaking
  Either<Failure, void> cancelMatchmaking();

  /// Leave video call room
  Either<Failure, void> leaveRoom(String roomId);

  /// Listen to match found events
  Stream<Either<Failure, MatchFoundEvent>> get onMatchFound;

  /// Listen to opponent disconnected events
  Stream<Either<Failure, String>> get onOpponentDisconnected;

  /// Listen to opponent left events
  Stream<Either<Failure, String>> get onOpponentLeft;

  /// Connect to LiveKit video call room
  Future<Either<Failure, void>> connectToVideoCall(String url, String token);

  /// Disconnect from LiveKit video call room
  Future<Either<Failure, void>> disconnectFromVideoCall();

  /// Toggle camera on/off
  Future<Either<Failure, bool>> toggleCamera();

  /// Toggle microphone on/off
  Future<Either<Failure, bool>> toggleMicrophone();

  /// Switch camera (front/back)
  Future<Either<Failure, void>> switchCamera();

  /// Request camera and microphone permissions
  Future<Either<Failure, bool>> requestPermissions();

  /// Check if permissions are granted
  Future<Either<Failure, bool>> checkPermissions();

  /// Get LiveKit room instance (for UI rendering)
  dynamic getLiveKitRoom();
}
