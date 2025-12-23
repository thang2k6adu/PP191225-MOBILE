import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/domain/entities/matchmaking/matchmaking_state.dart';
import 'package:jt291_flutter_mobile/presentation/matchmaking/controllers/matchmaking_controller.dart';
import 'package:jt291_flutter_mobile/presentation/matchmaking/widgets/idle_widget.dart';
import 'package:jt291_flutter_mobile/presentation/matchmaking/widgets/in_room_widget.dart';
import 'package:jt291_flutter_mobile/presentation/matchmaking/widgets/waiting_widget.dart';
import 'package:jt291_flutter_mobile/providers/datasources_provider.dart';

class MatchmakingScreen extends ConsumerStatefulWidget {
  const MatchmakingScreen({super.key});

  @override
  ConsumerState<MatchmakingScreen> createState() => _MatchmakingScreenState();
}

class _MatchmakingScreenState extends ConsumerState<MatchmakingScreen> {
  @override
  void initState() {
    super.initState();
    // Connect to WebSocket on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _connectWebSocket();
    });
  }

  Future<void> _connectWebSocket() async {
    // Get token from secure storage (you might need to adjust this)
    final storage = ref.read(secureStorageProvider);
    final token = await storage.read(key: 'access_token');

    if (token != null && token.isNotEmpty) {
      await ref
          .read(matchmakingControllerProvider.notifier)
          .connect(token);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please login first'),
            backgroundColor: Colors.red,
          ),
        );
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(matchmakingControllerProvider);

    // Show error snackbar
    ref.listen(
      matchmakingControllerProvider,
      (previous, next) {
        if (next.error != null && next.error!.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.error!),
              backgroundColor: Colors.red,
            ),
          );
          ref.read(matchmakingControllerProvider.notifier).clearError();
        }

        if (next.message != null && next.message!.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.message!),
              backgroundColor: Colors.green,
            ),
          );
          ref.read(matchmakingControllerProvider.notifier).clearMessage();
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matchmaking'),
        centerTitle: true,
        actions: [
          // Connection status indicator
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: state.isConnected ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      state.isConnected ? 'Online' : 'Offline',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _buildBody(state),
      ),
    );
  }

  Widget _buildBody(state) {
    if (state.isConnecting) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Connecting to matchmaking...'),
          ],
        ),
      );
    }

    if (!state.isConnected) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_off,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            const Text('Not connected to matchmaking'),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _connectWebSocket,
              icon: const Icon(Icons.refresh),
              label: const Text('Reconnect'),
            ),
          ],
        ),
      );
    }

    // Show different UI based on matchmaking state
    switch (state.state) {
      case MatchmakingState.idle:
        return const IdleWidget();
      case MatchmakingState.waiting:
        return const WaitingWidget();
      case MatchmakingState.inRoom:
        return InRoomWidget(matchData: state.matchData);
    }

    // Default fallback
    return const Center(child: Text('Unknown state'));
  }
}
