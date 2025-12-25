import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/data/datasources/remote/tracking_remote_datasource.dart';
import 'package:pp191225/domain/entities/tracking/activate_task_response.dart';
import 'package:pp191225/domain/entities/tracking/progress_response.dart';
import 'package:pp191225/domain/entities/tracking/stop_session_result.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/tracking_repository.dart';

/// Implementation of TrackingRepository
/// Calls remote datasource and maps DTOs to entities
/// Contains ZERO business logic - only data transformation
class TrackingRepositoryImpl implements TrackingRepository {
  final TrackingRemoteDataSource remoteDataSource;

  TrackingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ActivateTaskResponse>> activateTask(
    String taskId,
  ) async {
    try {
      final dto = await remoteDataSource.activateTask(taskId);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TrackingSession>> pauseSession(
    String sessionId,
  ) async {
    try {
      final dto = await remoteDataSource.pauseSession(sessionId);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TrackingSession>> resumeSession(
    String sessionId,
  ) async {
    try {
      final dto = await remoteDataSource.resumeSession(sessionId);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, StopSessionResult>> stopSession(
    String sessionId,
  ) async {
    try {
      final dto = await remoteDataSource.stopSession(sessionId);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProgressResponse>> getProgress(String taskId) async {
    try {
      final dto = await remoteDataSource.getProgress(taskId);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
