import 'package:flutter/material.dart';

/// Video Call Controls Widget
/// Contains buttons for camera, microphone, switch camera, and end call
class VideoControls extends StatelessWidget {
  final bool isCameraEnabled;
  final bool isMicEnabled;
  final VoidCallback onToggleCamera;
  final VoidCallback onToggleMicrophone;
  final VoidCallback onSwitchCamera;
  final VoidCallback onEndCall;

  const VideoControls({
    super.key,
    required this.isCameraEnabled,
    required this.isMicEnabled,
    required this.onToggleCamera,
    required this.onToggleMicrophone,
    required this.onSwitchCamera,
    required this.onEndCall,
  });

  @override
  Widget build(BuildContext context) {
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
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Toggle Camera
            _buildControlButton(
              icon: isCameraEnabled ? Icons.videocam : Icons.videocam_off,
              label: 'Camera',
              onPressed: onToggleCamera,
              isEnabled: isCameraEnabled,
            ),

            // Toggle Microphone
            _buildControlButton(
              icon: isMicEnabled ? Icons.mic : Icons.mic_off,
              label: 'Mic',
              onPressed: onToggleMicrophone,
              isEnabled: isMicEnabled,
            ),

            // Switch Camera
            _buildControlButton(
              icon: Icons.cameraswitch,
              label: 'Flip',
              onPressed: onSwitchCamera,
              isEnabled: true,
            ),

            // End Call
            _buildControlButton(
              icon: Icons.call_end,
              label: 'End',
              onPressed: onEndCall,
              isEnabled: true,
              isEndCall: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required bool isEnabled,
    bool isEndCall = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isEndCall
                ? Colors.red
                : isEnabled
                    ? Colors.white.withOpacity(0.2)
                    : Colors.red.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon),
            color: Colors.white,
            iconSize: 28,
            onPressed: onPressed,
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
