import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as IO;

/// WebSocket Service for real-time communication
/// Handles matchmaking events and room notifications
class SocketService {
  IO.Socket? _socket;
  String? _currentRoomId;

  // Stream controllers for events
  final _matchFoundController = StreamController<Map<String, dynamic>>.broadcast();
  final _queueJoinedController = StreamController<Map<String, dynamic>>.broadcast();
  final _opponentDisconnectedController = StreamController<Map<String, dynamic>>.broadcast();
  final _opponentLeftController = StreamController<Map<String, dynamic>>.broadcast();

  // Public streams
  Stream<Map<String, dynamic>> get onMatchFound => _matchFoundController.stream;
  Stream<Map<String, dynamic>> get onQueueJoined => _queueJoinedController.stream;
  Stream<Map<String, dynamic>> get onOpponentDisconnected => _opponentDisconnectedController.stream;
  Stream<Map<String, dynamic>> get onOpponentLeft => _opponentLeftController.stream;

  bool get isConnected => _socket?.connected ?? false;
  String? get currentRoomId => _currentRoomId;

  /// Connect to WebSocket server
  /// [url] - WebSocket server URL
  /// [token] - JWT token for authentication
  void connect(String url, String token) {
    if (_socket != null && _socket!.connected) {
      print('⚠️ Socket already connected');
      return;
    }

    _socket = IO.io(
      url,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({'token': 'Bearer $token'})
          .enableAutoConnect()
          .setReconnectionAttempts(5)
          .setReconnectionDelay(1000)
          .build(),
    );

    _setupListeners();
    _socket!.connect();
  }

  void _setupListeners() {
    _socket!.onConnect((_) {
      print('✅ Socket connected');
    });

    _socket!.onDisconnect((reason) {
      print('❌ Socket disconnected: $reason');
    });

    _socket!.onConnectError((error) {
      print('❌ Socket connection error: $error');
    });

    _socket!.onError((error) {
      print('❌ Socket error: $error');
    });

    // Listen to matchmaking events
    _socket!.on('queue-joined', (data) {
      print('📝 Queue joined: $data');
      _queueJoinedController.add(data as Map<String, dynamic>);
    });

    _socket!.on('match_found', (data) {
      print('🎉 Match found: $data');
      final matchData = data as Map<String, dynamic>;
      _currentRoomId = matchData['roomId'];
      _matchFoundController.add(matchData);
    });

    _socket!.on('opponent_disconnected', (data) {
      print('❌ Opponent disconnected: $data');
      _opponentDisconnectedController.add(data as Map<String, dynamic>);
    });

    _socket!.on('opponent_left', (data) {
      print('👋 Opponent left: $data');
      _opponentLeftController.add(data as Map<String, dynamic>);
    });
  }

  /// Emit join matchmaking event
  void joinMatchmaking({String? userName}) {
    if (_socket == null || !_socket!.connected) {
      print('❌ Socket not connected, cannot join matchmaking');
      return;
    }

    final data = <String, dynamic>{};
    if (userName != null) {
      data['userName'] = userName;
    }

    _socket!.emit('join-matchmaking', data);
    print('📤 Emitted: join-matchmaking');
  }

  /// Emit cancel matchmaking event
  void cancelMatchmaking() {
    if (_socket == null || !_socket!.connected) {
      print('❌ Socket not connected, cannot cancel matchmaking');
      return;
    }

    _socket!.emit('cancel-matchmaking');
    print('📤 Emitted: cancel-matchmaking');
  }

  /// Emit leave room event
  void leaveRoom(String roomId) {
    if (_socket == null || !_socket!.connected) {
      print('❌ Socket not connected, cannot leave room');
      return;
    }

    _socket!.emit('leave-room', {'roomId': roomId});
    _currentRoomId = null;
    print('📤 Emitted: leave-room ($roomId)');
  }

  /// Disconnect from WebSocket server
  void disconnect() {
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
    _currentRoomId = null;
    print('🔌 Socket disconnected');
  }

  /// Dispose resources
  void dispose() {
    disconnect();
    _matchFoundController.close();
    _queueJoinedController.close();
    _opponentDisconnectedController.close();
    _opponentLeftController.close();
  }
}
