import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/domain/entities/matchmaking/matchmaking_state.dart';
import 'package:jt291_flutter_mobile/domain/usecases/matchmaking/cancel_matchmaking_usecase.dart';
import 'package:jt291_flutter_mobile/domain/usecases/matchmaking/connect_matchmaking_usecase.dart';
import 'package:jt291_flutter_mobile/domain/usecases/matchmaking/get_matchmaking_status_usecase.dart';
import 'package:jt291_flutter_mobile/domain/usecases/matchmaking/join_matchmaking_usecase.dart';
import 'package:jt291_flutter_mobile/domain/usecases/matchmaking/join_room_usecase.dart';
import 'package:jt291_flutter_mobile/domain/usecases/matchmaking/leave_room_usecase.dart';
import 'package:jt291_flutter_mobile/domain/usecases/matchmaking/listen_match_found_usecase.dart';
import 'package:jt291_flutter_mobile/presentation/matchmaking/controllers/matchmaking_state.dart';
import 'package:jt291_flutter_mobile/providers/usecases_provider.dart';

final matchmakingControllerProvider =
    AutoDisposeNotifierProvider<MatchmakingController, MatchmakingUIState>(
  MatchmakingController.new,
);

/// Controller for matchmaking
/// ONLY calls UseCases and updates UI state
/// NO business logic here
class MatchmakingController extends AutoDisposeNotifier<MatchmakingUIState> {
  late final ConnectMatchmakingUseCase _connectUseCase;
  late final JoinMatchmakingUseCase _joinUseCase;
  late final CancelMatchmakingUseCase _cancelUseCase;
  late final GetMatchmakingStatusUseCase _getStatusUseCase;
  late final JoinRoomUseCase _joinRoomUseCase;
  late final LeaveRoomUseCase _leaveRoomUseCase;
  late final ListenMatchFoundUseCase _listenMatchFoundUseCase;

  StreamSubscription? _matchFoundSubscription;

  @override
  MatchmakingUIState build() {
    print('[MatchmakingController] build() called, _matchFoundSubscription is null: ${_matchFoundSubscription == null}');
    
    _connectUseCase = ref.read(connectMatchmakingUseCaseProvider);
    _joinUseCase = ref.read(joinMatchmakingUseCaseProvider2);
    _cancelUseCase = ref.read(cancelMatchmakingUseCaseProvider);
    _getStatusUseCase = ref.read(getMatchmakingStatusUseCaseProvider);
    _joinRoomUseCase = ref.read(joinRoomUseCaseProvider);
    _leaveRoomUseCase = ref.read(leaveRoomUseCaseProvider2);
    _listenMatchFoundUseCase = ref.read(listenMatchFoundUseCaseProvider);

    // Setup match found listener only once
    if (_matchFoundSubscription == null) {
      print('[MatchmakingController] First time setup - creating match found subscription');
      _startListeningToMatchFound();
    } else {
      print('[MatchmakingController] Subscription already exists, skipping setup');
    }

    // Cleanup on dispose
    ref.onDispose(() {
      print('[MatchmakingController] onDispose called - cancelling subscription');
      _matchFoundSubscription?.cancel();
      _matchFoundSubscription = null;
    });

    return const MatchmakingUIState();
  }

  /// Connect to matchmaking WebSocket
  Future<void> connect(String token) async {
    print('[MatchmakingController] ========================================');
    print('[MatchmakingController] connect() called');
    print('[MatchmakingController] Token length: ${token.length}');
    print('[MatchmakingController] Current subscription null: ${_matchFoundSubscription == null}');
    
    state = state.copyWith(isConnecting: true, error: null);

    final result = await _connectUseCase(token);

    result.fold(
      (failure) {
        print('[MatchmakingController] Connection FAILED: ${failure.message}');
        state = state.copyWith(
          isConnecting: false,
          error: failure.message,
          isConnected: false,
        );
      },
      (_) {
        print('[MatchmakingController] Connection SUCCESSFUL!');
        print('[MatchmakingController] Subscription is now: ${_matchFoundSubscription == null ? "NULL" : "ACTIVE"}');
        state = state.copyWith(
          isConnecting: false,
          isConnected: true,
          message: 'Connected to matchmaking',
        );
      },
    );
    print('[MatchmakingController] ========================================');
  }

  /// Join matchmaking queue
  Future<void> joinMatchmaking() async {
    print('[MatchmakingController] Joining matchmaking...');
    state = state.copyWith(isLoading: true, error: null, message: null);

    final result = await _joinUseCase();

    result.fold(
      (failure) {
        print('[MatchmakingController] Join failed: ${failure.message}');
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (response) {
        print('[MatchmakingController] Join response: status=${response.status}, message=${response.message}');
        if (response.isWaiting) {
          print('[MatchmakingController] Entered WAITING state');
          state = state.copyWith(
            isLoading: false,
            state: MatchmakingState.waiting,
            message: response.message,
          );
        } else if (response.isMatched) {
          print('[MatchmakingController] Matched immediately! Room: ${response.matchData?.roomId}');
          state = state.copyWith(
            isLoading: false,
            state: MatchmakingState.inRoom,
            matchData: response.matchData,
            message: response.message,
          );
          // Auto join room
          if (response.matchData != null) {
            _joinRoomUseCase(response.matchData!.roomId);
          }
        }
      },
    );
  }

  /// Cancel matchmaking
  Future<void> cancelMatchmaking() async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _cancelUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (_) {
        state = state.copyWith(
          isLoading: false,
          state: MatchmakingState.idle,
          message: 'Matchmaking cancelled',
        );
      },
    );
  }

  /// Get current matchmaking status
  Future<void> getStatus() async {
    final result = await _getStatusUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
      },
      (status) {
        state = state.copyWith(
          state: status.state,
        );
      },
    );
  }

  /// Leave current room
  Future<void> leaveRoom() async {
    final result = await _leaveRoomUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
      },
      (_) {
        state = state.copyWith(
          state: MatchmakingState.idle,
          matchData: null,
          message: 'Left the room',
        );
      },
    );
  }

  /// Listen to match found events from WebSocket
  void _startListeningToMatchFound() {
    print('[MatchmakingController] ========================================');
    print('[MatchmakingController] Setting up match found listener...');
    
    // Cancel existing subscription if any
    if (_matchFoundSubscription != null) {
      print('[MatchmakingController] Cancelling existing subscription');
      _matchFoundSubscription?.cancel();
    }
    
    _matchFoundSubscription = _listenMatchFoundUseCase().listen(
      (matchData) {
        print('[MatchmakingController] ========================================');
        print('[MatchmakingController] MATCH DATA RECEIVED IN CONTROLLER!');
        print('[MatchmakingController] Room: ${matchData.roomId}');
        print('[MatchmakingController] Opponent: ${matchData.opponentName}');
        print('[MatchmakingController] Current state before update: ${state.state}');
        
        state = state.copyWith(
          state: MatchmakingState.inRoom,
          matchData: matchData,
          message: 'Match found!',
          isLoading: false,
        );
        
        print('[MatchmakingController] State updated to: ${state.state}');
        print('[MatchmakingController] Auto joining room...');
        
        // Auto join room
        _joinRoomUseCase(matchData.roomId);
        print('[MatchmakingController] ========================================');
      },
      onError: (error) {
        print('[MatchmakingController] ERROR in match found stream: $error');
        print('[MatchmakingController] Stack trace: ${StackTrace.current}');
        state = state.copyWith(
          error: error.toString(),
          isLoading: false,
        );
      },
      onDone: () {
        print('[MatchmakingController] WARNING: Match found stream completed!');
      },
    );
    
    print('[MatchmakingController] Subscription created successfully');
    print('[MatchmakingController] Subscription active: ${!(_matchFoundSubscription?.isPaused ?? true)}');
    print('[MatchmakingController] ========================================');
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Clear info message
  void clearMessage() {
    state = state.copyWith(message: null);
  }
}
