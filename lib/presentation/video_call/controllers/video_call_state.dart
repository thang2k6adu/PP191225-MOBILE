import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/video_call/match_found_event.dart';

part 'video_call_state.freezed.dart';

/// Video Call UI State
/// Manages state for video call feature
@freezed
class VideoCallState with _$VideoCallState {
  const factory VideoCallState({
    // WebSocket connection state
    @Default(false) bool isWebSocketConnected,
    @Default(false) bool isConnectingWebSocket,
    
    // Matchmaking state
    @Default(false) bool isSearchingMatch,
    @Default(false) bool isMatchFound,
    MatchFoundEvent? matchFoundEvent,
    
    // Video call state
    @Default(false) bool isInVideoCall,
    @Default(false) bool isConnectingToCall,
    
    // Camera/Microphone state
    @Default(true) bool isCameraEnabled,
    @Default(true) bool isMicrophoneEnabled,
    
    // Error state
    String? error,
    
    // Opponent info
    String? opponentName,
    String? roomId,
  }) = _VideoCallState;
}
