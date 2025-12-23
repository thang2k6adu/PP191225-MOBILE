import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_found_dto.freezed.dart';
part 'match_found_dto.g.dart';

@freezed
abstract class MatchFoundDto with _$MatchFoundDto {
  const factory MatchFoundDto({
    required String roomId,
    required String opponentId,
    String? opponentName,
    required String message,
  }) = _MatchFoundDto;

  factory MatchFoundDto.fromJson(Map<String, dynamic> json) =>
      _$MatchFoundDtoFromJson(json);
}
