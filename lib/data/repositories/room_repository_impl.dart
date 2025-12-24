import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/data/datasources/remote/room_remote_datasource.dart';
import 'package:pp191225/domain/entities/room/room.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/room_repository.dart';

class RoomRepositoryImpl implements RoomRepository {
  final RoomRemoteDataSource remoteDataSource;

  RoomRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Room>> joinMatchmaking() async {
    try {
      final dto = await remoteDataSource.joinMatchmaking();
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Room>> getRoomInfo(String roomId) async {
    try {
      final dto = await remoteDataSource.getRoomInfo(roomId);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> leaveRoom(String roomId) async {
    try {
      await remoteDataSource.leaveRoom(roomId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
