import 'package:pp191225/data/models/room/room_member_status.dart';

class RoomMember {
  final String userId;
  final RoomMemberStatus status;

  const RoomMember({required this.userId, required this.status});
}
