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
    @JsonKey(name: 'estimateHours', fromJson: _toDouble)
    required double estimateHours,
    required DateTime deadline,
    required String status, // PLANNED, ACTIVE, DONE
    @JsonKey(name: 'isActive') @Default(false) bool isActive,
    @JsonKey(name: 'progress', defaultValue: 0.0)
    @Default(0.0)
    double progress, // 0-100%
    @JsonKey(name: 'totalTimeSpent', defaultValue: 0)
    @Default(0)
    int totalTimeSpent, // Total seconds spent
    @JsonKey(name: 'userId') required String userId,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
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

/// Helper function to convert num to double
double _toDouble(dynamic value) {
  if (value == null) {
    throw ArgumentError('Cannot convert null to double');
  }
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.parse(value);
  // Handle any other numeric type
  return (value as num).toDouble();
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
