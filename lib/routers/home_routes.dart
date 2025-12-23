import 'package:go_router/go_router.dart';
import '../../presentation/main/screens/main_screen.dart';
import '../../presentation/matchmaking/screens/matchmaking_screen.dart';
import '../../presentation/room/screens/room_list_screen.dart';
import '../core/core.dart';

final homeRoutes = <GoRoute>[
  GoRoute(
    path: RouteConstants.main,
    builder: (context, state) => const MainScreen(),
  ),
  GoRoute(
    path: RouteConstants.roomList,
    builder: (context, state) => const RoomListScreen(),
  ),
  GoRoute(
    path: RouteConstants.matchmaking,
    builder: (context, state) => const MatchmakingScreen(),
  ),
];
