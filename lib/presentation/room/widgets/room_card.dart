import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/data/models/room/room_status.dart';
import 'package:jt291_flutter_mobile/domain/entities/room/room.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  final VoidCallback? onTap;
  final bool isCurrentRoom;

  const RoomCard({
    super.key,
    required this.room,
    this.onTap,
    this.isCurrentRoom = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isCurrentRoom ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isCurrentRoom
            ? const BorderSide(color: Color(0xFF6366F1), width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _getIconColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getIcon(),
                  color: _getIconColor(),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),

              // Room Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getRoomTitle(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getRoomSubtitle(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              // Status
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${room.currentMemberCount}/${room.maxMembers}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _getStatusColor(),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _getStatusText(),
                          style: TextStyle(
                            fontSize: 12,
                            color: _getStatusColor(),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIcon() {
    // You can customize icons based on room type or other properties
    return Icons.book;
  }

  Color _getIconColor() {
    return const Color(0xFF6366F1);
  }

  String _getRoomTitle() {
    return 'Room ${room.id.substring(0, 8)}';
  }

  String _getRoomSubtitle() {
    return 'Study Session';
  }

  Color _getStatusColor() {
    switch (room.status) {
      case RoomStatus.waiting:
        return Colors.orange;
      case RoomStatus.active:
        return Colors.green;
      case RoomStatus.closed:
        return Colors.grey;
    }
  }

  String _getStatusText() {
    switch (room.status) {
      case RoomStatus.waiting:
        return 'Waiting';
      case RoomStatus.active:
        return 'Active';
      case RoomStatus.closed:
        return 'Closed';
    }
  }
}
