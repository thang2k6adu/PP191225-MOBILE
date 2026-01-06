import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livekit_client/livekit_client.dart';

/// Video Call Screen - Direct LiveKit Connection
class VideoCallScreen extends ConsumerStatefulWidget {
  final String livekitUrl;
  final String livekitToken;
  final String roomId;
  final String? opponentName;

  const VideoCallScreen({
    super.key,
    required this.livekitUrl,
    required this.livekitToken,
    required this.roomId,
    this.opponentName,
  });

  @override
  ConsumerState<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends ConsumerState<VideoCallScreen> {
  Room? _room;
  EventsListener<RoomEvent>? _listener;
  bool _isCameraEnabled = true;
  bool _isMicEnabled = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _connectToRoom();
    });
  }

  Future<void> _connectToRoom() async {
    try {
      final roomOptions = RoomOptions(
        adaptiveStream: true,
        dynacast: true,
        defaultCameraCaptureOptions: const CameraCaptureOptions(
          maxFrameRate: 30,
        ),
      );

      _room = Room(roomOptions: roomOptions);
      _setupListeners();

      // Convert localhost to 10.0.2.2 for Android emulator
      final url = widget.livekitUrl
          .replaceAll('localhost', '10.0.2.2')
          .replaceAll('127.0.0.1', '10.0.2.2');

      await _room!.connect(url, widget.livekitToken);

      await _room!.localParticipant?.setCameraEnabled(true);
      await _room!.localParticipant?.setMicrophoneEnabled(true);

      setState(() {});
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to connect: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _setupListeners() {
    _listener = _room!.createListener();
    _listener!
      ..on<ParticipantConnectedEvent>((event) {
        setState(() {});
      })
      ..on<ParticipantDisconnectedEvent>((event) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Opponent left the call')),
          );
        }
        setState(() {});
      })
      ..on<TrackSubscribedEvent>((event) {
        setState(() {});
      })
      ..on<TrackUnsubscribedEvent>((event) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _listener?.dispose();
    _room?.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_room == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.opponentName ?? 'Video Call',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.call_end, color: Colors.red, size: 28),
            onPressed: () async {
              await _room?.disconnect();
              if (mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          _buildRemoteVideo(),
          Positioned(
            top: 16,
            right: 16,
            child: _buildLocalVideo(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildVideoControls(),
          ),
        ],
      ),
    );
  }

  Widget _buildRemoteVideo() {
    final remoteParticipants = _room!.remoteParticipants.values.toList();

    if (remoteParticipants.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Colors.white54),
            SizedBox(height: 16),
            Text(
              'Waiting for opponent...',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      );
    }

    final participant = remoteParticipants.first;
    final videoTrack = participant.videoTrackPublications
        .where((pub) => pub.subscribed && pub.track != null)
        .map((pub) => pub.track as VideoTrack)
        .firstOrNull;

    if (videoTrack == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.videocam_off, size: 100, color: Colors.white54),
            const SizedBox(height: 16),
            Text(
              participant.identity,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      );
    }

    return VideoTrackRenderer(videoTrack);
  }

  Widget _buildLocalVideo() {
    final localParticipant = _room!.localParticipant;
    if (localParticipant == null) return const SizedBox.shrink();

    final videoTrack = localParticipant.videoTrackPublications
        .where((pub) => pub.track != null)
        .map((pub) => pub.track as VideoTrack)
        .firstOrNull;

    if (videoTrack == null) {
      return Container(
        width: 120,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white24, width: 2),
        ),
        child: const Icon(Icons.videocam_off, color: Colors.white54),
      );
    }

    return Container(
      width: 120,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: VideoTrackRenderer(videoTrack),
      ),
    );
  }

  Widget _buildVideoControls() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.8),
            Colors.transparent,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildControlButton(
            icon: _isCameraEnabled ? Icons.videocam : Icons.videocam_off,
            onPressed: () async {
              await _room!.localParticipant?.setCameraEnabled(!_isCameraEnabled);
              setState(() {
                _isCameraEnabled = !_isCameraEnabled;
              });
            },
          ),
          _buildControlButton(
            icon: _isMicEnabled ? Icons.mic : Icons.mic_off,
            onPressed: () async {
              await _room!.localParticipant?.setMicrophoneEnabled(!_isMicEnabled);
              setState(() {
                _isMicEnabled = !_isMicEnabled;
              });
            },
          ),
          _buildControlButton(
            icon: Icons.call_end,
            color: Colors.red,
            onPressed: () async {
              await _room?.disconnect();
              if (mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
    Color? color,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Colors.white.withOpacity(0.2),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        iconSize: 32,
        onPressed: onPressed,
      ),
    );
  }
}
