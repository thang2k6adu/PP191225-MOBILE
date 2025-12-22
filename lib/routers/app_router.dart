import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/providers/auth/auth_provider.dart';
import '../features/auth/screens/app_initializer.dart';
import 'auth_routes.dart';
import 'home_routes.dart';
import '../core/constants/route_constants.dart';

class RouterRefreshNotifier extends ChangeNotifier {
  void refresh() => notifyListeners();
}

final routerRefreshNotifier = RouterRefreshNotifier();

final routerProvider = Provider<GoRouter>((ref) {
  ref.listen<AsyncValue>(
    userAuthProvider,
    (previous, next) => routerRefreshNotifier.refresh(),
  );

  return GoRouter(
    initialLocation: RouteConstants.main,
    debugLogDiagnostics: true,
    refreshListenable: routerRefreshNotifier,
    routes: [
      ...authRoutes,
      ShellRoute(
        builder: (context, state, child) => AppInitializer(child: child),
        routes: [
          ...homeRoutes,
        ],
      ),
    ],
  );
});
