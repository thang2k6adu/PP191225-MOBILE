import 'package:freezed_annotation/freezed_annotation.dart';

part 'matchmaking_response_dto.freezed.dart';
part 'matchmaking_response_dto.g.dart';

@freezed
abstract class MatchmakingResponseDto with _$MatchmakingResponseDto {
  const factory MatchmakingResponseDto({
    required String status, // "WAITING" or "MATCHED"
    required String message,
    MatchDataDto? matchData,
  }) = _MatchmakingResponseDto;

  factory MatchmakingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MatchmakingResponseDtoFromJson(json);
}

@freezed
abstract class MatchDataDto with _$MatchDataDto {
  const factory MatchDataDto({
    required String roomId,
    required String opponentId,
    String? opponentName,
  }) = _MatchDataDto;

  factory MatchDataDto.fromJson(Map<String, dynamic> json) =>
      _$MatchDataDtoFromJson(json);
}
