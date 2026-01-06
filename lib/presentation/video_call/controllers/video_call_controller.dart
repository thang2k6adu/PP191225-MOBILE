import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/core/constants/api_constants.dart';
import 'package:pp191225/domain/usecases/video_call/cancel_matchmaking.dart';
import 'package:pp191225/domain/usecases/video_call/connect_to_video_call.dart';
import 'package:pp191225/domain/usecases/video_call/connect_websocket.dart';
import 'package:pp191225/domain/usecases/video_call/join_matchmaking.dart';
import 'package:pp191225/domain/usecases/video_call/leave_video_call_room.dart';
import 'package:pp191225/domain/usecases/video_call/switch_camera.dart';
import 'package:pp191225/domain/usecases/video_call/toggle_camera.dart';
import 'package:pp191225/domain/usecases/video_call/toggle_microphone.dart';
import 'package:pp191225/domain/repositories/video_call_repository.dart';
import 'package:pp191225/presentation/video_call/controllers/video_call_state.dart';
import 'package:pp191225/providers/repositories_provider.dart';
import 'package:pp191225/providers/usecases_provider.dart';

final videoCallControllerProvider =
    AutoDisposeNotifierProvider<VideoCallController, VideoCallState>(
  VideoCallController.new,
);

/// Video Call Controller
/// ONLY calls UseCases and updates UI state
/// NO business logic here
class VideoCallController extends AutoDisposeNotifier<VideoCallState> {
  late final ConnectWebSocketUseCase _connectWebSocketUseCase;
  late final JoinMatchmakingUseCase _joinMatchmakingUseCase;
  late final CancelMatchmakingUseCase _cancelMatchmakingUseCase;
  late final ConnectToVideoCallUseCase _connectToVideoCallUseCase;
  late final LeaveVideoCallRoomUseCase _leaveVideoCallRoomUseCase;
  late final ToggleCameraUseCase _toggleCameraUseCase;
  late final ToggleMicrophoneUseCase _toggleMicrophoneUseCase;
  late final SwitchCameraUseCase _switchCameraUseCase;
  late final VideoCallRepository _repository;

  StreamSubscription? _matchFoundSubscription;
  StreamSubscription? _opponentDisconnectedSubscription;
  StreamSubscription? _opponentLeftSubscription;

  @override
  VideoCallState build() {
    // Initialize UseCases
    _connectWebSocketUseCase = ref.read(connectWebSocketUseCaseProvider);
    _joinMatchmakingUseCase = ref.read(joinVideoCallMatchmakingUseCaseProvider);
    _cancelMatchmakingUseCase = ref.read(cancelVideoCallMatchmakingUseCaseProvider);
    _connectToVideoCallUseCase = ref.read(connectToVideoCallUseCaseProvider);
    _leaveVideoCallRoomUseCase = ref.read(leaveVideoCallRoomUseCaseProvider);
    _toggleCameraUseCase = ref.read(toggleCameraUseCaseProvider);
    _toggleMicrophoneUseCase = ref.read(toggleMicrophoneUseCaseProvider);
    _switchCameraUseCase = ref.read(switchCameraUseCaseProvider);
    _repository = ref.read(videoCallRepositoryProvider);

    // Setup listeners
    _setupListeners();

    // Cleanup on dispose
    ref.onDispose(() {
      _cleanup();
    });

    return const VideoCallState();
  }

  void _setupListeners() {
    // Listen to match found events
    _matchFoundSubscription = _repository.onMatchFound.listen((result) {
      result.fold(
        (failure) {
          state = state.copyWith(
            error: failure.message,
            isSearchingMatch: false,
          );
        },
        (matchFoundEvent) {
          state = state.copyWith(
            isMatchFound: true,
            isSearchingMatch: false,
            matchFoundEvent: matchFoundEvent,
            roomId: matchFoundEvent.roomId,
            opponentName: matchFoundEvent.opponentName,
            error: null,
          );
        },
      );
    });

    // Listen to opponent disconnected events
    _opponentDisconnectedSubscription = _repository.onOpponentDisconnected.listen((result) {
      result.fold(
        (failure) {
          state = state.copyWith(error: failure.message);
        },
        (message) {
          state = state.copyWith(
            error: message,
            isInVideoCall: false,
          );
          // Auto leave room
          if (state.roomId != null) {
            leaveRoom();
          }
        },
      );
    });

    // Listen to opponent left events
    _opponentLeftSubscription = _repository.onOpponentLeft.listen((result) {
      result.fold(
        (failure) {
          state = state.copyWith(error: failure.message);
        },
        (message) {
          state = state.copyWith(
            error: message,
            isInVideoCall: false,
          );
          // Auto leave room
          if (state.roomId != null) {
            leaveRoom();
          }
        },
      );
    });
  }

  /// Connect to WebSocket server
  Future<void> connectWebSocket(String token) async {
    state = state.copyWith(isConnectingWebSocket: true, error: null);

    final result = _connectWebSocketUseCase(
      url: ApiConstants.baseUrl, // Use your WebSocket URL
      token: token,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isConnectingWebSocket: false,
          isWebSocketConnected: false,
          error: failure.message,
        );
      },
      (_) {
        state = state.copyWith(
          isConnectingWebSocket: false,
          isWebSocketConnected: true,
          error: null,
        );
      },
    );
  }

  /// Join matchmaking queue
  Future<void> joinMatchmaking({String? userName}) async {
    if (!state.isWebSocketConnected) {
      state = state.copyWith(
        error: 'Please connect to server first',
      );
      return;
    }

    state = state.copyWith(
      isSearchingMatch: true,
      isMatchFound: false,
      error: null,
    );

    final result = _joinMatchmakingUseCase(userName: userName);

    result.fold(
      (failure) {
        state = state.copyWith(
          isSearchingMatch: false,
          error: failure.message,
        );
      },
      (_) {
        // State will be updated by match found listener
      },
    );
  }

  /// Cancel matchmaking
  Future<void> cancelMatchmaking() async {
    final result = _cancelMatchmakingUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
      },
      (_) {
        state = state.copyWith(
          isSearchingMatch: false,
          isMatchFound: false,
          matchFoundEvent: null,
          error: null,
        );
      },
    );
  }

  /// Connect to video call after match found
  Future<void> connectToVideoCall() async {
    final matchEvent = state.matchFoundEvent;
    if (matchEvent == null) {
      state = state.copyWith(error: 'No match found event');
      return;
    }

    state = state.copyWith(isConnectingToCall: true, error: null);

    final result = await _connectToVideoCallUseCase(
      url: matchEvent.livekitUrl,
      token: matchEvent.livekitToken,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isConnectingToCall: false,
          error: failure.message,
        );
      },
      (_) {
        state = state.copyWith(
          isConnectingToCall: false,
          isInVideoCall: true,
          error: null,
        );
      },
    );
  }

  /// Leave video call room
  Future<void> leaveRoom() async {
    final roomId = state.roomId;
    if (roomId == null) {
      state = state.copyWith(error: 'No active room');
      return;
    }

    final result = await _leaveVideoCallRoomUseCase(roomId: roomId);

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
      },
      (_) {
        state = state.copyWith(
          isInVideoCall: false,
          isMatchFound: false,
          matchFoundEvent: null,
          roomId: null,
          opponentName: null,
          error: null,
        );
      },
    );
  }

  /// Toggle camera on/off
  Future<void> toggleCamera() async {
    final result = await _toggleCameraUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
      },
      (isEnabled) {
        state = state.copyWith(
          isCameraEnabled: isEnabled,
          error: null,
        );
      },
    );
  }

  /// Toggle microphone on/off
  Future<void> toggleMicrophone() async {
    final result = await _toggleMicrophoneUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
      },
      (isEnabled) {
        state = state.copyWith(
          isMicrophoneEnabled: isEnabled,
          error: null,
        );
      },
    );
  }

  /// Switch camera (front/back)
  Future<void> switchCamera() async {
    final result = await _switchCameraUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(error: failure.message);
      },
      (_) {
        // Camera switched successfully
      },
    );
  }

  /// Get LiveKit room instance for UI rendering
  dynamic getLiveKitRoom() {
    return _repository.getLiveKitRoom();
  }

  /// Cleanup resources
  void _cleanup() {
    _matchFoundSubscription?.cancel();
    _opponentDisconnectedSubscription?.cancel();
    _opponentLeftSubscription?.cancel();
  }
}
