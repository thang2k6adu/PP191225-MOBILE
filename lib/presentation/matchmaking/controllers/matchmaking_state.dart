import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/matchmaking/match_data.dart';
import 'package:pp191225/domain/entities/matchmaking/matchmaking_state.dart';

part 'matchmaking_state.freezed.dart';

@freezed
abstract class MatchmakingUIState with _$MatchmakingUIState {
  const factory MatchmakingUIState({
    @Default(MatchmakingState.idle) MatchmakingState state,
    @Default(false) bool isLoading,
    @Default(false) bool isConnecting,
    String? error,
    String? message,
    MatchData? matchData,
    @Default(false) bool isConnected,
  }) = _MatchmakingUIState;
}
