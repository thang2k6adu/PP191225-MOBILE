import 'dart:async';
import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/data/datasources/remote/matchmaking_remote_datasource.dart';
import 'package:pp191225/data/models/matchmaking/match_found_dto.dart';
import 'package:pp191225/domain/entities/matchmaking/match_data.dart';
import 'package:pp191225/domain/entities/matchmaking/matchmaking_response.dart';
import 'package:pp191225/domain/entities/matchmaking/matchmaking_state.dart';
import 'package:pp191225/domain/entities/matchmaking/matchmaking_status.dart';
import 'package:pp191225/domain/entities/matchmaking/room_info.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/matchmaking_repository.dart';

/// Repository implementation for matchmaking
/// ZERO business logic - only calls datasource and maps DTO to Entity
class MatchmakingRepositoryImpl implements MatchmakingRepository {
  final MatchmakingRemoteDataSource remoteDataSource;

  MatchmakingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, MatchmakingResponse>> joinMatchmaking() async {
    try {
      final dto = await remoteDataSource.joinMatchmaking();
      return Right(_mapToMatchmakingResponse(dto));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelMatchmaking() async {
    try {
      await remoteDataSource.cancelMatchmaking();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MatchmakingStatus>> getStatus() async {
    try {
      final dto = await remoteDataSource.getStatus();
      return Right(_mapToMatchmakingStatus(dto));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> connectWebSocket(String token) async {
    try {
      await remoteDataSource.connectWebSocket(token);
      return const Right(null);
    } catch (e) {
      return Left(NetworkFailure(message: e.toString()));
    }
  }

  @override
  void disconnectWebSocket() {
    remoteDataSource.disconnectWebSocket();
  }

  @override
  bool get isConnected => remoteDataSource.isConnected;

  @override
  Stream<Either<Failure, MatchData>> get onMatchFound {
    print('[MatchmakingRepository] onMatchFound stream accessed');
    return remoteDataSource.onMatchFound.map((dto) {
      print(
        '[MatchmakingRepository] Received DTO from data source: roomId=${dto.roomId}',
      );
      try {
        final entity = _mapToMatchData(dto);
        print('[MatchmakingRepository] Mapped to entity successfully');
        return Right(entity);
      } catch (e) {
        print('[MatchmakingRepository] ERROR mapping DTO: $e');
        return Left(ServerFailure(message: e.toString()));
      }
    });
  }

  @override
  Stream<Either<Failure, String>> get onOpponentDisconnected {
    return remoteDataSource.onOpponentDisconnected.map((dto) {
      return Right(dto.message);
    });
  }

  @override
  Stream<Either<Failure, String>> get onOpponentLeft {
    return remoteDataSource.onOpponentLeft.map((dto) {
      return Right(dto.message);
    });
  }

  @override
  Stream<Either<Failure, String>> get onRoomJoined {
    return remoteDataSource.onRoomJoined.map((dto) {
      return Right(dto.message);
    });
  }

  @override
  Stream<Either<Failure, String>> get onRoomLeft {
    return remoteDataSource.onRoomLeft.map((dto) {
      return Right(dto.message);
    });
  }

  @override
  Future<Either<Failure, void>> joinRoom(String roomId) async {
    try {
      remoteDataSource.joinRoom(roomId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> leaveRoom() async {
    try {
      remoteDataSource.leaveRoom();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // Private mapping methods (DTO → Entity)
  MatchmakingResponse _mapToMatchmakingResponse(dto) {
    return MatchmakingResponse(
      status: dto.status,
      message: dto.message,
      matchData: dto.matchData != null
          ? MatchData(
              roomId: dto.matchData!.roomId,
              opponentId: dto.matchData!.opponentId,
              opponentName: dto.matchData!.opponentName ?? 'Unknown',
            )
          : null,
    );
  }

  MatchData _mapToMatchData(MatchFoundDto dto) {
    return MatchData(
      roomId: dto.roomId,
      opponentId: dto.opponentId,
      opponentName: dto.opponentName ?? 'Unknown',
    );
  }

  MatchmakingStatus _mapToMatchmakingStatus(dto) {
    return MatchmakingStatus(
      state: MatchmakingStateX.fromString(dto.state),
      room: dto.room != null
          ? RoomInfo(
              roomId: dto.room!.roomId,
              players: dto.room!.players,
              createdAt: DateTime.parse(dto.room!.createdAt),
            )
          : null,
    );
  }
}
