import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/video_call_repository.dart';

/// Connect to Video Call UseCase
/// Business Logic: Validates LiveKit URL and token, checks permissions
class ConnectToVideoCallUseCase {
  final VideoCallRepository repository;

  ConnectToVideoCallUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String url,
    required String token,
  }) async {
    // Validation: URL must not be empty
    if (url.trim().isEmpty) {
      return const Left(
        ValidationFailure(message: 'LiveKit URL cannot be empty'),
      );
    }

    // Validation: Token must not be empty
    if (token.trim().isEmpty) {
      return const Left(
        ValidationFailure(message: 'LiveKit token cannot be empty'),
      );
    }

    // Validation: URL must be valid format (ws:// or wss://)
    if (!url.startsWith('ws://') && !url.startsWith('wss://')) {
      return const Left(
        ValidationFailure(message: 'Invalid LiveKit URL format (must be ws:// or wss://)'),
      );
    }

    // Business Logic: Check permissions before connecting
    final permissionsResult = await repository.checkPermissions();
    
    return permissionsResult.fold(
      (failure) => Left(failure),
      (hasPermissions) async {
        if (!hasPermissions) {
          // Try to request permissions
          final requestResult = await repository.requestPermissions();
          return requestResult.fold(
            (failure) => Left(failure),
            (granted) async {
              if (!granted) {
                return const Left(
                  ValidationFailure(
                    message: 'Camera and microphone permissions are required for video call',
                  ),
                );
              }
              
              // Permissions granted, proceed with connection
              return await repository.connectToVideoCall(url, token);
            },
          );
        }
        
        // Permissions already granted, proceed with connection
        return await repository.connectToVideoCall(url, token);
      },
    );
  }
}
