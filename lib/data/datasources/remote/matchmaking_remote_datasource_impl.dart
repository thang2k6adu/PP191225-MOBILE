import 'dart:async';
import 'package:pp191225/core/constants/api_endpoints.dart';
import 'package:pp191225/data/datasources/remote/matchmaking_remote_datasource.dart';
import 'package:pp191225/data/models/base/api_response.dart';
import 'package:pp191225/data/models/matchmaking/match_found_dto.dart';
import 'package:pp191225/data/models/matchmaking/matchmaking_response_dto.dart';
import 'package:pp191225/data/models/matchmaking/matchmaking_status_dto.dart';
import 'package:pp191225/data/models/matchmaking/opponent_event_dto.dart';
import 'package:pp191225/data/models/matchmaking/room_event_dto.dart';
import 'package:pp191225/data/services/api_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MatchmakingRemoteDataSourceImpl implements MatchmakingRemoteDataSource {
  final ApiService apiService;
  IO.Socket? _socket;

  // Stream controllers for WebSocket events
  final _matchFoundController = StreamController<MatchFoundDto>.broadcast();
  final _opponentDisconnectedController =
      StreamController<OpponentEventDto>.broadcast();
  final _opponentLeftController =
      StreamController<OpponentEventDto>.broadcast();
  final _roomJoinedController = StreamController<RoomEventDto>.broadcast();
  final _roomLeftController = StreamController<RoomEventDto>.broadcast();
  final _errorController = StreamController<String>.broadcast();

  MatchmakingRemoteDataSourceImpl(this.apiService);

  // REST API implementations
  @override
  Future<MatchmakingResponseDto> joinMatchmaking() async {
    final response = await apiService.dio.post(ApiEndpoints.matchmakingJoin);
    final parsed = ApiResponse<MatchmakingResponseDto>.fromJson(
      response.data,
      (data) => MatchmakingResponseDto.fromJson(data as Map<String, dynamic>),
    );
    return parsed.data!;
  }

  @override
  Future<void> cancelMatchmaking() async {
    await apiService.dio.post(ApiEndpoints.matchmakingCancel);
  }

  @override
  Future<MatchmakingStatusDto> getStatus() async {
    final response = await apiService.dio.get(ApiEndpoints.matchmakingStatus);
    final parsed = ApiResponse<MatchmakingStatusDto>.fromJson(
      response.data,
      (data) => MatchmakingStatusDto.fromJson(data as Map<String, dynamic>),
    );
    return parsed.data!;
  }

  // WebSocket implementations
  @override
  Future<void> connectWebSocket(String token) async {
    if (_socket != null && _socket!.connected) {
      return; // Already connected
    }

    // Get base URL from ApiService
    final baseUrl = apiService.dio.options.baseUrl;
    final wsUrl = baseUrl.replaceFirst(RegExp(r'/api$'), '');

    _socket = IO.io(
      '$wsUrl/matchmaking',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .setAuth({'token': token})
          .build(),
    );

    // Setup event listeners
    _socket!.onConnect((_) {
      print('[Matchmaking WebSocket] Connected');
    });

    _socket!.on('connected', (data) {
      print('[Matchmaking WebSocket] Server confirmed connection: $data');
    });

    _socket!.on('match_found', (data) {
      print('[Matchmaking WebSocket] ========================================');
      print('[Matchmaking WebSocket] MATCH_FOUND EVENT RECEIVED!');
      print('[Matchmaking WebSocket] Raw data: $data');
      print(
        '[Matchmaking WebSocket] Stream has listeners: ${_matchFoundController.hasListener}',
      );
      try {
        final dto = MatchFoundDto.fromJson(data as Map<String, dynamic>);
        print(
          '[Matchmaking WebSocket] Parsed DTO: roomId=${dto.roomId}, opponent=${dto.opponentName}',
        );
        print('[Matchmaking WebSocket] Adding to stream controller...');
        _matchFoundController.add(dto);
        print('[Matchmaking WebSocket] Event added to stream successfully');
        print(
          '[Matchmaking WebSocket] ========================================',
        );
      } catch (e) {
        print('[Matchmaking WebSocket] ERROR parsing match_found: $e');
        print('[Matchmaking WebSocket] Stack trace: ${StackTrace.current}');
        _errorController.add('Failed to parse match_found: $e');
      }
    });

    _socket!.on('opponent_disconnected', (data) {
      print('[Matchmaking WebSocket] Opponent disconnected: $data');
      try {
        final dto = OpponentEventDto.fromJson(data as Map<String, dynamic>);
        _opponentDisconnectedController.add(dto);
      } catch (e) {
        _errorController.add('Failed to parse opponent_disconnected: $e');
      }
    });

    _socket!.on('opponent_left', (data) {
      print('[Matchmaking WebSocket] Opponent left: $data');
      try {
        final dto = OpponentEventDto.fromJson(data as Map<String, dynamic>);
        _opponentLeftController.add(dto);
      } catch (e) {
        _errorController.add('Failed to parse opponent_left: $e');
      }
    });

    _socket!.on('room_joined', (data) {
      try {
        final dto = RoomEventDto.fromJson(data as Map<String, dynamic>);
        _roomJoinedController.add(dto);
      } catch (e) {
        _errorController.add('Failed to parse room_joined: $e');
      }
    });

    _socket!.on('room_left', (data) {
      try {
        final dto = RoomEventDto.fromJson(data as Map<String, dynamic>);
        _roomLeftController.add(dto);
      } catch (e) {
        _errorController.add('Failed to parse room_left: $e');
      }
    });

    _socket!.on('error', (data) {
      print('[Matchmaking WebSocket] Error: $data');
      _errorController.add(data.toString());
    });

    _socket!.onDisconnect((_) {
      print('[Matchmaking WebSocket] Disconnected');
    });

    _socket!.connect();

    // Wait for connection with timeout
    await _waitForConnection();
  }

  Future<void> _waitForConnection() async {
    const timeout = Duration(seconds: 10);
    final startTime = DateTime.now();

    while (!isConnected) {
      if (DateTime.now().difference(startTime) > timeout) {
        throw Exception('WebSocket connection timeout');
      }
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  @override
  void disconnectWebSocket() {
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
  }

  @override
  bool get isConnected => _socket?.connected ?? false;

  // Stream getters
  @override
  Stream<MatchFoundDto> get onMatchFound {
    print(
      '[Matchmaking DataSource] onMatchFound stream accessed, hasListener: ${_matchFoundController.hasListener}',
    );
    return _matchFoundController.stream;
  }

  @override
  Stream<OpponentEventDto> get onOpponentDisconnected =>
      _opponentDisconnectedController.stream;

  @override
  Stream<OpponentEventDto> get onOpponentLeft => _opponentLeftController.stream;

  @override
  Stream<RoomEventDto> get onRoomJoined => _roomJoinedController.stream;

  @override
  Stream<RoomEventDto> get onRoomLeft => _roomLeftController.stream;

  @override
  Stream<String> get onError => _errorController.stream;

  // Emit events to server
  @override
  void joinRoom(String roomId) {
    _socket?.emit('join_room', {'roomId': roomId});
  }

  @override
  void leaveRoom() {
    _socket?.emit('leave_room', {});
  }

  // Cleanup
  void dispose() {
    disconnectWebSocket();
    _matchFoundController.close();
    _opponentDisconnectedController.close();
    _opponentLeftController.close();
    _roomJoinedController.close();
    _roomLeftController.close();
    _errorController.close();
  }
}
