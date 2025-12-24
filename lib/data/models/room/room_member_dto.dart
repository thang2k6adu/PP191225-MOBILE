import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/data/models/room/room_member_status.dart';
import 'package:pp191225/domain/entities/room/room_member.dart';

part 'room_member_dto.freezed.dart';
part 'room_member_dto.g.dart';

@freezed
abstract class RoomMemberDto with _$RoomMemberDto {
  const RoomMemberDto._();

  const factory RoomMemberDto({
    required String userId,
    required RoomMemberStatus status,
  }) = _RoomMemberDto;

  factory RoomMemberDto.fromJson(Map<String, dynamic> json) =>
      _$RoomMemberDtoFromJson(json);

  RoomMember toEntity() => RoomMember(userId: userId, status: status);
}
