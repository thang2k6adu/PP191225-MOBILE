import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/room/room.dart';
import 'package:pp191225/domain/failures/failures.dart';

abstract class RoomRepository {
  /// Join matchmaking queue
  Future<Either<Failure, Room>> joinMatchmaking();

  /// Get room information by id
  Future<Either<Failure, Room>> getRoomInfo(String roomId);

  /// Leave a room
  Future<Either<Failure, void>> leaveRoom(String roomId);
}
