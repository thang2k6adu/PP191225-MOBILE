import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/repositories/auth_repository_impl.dart';
import 'package:jt291_flutter_mobile/data/repositories/matchmaking_repository_impl.dart';
import 'package:jt291_flutter_mobile/data/repositories/room_repository_impl.dart';
import 'package:jt291_flutter_mobile/data/repositories/user_repository_impl.dart';
import 'package:jt291_flutter_mobile/domain/repositories/auth_repository.dart';
import 'package:jt291_flutter_mobile/domain/repositories/matchmaking_repository.dart';
import 'package:jt291_flutter_mobile/domain/repositories/room_repository.dart';
import 'package:jt291_flutter_mobile/domain/repositories/user_repository.dart';
import 'package:jt291_flutter_mobile/providers/datasources_provider.dart';

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
  
  return UserRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );
});

/// Provide RoomRepository
final roomRepositoryProvider = Provider<RoomRepository>((ref) {
  final remoteDataSource = ref.watch(roomRemoteDataSourceProvider);
  
  return RoomRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );
});

/// Provide MatchmakingRepository
final matchmakingRepositoryProvider = Provider<MatchmakingRepository>((ref) {
  final remoteDataSource = ref.watch(matchmakingRemoteDataSourceProvider);

  return MatchmakingRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );
});
