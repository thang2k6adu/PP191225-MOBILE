import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/video_call_repository.dart';

/// Toggle Microphone UseCase
/// Business Logic: Toggles microphone on/off
class ToggleMicrophoneUseCase {
  final VideoCallRepository repository;

  ToggleMicrophoneUseCase(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.toggleMicrophone();
  }
}
