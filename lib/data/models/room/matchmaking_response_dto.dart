import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/room/room_dto.dart';
import 'package:jt291_flutter_mobile/domain/entities/room/room.dart';

part 'matchmaking_response_dto.freezed.dart';
part 'matchmaking_response_dto.g.dart';

@freezed
abstract class MatchmakingResponseDto with _$MatchmakingResponseDto {
  const MatchmakingResponseDto._();
  
  const factory MatchmakingResponseDto({
    required RoomDto room,
  }) = _MatchmakingResponseDto;

  factory MatchmakingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MatchmakingResponseDtoFromJson(json);
      
  Room toEntity() => room.toEntity();
}
