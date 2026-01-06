import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/video_call_repository.dart';

/// Disconnect from Video Call UseCase
/// Business Logic: Ensures proper cleanup
class DisconnectFromVideoCallUseCase {
  final VideoCallRepository repository;

  DisconnectFromVideoCallUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.disconnectFromVideoCall();
  }
}
