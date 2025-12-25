import 'package:pp191225/core/constants/api_endpoints.dart';
import 'package:pp191225/data/datasources/remote/room_remote_datasource.dart';
import 'package:pp191225/data/models/base/api_response.dart';
import 'package:pp191225/data/models/room/matchmaking_response_dto.dart';
import 'package:pp191225/data/models/room/room_dto.dart';
import 'package:pp191225/data/services/api_service.dart';

class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  final ApiService apiService;

  RoomRemoteDataSourceImpl(this.apiService);

  @override
  Future<MatchmakingResponseDto> joinMatchmaking() async {
    final res = await apiService.dio.post(ApiEndpoints.roomMatchmakingJoin);
    final parsed = ApiResponse<MatchmakingResponseDto>.fromJson(
      res.data,
      (data) => MatchmakingResponseDto.fromJson(data as Map<String, dynamic>),
    );
    return parsed.data!;
  }

  @override
  Future<RoomDto> getRoomInfo(String roomId) async {
    final res = await apiService.dio.get(ApiEndpoints.getRoomInfo(roomId));
    final parsed = ApiResponse<RoomDto>.fromJson(
      res.data,
      (data) => RoomDto.fromJson(data as Map<String, dynamic>),
    );
    return parsed.data!;
  }

  @override
  Future<void> leaveRoom(String roomId) async {
    await apiService.dio.post(ApiEndpoints.leaveRoom(roomId));
  }
}
