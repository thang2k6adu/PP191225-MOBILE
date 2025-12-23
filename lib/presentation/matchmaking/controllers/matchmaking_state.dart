import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/domain/entities/matchmaking/match_data.dart';
import 'package:jt291_flutter_mobile/domain/entities/matchmaking/matchmaking_state.dart';

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
