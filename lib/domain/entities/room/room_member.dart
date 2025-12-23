import 'package:jt291_flutter_mobile/data/models/room/room_member_status.dart';

class RoomMember {
  final String userId;
  final RoomMemberStatus status;

  const RoomMember({
    required this.userId,
    required this.status,
  });
}
