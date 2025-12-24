import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/domain/usecases/tasks/create_task_usecase.dart';
import 'package:pp191225/domain/usecases/tasks/get_tasks_usecase.dart';
import 'package:pp191225/presentation/tasks/controllers/task_state.dart';
import 'package:pp191225/providers/usecases_provider.dart';

final taskControllerProvider =
    AutoDisposeNotifierProvider<TaskController, TaskState>(TaskController.new);

class TaskController extends AutoDisposeNotifier<TaskState> {
  late final GetTasksUseCase _getTasksUseCase;
  late final CreateTaskUseCase _createTaskUseCase;

  @override
  TaskState build() {
    _getTasksUseCase = ref.read(getTasksUseCaseProvider);
    _createTaskUseCase = ref.read(createTaskUseCaseProvider);

    // Auto-load tasks when controller is initialized
    loadTasks();

    return const TaskState();
  }

  /// Load all tasks from the repository
  Future<void> loadTasks() async {
    print('🔍 TaskController - Starting loadTasks...');
    state = state.copyWith(isLoading: true, error: null);

    final result = await _getTasksUseCase();

    result.fold(
      (failure) {
        print('🔍 TaskController - Load failed: ${failure.message}');
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (tasks) {
        print('🔍 TaskController - Load success: ${tasks.length} tasks');
        for (var task in tasks) {
          print('  - Task: ${task.name}, status: ${task.status}');
        }
        state = state.copyWith(isLoading: false, tasks: tasks, error: null);
        print(
          '🔍 TaskController - State updated, tasks count: ${state.tasks.length}',
        );
      },
    );
  }

  /// Create a new task
  Future<bool> createTask({
    required String name,
    required DateTime deadline,
    required double estimateHours,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _createTaskUseCase(
      name: name,
      deadline: deadline,
      estimateHours: estimateHours,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
        return false;
      },
      (newTask) {
        // Add the new task to the list
        final updatedTasks = [...state.tasks, newTask];
        state = state.copyWith(
          isLoading: false,
          tasks: updatedTasks,
          error: null,
        );
        return true;
      },
    );
  }
}
