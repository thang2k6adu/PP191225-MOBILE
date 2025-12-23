/// Room information entity
class RoomInfo {
  final String roomId;
  final List<String> players;
  final DateTime createdAt;

  const RoomInfo({
    required this.roomId,
    required this.players,
    required this.createdAt,
  });
}
