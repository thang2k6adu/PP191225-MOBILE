import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/video_call/match_found_event.dart';

part 'match_found_event_dto.freezed.dart';
part 'match_found_event_dto.g.dart';

/// MatchFoundEvent Data Transfer Object
/// Received from WebSocket when match is found
@freezed
abstract class MatchFoundEventDto with _$MatchFoundEventDto {
  const MatchFoundEventDto._();

  const factory MatchFoundEventDto({
    required String roomId,
    required String livekitToken,
    required String livekitUrl,
    required String opponentId,
    String? opponentName,
    String? message,
  }) = _MatchFoundEventDto;

  factory MatchFoundEventDto.fromJson(Map<String, dynamic> json) =>
      _$MatchFoundEventDtoFromJson(json);

  /// Convert DTO to Entity
  MatchFoundEvent toEntity() {
    return MatchFoundEvent(
      roomId: roomId,
      livekitToken: livekitToken,
      livekitUrl: livekitUrl,
      opponentId: opponentId,
      opponentName: opponentName,
      message: message,
    );
  }
}
