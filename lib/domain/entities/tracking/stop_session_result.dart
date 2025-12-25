import 'package:pp191225/domain/entities/tracking/tracking_session.dart';

class StopSessionResult {
  final TrackingSession session;
  final double previousProgress;
  final double progress;

  const StopSessionResult({
    required this.session,
    required this.previousProgress,
    required this.progress,
  });
}
