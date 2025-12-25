import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/domain/usecases/tracking/activate_task_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/get_progress_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/pause_session_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/resume_session_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/stop_session_usecase.dart';
import 'package:pp191225/presentation/tracking/controllers/tracking_state.dart';
import 'package:pp191225/providers/usecases_provider.dart';

final trackingControllerProvider =
    AutoDisposeNotifierProvider<TrackingController, TrackingState>(
      TrackingController.new,
    );

/// Controller for tracking feature
/// Manages tracking session state and timer
class TrackingController extends AutoDisposeNotifier<TrackingState> {
  late final ActivateTaskUseCase _activateTaskUseCase;
  late final PauseSessionUseCase _pauseSessionUseCase;
  late final ResumeSessionUseCase _resumeSessionUseCase;
  late final StopSessionUseCase _stopSessionUseCase;
  late final GetProgressUseCase _getProgressUseCase;

  Timer? _timer;

  @override
  TrackingState build() {
    _activateTaskUseCase = ref.read(activateTaskUseCaseProvider);
    _pauseSessionUseCase = ref.read(pauseSessionUseCaseProvider);
    _resumeSessionUseCase = ref.read(resumeSessionUseCaseProvider);
    _stopSessionUseCase = ref.read(stopSessionUseCaseProvider);
    _getProgressUseCase = ref.read(getProgressUseCaseProvider);

    // Clean up timer when controller is disposed
    ref.onDispose(() {
      _timer?.cancel();
    });

    return const TrackingState();
  }

  /// Activate a task and start tracking
  Future<void> activateTask(String taskId) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _activateTaskUseCase(taskId);

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (response) {
        state = state.copyWith(
          isLoading: false,
          activeTask: response.task,
          currentSession: response.session,
          error: null,
        );

        // Start timer
        _startTimer(response.session.startTime);
      },
    );
  }

  /// Pause the current session
  Future<void> pauseSession() async {
    if (state.currentSession == null) return;

    state = state.copyWith(isLoading: true, error: null);

    final result = await _pauseSessionUseCase(state.currentSession!.id);

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (session) {
        state = state.copyWith(
          isLoading: false,
          currentSession: session,
          error: null,
        );

        // Stop timer
        _stopTimer();
      },
    );
  }

  /// Resume the current session
  Future<void> resumeSession() async {
    if (state.currentSession == null) return;

    state = state.copyWith(isLoading: true, error: null);

    final result = await _resumeSessionUseCase(state.currentSession!.id);

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (session) {
        state = state.copyWith(
          isLoading: false,
          currentSession: session,
          error: null,
        );

        // Resume timer
        _startTimer(session.startTime);
      },
    );
  }

  /// Stop the current session
  Future<void> stopSession() async {
    if (state.currentSession == null) return;

    state = state.copyWith(isLoading: true, error: null);

    final result = await _stopSessionUseCase(state.currentSession!.id);

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (stopResult) {
        // Merge with current session to preserve taskId/userId if they are missing in response
        final mergedSession =
            state.currentSession?.copyWith(
              endTime: stopResult.session.endTime,
              duration: stopResult.session.duration,
              status: 'stopped',
              expEarned: stopResult.session.expEarned,
            ) ??
            stopResult.session;

        // Update active task progress from stop result
        final updatedTask = state.activeTask?.copyWith(
          progress: stopResult.progress,
        );

        state = state.copyWith(
          isLoading: false,
          currentSession: mergedSession,
          activeTask: updatedTask,
          error: null,
        );

        // Stop timer
        _stopTimer();

        // No need to loadProgress anymore as stopSession returns updated progress
      },
    );
  }

  /// Load progress for a task
  /// Silently fails if no progress data exists yet (404 is normal)
  Future<void> loadProgress(String taskId) async {
    final result = await _getProgressUseCase(taskId);

    result.fold(
      (failure) {
        // Don't show error for 404 - it's normal if no tracking session exists yet
        // Only show error for other failures
        if (!failure.message.contains('404')) {
          state = state.copyWith(error: failure.message);
        }
      },
      (progressData) {
        state = state.copyWith(
          progressData: progressData,
          currentSession: progressData.currentSession,
        );

        // If there's an active session, start the timer
        if (progressData.currentSession != null &&
            progressData.currentSession!.status == 'active') {
          _startTimer(progressData.currentSession!.startTime);
        }
      },
    );
  }

  /// Start the timer
  void _startTimer(DateTime startTime) {
    _stopTimer(); // Stop any existing timer

    // Update time immediately
    _updateCurrentTime(startTime);

    // Update every second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateCurrentTime(startTime);
    });
  }

  /// Stop the timer
  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  /// Update current time based on start time
  void _updateCurrentTime(DateTime startTime) {
    final elapsed = DateTime.now().difference(startTime).inSeconds;
    state = state.copyWith(currentTime: elapsed);
  }

  /// Format seconds to HH:MM:SS
  String formatTime(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}
