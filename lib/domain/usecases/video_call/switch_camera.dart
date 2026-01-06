import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/video_call_repository.dart';

/// Switch Camera UseCase
/// Business Logic: Switches between front and back camera
class SwitchCameraUseCase {
  final VideoCallRepository repository;

  SwitchCameraUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.switchCamera();
  }
}
