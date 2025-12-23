// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matchmaking_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchmakingStatusDto {

 String get state;// "IDLE", "WAITING", "IN_ROOM"
 RoomInfoDto? get room;
/// Create a copy of MatchmakingStatusDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchmakingStatusDtoCopyWith<MatchmakingStatusDto> get copyWith => _$MatchmakingStatusDtoCopyWithImpl<MatchmakingStatusDto>(this as MatchmakingStatusDto, _$identity);

  /// Serializes this MatchmakingStatusDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchmakingStatusDto&&(identical(other.state, state) || other.state == state)&&(identical(other.room, room) || other.room == room));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,room);

@override
String toString() {
  return 'MatchmakingStatusDto(state: $state, room: $room)';
}


}

/// @nodoc
abstract mixin class $MatchmakingStatusDtoCopyWith<$Res>  {
  factory $MatchmakingStatusDtoCopyWith(MatchmakingStatusDto value, $Res Function(MatchmakingStatusDto) _then) = _$MatchmakingStatusDtoCopyWithImpl;
@useResult
$Res call({
 String state, RoomInfoDto? room
});


$RoomInfoDtoCopyWith<$Res>? get room;

}
/// @nodoc
class _$MatchmakingStatusDtoCopyWithImpl<$Res>
    implements $MatchmakingStatusDtoCopyWith<$Res> {
  _$MatchmakingStatusDtoCopyWithImpl(this._self, this._then);

  final MatchmakingStatusDto _self;
  final $Res Function(MatchmakingStatusDto) _then;

/// Create a copy of MatchmakingStatusDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? room = freezed,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as RoomInfoDto?,
  ));
}
/// Create a copy of MatchmakingStatusDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomInfoDtoCopyWith<$Res>? get room {
    if (_self.room == null) {
    return null;
  }

  return $RoomInfoDtoCopyWith<$Res>(_self.room!, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchmakingStatusDto].
extension MatchmakingStatusDtoPatterns on MatchmakingStatusDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchmakingStatusDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchmakingStatusDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchmakingStatusDto value)  $default,){
final _that = this;
switch (_that) {
case _MatchmakingStatusDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchmakingStatusDto value)?  $default,){
final _that = this;
switch (_that) {
case _MatchmakingStatusDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String state,  RoomInfoDto? room)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchmakingStatusDto() when $default != null:
return $default(_that.state,_that.room);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String state,  RoomInfoDto? room)  $default,) {final _that = this;
switch (_that) {
case _MatchmakingStatusDto():
return $default(_that.state,_that.room);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String state,  RoomInfoDto? room)?  $default,) {final _that = this;
switch (_that) {
case _MatchmakingStatusDto() when $default != null:
return $default(_that.state,_that.room);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchmakingStatusDto implements MatchmakingStatusDto {
  const _MatchmakingStatusDto({required this.state, this.room});
  factory _MatchmakingStatusDto.fromJson(Map<String, dynamic> json) => _$MatchmakingStatusDtoFromJson(json);

@override final  String state;
// "IDLE", "WAITING", "IN_ROOM"
@override final  RoomInfoDto? room;

/// Create a copy of MatchmakingStatusDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchmakingStatusDtoCopyWith<_MatchmakingStatusDto> get copyWith => __$MatchmakingStatusDtoCopyWithImpl<_MatchmakingStatusDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchmakingStatusDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchmakingStatusDto&&(identical(other.state, state) || other.state == state)&&(identical(other.room, room) || other.room == room));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,room);

@override
String toString() {
  return 'MatchmakingStatusDto(state: $state, room: $room)';
}


}

/// @nodoc
abstract mixin class _$MatchmakingStatusDtoCopyWith<$Res> implements $MatchmakingStatusDtoCopyWith<$Res> {
  factory _$MatchmakingStatusDtoCopyWith(_MatchmakingStatusDto value, $Res Function(_MatchmakingStatusDto) _then) = __$MatchmakingStatusDtoCopyWithImpl;
@override @useResult
$Res call({
 String state, RoomInfoDto? room
});


@override $RoomInfoDtoCopyWith<$Res>? get room;

}
/// @nodoc
class __$MatchmakingStatusDtoCopyWithImpl<$Res>
    implements _$MatchmakingStatusDtoCopyWith<$Res> {
  __$MatchmakingStatusDtoCopyWithImpl(this._self, this._then);

  final _MatchmakingStatusDto _self;
  final $Res Function(_MatchmakingStatusDto) _then;

/// Create a copy of MatchmakingStatusDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? room = freezed,}) {
  return _then(_MatchmakingStatusDto(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as RoomInfoDto?,
  ));
}

/// Create a copy of MatchmakingStatusDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomInfoDtoCopyWith<$Res>? get room {
    if (_self.room == null) {
    return null;
  }

  return $RoomInfoDtoCopyWith<$Res>(_self.room!, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}


/// @nodoc
mixin _$RoomInfoDto {

 String get roomId; List<String> get players; String get createdAt;
/// Create a copy of RoomInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomInfoDtoCopyWith<RoomInfoDto> get copyWith => _$RoomInfoDtoCopyWithImpl<RoomInfoDto>(this as RoomInfoDto, _$identity);

  /// Serializes this RoomInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomInfoDto&&(identical(other.roomId, roomId) || other.roomId == roomId)&&const DeepCollectionEquality().equals(other.players, players)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,const DeepCollectionEquality().hash(players),createdAt);

@override
String toString() {
  return 'RoomInfoDto(roomId: $roomId, players: $players, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $RoomInfoDtoCopyWith<$Res>  {
  factory $RoomInfoDtoCopyWith(RoomInfoDto value, $Res Function(RoomInfoDto) _then) = _$RoomInfoDtoCopyWithImpl;
@useResult
$Res call({
 String roomId, List<String> players, String createdAt
});




}
/// @nodoc
class _$RoomInfoDtoCopyWithImpl<$Res>
    implements $RoomInfoDtoCopyWith<$Res> {
  _$RoomInfoDtoCopyWithImpl(this._self, this._then);

  final RoomInfoDto _self;
  final $Res Function(RoomInfoDto) _then;

/// Create a copy of RoomInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = null,Object? players = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomInfoDto].
extension RoomInfoDtoPatterns on RoomInfoDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomInfoDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _RoomInfoDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _RoomInfoDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roomId,  List<String> players,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomInfoDto() when $default != null:
return $default(_that.roomId,_that.players,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roomId,  List<String> players,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _RoomInfoDto():
return $default(_that.roomId,_that.players,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roomId,  List<String> players,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _RoomInfoDto() when $default != null:
return $default(_that.roomId,_that.players,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomInfoDto implements RoomInfoDto {
  const _RoomInfoDto({required this.roomId, required final  List<String> players, required this.createdAt}): _players = players;
  factory _RoomInfoDto.fromJson(Map<String, dynamic> json) => _$RoomInfoDtoFromJson(json);

@override final  String roomId;
 final  List<String> _players;
@override List<String> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}

@override final  String createdAt;

/// Create a copy of RoomInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomInfoDtoCopyWith<_RoomInfoDto> get copyWith => __$RoomInfoDtoCopyWithImpl<_RoomInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomInfoDto&&(identical(other.roomId, roomId) || other.roomId == roomId)&&const DeepCollectionEquality().equals(other._players, _players)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,const DeepCollectionEquality().hash(_players),createdAt);

@override
String toString() {
  return 'RoomInfoDto(roomId: $roomId, players: $players, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RoomInfoDtoCopyWith<$Res> implements $RoomInfoDtoCopyWith<$Res> {
  factory _$RoomInfoDtoCopyWith(_RoomInfoDto value, $Res Function(_RoomInfoDto) _then) = __$RoomInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String roomId, List<String> players, String createdAt
});




}
/// @nodoc
class __$RoomInfoDtoCopyWithImpl<$Res>
    implements _$RoomInfoDtoCopyWith<$Res> {
  __$RoomInfoDtoCopyWithImpl(this._self, this._then);

  final _RoomInfoDto _self;
  final $Res Function(_RoomInfoDto) _then;

/// Create a copy of RoomInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? players = null,Object? createdAt = null,}) {
  return _then(_RoomInfoDto(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
