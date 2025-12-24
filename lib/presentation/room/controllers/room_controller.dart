import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/domain/usecases/room/get_room_info_usecase.dart';
import 'package:pp191225/domain/usecases/room/join_matchmaking_usecase.dart';
import 'package:pp191225/domain/usecases/room/leave_room_usecase.dart';
import 'package:pp191225/presentation/room/controllers/room_state.dart';
import 'package:pp191225/providers/usecases_provider.dart';

final roomControllerProvider =
    AutoDisposeNotifierProvider<RoomController, RoomState>(RoomController.new);

class RoomController extends AutoDisposeNotifier<RoomState> {
  late final JoinMatchmakingUseCase _joinMatchmakingUseCase;
  late final GetRoomInfoUseCase _getRoomInfoUseCase;
  late final LeaveRoomUseCase _leaveRoomUseCase;

  @override
  RoomState build() {
    _joinMatchmakingUseCase = ref.read(joinMatchmakingUseCaseProvider);
    _getRoomInfoUseCase = ref.read(getRoomInfoUseCaseProvider);
    _leaveRoomUseCase = ref.read(leaveRoomUseCaseProvider);
    return const RoomState();
  }

  /// Join matchmaking queue
  Future<void> joinMatchmaking() async {
    state = state.copyWith(isJoining: true, error: null);

    final result = await _joinMatchmakingUseCase();

    result.fold(
      (failure) =>
          state = state.copyWith(isJoining: false, error: failure.message),
      (room) => state = state.copyWith(
        isJoining: false,
        currentRoom: room,
        error: null,
      ),
    );
  }

  /// Get room info (for refresh/polling)
  Future<void> getRoomInfo(String roomId) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _getRoomInfoUseCase(roomId);

    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, error: failure.message),
      (room) => state = state.copyWith(
        isLoading: false,
        currentRoom: room,
        error: null,
      ),
    );
  }

  /// Leave current room
  Future<void> leaveRoom() async {
    if (state.currentRoom == null) return;

    state = state.copyWith(isLeaving: true, error: null);

    final result = await _leaveRoomUseCase(state.currentRoom!.id);

    result.fold(
      (failure) =>
          state = state.copyWith(isLeaving: false, error: failure.message),
      (_) => state = const RoomState(), // Reset state after leaving
    );
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Reset state
  void reset() {
    state = const RoomState();
  }
}
