import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/data/datasources/remote/video_call_remote_datasource.dart';
import 'package:pp191225/domain/entities/video_call/match_found_event.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/video_call_repository.dart';

/// VideoCall Repository Implementation
/// Maps DTO → Entity, handles errors, NO business logic
class VideoCallRepositoryImpl implements VideoCallRepository {
  final VideoCallRemoteDataSource remoteDataSource;

  VideoCallRepositoryImpl(this.remoteDataSource);

  @override
  Either<Failure, void> connectWebSocket(String url, String token) {
    try {
      remoteDataSource.connectWebSocket(url, token);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to connect WebSocket: $e'));
    }
  }

  @override
  void disconnectWebSocket() {
    remoteDataSource.disconnectWebSocket();
  }

  @override
  Either<Failure, void> joinMatchmaking({String? userName}) {
    try {
      if (!remoteDataSource.isWebSocketConnected) {
        return const Left(
          ServerFailure(message: 'WebSocket not connected'),
        );
      }
      remoteDataSource.joinMatchmaking(userName: userName);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to join matchmaking: $e'));
    }
  }

  @override
  Either<Failure, void> cancelMatchmaking() {
    try {
      if (!remoteDataSource.isWebSocketConnected) {
        return const Left(
          ServerFailure(message: 'WebSocket not connected'),
        );
      }
      remoteDataSource.cancelMatchmaking();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to cancel matchmaking: $e'));
    }
  }

  @override
  Either<Failure, void> leaveRoom(String roomId) {
    try {
      remoteDataSource.leaveRoom(roomId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to leave room: $e'));
    }
  }

  @override
  Stream<Either<Failure, MatchFoundEvent>> get onMatchFound {
    return remoteDataSource.onMatchFound.map((dto) {
      try {
        return Right(dto.toEntity());
      } catch (e) {
        return Left(ServerFailure(message: 'Failed to parse match found: $e'));
      }
    });
  }

  @override
  Stream<Either<Failure, String>> get onOpponentDisconnected {
    return remoteDataSource.onOpponentDisconnected.map((data) {
      try {
        final message = data['message'] as String? ?? 'Opponent disconnected';
        return Right(message);
      } catch (e) {
        return Left(
          ServerFailure(message: 'Failed to parse opponent disconnected: $e'),
        );
      }
    });
  }

  @override
  Stream<Either<Failure, String>> get onOpponentLeft {
    return remoteDataSource.onOpponentLeft.map((data) {
      try {
        final message = data['message'] as String? ?? 'Opponent left';
        return Right(message);
      } catch (e) {
        return Left(
          ServerFailure(message: 'Failed to parse opponent left: $e'),
        );
      }
    });
  }

  @override
  Future<Either<Failure, void>> connectToVideoCall(
    String url,
    String token,
  ) async {
    try {
      await remoteDataSource.connectToLiveKitRoom(url, token);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to connect video call: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> disconnectFromVideoCall() async {
    try {
      await remoteDataSource.disconnectFromLiveKitRoom();
      return const Right(null);
    } catch (e) {
      return Left(
        ServerFailure(message: 'Failed to disconnect video call: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> toggleCamera() async {
    try {
      await remoteDataSource.toggleCamera();
      final isEnabled = remoteDataSource.isCameraEnabled();
      return Right(isEnabled);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to toggle camera: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> toggleMicrophone() async {
    try {
      await remoteDataSource.toggleMicrophone();
      final isEnabled = remoteDataSource.isMicrophoneEnabled();
      return Right(isEnabled);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to toggle microphone: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> switchCamera() async {
    try {
      await remoteDataSource.switchCamera();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to switch camera: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> requestPermissions() async {
    try {
      final granted = await remoteDataSource.requestPermissions();
      return Right(granted);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to request permissions: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> checkPermissions() async {
    try {
      final granted = await remoteDataSource.checkPermissions();
      return Right(granted);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to check permissions: $e'));
    }
  }

  @override
  dynamic getLiveKitRoom() {
    return remoteDataSource.getLiveKitRoom();
  }
}
