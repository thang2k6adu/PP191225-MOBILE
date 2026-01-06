import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/video_call_repository.dart';

/// Toggle Camera UseCase
/// Business Logic: Toggles camera on/off
class ToggleCameraUseCase {
  final VideoCallRepository repository;

  ToggleCameraUseCase(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.toggleCamera();
  }
}
