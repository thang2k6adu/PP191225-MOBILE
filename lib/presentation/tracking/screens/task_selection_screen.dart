import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/presentation/tasks/controllers/task_controller.dart';
import 'package:pp191225/presentation/tracking/screens/task_tracking_screen.dart';

/// Screen to select a task after match found
class TaskSelectionScreen extends ConsumerStatefulWidget {
  final String roomId;
  final String opponentName;

  const TaskSelectionScreen({
    super.key,
    required this.roomId,
    required this.opponentName,
  });

  @override
  ConsumerState<TaskSelectionScreen> createState() =>
      _TaskSelectionScreenState();
}

class _TaskSelectionScreenState extends ConsumerState<TaskSelectionScreen> {
  @override
  void initState() {
    super.initState();
    // Load tasks when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(taskControllerProvider.notifier).loadTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskState = ref.watch(taskControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Task to Track'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Match info banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.green.withOpacity(0.1),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Matched with',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        widget.opponentName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Instructions
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Choose a task to work on during this session',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),

          // Task list
          Expanded(
            child: taskState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : taskState.tasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.task_alt, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No tasks available',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Create a task first to start tracking',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: taskState.tasks.length,
                    itemBuilder: (context, index) {
                      final task = taskState.tasks[index];
                      final isDone = task.status == 'DONE';

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          enabled: !isDone,
                          leading: CircleAvatar(
                            backgroundColor: isDone
                                ? Colors.grey
                                : task.status == 'ACTIVE'
                                ? Colors.green
                                : Colors.orange,
                            child: Icon(
                              isDone ? Icons.check : Icons.task_alt,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            task.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: isDone
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                'Est: ${task.estimateHours}h | Status: ${task.status}',
                              ),
                              if (task.progress > 0) ...[
                                const SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: task.progress / 100,
                                  backgroundColor: Colors.grey[300],
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Colors.green,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${task.progress.toStringAsFixed(1)}% complete',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ],
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: isDone ? Colors.grey : Colors.green,
                          ),
                          onTap: isDone
                              ? null
                              : () {
                                  // Navigate to tracking screen
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TaskTrackingScreen(task: task),
                                    ),
                                  );
                                },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
