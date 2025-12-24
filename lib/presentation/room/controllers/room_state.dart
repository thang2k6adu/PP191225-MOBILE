import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/room/room.dart';

part 'room_state.freezed.dart';

@freezed
abstract class RoomState with _$RoomState {
  const factory RoomState({
    Room? currentRoom,
    @Default(false) bool isLoading,
    @Default(false) bool isJoining,
    @Default(false) bool isLeaving,
    String? error,
  }) = _RoomState;
}
