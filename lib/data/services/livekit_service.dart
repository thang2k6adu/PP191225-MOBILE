import 'dart:async';
import 'package:livekit_client/livekit_client.dart';
import 'package:permission_handler/permission_handler.dart';

/// LiveKit Service for video call management
/// Handles room connection, camera/microphone controls
class LiveKitService {
  Room? _room;
  
  // Stream controllers for events
  final _participantConnectedController = StreamController<Participant>.broadcast();
  final _participantDisconnectedController = StreamController<Participant>.broadcast();
  final _roomStateChangedController = StreamController<ConnectionState>.broadcast();

  // Public streams
  Stream<Participant> get onParticipantConnected => _participantConnectedController.stream;
  Stream<Participant> get onParticipantDisconnected => _participantDisconnectedController.stream;
  Stream<ConnectionState> get onRoomStateChanged => _roomStateChangedController.stream;

  Room? get room => _room;
  LocalParticipant? get localParticipant => _room?.localParticipant;
  bool get isConnected => _room != null && _room!.connectionState == ConnectionState.connected;

  /// Request camera and microphone permissions
  Future<bool> requestPermissions() async {
    final statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    final cameraGranted = statuses[Permission.camera]?.isGranted ?? false;
    final micGranted = statuses[Permission.microphone]?.isGranted ?? false;

    return cameraGranted && micGranted;
  }

  /// Check if permissions are granted
  Future<bool> checkPermissions() async {
    final cameraStatus = await Permission.camera.status;
    final micStatus = await Permission.microphone.status;

    return cameraStatus.isGranted && micStatus.isGranted;
  }

  /// Connect to LiveKit room
  /// [url] - LiveKit server URL (ws:// or wss://)
  /// [token] - JWT token for room access
  Future<void> connect(String url, String token) async {
    if (_room != null) {
      print('⚠️ Room already exists, disconnecting first');
      await disconnect();
    }

    // Check permissions
    final hasPermissions = await checkPermissions();
    if (!hasPermissions) {
      final granted = await requestPermissions();
      if (!granted) {
        throw Exception('Camera and microphone permissions are required');
      }
    }

    try {
      // Create room
      _room = Room();

      // Setup listeners
      _setupListeners();

      // Connect to room
      await _room!.connect(url, token);
      print('✅ Connected to LiveKit room');

      // Enable camera and microphone by default
      await _room!.localParticipant?.setCameraEnabled(true);
      await _room!.localParticipant?.setMicrophoneEnabled(true);
      
      print('📹 Camera and microphone enabled');
    } catch (e) {
      print('❌ Failed to connect to LiveKit: $e');
      await disconnect();
      rethrow;
    }
  }

  void _setupListeners() {
    if (_room == null) return;

    // Room state changes
    _room!.addListener(() {
      _roomStateChangedController.add(_room!.connectionState);
    });

    // Participant connected
    _room!.addListener(() {
      for (var participant in _room!.remoteParticipants.values) {
        print('👤 Participant: ${participant.identity}');
        _participantConnectedController.add(participant);
      }
    });

    // Note: Track subscription events are handled automatically by LiveKit
  }

  /// Toggle camera on/off
  Future<void> toggleCamera() async {
    if (_room?.localParticipant == null) {
      print('⚠️ Local participant not found');
      return;
    }

    final enabled = _room!.localParticipant!.isCameraEnabled();
    await _room!.localParticipant!.setCameraEnabled(!enabled);
    print('📹 Camera ${!enabled ? 'enabled' : 'disabled'}');
  }

  /// Toggle microphone on/off
  Future<void> toggleMicrophone() async {
    if (_room?.localParticipant == null) {
      print('⚠️ Local participant not found');
      return;
    }

    final enabled = _room!.localParticipant!.isMicrophoneEnabled();
    await _room!.localParticipant!.setMicrophoneEnabled(!enabled);
    print('🎤 Microphone ${!enabled ? 'enabled' : 'disabled'}');
  }

  /// Switch between front and back camera
  Future<void> switchCamera() async {
    if (_room?.localParticipant == null) {
      print('⚠️ Local participant not found');
      return;
    }

    try {
      // Get current video track
      final videoTrack = _room!.localParticipant!.videoTrackPublications
          .where((pub) => pub.track != null)
          .map((pub) => pub.track as LocalVideoTrack)
          .firstOrNull;
      
      if (videoTrack != null) {
        // switchCamera() requires parameter in livekit_client 2.0
        // TODO: Implement proper camera switching with CameraPosition
        print('🔄 Camera switch not yet implemented');
      }
    } catch (e) {
      print('❌ Failed to switch camera: $e');
    }
  }

  /// Get current camera state
  bool isCameraEnabled() {
    return _room?.localParticipant?.isCameraEnabled() ?? false;
  }

  /// Get current microphone state
  bool isMicrophoneEnabled() {
    return _room?.localParticipant?.isMicrophoneEnabled() ?? false;
  }

  /// Get remote participants
  List<RemoteParticipant> getRemoteParticipants() {
    return _room?.remoteParticipants.values.toList() ?? [];
  }

  /// Disconnect from room
  Future<void> disconnect() async {
    if (_room == null) return;

    try {
      await _room!.disconnect();
      await _room!.dispose();
      _room = null;
      print('🔌 Disconnected from LiveKit room');
    } catch (e) {
      print('❌ Error disconnecting from room: $e');
    }
  }

  /// Dispose resources
  void dispose() {
    disconnect();
    _participantConnectedController.close();
    _participantDisconnectedController.close();
    _roomStateChangedController.close();
  }
}
