class ApiEndpoints {
  ApiEndpoints._();

  // Auth endpoints
  static const String authLogin = '/auth/login';
  static const String authRegister = '/auth/register';
  static const String authFirebaseLogin = '/auth/firebase/login';
  static const String authRefresh = '/auth/refresh';
  static const String authLogout = '/auth/logout';

  // User endpoints
  static const String userProfile = '/users/profile';
  static String getUserById(String userId) => '/users/$userId';

  // Task endpoints
  static const String tasks = '/tasks';
  static String getTaskById(String taskId) => '/tasks/$taskId';
  static String activateTask(String taskId) => '/tasks/$taskId/activate';

  // Tracking session endpoints
  static String pauseSession(String sessionId) =>
      '/tracking-sessions/$sessionId/pause';
  static String resumeSession(String sessionId) =>
      '/tracking-sessions/$sessionId/resume';
  static String stopSession(String sessionId) =>
      '/tracking-sessions/$sessionId/stop';
  static const String trackingProgress = '/tracking-sessions/progress';

  // Matchmaking endpoints
  static const String matchmakingJoin = '/matchmaking/join';
  static const String matchmakingCancel = '/matchmaking/cancel';
  static const String matchmakingStatus = '/matchmaking/status';

  // Room endpoints
  static const String roomMatchmakingJoin = '/rooms/matchmaking/join';
  static String getRoomInfo(String roomId) => '/rooms/$roomId';
  static String leaveRoom(String roomId) => '/rooms/$roomId/leave';

  // Health check endpoints
  static const String healthCheck = '/health';
  static const String versionCheck = '/version';
}
