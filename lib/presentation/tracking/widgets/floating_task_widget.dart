import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/presentation/tracking/controllers/tracking_controller.dart';
import 'package:pp191225/presentation/tracking/widgets/progress_ring.dart';
import 'package:pp191225/presentation/tracking/widgets/session_summary_modal.dart';

/// Floating task widget that displays in corner of room screen
/// Shows active task with timer, progress, and quick actions
class FloatingTaskWidget extends ConsumerStatefulWidget {
  const FloatingTaskWidget({super.key});

  @override
  ConsumerState<FloatingTaskWidget> createState() => _FloatingTaskWidgetState();
}

class _FloatingTaskWidgetState extends ConsumerState<FloatingTaskWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final trackingState = ref.watch(trackingControllerProvider);
    final controller = ref.read(trackingControllerProvider.notifier);

    final task = trackingState.activeTask;
    final session = trackingState.currentSession;

    // Hide widget if no task/session or if session is stopped
    if (task == null || session == null || session.status == 'stopped') {
      return const SizedBox.shrink();
    }

    final currentTime = trackingState.currentTime;
    final formattedTime = controller.formatTime(currentTime);
    final progress = task.progress;
    final isPaused = session.status == 'paused';

    return GestureDetector(
      onTap: _toggleExpanded,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: _isExpanded ? 280 : 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1A1A2E).withOpacity(0.95),
              const Color(0xFF16213E).withOpacity(0.95),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6366F1).withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header with task name
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.task_alt,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        task.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: _isExpanded ? 2 : 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              // Timer and progress
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Progress ring with timer
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ProgressRing(
                            progress: progress / 100,
                            size: 120,
                            strokeWidth: 8,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                formattedTime,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFeatures: [FontFeature.tabularFigures()],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                isPaused ? 'Paused' : 'Active',
                                style: TextStyle(
                                  color: isPaused
                                      ? const Color(0xFFFBBF24)
                                      : const Color(0xFF10B981),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Expanded info
                    if (_isExpanded) ...[
                      const SizedBox(height: 16),
                      _buildExpandedInfo(task, currentTime),
                    ],
                  ],
                ),
              ),

              // Action buttons
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      icon: isPaused ? Icons.play_arrow : Icons.pause,
                      label: isPaused ? 'Resume' : 'Pause',
                      color: const Color(0xFF6366F1),
                      onTap: () {
                        if (isPaused) {
                          controller.resumeSession();
                        } else {
                          controller.pauseSession();
                        }
                      },
                    ),
                    _buildActionButton(
                      icon: Icons.stop,
                      label: 'Stop',
                      color: const Color(0xFFEF4444),
                      onTap: () async {
                        final confirmed = await _showStopConfirmation(context);
                        if (confirmed == true) {
                          final progressBefore = task.progress;
                          await controller.stopSession();

                          // Show session summary modal
                          if (context.mounted) {
                            final updatedState = ref.read(
                              trackingControllerProvider,
                            );
                            final stoppedSession = updatedState.currentSession;

                            final progressAfter =
                                updatedState.activeTask?.progress ??
                                progressBefore;

                            // Only show if we have a valid stopped session
                            if (stoppedSession != null) {
                              await showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => SessionSummaryModal(
                                  session: stoppedSession,
                                  taskName: task.name,
                                  progressBefore: progressBefore,
                                  progressAfter: progressAfter,
                                ),
                              );
                            }
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedInfo(task, int currentTime) {
    final hours = currentTime ~/ 3600;
    final minutes = (currentTime % 3600) ~/ 60;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildInfoRow(
            Icons.trending_up,
            'Progress',
            '${task.progress.toStringAsFixed(0)}%',
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            Icons.access_time,
            'Estimate',
            '${task.estimateHours.toStringAsFixed(0)}h',
          ),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.timer, 'Elapsed', '${hours}h ${minutes}m'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.white.withOpacity(0.6)),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 18),
            if (_isExpanded) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<bool?> _showStopConfirmation(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        title: const Text(
          'Stop Session?',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Are you sure you want to stop this tracking session?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
            ),
            child: const Text('Stop'),
          ),
        ],
      ),
    );
  }
}
