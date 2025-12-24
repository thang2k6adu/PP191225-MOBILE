import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/presentation/tasks/controllers/task_controller.dart';
import 'package:pp191225/presentation/tasks/widgets/create_task_bottom_sheet.dart';
import 'package:pp191225/presentation/tasks/widgets/task_empty_state_widget.dart';
import 'package:pp191225/presentation/tasks/widgets/task_item_widget.dart';

class TaskListScreen extends ConsumerStatefulWidget {
  const TaskListScreen({super.key});

  @override
  ConsumerState<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends ConsumerState<TaskListScreen> {
  @override
  void initState() {
    super.initState();
    // Load tasks when screen is first displayed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(taskControllerProvider.notifier).loadTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskState = ref.watch(taskControllerProvider);
    final taskController = ref.read(taskControllerProvider.notifier);

    print(
      '🔍 TaskListScreen - Building with ${taskState.tasks.length} tasks, isLoading: ${taskState.isLoading}',
    );

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('My Tasks'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => _showCreateTaskSheet(context, ref),
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      child: SafeArea(
        child: taskState.isLoading && taskState.tasks.isEmpty
            ? const Center(child: CupertinoActivityIndicator())
            : taskState.tasks.isEmpty
            ? const TaskEmptyStateWidget()
            : CustomScrollView(
                slivers: [
                  CupertinoSliverRefreshControl(
                    onRefresh: () => taskController.loadTasks(),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final task = taskState.tasks[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: TaskItemWidget(task: task),
                        );
                      }, childCount: taskState.tasks.length),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _showCreateTaskSheet(BuildContext context, WidgetRef ref) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => const CreateTaskBottomSheet(),
    );
  }
}
