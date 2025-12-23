import 'package:freezed_annotation/freezed_annotation.dart';

part 'opponent_event_dto.freezed.dart';
part 'opponent_event_dto.g.dart';

@freezed
abstract class OpponentEventDto with _$OpponentEventDto {
  const factory OpponentEventDto({
    required String message,
    String? roomId,
  }) = _OpponentEventDto;

  factory OpponentEventDto.fromJson(Map<String, dynamic> json) =>
      _$OpponentEventDtoFromJson(json);
}
