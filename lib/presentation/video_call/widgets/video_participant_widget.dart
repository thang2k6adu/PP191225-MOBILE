import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';

/// Video Participant Widget
/// Renders video track for a participant (local or remote)
class VideoParticipantWidget extends StatefulWidget {
  final Participant participant;
  final bool isLocal;

  const VideoParticipantWidget({
    super.key,
    required this.participant,
    this.isLocal = false,
  });

  @override
  State<VideoParticipantWidget> createState() =>
      _VideoParticipantWidgetState();
}

class _VideoParticipantWidgetState extends State<VideoParticipantWidget> {
  VideoTrack? _videoTrack;
  TrackPublication? _videoPublication;

  @override
  void initState() {
    super.initState();
    _updateVideoTrack();
    
    // Listen to track updates
    widget.participant.addListener(_onParticipantChanged);
  }

  @override
  void dispose() {
    widget.participant.removeListener(_onParticipantChanged);
    super.dispose();
  }

  void _onParticipantChanged() {
    setState(() {
      _updateVideoTrack();
    });
  }

  void _updateVideoTrack() {
    // Get video track publication
    _videoPublication = widget.participant.videoTrackPublications
        .where((pub) => pub.subscribed && pub.track != null)
        .firstOrNull;

    _videoTrack = _videoPublication?.track as VideoTrack?;
  }

  @override
  Widget build(BuildContext context) {
    if (_videoTrack == null) {
      return Container(
        color: Colors.grey[900],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.videocam_off,
                color: Colors.white.withOpacity(0.7),
                size: widget.isLocal ? 40 : 80,
              ),
              const SizedBox(height: 8),
              Text(
                widget.isLocal ? 'You' : (widget.participant.identity),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: widget.isLocal ? 14 : 18,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: VideoTrackRenderer(
        _videoTrack!,
      ),
    );
  }
}
