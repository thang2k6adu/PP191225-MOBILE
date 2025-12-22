import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/services/auth_service.dart';

final userAuthProvider = AsyncNotifierProvider<UserAuthNotifier, UserModel?>(
  () => UserAuthNotifier(),
);

class UserAuthNotifier extends AsyncNotifier<UserModel?> {
  late final AuthService _authService;

  @override
  Future<UserModel?> build() async {
    // Inject service
    _authService = ref.read(authServiceProvider);

    // fetch firebase user
    final firebaseUser = FirebaseAuth.instance.currentUser;
    print('UserAuthNotifier build firebaseUser: $firebaseUser');
    if (firebaseUser == null) {
      final me = await _authService.getCurrentUser();
      print('UserAuthNotifier build no firebase user, me=$me');
      if (me != null) {
        return me;
      }

      await Future.delayed(const Duration(seconds: 2));
      return null;
    }

    final idToken = await firebaseUser.getIdToken();
    if (idToken == null) return null;

    // Call API login with Firebase
    await _authService.loginWithFirebase(idToken: idToken);
    final me = await _authService.getCurrentUser();
    return me;
  }

  /// Login with Firebase idToken
  Future<UserModel?> loginWithFirebase(String idToken) async {
    state = const AsyncLoading();
    try {
      final authResponse = await _authService.loginWithFirebase(idToken: idToken);
      if (authResponse != null) {
        state = AsyncData(authResponse.user);
        return authResponse.user;
      }
      return null;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }
  
  /// Login with email and password
  Future<UserModel?> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final authResponse = await _authService.login(email: email, password: password);
      print('login user: ${authResponse?.user}');
      if (authResponse != null) {
        state = AsyncData(authResponse.user);
        return authResponse.user;
      }
      throw Exception("Login failed");
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  /// Logout User
  Future<void> logout() async {
    try {
      await _authService.logout();
      await FirebaseAuth.instance.signOut();
      // Invalidate để build lại thành null
      ref.invalidateSelf();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// refresh profile loggedInUser
  Future<void> refresh() async {
    try {
      final loggedInUser = await _authService.getCurrentUser();
      state = AsyncData(loggedInUser);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
