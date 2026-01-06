import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/video_call_repository.dart';

/// Connect to WebSocket for Matchmaking UseCase
/// Business Logic: Validates URL and token before connecting
class ConnectWebSocketUseCase {
  final VideoCallRepository repository;

  ConnectWebSocketUseCase(this.repository);

  Either<Failure, void> call({
    required String url,
    required String token,
  }) {
    // Validation: URL must not be empty
    if (url.trim().isEmpty) {
      return const Left(
        ValidationFailure(message: 'WebSocket URL cannot be empty'),
      );
    }

    // Validation: Token must not be empty
    if (token.trim().isEmpty) {
      return const Left(
        ValidationFailure(message: 'Authentication token cannot be empty'),
      );
    }

    // Validation: URL must be valid format (ws:// or wss://)
    if (!url.startsWith('ws://') && !url.startsWith('wss://') && !url.startsWith('http://') && !url.startsWith('https://')) {
      return const Left(
        ValidationFailure(message: 'Invalid WebSocket URL format'),
      );
    }

    return repository.connectWebSocket(url, token);
  }
}
