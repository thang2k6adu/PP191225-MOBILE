/// Task entity - Pure Dart class without JSON serialization
/// This represents the business object in the domain layer
class Task {
  final String id;
  final String name;
  final double estimateHours;
  final DateTime deadline;
  final String status; // PLANNED, ACTIVE, DONE
  final bool isActive;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Task({
    required this.id,
    required this.name,
    required this.estimateHours,
    required this.deadline,
    required this.status,
    required this.isActive,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.id == id &&
        other.name == name &&
        other.estimateHours == estimateHours &&
        other.deadline == deadline &&
        other.status == status &&
        other.isActive == isActive &&
        other.userId == userId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        estimateHours.hashCode ^
        deadline.hashCode ^
        status.hashCode ^
        isActive.hashCode ^
        userId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  Task copyWith({
    String? id,
    String? name,
    double? estimateHours,
    DateTime? deadline,
    String? status,
    bool? isActive,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      estimateHours: estimateHours ?? this.estimateHours,
      deadline: deadline ?? this.deadline,
      status: status ?? this.status,
      isActive: isActive ?? this.isActive,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'Task(id: $id, name: $name, estimateHours: $estimateHours, deadline: $deadline, status: $status, isActive: $isActive)';
  }
}
