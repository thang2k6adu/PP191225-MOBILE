import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/domain/entities/matchmaking/match_data.dart';
import 'package:pp191225/presentation/matchmaking/controllers/matchmaking_controller.dart';
import 'package:pp191225/presentation/tracking/controllers/tracking_controller.dart';
import 'package:pp191225/presentation/tracking/widgets/task_selection_dialog.dart';
import 'package:pp191225/presentation/tracking/widgets/floating_task_widget.dart';
import 'package:pp191225/presentation/tracking/widgets/session_summary_modal.dart';
import 'package:pp191225/presentation/video_call/screens/video_call_screen.dart';
import 'package:pp191225/providers/datasources_provider.dart';

class InRoomWidget extends ConsumerStatefulWidget {
  final MatchData? matchData;

  const InRoomWidget({super.key, required this.matchData});

  @override
  ConsumerState<InRoomWidget> createState() => _InRoomWidgetState();
}

class _InRoomWidgetState extends ConsumerState<InRoomWidget> {
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    // Auto navigate to video call after match found
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!_hasNavigated && 
          widget.matchData != null && 
          widget.matchData!.livekitToken != null &&
          widget.matchData!.livekitUrl != null &&
          mounted) {
        _hasNavigated = true;
        
        // Navigate to video call with LiveKit token and URL from match data
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoCallScreen(
              livekitUrl: widget.matchData!.livekitUrl!,
              livekitToken: widget.matchData!.livekitToken!,
              roomId: widget.matchData!.roomId,
              opponentName: widget.matchData!.opponentName,
            ),
          ),
        );
      }
    });
  }

  Future<bool> _handleLeaveRoom(BuildContext context, WidgetRef ref) async {
    final trackingState = ref.read(trackingControllerProvider);
    final hasActiveSession =
        trackingState.currentSession != null &&
        trackingState.currentSession!.status != 'stopped';

    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        title: const Text('Leave Room?', style: TextStyle(color: Colors.white)),
        content: Text(
          hasActiveSession
              ? 'Leaving will stop your active tracking session. Continue?'
              : 'Are you sure you want to leave this room?',
          style: const TextStyle(color: Colors.white70),
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
            child: const Text('Leave'),
          ),
        ],
      ),
    );

    if (confirmed != true) return false;

    // If has active session, stop it and show summary
    if (hasActiveSession && context.mounted) {
      final task = trackingState.activeTask;
      final session = trackingState.currentSession;

      if (task != null && session != null) {
        final progressBefore = task.progress;

        // Stop the session
        await ref.read(trackingControllerProvider.notifier).stopSession();

        // Show session summary
        if (context.mounted) {
          final updatedState = ref.read(trackingControllerProvider);
          final stoppedSession = updatedState.currentSession;

          final progressAfter =
              updatedState.activeTask?.progress ?? progressBefore;

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
    }

    // Leave the room
    if (context.mounted) {
      ref.read(matchmakingControllerProvider.notifier).leaveRoom();
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.matchData == null) {
      return const Center(child: Text('No match data available'));
    }

    final trackingState = ref.watch(trackingControllerProvider);
    final hasActiveSession =
        trackingState.currentSession != null &&
        trackingState.currentSession!.status != 'stopped';

    return WillPopScope(
      onWillPop: () => _handleLeaveRoom(context, ref),
      child: Stack(
        children: [
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Success icon
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.withOpacity(0.2),
                          Colors.green.withOpacity(0.1),
                        ],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      size: 64,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Title
                  Text(
                    'Match Found!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Match info card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.grey[100]!, Colors.grey[50]!],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey[300]!, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Opponent info
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(
                                      context,
                                    ).primaryColor.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Text(
                                  (widget.matchData!.opponentName ?? 'U')[0]
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Opponent',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.matchData!.opponentName ?? 'Unknown Player',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),

                        // Room info
                        Row(
                          children: [
                            const Icon(
                              Icons.meeting_room,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Room ID:',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                widget.matchData!.roomId,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Start button - Shows dialog instead of navigating
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: hasActiveSession
                          ? null
                          : () async {
                              // Show task selection dialog
                              final selectedTask = await showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) =>
                                    const TaskSelectionDialog(),
                              );

                              if (selectedTask != null && context.mounted) {
                                // Activate the selected task
                                await ref
                                    .read(trackingControllerProvider.notifier)
                                    .activateTask(selectedTask.id);

                                // Show success message
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Started tracking: ${selectedTask.name}',
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              }
                            },
                      icon: Icon(
                        hasActiveSession
                            ? Icons.check_circle
                            : Icons.play_arrow,
                      ),
                      label: Text(
                        hasActiveSession ? 'Task Active' : 'Start Tracking',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hasActiveSession
                            ? Colors.grey
                            : Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Leave button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton.icon(
                      onPressed: () => _handleLeaveRoom(context, ref),
                      icon: const Icon(Icons.exit_to_app),
                      label: const Text(
                        'Leave Room',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Floating task widget overlay (top-right corner)
          if (hasActiveSession)
            Positioned(top: 16, right: 16, child: const FloatingTaskWidget()),
        ],
      ),
    );
  }
}
