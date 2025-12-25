import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/data/repositories/auth_repository_impl.dart';
import 'package:pp191225/data/repositories/matchmaking_repository_impl.dart';
import 'package:pp191225/data/repositories/room_repository_impl.dart';
import 'package:pp191225/data/repositories/task_repository_impl.dart';
import 'package:pp191225/data/repositories/tracking_repository_impl.dart';
import 'package:pp191225/data/repositories/user_repository_impl.dart';
import 'package:pp191225/domain/repositories/auth_repository.dart';
import 'package:pp191225/domain/repositories/matchmaking_repository.dart';
import 'package:pp191225/domain/repositories/room_repository.dart';
import 'package:pp191225/domain/repositories/task_repository.dart';
import 'package:pp191225/domain/repositories/tracking_repository.dart';
import 'package:pp191225/domain/repositories/user_repository.dart';
import 'package:pp191225/providers/datasources_provider.dart';

// ============================================================================
// Repositories
// ============================================================================

/// Provide AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = ref.watch(authLocalDataSourceProvider);

  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
});

/// Provide UserRepository
final userRepositoryProvider = Provider<UserRepository>((ref) {
  final remoteDataSource = ref.watch(userRemoteDataSourceProvider);

  return UserRepositoryImpl(remoteDataSource: remoteDataSource);
});

/// Provide RoomRepository
final roomRepositoryProvider = Provider<RoomRepository>((ref) {
  final remoteDataSource = ref.watch(roomRemoteDataSourceProvider);

  return RoomRepositoryImpl(remoteDataSource: remoteDataSource);
});

/// Provide MatchmakingRepository
final matchmakingRepositoryProvider = Provider<MatchmakingRepository>((ref) {
  final remoteDataSource = ref.watch(matchmakingRemoteDataSourceProvider);

  return MatchmakingRepositoryImpl(remoteDataSource: remoteDataSource);
});

/// Provide TaskRepository
final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final remoteDataSource = ref.watch(taskRemoteDataSourceProvider);

  return TaskRepositoryImpl(remoteDataSource: remoteDataSource);
});

/// Provide TrackingRepository
final trackingRepositoryProvider = Provider<TrackingRepository>((ref) {
  final remoteDataSource = ref.watch(trackingRemoteDataSourceProvider);

  return TrackingRepositoryImpl(remoteDataSource: remoteDataSource);
});
