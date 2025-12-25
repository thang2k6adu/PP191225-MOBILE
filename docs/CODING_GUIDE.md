# 📚 Coding Guide - Clean Architecture Implementation

This guide demonstrates how to implement a complete feature following Clean Architecture principles in this boilerplate.

---

## 🚀 Quick Feature Flow (TL;DR)

Khi code **một feature mới**, luôn đi theo flow này:

1. **Phân tích API / requirement**
   - Xác định request, response, pagination, filter, error format (thường bọc trong `ApiResponse<T>` và/hoặc `PaginatedData<T>`).
2. **Tạo DTO ở `data/models/`**
   - Dùng `@freezed` + `*.g.dart`, map đúng JSON từ backend.
3. **Thêm API endpoints vào `core/constants/api_endpoints.dart`**
   - 🚨 **CRITICAL**: NEVER hardcode endpoints trong DataSource!
   - Thêm constants cho tất cả endpoints của feature.
4. **Tạo DataSource ở `data/datasources/`**
   - Gọi API / local storage, trả về DTO, không chứa business logic.
   - **SỬ DỤNG** `ApiEndpoints` constants, KHÔNG hardcode URLs!
5. **Tạo Entity + Repository interface + UseCase ở `domain/`**
   - Entity: pure Dart.
   - Repository interface: định nghĩa “làm gì”.
   - UseCase: chứa **toàn bộ business logic + validation** cho feature.
6. **Implement Repository ở `data/repositories/`**
   - Gọi DataSource + map DTO → Entity, **tuyệt đối không viết business logic**.
7. **Đăng ký DI ở `providers/`**
   - Nối DataSource → Repository → UseCase bằng Riverpod providers.
8. **Tạo State + Controller ở `presentation/<feature>/controllers/`**
   - State dùng `@freezed`.
   - Controller (AutoDisposeNotifier) chỉ gọi UseCase + update state, không biết Data layer.
9. **Tạo UI ở `presentation/<feature>/screens/` + `widgets/`**
   - Screen watch controller state, render UI, handle refresh/pagination/search.
10. **Chạy codegen + test**
   - `dart run build_runner build --delete-conflicting-outputs`
   - `flutter run` và test đầy đủ các flow của feature.

## 📋 Table of Contents

- [Architecture Overview](#-architecture-overview)
- [Project Structure](#-project-structure)
- [Feature Example: Product Management](#-feature-example-product-management)
- [Step-by-Step Implementation](#-step-by-step-implementation)
- [Best Practices](#-best-practices)
- [Common Patterns](#-common-patterns)

---

## 🏗️ Architecture Overview

### Three Layers

```
📱 Presentation Layer (UI)
    ↓ calls
🎯 Domain Layer (Business Logic)
    ↑ implements
💾 Data Layer (Data Sources)
```

### Key Principles

1. **Domain Layer** is independent (pure Dart, no Flutter/Firebase imports)
2. **Data Layer** implements contracts from Domain
3. **Presentation Layer** only depends on Domain (UseCases)
4. **Use Either<Failure, T>** for functional error handling
5. **One UseCase = One Business Action**
6. **Repository has ZERO business logic** - chỉ call datasources và map DTO → Entity
7. **UseCase chứa ALL business logic** - validation, orchestration, rules

---

## 📁 Project Structure

**Actual structure** (79 directories, 5 main features):

```
lib/
├── assets/                     # Asset paths constants
│   ├── assets.dart
│   └── image_paths.dart
├── core/                       # Core utilities & base classes
│   ├── base/                   # Base classes for controllers
│   │   ├── base_async_notifier.dart
│   │   └── base_pagination_notifier.dart
│   ├── constants/              # App-wide constants (8 files)
│   │   ├── api_constants.dart       # API config (base URL, timeouts)
│   │   ├── api_endpoints.dart       # 🚨 API endpoints (NEVER hardcode!)
│   │   ├── app_constants.dart       # App-level constants
│   │   ├── app_icons.dart           # Icon paths
│   │   ├── app_images.dart          # Image paths
│   │   ├── route_constants.dart     # Route names
│   │   └── storage_constants.dart   # Storage keys
│   ├── exceptions/             # Custom exceptions
│   ├── mixins/                 # Reusable mixins
│   ├── theme/                  # App theme
│   └── utils/                  # Utilities
│       ├── either.dart              # Functional error handling
│       ├── formatters/              # Date, number formatters
│       └── helpers/                 # Helper functions
├── data/                       # 💾 DATA LAYER
│   ├── datasources/            # Data sources
│   │   ├── local/              # Local storage (SecureStorage)
│   │   └── remote/             # Remote API calls (6 implementations)
│   │       ├── auth_remote_datasource_impl.dart
│   │       ├── task_remote_datasource_impl.dart
│   │       ├── tracking_remote_datasource_impl.dart
│   │       ├── matchmaking_remote_datasource_impl.dart
│   │       ├── room_remote_datasource_impl.dart
│   │       └── user_remote_datasource_impl.dart
│   ├── models/                 # DTOs (Data Transfer Objects) - 15 DTOs
│   │   ├── auth/               # auth_response_dto, token_dto
│   │   ├── base/               # api_response, paginated_data
│   │   ├── tasks/              # task_dto
│   │   ├── tracking/           # tracking_session_dto, activate_task_response_dto, progress_response_dto
│   │   ├── matchmaking/        # match_found_dto, matchmaking_response_dto, etc.
│   │   ├── room/               # room_dto, room_member_dto
│   │   └── users/              # user_dto
│   ├── repositories/           # Repository implementations (6 repos)
│   │   ├── auth_repository_impl.dart
│   │   ├── task_repository_impl.dart
│   │   ├── tracking_repository_impl.dart
│   │   ├── matchmaking_repository_impl.dart
│   │   ├── room_repository_impl.dart
│   │   └── user_repository_impl.dart
│   └── services/               # External services
│       ├── api_service.dart         # Dio HTTP client
│       ├── firebase_auth_service.dart
│       └── secure_storage_service.dart
├── domain/                     # 🎯 DOMAIN LAYER (Pure Dart)
│   ├── entities/               # Business models (pure Dart classes)
│   │   ├── auth/               # User, TokenPair, AuthResponse
│   │   ├── tasks/              # Task
│   │   ├── tracking/           # TrackingSession, ActivateTaskResponse, ProgressResponse
│   │   ├── matchmaking/        # MatchFound, MatchmakingResponse, etc.
│   │   ├── room/               # Room, RoomMember
│   │   ├── users/              # User
│   │   └── pagination/         # PaginatedData
│   ├── failures/               # Failure types
│   │   └── failures.dart            # ServerFailure, ValidationFailure, etc.
│   ├── repositories/           # Repository interfaces (6 contracts)
│   │   ├── auth_repository.dart
│   │   ├── task_repository.dart
│   │   ├── tracking_repository.dart
│   │   ├── matchmaking_repository.dart
│   │   ├── room_repository.dart
│   │   └── user_repository.dart
│   └── usecases/               # Business logic (25 usecases)
│       ├── auth/               # login, register, logout, refresh_token (6 usecases)
│       ├── tasks/              # get_tasks, create_task (2 usecases)
│       ├── tracking/           # activate_task, pause_session, resume_session, stop_session, get_progress (5 usecases)
│       ├── matchmaking/        # join, cancel, listen_match_found, etc. (7 usecases)
│       ├── room/               # get_room_info, join, leave (3 usecases)
│       └── user/               # get_current_user, update_profile (2 usecases)
├── presentation/               # 📱 PRESENTATION LAYER
│   ├── auth/                   # Authentication feature
│   │   ├── controllers/        # auth_controller.dart
│   │   ├── screens/            # login_screen, sign_up_screen
│   │   └── widgets/            # Feature-specific widgets
│   ├── tasks/                  # Task management feature
│   │   ├── controllers/        # task_controller.dart
│   │   ├── screens/            # task_list_screen.dart
│   │   └── widgets/
│   ├── tracking/               # Task tracking feature
│   │   ├── controllers/        # tracking_controller.dart
│   │   ├── screens/            # task_tracking_screen.dart
│   │   └── widgets/
│   ├── matchmaking/            # Matchmaking feature
│   │   ├── controllers/        # matchmaking_controller.dart
│   │   ├── screens/            # matchmaking_screen.dart
│   │   └── widgets/
│   ├── room/                   # Room feature
│   │   ├── controllers/        # room_controller.dart
│   │   ├── screens/            # room_screen.dart
│   │   └── widgets/
│   └── main/                   # Main app screens
│       ├── screens/            # main_screen.dart
│       └── widgets/
├── providers/                  # Riverpod providers (DI) - 3 files
│   ├── datasources_provider.dart    # DataSource providers
│   ├── repositories_provider.dart   # Repository providers
│   └── usecases_provider.dart       # UseCase providers (25 providers)
├── routers/                    # App routing
│   └── app_router.dart
├── shared/                     # Shared widgets & helpers
│   ├── helpers/
│   ├── layouts/
│   └── widgets/
│       ├── buttons/
│       ├── common/
│       ├── feedback/
│       └── inputs/
├── firebase_options.dart
└── main.dart
```

### Layer Dependencies

```
Presentation → Domain
Data → Domain
Presentation ✗ Data (NEVER import Data in Presentation)
Domain ✗ Data (Domain knows nothing about implementations)
Domain ✗ Presentation (Domain is pure Dart)
```

---

## 🎯 Feature Example: Task Tracking (Real Implementation)

Ví dụ này lấy từ **code thực tế** trong project, demonstrating:

- ✅ **API Endpoints Constants** - Using `ApiEndpoints.*` instead of hardcoded strings
- ✅ **DTO Pattern** - `@freezed` with `toEntity()` method
- ✅ **Entity Pattern** - Pure Dart class (no @freezed)
- ✅ **UseCase Pattern** - Business logic + validation
- ✅ **Repository Pattern** - ZERO business logic, only DTO→Entity mapping
- ✅ **Complete flow** - From API call to UI state management

**Feature Requirements:**
- ✅ Activate a task to start tracking session
- ✅ Pause/Resume/Stop tracking session
- ✅ Get progress data for a task
- ✅ Real-time timer updates in UI
- ✅ Error handling with `Either<Failure, T>`

---

## 📝 Step-by-Step Implementation (Tracking Feature)

> **Flow thực tế:** API Analysis → DTO → DataSource (use ApiEndpoints!) → Entity → Repository Interface → UseCase → Repository Impl → Providers → Controller → UI → Test.

### Step 1: Add API Endpoints to Constants

**🚨 CRITICAL FIRST STEP:** Add endpoints to `lib/core/constants/api_endpoints.dart`

```dart
class ApiEndpoints {
  ApiEndpoints._();
  
  // ... other endpoints ...
  
  // Task endpoints
  static const String tasks = '/tasks';
  static String activateTask(String taskId) => '/api/tasks/$taskId/activate';
  
  // Tracking session endpoints
  static String pauseSession(String sessionId) => 
      '/api/tracking-sessions/$sessionId/pause';
  static String resumeSession(String sessionId) => 
      '/api/tracking-sessions/$sessionId/resume';
  static String stopSession(String sessionId) => 
      '/api/tracking-sessions/$sessionId/stop';
  static const String trackingProgress = '/api/tracking-sessions/progress';
}
```

### Step 2: Analyze API & Create DTOs (Data Layer)

**API Endpoints:**
- `POST /api/tasks/:id/activate` → Returns task + new tracking session
- `POST /api/tracking-sessions/:id/pause` → Returns updated session
- `POST /api/tracking-sessions/:id/resume` → Returns updated session
- `POST /api/tracking-sessions/:id/stop` → Returns completed session
- `GET /api/tracking-sessions/progress?taskId=:id` → Returns progress data

**Response Example:**
```json
{
  "error": false,
  "message": "Success",
  "data": {
    "task": { "id": "t1", "name": "Learn Flutter", ... },
    "session": {
      "id": "s1",
      "taskId": "t1",
      "userId": "u1",
      "startTime": "2025-12-25T10:00:00Z",
      "status": "active",
      "duration": 0,
      "expEarned": 0
    }
  }
}
```

**DTOs (Real Code from Project)**

`lib/data/models/tracking/tracking_session_dto.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';

part 'tracking_session_dto.freezed.dart';
part 'tracking_session_dto.g.dart';

/// TrackingSession Data Transfer Object
/// Used for JSON serialization/deserialization
@freezed
abstract class TrackingSessionDto with _$TrackingSessionDto {
  const TrackingSessionDto._();

  const factory TrackingSessionDto({
    required String id,
    required String taskId,
    required String userId,
    required DateTime startTime,
    DateTime? endTime,
    @Default(0) int duration,
    required String status, // 'active', 'paused', 'stopped'
    @Default(0) int expEarned,
    int? currentDuration, // For paused sessions
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TrackingSessionDto;

  factory TrackingSessionDto.fromJson(Map<String, dynamic> json) =>
      _$TrackingSessionDtoFromJson(json);

  /// Convert DTO to Domain Entity
  TrackingSession toEntity() {
    return TrackingSession(
      id: id,
      taskId: taskId,
      userId: userId,
      startTime: startTime,
      endTime: endTime,
      duration: duration,
      status: status,
      expEarned: expEarned,
      currentDuration: currentDuration,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
```

`lib/data/models/tracking/activate_task_response_dto.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/data/models/tasks/task_dto.dart';
import 'package:pp191225/data/models/tracking/tracking_session_dto.dart';
import 'package:pp191225/domain/entities/tracking/activate_task_response.dart';

part 'activate_task_response_dto.freezed.dart';
part 'activate_task_response_dto.g.dart';

/// ActivateTaskResponse Data Transfer Object
@freezed
abstract class ActivateTaskResponseDto with _$ActivateTaskResponseDto {
  const ActivateTaskResponseDto._();

  const factory ActivateTaskResponseDto({
    required TaskDto task,
    required TrackingSessionDto session,
  }) = _ActivateTaskResponseDto;

  factory ActivateTaskResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ActivateTaskResponseDtoFromJson(json);

  /// Convert DTO to Domain Entity
  ActivateTaskResponse toEntity() {
    return ActivateTaskResponse(
      task: task.toEntity(),
      session: session.toEntity(),
    );
  }
}
```

**🔨 Generate code**
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Step 3: Create Domain Entities (Pure Dart)

`lib/data/datasources/remote/auth_remote_datasource.dart`
```dart
import 'package:pp191225/data/models/auth/auth_response_dto.dart';
import 'package:pp191225/data/models/auth/user_dto.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseDto> login({
    required String email,
    required String password,
  });

  Future<AuthResponseDto> refresh({
    required String refreshToken,
  });

  Future<UserDto> getProfile();

  Future<void> logout();
}
```

`lib/data/datasources/remote/auth_remote_datasource_impl.dart`
```dart
import 'package:dio/dio.dart';
import 'package:pp191225/core/constants/api_endpoints.dart';
import 'package:pp191225/data/datasources/remote/auth_remote_datasource.dart';
import 'package:pp191225/data/models/auth/auth_response_dto.dart';
import 'package:pp191225/data/models/auth/user_dto.dart';
import 'package:pp191225/data/models/base/api_response.dart';
import 'package:pp191225/data/services/api_service.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<AuthResponseDto> login({
    required String email,
    required String password,
  }) async {
    final res = await apiService.dio.post(
      ApiEndpoints.authLogin,  // ✅ Use constant, NOT hardcoded '/auth/login'
      data: {'email': email, 'password': password},
    );
    final parsed = ApiResponse<AuthResponseDto>.fromJson(
      res.data,
      (data) => AuthResponseDto.fromJson(data as Map<String, dynamic>),
    );
    return parsed.data!;
  }

  @override
  Future<AuthResponseDto> refresh({required String refreshToken}) async {
    final res = await apiService.dio.post(
      ApiEndpoints.authRefresh,  // ✅ Use constant
      data: {'refresh_token': refreshToken},
    );
    final parsed = ApiResponse<AuthResponseDto>.fromJson(
      res.data,
      (data) => AuthResponseDto.fromJson(data as Map<String, dynamic>),
    );
    return parsed.data!;
  }

  @override
  Future<UserDto> getProfile() async {
    final res = await apiService.dio.get(ApiEndpoints.userProfile);  // ✅ Use constant
    final parsed = ApiResponse<UserDto>.fromJson(
      res.data,
      (data) => UserDto.fromJson(data as Map<String, dynamic>),
    );
    return parsed.data!;
  }

  @override
  Future<void> logout() async {
    await apiService.dio.post(ApiEndpoints.authLogout);  // ✅ Use constant
  }
}
```

> **⚠️ CRITICAL: API Endpoints Constants**
>
> **NEVER hardcode API endpoints** trong DataSource implementations! Luôn sử dụng constants từ `lib/core/constants/api_endpoints.dart`.
>
> **Why?**
> - ✅ Centralized management - dễ maintain và update
> - ✅ Avoid typos - compile-time safety
> - ✅ Easy refactoring - change once, apply everywhere
> - ✅ Better code review - dễ spot inconsistencies
>
> **How to add new endpoints:**
>
> 1. **Open** `lib/core/constants/api_endpoints.dart`
> 2. **Add constant** theo nhóm feature:
>    ```dart
>    class ApiEndpoints {
>      // Auth endpoints
>      static const String authLogin = '/auth/login';
>      static const String authRegister = '/auth/register';
>      
>      // Task endpoints
>      static const String tasks = '/tasks';
>      static String getTaskById(String taskId) => '/tasks/$taskId';
>      static String activateTask(String taskId) => '/api/tasks/$taskId/activate';
>      
>      // Tracking endpoints
>      static String pauseSession(String sessionId) => '/api/tracking-sessions/$sessionId/pause';
>      static const String trackingProgress = '/api/tracking-sessions/progress';
>    }
>    ```
> 3. **Use in DataSource**:
>    ```dart
>    // ❌ WRONG - Hardcoded
>    await apiService.dio.post('/api/tasks/$taskId/activate');
>    
>    // ✅ CORRECT - Use constant
>    await apiService.dio.post(ApiEndpoints.activateTask(taskId));
>    ```
>
> **Patterns:**
> - **Static endpoints**: `static const String tasks = '/tasks';`
> - **Dynamic endpoints with params**: `static String getTaskById(String id) => '/tasks/$id';`
> - **Query parameters**: Handle in the API call, not in the constant
>   ```dart
>   await apiService.dio.get(
>     ApiEndpoints.trackingProgress,
>     queryParameters: {'taskId': taskId},
>   );
>   ```


### Step 3: Create Domain Entities (Pure Dart)

**Entities** (`lib/domain/entities/tracking/`)

> **Key Difference**: Entities are **pure Dart classes** (no @freezed), while DTOs use @freezed for JSON serialization.

`lib/domain/entities/tracking/tracking_session.dart`
```dart
/// TrackingSession entity - Pure Dart class
/// Represents a tracking session for a task
class TrackingSession {
  final String id;
  final String taskId;
  final String userId;
  final DateTime startTime;
  final DateTime? endTime;
  final int duration; // Seconds
  final String status; // 'active', 'paused', 'stopped'
  final int expEarned; // Seconds
  final int? currentDuration; // For paused sessions
  final DateTime createdAt;
  final DateTime updatedAt;

  const TrackingSession({
    required this.id,
    required this.taskId,
    required this.userId,
    required this.startTime,
    this.endTime,
    this.duration = 0,
    required this.status,
    this.expEarned = 0,
    this.currentDuration,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TrackingSession &&
        other.id == id &&
        other.taskId == taskId &&
        other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ taskId.hashCode ^ status.hashCode;

  TrackingSession copyWith({
    String? id,
    String? taskId,
    String? userId,
    DateTime? startTime,
    DateTime? endTime,
    int? duration,
    String? status,
    int? expEarned,
    int? currentDuration,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TrackingSession(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      userId: userId ?? this.userId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      duration: duration ?? this.duration,
      status: status ?? this.status,
      expEarned: expEarned ?? this.expEarned,
      currentDuration: currentDuration ?? this.currentDuration,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'TrackingSession(id: $id, taskId: $taskId, status: $status, duration: $duration)';
  }
}
```

`lib/domain/entities/tracking/activate_task_response.dart`
```dart
import 'package:pp191225/domain/entities/tasks/task.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';

/// ActivateTaskResponse entity
/// Contains both task and newly created session
class ActivateTaskResponse {
  final Task task;
  final TrackingSession session;

  const ActivateTaskResponse({required this.task, required this.session});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivateTaskResponse &&
        other.task == task &&
        other.session == session;
  }

  @override
  int get hashCode => task.hashCode ^ session.hashCode;

  @override
  String toString() {
    return 'ActivateTaskResponse(task: ${task.name}, session: ${session.id})';
  }
}
```

### Step 4: Create DataSource (Use ApiEndpoints!)

`lib/data/datasources/remote/tracking_remote_datasource.dart`
```dart
import 'package:pp191225/data/models/tracking/activate_task_response_dto.dart';
import 'package:pp191225/data/models/tracking/progress_response_dto.dart';
import 'package:pp191225/data/models/tracking/tracking_session_dto.dart';

abstract class TrackingRemoteDataSource {
  /// Activate a task and create a new tracking session
  /// POST /api/tasks/:id/activate
  Future<ActivateTaskResponseDto> activateTask(String taskId);

  /// Pause a tracking session
  /// POST /api/tracking-sessions/:id/pause
  Future<TrackingSessionDto> pauseSession(String sessionId);

  /// Resume a tracking session
  /// POST /api/tracking-sessions/:id/resume
  Future<TrackingSessionDto> resumeSession(String sessionId);

  /// Stop a tracking session
  /// POST /api/tracking-sessions/:id/stop
  Future<TrackingSessionDto> stopSession(String sessionId);

  /// Get progress for a task
  /// GET /api/tracking-sessions/progress?taskId=:id
  Future<ProgressResponseDto> getProgress(String taskId);
}
```

`lib/data/datasources/remote/tracking_remote_datasource_impl.dart`
```dart
import 'package:pp191225/core/constants/api_endpoints.dart';  // ✅ Import constants
import 'package:pp191225/data/datasources/remote/tracking_remote_datasource.dart';
import 'package:pp191225/data/models/base/api_response.dart';
import 'package:pp191225/data/models/tracking/activate_task_response_dto.dart';
import 'package:pp191225/data/models/tracking/progress_response_dto.dart';
import 'package:pp191225/data/models/tracking/tracking_session_dto.dart';
import 'package:pp191225/data/services/api_service.dart';

class TrackingRemoteDataSourceImpl implements TrackingRemoteDataSource {
  final ApiService apiService;

  TrackingRemoteDataSourceImpl(this.apiService);

  @override
  Future<ActivateTaskResponseDto> activateTask(String taskId) async {
    // ✅ Use ApiEndpoints constant, NOT hardcoded string!
    final response = await apiService.dio.post(ApiEndpoints.activateTask(taskId));

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
    // ✅ Use constant
    final response = await apiService.dio.post(
      ApiEndpoints.pauseSession(sessionId),
    );

    final parsed = ApiResponse<TrackingSessionDto>.fromJson(
      response.data,
      (data) => TrackingSessionDto.fromJson(data as Map<String, dynamic>),
    );

    return parsed.data!;
  }

  @override
  Future<TrackingSessionDto> resumeSession(String sessionId) async {
    // ✅ Use constant
    final response = await apiService.dio.post(
      ApiEndpoints.resumeSession(sessionId),
    );

    final parsed = ApiResponse<TrackingSessionDto>.fromJson(
      response.data,
      (data) => TrackingSessionDto.fromJson(data as Map<String, dynamic>),
    );

    return parsed.data!;
  }

  @override
  Future<TrackingSessionDto> stopSession(String sessionId) async {
    // ✅ Use constant
    final response = await apiService.dio.post(
      ApiEndpoints.stopSession(sessionId),
    );

    final parsed = ApiResponse<TrackingSessionDto>.fromJson(
      response.data,
      (data) => TrackingSessionDto.fromJson(data as Map<String, dynamic>),
    );

    return parsed.data!;
  }

  @override
  Future<ProgressResponseDto> getProgress(String taskId) async {
    // ✅ Use constant with query parameters
    final response = await apiService.dio.get(
      ApiEndpoints.trackingProgress,
      queryParameters: {'taskId': taskId},
    );

    final parsed = ApiResponse<ProgressResponseDto>.fromJson(
      response.data,
      (data) => ProgressResponseDto.fromJson(data as Map<String, dynamic>),
    );

    return parsed.data!;
  }
}
```

> **🚨 CRITICAL**: Notice how we use `ApiEndpoints.*` constants everywhere, NEVER hardcoded strings like `'/api/tasks/$taskId/activate'`!

### Step 5: Create Repository Interface (Domain)
```dart
class TokenPair {
  final String accessToken;
  final String refreshToken;
  const TokenPair({required this.accessToken, required this.refreshToken});
}

class User {
  final String id;
  final String email;
  final String name;
  final String? avatar;
  final List<String> roles;

  const User({
    required this.id,
    required this.email,
    required this.name,
    this.avatar,
    this.roles = const [],
  });
}

class AuthResponse {
  final TokenPair tokens;
  final User user;
  const AuthResponse({required this.tokens, required this.user});
}
```

`lib/domain/repositories/tracking_repository.dart`
```dart
import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tracking/activate_task_response.dart';
import 'package:pp191225/domain/entities/tracking/progress_response.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';
import 'package:pp191225/domain/failures/failures.dart';

/// Repository interface for tracking feature
/// Defines "what" operations are available, not "how" they work
abstract class TrackingRepository {
  /// Activate a task and create a new tracking session
  Future<Either<Failure, ActivateTaskResponse>> activateTask(String taskId);

  /// Pause a tracking session
  Future<Either<Failure, TrackingSession>> pauseSession(String sessionId);

  /// Resume a tracking session
  Future<Either<Failure, TrackingSession>> resumeSession(String sessionId);

  /// Stop a tracking session
  Future<Either<Failure, TrackingSession>> stopSession(String sessionId);

  /// Get progress for a task
  Future<Either<Failure, ProgressResponse>> getProgress(String taskId);
}
```

### Step 6: Create UseCases (Business Logic)

> **🚨 CRITICAL**: UseCases contain **ALL business logic** - validation, orchestration, rules. Repository has ZERO business logic!

**UseCases** (`lib/domain/usecases/tracking/`)

`activate_task_usecase.dart`
```dart
import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tracking/activate_task_response.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/tracking_repository.dart';

/// UseCase for activating a task
/// Contains business logic for task activation
class ActivateTaskUseCase {
  final TrackingRepository repository;

  ActivateTaskUseCase(this.repository);

  Future<Either<Failure, ActivateTaskResponse>> call(String taskId) async {
    // ✅ Business logic: Validate task ID
    if (taskId.isEmpty) {
      return const Left(ValidationFailure(message: 'Task ID cannot be empty'));
    }

    // Call repository to activate task
    final result = await repository.activateTask(taskId);

    return result.fold((failure) => Left(failure), (response) {
      // ✅ Business logic: Could save session ID to local storage for offline handling
      // This would be done via a local storage service
      // For now, we'll just return the response
      return Right(response);
    });
  }
}
```

`pause_session_usecase.dart`
```dart
import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/tracking_repository.dart';

/// UseCase for pausing a session
class PauseSessionUseCase {
  final TrackingRepository repository;

  PauseSessionUseCase(this.repository);

  Future<Either<Failure, TrackingSession>> call(String sessionId) async {
    // ✅ Business logic: Validate session ID
    if (sessionId.isEmpty) {
      return const Left(ValidationFailure(message: 'Session ID cannot be empty'));
    }

    // Call repository
    return repository.pauseSession(sessionId);
  }
}
```

`stop_session_usecase.dart`
```dart
import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/tracking_repository.dart';

/// UseCase for stopping a session
class StopSessionUseCase {
  final TrackingRepository repository;

  StopSessionUseCase(this.repository);

  Future<Either<Failure, TrackingSession>> call(String sessionId) async {
    // ✅ Business logic: Validate session ID
    if (sessionId.isEmpty) {
      return const Left(ValidationFailure(message: 'Session ID cannot be empty'));
    }

    // Call repository to stop session
    final result = await repository.stopSession(sessionId);

    return result.fold((failure) => Left(failure), (session) {
      // ✅ Business logic: Could trigger analytics event here
      // trackEvent('session_stopped', {
      //   'duration': session.duration,
      //   'expEarned': session.expEarned,
      // });
      return Right(session);
    });
  }
}
```

### Step 7: Implement Repository (ZERO Business Logic!)

`lib/data/repositories/tracking_repository_impl.dart`
```dart
import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/data/datasources/remote/tracking_remote_datasource.dart';
import 'package:pp191225/domain/entities/tracking/activate_task_response.dart';
import 'package:pp191225/domain/entities/tracking/progress_response.dart';
import 'package:pp191225/domain/entities/tracking/tracking_session.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/tracking_repository.dart';

/// Implementation of TrackingRepository
/// Calls remote datasource and maps DTOs to entities
/// Contains ZERO business logic - only data transformation
class TrackingRepositoryImpl implements TrackingRepository {
  final TrackingRemoteDataSource remoteDataSource;

  TrackingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ActivateTaskResponse>> activateTask(
    String taskId,
  ) async {
    try {
      // ❌ NO business logic here!
      // ✅ ONLY: Call datasource + map DTO → Entity
      final dto = await remoteDataSource.activateTask(taskId);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TrackingSession>> pauseSession(
    String sessionId,
  ) async {
    try {
      final dto = await remoteDataSource.pauseSession(sessionId);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TrackingSession>> resumeSession(
    String sessionId,
  ) async {
    try {
      final dto = await remoteDataSource.resumeSession(sessionId);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TrackingSession>> stopSession(String sessionId) async {
    try {
      final dto = await remoteDataSource.stopSession(sessionId);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProgressResponse>> getProgress(String taskId) async {
    try {
      final dto = await remoteDataSource.getProgress(taskId);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
```

> **🎯 Key Point**: Repository has **ZERO business logic**. It only:
> 1. Calls datasource
> 2. Maps DTO → Entity
> 3. Wraps in `Either<Failure, T>`
>
> All validation, orchestration, and business rules are in UseCases!

### Step 8: Setup Providers (DI)
```dart
import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/domain/entities/auth/auth_response.dart';
import 'package:pp191225/domain/entities/auth/user.dart';
import 'package:pp191225/domain/entities/auth/token_pair.dart';
import 'package:pp191225/domain/failures/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthResponse>> refreshToken(String refreshToken);

  Future<Either<Failure, User>> getProfile();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> saveTokens(TokenPair tokens);
  Future<Either<Failure, TokenPair?>> loadTokens();
  Future<Either<Failure, void>> clearTokens();
}
```

**UseCases** (`lib/domain/usecases/auth/`)

`login_usecase.dart`
```dart
class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<Either<Failure, AuthResponse>> call({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return const Left(ValidationFailure(message: 'Email/password is required'));
    }
    final result = await repository.login(email: email, password: password);
    return result.fold(
      (f) => Left(f),
      (auth) async {
        await repository.saveTokens(auth.tokens);
        return Right(auth);
      },
    );
  }
}
```

`refresh_token_usecase.dart`
```dart
class RefreshTokenUseCase {
  final AuthRepository repository;
  RefreshTokenUseCase(this.repository);

  Future<Either<Failure, TokenPair>> call() async {
    final loaded = await repository.loadTokens();
    return loaded.fold(
      (f) => Left(f),
      (tokens) async {
        if (tokens == null) {
          return const Left(AuthFailure(message: 'No refresh token'));
        }
        final refreshed = await repository.refreshToken(tokens.refreshToken);
        return refreshed.fold(
          (f) => Left(f),
          (auth) async {
            await repository.saveTokens(auth.tokens);
            return Right(auth.tokens);
          },
        );
      },
    );
  }
}
```

`get_profile_usecase.dart`
```dart
class GetProfileUseCase {
  final AuthRepository repository;
  GetProfileUseCase(this.repository);

  Future<Either<Failure, User>> call() async {
    return repository.getProfile();
  }
}
```

`logout_usecase.dart`
```dart
class LogoutUseCase {
  final AuthRepository repository;
  LogoutUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    await repository.logout(); // optional best-effort
    return repository.clearTokens();
  }
}
```

### Step 4: Implement Repository (Data Layer)

`lib/data/repositories/auth_repository_impl.dart`
```dart
import 'package:pp191225/core/utils/either.dart';
import 'package:pp191225/data/datasources/remote/auth_remote_datasource.dart';
import 'package:pp191225/domain/entities/auth/auth_response.dart';
import 'package:pp191225/domain/entities/auth/user.dart';
import 'package:pp191225/domain/entities/auth/token_pair.dart';
import 'package:pp191225/domain/failures/failures.dart';
import 'package:pp191225/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final SecureStorageService storage; // giả định đã có service lưu token

  AuthRepositoryImpl({
    required this.remote,
    required this.storage,
  });

  @override
  Future<Either<Failure, AuthResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final dto = await remote.login(email: email, password: password);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> refreshToken(String refreshToken) async {
    try {
      final dto = await remote.refresh(refreshToken: refreshToken);
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getProfile() async {
    try {
      final dto = await remote.getProfile();
      return Right(dto.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remote.logout();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveTokens(TokenPair tokens) async {
    try {
      await storage.writeTokens(tokens);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokenPair?>> loadTokens() async {
    try {
      final tokens = await storage.readTokens();
      return Right(tokens);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearTokens() async {
    try {
      await storage.clearTokens();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
```

### Step 8: Setup Providers (DI)

**Real Providers from Project** (`lib/providers/`)

`datasources_provider.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/data/datasources/remote/tracking_remote_datasource.dart';
import 'package:pp191225/data/datasources/remote/tracking_remote_datasource_impl.dart';
import 'package:pp191225/data/services/api_service.dart';

/// Provide TrackingRemoteDataSource
final trackingRemoteDataSourceProvider = Provider<TrackingRemoteDataSource>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return TrackingRemoteDataSourceImpl(apiService);
});
```

`repositories_provider.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/data/repositories/tracking_repository_impl.dart';
import 'package:pp191225/domain/repositories/tracking_repository.dart';
import 'package:pp191225/providers/datasources_provider.dart';

/// Provide TrackingRepository
final trackingRepositoryProvider = Provider<TrackingRepository>((ref) {
  final remoteDataSource = ref.watch(trackingRemoteDataSourceProvider);
  return TrackingRepositoryImpl(remoteDataSource: remoteDataSource);
});
```

`usecases_provider.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/domain/usecases/tracking/activate_task_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/pause_session_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/resume_session_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/stop_session_usecase.dart';
import 'package:pp191225/domain/usecases/tracking/get_progress_usecase.dart';
import 'package:pp191225/providers/repositories_provider.dart';

/// Provide ActivateTaskUseCase
final activateTaskUseCaseProvider = Provider<ActivateTaskUseCase>((ref) {
  final repository = ref.watch(trackingRepositoryProvider);
  return ActivateTaskUseCase(repository);
});

/// Provide PauseSessionUseCase
final pauseSessionUseCaseProvider = Provider<PauseSessionUseCase>((ref) {
  final repository = ref.watch(trackingRepositoryProvider);
  return PauseSessionUseCase(repository);
});

/// Provide ResumeSessionUseCase
final resumeSessionUseCaseProvider = Provider<ResumeSessionUseCase>((ref) {
  final repository = ref.watch(trackingRepositoryProvider);
  return ResumeSessionUseCase(repository);
});

/// Provide StopSessionUseCase
final stopSessionUseCaseProvider = Provider<StopSessionUseCase>((ref) {
  final repository = ref.watch(trackingRepositoryProvider);
  return StopSessionUseCase(repository);
});

/// Provide GetProgressUseCase
final getProgressUseCaseProvider = Provider<GetProgressUseCase>((ref) {
  final repository = ref.watch(trackingRepositoryProvider);
  return GetProgressUseCase(repository);
});
```

> **Pattern**: DataSource → Repository → UseCase, all connected via Riverpod providers.

### Step 9: Run Code Generation & Test

`lib/presentation/auth/controllers/auth_state.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/auth/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? user,
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool isRefreshing,
  }) = _AuthState;
}
```

`lib/presentation/auth/controllers/auth_controller.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pp191225/domain/usecases/auth/login_usecase.dart';
import 'package:pp191225/domain/usecases/auth/refresh_token_usecase.dart';
import 'package:pp191225/domain/usecases/auth/get_profile_usecase.dart';
import 'package:pp191225/domain/usecases/auth/logout_usecase.dart';
import 'package:pp191225/presentation/auth/controllers/auth_state.dart';
import 'package:pp191225/providers/usecases_provider.dart';

final authControllerProvider =
    AutoDisposeNotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

class AuthController extends AutoDisposeNotifier<AuthState> {
  late final LoginUseCase _login;
  late final RefreshTokenUseCase _refresh;
  late final GetProfileUseCase _getProfile;
  late final LogoutUseCase _logout;

  @override
  AuthState build() {
    _login = ref.read(loginUseCaseProvider);
    _refresh = ref.read(refreshTokenUseCaseProvider);
    _getProfile = ref.read(getProfileUseCaseProvider);
    _logout = ref.read(logoutUseCaseProvider);
    return const AuthState();
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _login(email: email, password: password);
    result.fold(
      (f) => state = state.copyWith(isLoading: false, error: f.message),
      (auth) => state = state.copyWith(
        isLoading: false,
        user: auth.user,
      ),
    );
  }

  Future<void> loadProfile() async {
    final result = await _getProfile();
    result.fold(
      (f) => state = state.copyWith(error: f.message),
      (user) => state = state.copyWith(user: user),
    );
  }

  Future<void> refreshToken() async {
    state = state.copyWith(isRefreshing: true);
    final result = await _refresh();
    result.fold(
      (f) => state = state.copyWith(isRefreshing: false, error: f.message),
      (_) => state = state.copyWith(isRefreshing: false),
    );
  }

  Future<void> logout() async {
    await _logout();
    state = const AuthState();
  }
}
```

### Step 7: UI (rút gọn)

`lib/presentation/auth/screens/login_screen.dart`
```dart
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _passCtrl, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 12),
            if (state.isLoading) const CircularProgressIndicator(),
            if (state.error != null) Text(state.error!, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () => ref.read(authControllerProvider.notifier).login(
                        _emailCtrl.text,
                        _passCtrl.text,
                      ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Step 8: Run & Test

```bash
# 1. Generate code (Freezed/json)
dart run build_runner build --delete-conflicting-outputs

# 2. Run app
flutter run

# 3. Test auth flows
# - Login sai → hiển thị lỗi
# - Login đúng → nhận token, user, state cập nhật
# - Refresh token (giả lập hết hạn)
# - Load profile sau login
# - Logout → clear token + state
```

---

## 🔄 Development Flow Summary

```
1. 📋 Analyze API Response (Postman/Swagger)
   ↓
2. 📦 Create DTOs with @freezed
   ├─ product_dto.dart
   ├─ product_list_dto.dart
   └─ Run: dart run build_runner build
   ↓
3. 🌐 Create Remote DataSource
   ├─ Interface (abstract class)
   ├─ Implementation (ApiService)
   └─ Test API calls (optional)
   ↓
4. 🎯 Create Domain Layer
   ├─ Entities (pure Dart)
   ├─ Repository Interface
   └─ UseCases (ALL business logic here)
   ↓
5. 🔗 Implement Repository
   └─ ZERO business logic - just call datasource + map DTO → Entity
   ↓
6. 🔌 Setup Providers
   ├─ DataSources (in datasources_provider.dart)
   ├─ Repositories (in repositories_provider.dart)
   └─ UseCases (in usecases_provider.dart)
   ↓
7. 🎮 Create Controller (AutoDisposeNotifier)
   ├─ State model (@freezed)
   ├─ Provider declaration
   └─ Controller: ONLY call UseCases + update state
   ↓
8. 🎨 Create UI Layer
   ├─ Screen (watch controller state)
   └─ Widgets
   ↓
9. ✅ Test & Debug
```

---

## ✅ Best Practices

### 1. API Endpoints Constants

**🚨 CRITICAL RULE: NEVER hardcode API endpoints!**

```dart
// ❌ WRONG - Hardcoded endpoints
await apiService.dio.post('/api/tasks/$taskId/activate');
await apiService.dio.get('/api/tracking-sessions/progress');

// ✅ CORRECT - Use constants from api_endpoints.dart
await apiService.dio.post(ApiEndpoints.activateTask(taskId));
await apiService.dio.get(ApiEndpoints.trackingProgress);
```

**Location:** `lib/core/constants/api_endpoints.dart`

**Structure:**
```dart
class ApiEndpoints {
  ApiEndpoints._();  // Private constructor

  // Group by feature
  // Auth endpoints
  static const String authLogin = '/auth/login';
  static const String authRegister = '/auth/register';
  
  // Task endpoints
  static const String tasks = '/tasks';
  static String getTaskById(String id) => '/tasks/$id';
  static String activateTask(String id) => '/api/tasks/$id/activate';
  
  // Tracking endpoints
  static String pauseSession(String sessionId) => 
      '/api/tracking-sessions/$sessionId/pause';
  static const String trackingProgress = '/api/tracking-sessions/progress';
}
```

**Benefits:**
- ✅ Single source of truth cho tất cả API endpoints
- ✅ Compile-time safety - typos sẽ bị catch ngay
- ✅ Easy refactoring - đổi 1 chỗ, apply everywhere
- ✅ Better code review - dễ phát hiện inconsistencies

### 2. Naming Conventions

```dart
// Entities (domain)
Product, User, Order

// DTOs (data)
ProductDto, UserDto, OrderDto

// UseCases (domain)
GetProductsUseCase, LoginUseCase

// Repositories (domain interface)
ProductRepository, AuthRepository

// Repository Implementations (data)
ProductRepositoryImpl, AuthRepositoryImpl

// DataSources (data)
ProductRemoteDataSource, AuthLocalDataSource

// Controllers (presentation)
ProductListController, AuthController

// States (presentation)
ProductListState, AuthState

// Providers (providers)
productListControllerProvider, authControllerProvider
```

### 2. Error Handling

```dart
// Always use Either<Failure, T>
Future<Either<Failure, Product>> getProduct(String id) async {
  try {
    final dto = await remoteDataSource.getProductById(id);
    return Right(dto.toEntity());
  } catch (e) {
    return Left(ServerFailure(message: e.toString()));
  }
}

// Handle in Controller
result.fold(
  (failure) => state = state.copyWith(error: failure.message),
  (product) => state = state.copyWith(product: product),
);

// Handle in UI
if (state.error != null) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(state.error!)),
  );
}
```

### 3. Dependency Injection

```dart
// Use Riverpod providers in providers/ folder
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final remote = ref.watch(productRemoteDataSourceProvider);
  return ProductRepositoryImpl(remoteDataSource: remote);
});

// Inject in Controller
@override
ProductListState build() {
  _getProductsUseCase = ref.read(getProductsUseCaseProvider);
  _loadProducts();
  return const ProductListState();
}
```

### 4. State Management

```dart
// Use AutoDisposeNotifier for stateful controllers
class ProductListController extends AutoDisposeNotifier<ProductListState> {
  @override
  ProductListState build() {
    // Initialize and return initial state
    return const ProductListState();
  }

  // Methods to update state
  void updateProducts(List<Product> products) {
    state = state.copyWith(products: products);
  }
}

// Provider declaration
final productListControllerProvider = 
    AutoDisposeNotifierProvider<ProductListController, ProductListState>(
  ProductListController.new,
);
```

---

## 🎯 Common Patterns

### Pattern 1: Pagination

```dart
// In Controller
Future<void> loadMore() async {
  if (!state.hasMore || state.isLoadingMore) return;

  state = state.copyWith(isLoadingMore: true);

  final result = await _getProductsUseCase.loadMore(
    currentPage: state.currentPage,
  );

  result.fold(
    (failure) => state = state.copyWith(isLoadingMore: false, error: failure.message),
    (productList) => state = state.copyWith(
      isLoadingMore: false,
      products: [...state.products, ...productList.products],
      currentPage: productList.currentPage,
      hasMore: productList.hasMore,
    ),
  );
}
```

### Pattern 2: Search with Debounce

```dart
// Use core/mixins/search_with_debounce_mixin.dart
import 'dart:async';

mixin SearchWithDebounceMixin {
  Timer? _debounce;

  void onSearchChanged(String query, Function callback) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      callback(query);
    });
  }

  void dispose() {
    _debounce?.cancel();
  }
}
```

### Pattern 3: Pull to Refresh

```dart
// In Screen
RefreshIndicator(
  onRefresh: () async {
    await ref.read(productListControllerProvider.notifier).refresh();
  },
  child: ListView(...),
)

// In Controller
Future<void> refresh() async {
  state = state.copyWith(currentPage: 1, products: []);
  await _loadProducts();
}
```

---

## 📝 Summary

### Implementation Checklist (Practical Order)

**Based on actual project structure:**
- 79 directories
- 5 main features: auth, tasks, tracking, matchmaking, room
- 15 DTOs across features
- 25 UseCases across features
- 6 Repository implementations
- 5 Controllers

**Step-by-step checklist:**

- [ ] **Step 1:** Add API endpoints to `core/constants/api_endpoints.dart` 🚨 **CRITICAL FIRST STEP**
- [ ] **Step 2:** Analyze API response & create DTOs in `data/models/` (use @freezed)
- [ ] **Step 3:** Create Entities in `domain/entities/` (pure Dart classes)
- [ ] **Step 4:** Create Remote DataSource interface & implementation in `data/datasources/remote/` (use ApiEndpoints!)
- [ ] **Step 5:** Create Repository interface in `domain/repositories/`
- [ ] **Step 6:** Create UseCases in `domain/usecases/` (**ALL business logic here**)
- [ ] **Step 7:** Implement Repository in `data/repositories/` (**ZERO business logic - only mapping**)
- [ ] **Step 8:** Setup Providers in `providers/` (DataSources, Repositories, UseCases)
- [ ] **Step 9:** Run code generation: `dart run build_runner build --delete-conflicting-outputs`
- [ ] **Step 10:** Create State model in `presentation/*/controllers/` (@freezed)
- [ ] **Step 11:** Create Controller (AutoDisposeNotifier) - **ONLY call UseCases**
- [ ] **Step 12:** Create Screens in `presentation/*/screens/`
- [ ] **Step 13:** Create Widgets in `presentation/*/widgets/`
- [ ] **Step 14:** Test the feature

### Quick Start Commands

```bash
# Create DTOs → Generate code
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-generate on save)
dart run build_runner watch --delete-conflicting-outputs

# Clean + Rebuild
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs

# Run app
flutter run
```

---

## 🎓 Key Takeaways

### Architecture Principles

1. **Domain Layer** - Pure business logic, no dependencies on external libs
2. **UseCase** - Chứa TOÀN BỘ business logic và validation
3. **Repository** - ZERO business logic, chỉ call datasource + map DTO → Entity
4. **Controller** - CHỈ gọi UseCase và update UI state
5. **Data Layer** - Handles API, database, external services
6. **Either<Failure, T>** - Functional error handling
7. **DTO → Entity** - Always convert at repository layer
8. **Freezed** - Immutable models with code generation

### Separation of Concerns

```
┌─────────────────────────────────────────────────┐
│  UI Layer (Presentation)                        │
│  ├─ Screen: Hiển thị UI + watch state          │
│  ├─ Controller: GỌI UseCase + Update State     │
│  └─ Provider: Manage lifecycle                  │
└────────────────┬────────────────────────────────┘
                 │ calls
                 ▼
┌─────────────────────────────────────────────────┐
│  Domain Layer (Business Logic)                  │
│  ├─ UseCase: TOÀN BỘ business logic + rules    │
│  ├─ Entity: Business models (pure Dart)         │
│  └─ Repository Interface: Contracts             │
└────────────────┬────────────────────────────────┘
                 │ implements
                 ▼
┌─────────────────────────────────────────────────┐
│  Data Layer (Data Sources)                      │
│  ├─ Repository Impl: ZERO logic, just mapping   │
│  ├─ DataSource: API/Database calls              │
│  ├─ DTO: JSON mapping (@freezed)                │
│  └─ Services: API, Firebase, etc.               │
└─────────────────────────────────────────────────┘
```

### UseCase vs Repository vs Controller Responsibilities

| Responsibility | UseCase ✅ | Repository ❌ | Controller ❌ |
|---------------|-----------|--------------|--------------|
| Business validation | ✅ Yes | ❌ No | ❌ No |
| Business rules | ✅ Yes | ❌ No | ❌ No |
| Pagination logic | ✅ Yes | ❌ No | ❌ No |
| Search logic | ✅ Yes | ❌ No | ❌ No |
| Orchestration | ✅ Yes | ❌ No | ❌ No |
| Call DataSource | ❌ No | ✅ Yes | ❌ No |
| Map DTO → Entity | ❌ No | ✅ Yes | ❌ No |
| Call UseCase | ❌ No | ❌ No | ✅ Yes |
| Update UI state | ❌ No | ❌ No | ✅ Yes |

**Golden Rules:** 
- **UseCase** = "What to do" (ALL Business Logic)
- **Repository** = "Where to get data" (NO Business Logic, just mapping)
- **Controller** = "How to show" (UI State Management, call UseCases)

### Real Example from This Boilerplate

```dart
// ✅ CORRECT: UseCase has business logic
class LoginWithProviderUseCase {
  Future<Either<Failure, AuthResponse>> call(ProviderLogin provider) async {
    // Business logic: handle different providers
    final String? idToken = await _handleProvider(provider);
    
    // Validation
    if (idToken == null) {
      return Left(AuthFailure(message: 'Sign in failed'));
    }
    
    // Orchestration: Firebase auth → Backend login → Save tokens
    final authResult = await repository.loginWithFirebase(idToken: idToken);
    
    return authResult.fold(
      (failure) => Left(failure),
      (response) async {
        await repository.saveTokens(response.tokens);
        return Right(response);
      },
    );
  }
}

// ✅ CORRECT: Repository has ZERO business logic
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, AuthResponse>> loginWithFirebase({
    required String idToken,
  }) async {
    try {
      final dto = await remoteDataSource.loginWithFirebase(idToken: idToken);
      return Right(dto.toEntity()); // Just mapping
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

// ✅ CORRECT: Controller ONLY calls UseCase
class AuthController extends AutoDisposeNotifier<User?> {
  Future<void> loginWithProvider(ProviderLogin provider) async {
    final result = await _loginWithProviderUseCase(provider);
    
    result.fold(
      (failure) => overlay.showError(failure.message),
      (authResponse) => state = authResponse.user,
    );
  }
}
```

---

**Happy Coding! 🚀**
