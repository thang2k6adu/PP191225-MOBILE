import 'package:pp191225/core/constants/api_endpoints.dart';
import 'package:pp191225/data/datasources/remote/task_remote_datasource.dart';
import 'package:pp191225/data/models/base/api_response.dart';
import 'package:pp191225/data/models/tasks/task_dto.dart';
import 'package:pp191225/data/services/api_service.dart';

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final ApiService apiService;

  TaskRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<TaskDto>> getTasks() async {
    print('🔍 TaskRemoteDataSource - Fetching tasks...');
    final response = await apiService.get(ApiEndpoints.tasks);

    final parsed = ApiResponse<PaginatedData<TaskDto>>.fromJson(
      response,
      (data) => PaginatedData<TaskDto>.fromJson(
        data as Map<String, dynamic>,
        (item) => TaskDto.fromJson(item as Map<String, dynamic>),
      ),
    );

    final tasks = parsed.data?.items ?? [];
    print('🔍 TaskRemoteDataSource - Parsed ${tasks.length} tasks');
    return tasks;
  }

  @override
  Future<TaskDto> createTask({
    required String name,
    required DateTime deadline,
    required double estimateHours,
  }) async {
    final requestBody = {
      'name': name,
      'deadline': deadline.toIso8601String(),
      'estimateHours': estimateHours, // Changed to camelCase
    };

    print('🔍 API Request Body: $requestBody');

    final response = await apiService.post(
      ApiEndpoints.tasks,
      data: requestBody,
    );

    print('🔍 API Response: $response');

    final parsed = ApiResponse<TaskDto>.fromJson(
      response,
      (data) => TaskDto.fromJson(data as Map<String, dynamic>),
    );

    return parsed.data!;
  }
}
