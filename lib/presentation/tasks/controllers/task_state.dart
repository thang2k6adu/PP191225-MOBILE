import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/tasks/task.dart';

part 'task_state.freezed.dart';

@freezed
abstract class TaskState with _$TaskState {
  const TaskState._();

  const factory TaskState({
    @Default([]) List<Task> tasks,
    @Default(false) bool isLoading,
    String? error,
  }) = _TaskState;

  /// Get the currently active task from the list
  Task? get activeTask {
    try {
      return tasks.firstWhere((task) => task.isActive);
    } catch (e) {
      return null;
    }
  }
}
