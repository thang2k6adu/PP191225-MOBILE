import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/tasks/task.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

/// Task Data Transfer Object
/// Used for JSON serialization/deserialization
@freezed
abstract class TaskDto with _$TaskDto {
  const TaskDto._();

  const factory TaskDto({
    required String id,
    required String name,
    required double estimateHours,
    required DateTime deadline,
    required String status, // PLANNED, ACTIVE, DONE
    @Default(false) bool isActive,
    @Default(0.0) double progress, // 0-100%
    @Default(0) int totalTimeSpent, // Total seconds spent
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, Object?> json) =>
      _$TaskDtoFromJson(json);

  /// Convert DTO to Domain Entity
  Task toEntity() {
    return Task(
      id: id,
      name: name,
      estimateHours: estimateHours,
      deadline: deadline,
      status: status,
      isActive: isActive,
      progress: progress,
      totalTimeSpent: totalTimeSpent,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// Extension to convert Domain Entity to DTO
extension TaskToDto on Task {
  TaskDto toDto() {
    return TaskDto(
      id: id,
      name: name,
      estimateHours: estimateHours,
      deadline: deadline,
      status: status,
      isActive: isActive,
      progress: progress,
      totalTimeSpent: totalTimeSpent,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
