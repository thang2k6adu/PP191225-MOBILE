import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/core/core.dart';
import 'package:pp191225/presentation/auth/controllers/auth_controller.dart';
import 'package:pp191225/routers/app_router.dart';

class AppInitializer extends ConsumerStatefulWidget {
  final Widget child;
  const AppInitializer({super.key, required this.child});

  @override
  AppInitializerState createState() => AppInitializerState();
}

class AppInitializerState extends ConsumerState<AppInitializer> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Try to load current user from stored token
    final authController = ref.read(authControllerProvider.notifier);
    await authController.loadCurrentUser();

    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show loading while initializing
    if (!_isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final user = ref.watch(authControllerProvider);
    final router = ref.read(routerProvider);

    if (user != null) {
      return widget.child;
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        router.go(RouteConstants.login);
      });
      return const SizedBox.shrink();
    }
  }
}
