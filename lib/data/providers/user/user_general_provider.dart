import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_service.dart';


final userGeneralProvider =
    AsyncNotifierProvider<UserGeneralNotifier, UserModel?>(
      () => UserGeneralNotifier(),
    );

/// Provider để lấy thông tin user theo ID (có thể là user hiện tại hoặc user khác)
/// Nếu userId = null thì lấy thông tin user hiện tại
final userProfileByIdProvider =
    FutureProvider.family<UserModel?, String?>((ref, userId) async {
  final userService = ref.read(userServiceProvider);
  
  if (userId == null || userId.isEmpty) {
    // Lấy thông tin user hiện tại
    return await userService.getProfile();
  } else {
    // Lấy thông tin user khác theo ID
    return await userService.getUserById(userId);
  }
});

class UserGeneralNotifier extends AsyncNotifier<UserModel?> {
  late final UserService _userService;

  @override
  Future<UserModel?> build() async {
    // Inject service
    _userService = ref.read(userServiceProvider);

    // Tải thông tin user hiện tại khi provider được khởi tạo
    try {
      final me = await _userService.getProfile();
      return me;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  /// Cập nhật thông tin user hiện tại
  Future<bool> updateProfile(Map<String, dynamic> data) async {
    state = const AsyncLoading();
    try {
      print('updateProfile data: $data');
      final updatedUser = await _userService.updateProfile(data);
      print('updatedUser: $updatedUser');
      if (updatedUser != null) {
        state = AsyncData(updatedUser);
        return true;
      }
      return false;
    } catch (e) {
      print('updateProfile failed: $e');
      state = AsyncError(e, StackTrace.current);
      return false;
    }
  }

  /// Lấy thông tin profile người dùng khác
  Future<UserModel?> getUserProfile(String userId) async {
    try {
      final user = await _userService.getUserById(userId);
      return user;
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
      return null;
    }
  }

  /// Làm mới lại dữ liệu user hiện tại
  Future<void> refreshProfile() async {
    try {
      final me = await _userService.getProfile();
      state = AsyncData(me);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
