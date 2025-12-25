import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/domain/entities/tasks/task.dart';
import 'package:pp191225/presentation/tracking/controllers/tracking_controller.dart';

/// Screen for tracking a task with timer
class TaskTrackingScreen extends ConsumerStatefulWidget {
  final Task task;

  const TaskTrackingScreen({super.key, required this.task});

  @override
  ConsumerState<TaskTrackingScreen> createState() => _TaskTrackingScreenState();
}

class _TaskTrackingScreenState extends ConsumerState<TaskTrackingScreen> {
  @override
  void initState() {
    super.initState();
    // Load progress when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(trackingControllerProvider.notifier)
          .loadProgress(widget.task.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final trackingState = ref.watch(trackingControllerProvider);
    final controller = ref.read(trackingControllerProvider.notifier);

    final session = trackingState.currentSession;
    final isActive = session?.status == 'active';
    final isPaused = session?.status == 'paused';

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Task Tracking'),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          child: const Icon(CupertinoIcons.back),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Task Name
              Text(
                widget.task.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Task Details
              Text(
                'Estimate: ${widget.task.estimateHours}h | Status: ${widget.task.status}',
                style: const TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              const SizedBox(height: 24),

              // Progress Bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Progress',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${widget.task.progress.toStringAsFixed(1)}%',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.activeBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      height: 8,
                      child: LinearProgressIndicator(
                        value: widget.task.progress / 100,
                        backgroundColor: CupertinoColors.systemGrey5,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          CupertinoColors.activeBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Timer Display
              if (session != null) ...[
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        controller.formatTime(trackingState.currentTime),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isActive
                            ? 'Tracking...'
                            : isPaused
                            ? 'Paused'
                            : 'Stopped',
                        style: TextStyle(
                          fontSize: 16,
                          color: isActive
                              ? CupertinoColors.activeGreen
                              : CupertinoColors.systemGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // Control Buttons
              if (session == null || session.status == 'stopped') ...[
                CupertinoButton.filled(
                  onPressed: trackingState.isLoading
                      ? null
                      : () => controller.activateTask(widget.task.id),
                  child: trackingState.isLoading
                      ? const CupertinoActivityIndicator(
                          color: CupertinoColors.white,
                        )
                      : const Text('Start Tracking'),
                ),
              ] else if (isActive) ...[
                Row(
                  children: [
                    Expanded(
                      child: CupertinoButton(
                        color: CupertinoColors.systemOrange,
                        onPressed: trackingState.isLoading
                            ? null
                            : controller.pauseSession,
                        child: const Text('Pause'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CupertinoButton(
                        color: CupertinoColors.systemRed,
                        onPressed: trackingState.isLoading
                            ? null
                            : controller.stopSession,
                        child: const Text('Stop'),
                      ),
                    ),
                  ],
                ),
              ] else if (isPaused) ...[
                Row(
                  children: [
                    Expanded(
                      child: CupertinoButton(
                        color: CupertinoColors.activeGreen,
                        onPressed: trackingState.isLoading
                            ? null
                            : controller.resumeSession,
                        child: const Text('Resume'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CupertinoButton(
                        color: CupertinoColors.systemRed,
                        onPressed: trackingState.isLoading
                            ? null
                            : controller.stopSession,
                        child: const Text('Stop'),
                      ),
                    ),
                  ],
                ),
              ],

              // Error Display
              if (trackingState.error != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemRed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    trackingState.error!,
                    style: const TextStyle(color: CupertinoColors.systemRed),
                  ),
                ),
              ],

              // Session History
              if (trackingState.progressData != null &&
                  trackingState.progressData!.sessions.isNotEmpty) ...[
                const SizedBox(height: 24),
                Container(height: 1, color: CupertinoColors.separator),
                const SizedBox(height: 16),
                const Text(
                  'Session History',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                // Use fixed height ListView instead of Expanded
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: trackingState.progressData!.sessions.length,
                    itemBuilder: (context, index) {
                      final session =
                          trackingState.progressData!.sessions[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey6,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.formatTime(session.duration),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  session.status,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: CupertinoColors.systemGrey,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${session.expEarned} EXP',
                              style: const TextStyle(
                                color: CupertinoColors.activeBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
