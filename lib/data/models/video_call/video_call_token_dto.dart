import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/video_call/video_call_token.dart';

part 'video_call_token_dto.freezed.dart';
part 'video_call_token_dto.g.dart';

/// VideoCallToken Data Transfer Object
/// Used for JSON serialization/deserialization
@freezed
abstract class VideoCallTokenDto with _$VideoCallTokenDto {
  const VideoCallTokenDto._();

  const factory VideoCallTokenDto({
    required String token,
    required String url,
    required String roomId,
  }) = _VideoCallTokenDto;

  factory VideoCallTokenDto.fromJson(Map<String, dynamic> json) =>
      _$VideoCallTokenDtoFromJson(json);

  /// Convert DTO to Entity
  VideoCallToken toEntity() {
    return VideoCallToken(
      token: token,
      url: url,
      roomId: roomId,
    );
  }
}
