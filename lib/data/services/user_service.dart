import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';

class UserService {
  final ApiService _apiService = ApiService();

  UserService();

  /// Get current user profile
  /// GET /api/users/profile
  Future<UserModel?> getProfile() async {
    try {
      final response = await _apiService.get('/users/profile');
      
      if (response['error'] == false) {
        return UserModel.fromJson(response['data']);
      }
      
      return null;
    } catch (e) {
      print('getProfile error: $e');
      rethrow;
    }
  }

  /// Update current user profile
  /// PATCH /api/users/profile
  Future<UserModel?> updateProfile(Map<String, dynamic> data) async {
    try {
      final response = await _apiService.patch('/users/profile', data: data);
      
      if (response['error'] == false) {
        return UserModel.fromJson(response['data']);
      }
      
      throw Exception(response['message'] ?? 'Update profile failed');
    } catch (e) {
      print('updateProfile error: $e');
      rethrow;
    }
  }

  /// Get user by ID
  /// GET /api/users/{id}
  Future<UserModel?> getUserById(String id) async {
    try {
      final response = await _apiService.get('/users/$id');
      
      if (response['error'] == false) {
        return UserModel.fromJson(response['data']);
      }
      
      return null;
    } catch (e) {
      print('getUserById error: $e');
      rethrow;
    }
  }

  /// Get all users with pagination (for listing)
  /// GET /api/users
  Future<Map<String, dynamic>> getUsers({
    int page = 1,
    int limit = 10,
    String? search,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'limit': limit,
        if (search != null && search.isNotEmpty) 'search': search,
      };

      final response = await _apiService.get(
        '/users',
        queryParameters: queryParams,
      );
      
      if (response['error'] == false) {
        return response['data'] as Map<String, dynamic>;
      }
      
      throw Exception(response['message'] ?? 'Get users failed');
    } catch (e) {
      print('getUsers error: $e');
      rethrow;
    }
  }

  /// Create a new user (Admin only)
  /// POST /api/users
  Future<UserModel?> createUser(Map<String, dynamic> data) async {
    try {
      final response = await _apiService.post('/users', data: data);
      
      if (response['error'] == false) {
        return UserModel.fromJson(response['data']);
      }
      
      throw Exception(response['message'] ?? 'Create user failed');
    } catch (e) {
      print('createUser error: $e');
      rethrow;
    }
  }

  /// Update user by ID (Admin only)
  /// PATCH /api/users/{id}
  Future<UserModel?> updateUser(String id, Map<String, dynamic> data) async {
    try {
      final response = await _apiService.patch('/users/$id', data: data);
      
      if (response['error'] == false) {
        return UserModel.fromJson(response['data']);
      }
      
      throw Exception(response['message'] ?? 'Update user failed');
    } catch (e) {
      print('updateUser error: $e');
      rethrow;
    }
  }

  /// Delete user by ID (Admin only)
  /// DELETE /api/users/{id}
  Future<bool> deleteUser(String id) async {
    try {
      final response = await _apiService.delete('/users/$id');
      
      return response['error'] == false;
    } catch (e) {
      print('deleteUser error: $e');
      rethrow;
    }
  }
}

/// Provider to inject into Riverpod
final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});
