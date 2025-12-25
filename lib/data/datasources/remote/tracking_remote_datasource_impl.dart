import 'package:pp191225/core/constants/api_endpoints.dart';
import 'package:pp191225/data/datasources/remote/tracking_remote_datasource.dart';
import 'package:pp191225/data/models/base/api_response.dart';
import 'package:pp191225/data/models/tracking/activate_task_response_dto.dart';
import 'package:pp191225/data/models/tracking/progress_response_dto.dart';
import 'package:pp191225/data/models/tracking/stop_session_response_dto.dart';
import 'package:pp191225/data/models/tracking/tracking_session_dto.dart';
import 'package:pp191225/data/services/api_service.dart';

/// Implementation of TrackingRemoteDataSource
/// Handles all tracking-related API calls
class TrackingRemoteDataSourceImpl implements TrackingRemoteDataSource {
  final ApiService apiService;

  TrackingRemoteDataSourceImpl(this.apiService);

  @override
  Future<ActivateTaskResponseDto> activateTask(String taskId) async {
    final response = await apiService.dio.post(
      ApiEndpoints.activateTask(taskId),
    );

    final parsed = ApiResponse<ActivateTaskResponseDto>.fromJson(
      response.data,
      (data) => ActivateTaskResponseDto.fromJson(data as Map<String, dynamic>),
    );

    if (parsed.data == null) {
      throw Exception('Failed to activate task: No data returned');
    }

    return parsed.data!;
  }

  @override
  Future<TrackingSessionDto> pauseSession(String sessionId) async {
    final response = await apiService.dio.post(
      ApiEndpoints.pauseSession(sessionId),
    );

    final parsed = ApiResponse<TrackingSessionDto>.fromJson(
      response.data,
      (data) => TrackingSessionDto.fromJson(data as Map<String, dynamic>),
    );

    if (parsed.data == null) {
      throw Exception('Failed to pause session: No data returned');
    }

    return parsed.data!;
  }

  @override
  Future<TrackingSessionDto> resumeSession(String sessionId) async {
    final response = await apiService.dio.post(
      ApiEndpoints.resumeSession(sessionId),
    );

    final parsed = ApiResponse<TrackingSessionDto>.fromJson(
      response.data,
      (data) => TrackingSessionDto.fromJson(data as Map<String, dynamic>),
    );

    if (parsed.data == null) {
      throw Exception('Failed to resume session: No data returned');
    }

    return parsed.data!;
  }

  @override
  Future<StopSessionResponseDto> stopSession(String sessionId) async {
    final response = await apiService.dio.post(
      ApiEndpoints.stopSession(sessionId),
    );

    final parsed = ApiResponse<StopSessionResponseDto>.fromJson(
      response.data,
      (data) => StopSessionResponseDto.fromJson(data as Map<String, dynamic>),
    );

    if (parsed.data == null) {
      throw Exception('Failed to stop session: No data returned');
    }

    return parsed.data!;
  }

  @override
  Future<ProgressResponseDto> getProgress(String taskId) async {
    final response = await apiService.dio.get(
      ApiEndpoints.trackingProgress,
      queryParameters: {'taskId': taskId},
    );

    final parsed = ApiResponse<ProgressResponseDto>.fromJson(
      response.data,
      (data) => ProgressResponseDto.fromJson(data as Map<String, dynamic>),
    );

    if (parsed.data == null) {
      throw Exception('Failed to get progress: No data returned');
    }

    return parsed.data!;
  }
}
