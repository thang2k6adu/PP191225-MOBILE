import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jt291_flutter_mobile/core/constants/constants.dart';
import 'package:jt291_flutter_mobile/data/models/auth/token_model.dart';
import 'package:jt291_flutter_mobile/data/models/auth/auth_response_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';

class AuthService {
  final ApiService _apiService = ApiService();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthService();

  /// Get stored tokens from secure storage
  FutureOr<TokenModel?> getToken() async {
    try {
      final accessToken = await _storage.read(
        key: StorageConstants.accessTokenKey,
      );
      final refreshToken = await _storage.read(
        key: StorageConstants.refreshTokenKey,
      );
      final expiresIn = await _storage.read(
        key: StorageConstants.tokenExpiredKey,
      );

      if (accessToken == null) {
        return null;
      }

      return TokenModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresIn: expiresIn != null ? int.tryParse(expiresIn) : null,
      );
    } catch (e) {
      print("getToken error: $e");
      rethrow;
    }
  }

  /// Get current user profile
  /// GET /api/users/profile
  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await _apiService.get('/users/profile');
      if (response['error'] == false) {
        return UserModel.fromJson(response['data']);
      }
      return null;
    } catch (e) {
      print("getCurrentUser fail: $e");
      return null;
    }
  }

  /// Register a new user
  /// POST /api/auth/register
  Future<AuthResponseModel?> register({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final response = await _apiService.post(
        '/auth/register',
        data: {
          'email': email,
          'password': password,
          if (name != null) 'name': name,
        },
      );

      if (response['error'] == false) {
        final authResponse = AuthResponseModel.fromJson(response['data']);
        await _saveTokens(authResponse.tokens);
        return authResponse;
      }
      
      throw Exception(response['message'] ?? 'Register failed');
    } catch (e) {
      print("register error: $e");
      rethrow;
    }
  }

  /// Login with email and password
  /// POST /api/auth/login
  Future<AuthResponseModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiService.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      print("login response: $response");

      if (response['error'] == false) {
        final authResponse = AuthResponseModel.fromJson(response['data']);
        await _saveTokens(authResponse.tokens);
        return authResponse;
      }
      
      throw Exception(response['message'] ?? 'Login failed');
    } catch (e) {
      print("login error: $e");
      rethrow;
    }
  }

  /// Login with Firebase ID token
  /// POST /api/auth/firebase/login
  Future<AuthResponseModel?> loginWithFirebase({
    required String idToken,
    String? deviceId,
    String? platform,
  }) async {
    try {
      final response = await _apiService.post(
        '/auth/firebase/login',
        data: {
          'idToken': idToken,
          if (deviceId != null) 'deviceId': deviceId,
          if (platform != null) 'platform': platform,
        },
      );

      if (response['error'] == false) {
        final authResponse = AuthResponseModel.fromJson(response['data']);
        await _saveTokens(authResponse.tokens);
        return authResponse;
      }
      
      throw Exception(response['message'] ?? 'Firebase login failed');
    } catch (e) {
      print("loginWithFirebase error: $e");
      rethrow;
    }
  }

  /// Refresh access token
  /// POST /api/auth/refresh
  Future<TokenModel?> refreshToken() async {
    try {
      final currentToken = await getToken();
      
      if (currentToken?.refreshToken == null) {
        throw Exception('No refresh token available');
      }

      final response = await _apiService.post(
        '/auth/refresh',
        data: {
          'refreshToken': currentToken!.refreshToken,
        },
      );

      if (response['error'] == false) {
        final newToken = TokenModel.fromJson(response['data']);
        await _saveTokens(newToken);
        return newToken;
      }
      
      throw Exception(response['message'] ?? 'Refresh token failed');
    } catch (e) {
      print("refreshToken error: $e");
      await clearTokens(); // Clear invalid tokens
      rethrow;
    }
  }

  /// Logout user
  /// POST /api/auth/logout
  Future<void> logout() async {
    try {
      await _apiService.post('/auth/logout');
    } catch (e) {
      print("logout error: $e");
    } finally {
      await clearTokens();
    }
  }

  /// Save tokens to secure storage
  Future<void> _saveTokens(TokenModel token) async {
    await _storage.write(
      key: StorageConstants.accessTokenKey,
      value: token.accessToken,
    );
    
    if (token.refreshToken != null) {
      await _storage.write(
        key: StorageConstants.refreshTokenKey,
        value: token.refreshToken!,
      );
    }
    
    if (token.expiresIn != null) {
      await _storage.write(
        key: StorageConstants.tokenExpiredKey,
        value: token.expiresIn.toString(),
      );
    }
  }

  /// Clear all stored tokens
  Future<void> clearTokens() async {
    await _storage.delete(key: StorageConstants.accessTokenKey);
    await _storage.delete(key: StorageConstants.refreshTokenKey);
    await _storage.delete(key: StorageConstants.tokenExpiredKey);
  }

  /// Check if user is authenticated
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token?.accessToken != null;
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});
