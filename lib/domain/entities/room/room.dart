import 'package:pp191225/data/models/room/room_status.dart';
import 'package:pp191225/data/models/room/room_type.dart';
import 'package:pp191225/domain/entities/room/room_member.dart';

class Room {
  final String id;
  final RoomType type;
  final RoomStatus status;
  final int maxMembers;
  final List<RoomMember> members;

  const Room({
    required this.id,
    required this.type,
    required this.status,
    required this.maxMembers,
    required this.members,
  });

  int get currentMemberCount => members.length;
  bool get isFull => currentMemberCount >= maxMembers;
  bool get isWaiting => status == RoomStatus.waiting;
  bool get isActive => status == RoomStatus.active;
}
