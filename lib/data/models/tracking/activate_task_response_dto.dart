import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/data/models/tasks/task_dto.dart';
import 'package:pp191225/data/models/tracking/tracking_session_dto.dart';
import 'package:pp191225/domain/entities/tracking/activate_task_response.dart';

part 'activate_task_response_dto.freezed.dart';
part 'activate_task_response_dto.g.dart';

/// ActivateTaskResponse Data Transfer Object
/// Contains both task and session after activation
@freezed
abstract class ActivateTaskResponseDto with _$ActivateTaskResponseDto {
  const ActivateTaskResponseDto._();

  const factory ActivateTaskResponseDto({
    required TaskDto task,
    required TrackingSessionDto session,
  }) = _ActivateTaskResponseDto;

  factory ActivateTaskResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ActivateTaskResponseDtoFromJson(json);

  /// Convert DTO to Domain Entity
  ActivateTaskResponse toEntity() {
    return ActivateTaskResponse(
      task: task.toEntity(),
      session: session.toEntity(),
    );
  }
}
