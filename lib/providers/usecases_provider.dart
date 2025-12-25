import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/domain/usecases/auth/login_usecase.dart';
import 'package:pp191225/domain/usecases/auth/login_with_provider_usecase.dart';
import 'package:pp191225/domain/usecases/auth/login_with_password_usecase.dart';
import 'package:pp191225/domain/usecases/auth/logout_usecase.dart';
import 'package:pp191225/domain/usecases/auth/register_usecase.dart';
import 'package:pp191225/domain/usecases/matchmaking/cancel_matchmaking_usecase.dart';
import 'package:pp191225/domain/usecases/matchmaking/connect_matchmaking_usecase.dart';
import 'package:pp191225/domain/usecases/matchmaking/get_matchmaking_status_usecase.dart';
import 'package:pp191225/domain/usecases/matchmaking/join_matchmaking_usecase.dart'
    as matchmaking;
import 'package:pp191225/domain/usecases/matchmaking/join_room_usecase.dart';
import 'package:pp191225/domain/usecases/matchmaking/leave_room_usecase.dart'
    as matchmaking;
import 'package:pp191225/domain/usecases/matchmaking/listen_match_found_usecase.dart';
import 'package:pp191225/domain/usecases/room/get_room_info_usecase.dart';
import 'package:pp191225/domain/usecases/room/join_matchmaking_usecase.dart';
import 'package:pp191225/domain/usecases/room/leave_room_usecase.dart';
import 'package:pp191225/domain/usecases/tasks/create_task_usecase.dart';
import 'package:pp191225/domain/usecases/tasks/get_tasks_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/activate_task_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/get_progress_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/pause_session_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/resume_session_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/stop_session_usecase.dart';
import 'package:pp191225/domain/usecases/user/get_current_user_usecase.dart';
import 'package:pp191225/domain/usecases/user/update_user_profile_usecase.dart';
import 'package:pp191225/providers/repositories_provider.dart';
import 'package:pp191225/providers/datasources_provider.dart';

// ============================================================================
// Auth UseCases
// ============================================================================

/// Provide LoginUseCase (for backward compatibility - direct backend login)
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});

/// Provide RegisterUseCase
final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterUseCase(repository);
});

/// Provide LogoutUseCase (calls Repository only)
final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LogoutUseCase(repository);
});

final loginWithProviderUseCaseProvider = Provider<LoginWithProviderUseCase>((
  ref,
) {
  final repository = ref.watch(authRepositoryProvider);
  final firebaseAuthService = ref.watch(firebaseAuthServiceProvider);
  return LoginWithProviderUseCase(
    repository: repository,
    firebaseAuthService: firebaseAuthService,
  );
});

final loginWithPasswordUseCaseProvider = Provider<LoginWithPasswordUseCase>((
  ref,
) {
  final repository = ref.watch(authRepositoryProvider);
  final firebaseAuthService = ref.watch(firebaseAuthServiceProvider);
  return LoginWithPasswordUseCase(
    repository: repository,
    firebaseAuthService: firebaseAuthService,
  );
});

final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return GetCurrentUserUseCase(repository);
});

/// Provide UpdateUserProfileUseCase
final updateUserProfileUseCaseProvider = Provider<UpdateUserProfileUseCase>((
  ref,
) {
  final repository = ref.watch(userRepositoryProvider);
  return UpdateUserProfileUseCase(repository);
});

// ============================================================================
// Room UseCases
// ============================================================================

/// Provide JoinMatchmakingUseCase
final joinMatchmakingUseCaseProvider = Provider<JoinMatchmakingUseCase>((ref) {
  final repository = ref.watch(roomRepositoryProvider);
  return JoinMatchmakingUseCase(repository);
});

/// Provide GetRoomInfoUseCase
final getRoomInfoUseCaseProvider = Provider<GetRoomInfoUseCase>((ref) {
  final repository = ref.watch(roomRepositoryProvider);
  return GetRoomInfoUseCase(repository);
});

/// Provide LeaveRoomUseCase
final leaveRoomUseCaseProvider = Provider<LeaveRoomUseCase>((ref) {
  final repository = ref.watch(roomRepositoryProvider);
  return LeaveRoomUseCase(repository);
});

// ============================================================================
// Matchmaking UseCases
// ============================================================================

/// Provide ConnectMatchmakingUseCase
final connectMatchmakingUseCaseProvider = Provider<ConnectMatchmakingUseCase>((
  ref,
) {
  final repository = ref.watch(matchmakingRepositoryProvider);
  return ConnectMatchmakingUseCase(repository);
});

/// Provide JoinMatchmakingUseCase (Matchmaking module)
final joinMatchmakingUseCaseProvider2 =
    Provider<matchmaking.JoinMatchmakingUseCase>((ref) {
      final repository = ref.watch(matchmakingRepositoryProvider);
      return matchmaking.JoinMatchmakingUseCase(repository);
    });

/// Provide CancelMatchmakingUseCase
final cancelMatchmakingUseCaseProvider = Provider<CancelMatchmakingUseCase>((
  ref,
) {
  final repository = ref.watch(matchmakingRepositoryProvider);
  return CancelMatchmakingUseCase(repository);
});

/// Provide GetMatchmakingStatusUseCase
final getMatchmakingStatusUseCaseProvider =
    Provider<GetMatchmakingStatusUseCase>((ref) {
      final repository = ref.watch(matchmakingRepositoryProvider);
      return GetMatchmakingStatusUseCase(repository);
    });

/// Provide JoinRoomUseCase
final joinRoomUseCaseProvider = Provider<JoinRoomUseCase>((ref) {
  final repository = ref.watch(matchmakingRepositoryProvider);
  return JoinRoomUseCase(repository);
});

/// Provide LeaveRoomUseCase (Matchmaking module)
final leaveRoomUseCaseProvider2 = Provider<matchmaking.LeaveRoomUseCase>((ref) {
  final repository = ref.watch(matchmakingRepositoryProvider);
  return matchmaking.LeaveRoomUseCase(repository);
});

/// Provide ListenMatchFoundUseCase
final listenMatchFoundUseCaseProvider = Provider<ListenMatchFoundUseCase>((
  ref,
) {
  final repository = ref.watch(matchmakingRepositoryProvider);
  return ListenMatchFoundUseCase(repository);
});

// ============================================================================
// Task UseCases
// ============================================================================

/// Provide GetTasksUseCase
final getTasksUseCaseProvider = Provider<GetTasksUseCase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return GetTasksUseCase(repository);
});

/// Provide CreateTaskUseCase
final createTaskUseCaseProvider = Provider<CreateTaskUseCase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return CreateTaskUseCase(repository);
});

// ============================================================================
// Tracking UseCases
// ============================================================================

/// Provide ActivateTaskUseCase
final activateTaskUseCaseProvider = Provider<ActivateTaskUseCase>((ref) {
  final repository = ref.watch(trackingRepositoryProvider);
  return ActivateTaskUseCase(repository);
});

/// Provide PauseSessionUseCase
final pauseSessionUseCaseProvider = Provider<PauseSessionUseCase>((ref) {
  final repository = ref.watch(trackingRepositoryProvider);
  return PauseSessionUseCase(repository);
});

/// Provide ResumeSessionUseCase
final resumeSessionUseCaseProvider = Provider<ResumeSessionUseCase>((ref) {
  final repository = ref.watch(trackingRepositoryProvider);
  return ResumeSessionUseCase(repository);
});

/// Provide StopSessionUseCase
final stopSessionUseCaseProvider = Provider<StopSessionUseCase>((ref) {
  final repository = ref.watch(trackingRepositoryProvider);
  return StopSessionUseCase(repository);
});

/// Provide GetProgressUseCase
final getProgressUseCaseProvider = Provider<GetProgressUseCase>((ref) {
  final repository = ref.watch(trackingRepositoryProvider);
  return GetProgressUseCase(repository);
});
