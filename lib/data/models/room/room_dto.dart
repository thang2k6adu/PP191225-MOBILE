import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/room/room_member_dto.dart';
import 'package:jt291_flutter_mobile/data/models/room/room_status.dart';
import 'package:jt291_flutter_mobile/data/models/room/room_type.dart';
import 'package:jt291_flutter_mobile/domain/entities/room/room.dart';

part 'room_dto.freezed.dart';
part 'room_dto.g.dart';

@freezed
abstract class RoomDto with _$RoomDto {
  const RoomDto._();
  
  const factory RoomDto({
    required String id,
    required RoomType type,
    required RoomStatus status,
    required int maxMembers,
    @Default([]) List<RoomMemberDto> members,
  }) = _RoomDto;

  factory RoomDto.fromJson(Map<String, dynamic> json) =>
      _$RoomDtoFromJson(json);
      
  Room toEntity() => Room(
        id: id,
        type: type,
        status: status,
        maxMembers: maxMembers,
        members: members.map((m) => m.toEntity()).toList(),
      );
}
