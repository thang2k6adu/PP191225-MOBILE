// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matchmaking_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchmakingResponseDto {

 RoomDto get room;
/// Create a copy of MatchmakingResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchmakingResponseDtoCopyWith<MatchmakingResponseDto> get copyWith => _$MatchmakingResponseDtoCopyWithImpl<MatchmakingResponseDto>(this as MatchmakingResponseDto, _$identity);

  /// Serializes this MatchmakingResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchmakingResponseDto&&(identical(other.room, room) || other.room == room));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,room);

@override
String toString() {
  return 'MatchmakingResponseDto(room: $room)';
}


}

/// @nodoc
abstract mixin class $MatchmakingResponseDtoCopyWith<$Res>  {
  factory $MatchmakingResponseDtoCopyWith(MatchmakingResponseDto value, $Res Function(MatchmakingResponseDto) _then) = _$MatchmakingResponseDtoCopyWithImpl;
@useResult
$Res call({
 RoomDto room
});


$RoomDtoCopyWith<$Res> get room;

}
/// @nodoc
class _$MatchmakingResponseDtoCopyWithImpl<$Res>
    implements $MatchmakingResponseDtoCopyWith<$Res> {
  _$MatchmakingResponseDtoCopyWithImpl(this._self, this._then);

  final MatchmakingResponseDto _self;
  final $Res Function(MatchmakingResponseDto) _then;

/// Create a copy of MatchmakingResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? room = null,}) {
  return _then(_self.copyWith(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as RoomDto,
  ));
}
/// Create a copy of MatchmakingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomDtoCopyWith<$Res> get room {
  
  return $RoomDtoCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}


/// Adds pattern-matching-related methods to [MatchmakingResponseDto].
extension MatchmakingResponseDtoPatterns on MatchmakingResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchmakingResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchmakingResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchmakingResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _MatchmakingResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchmakingResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _MatchmakingResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RoomDto room)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchmakingResponseDto() when $default != null:
return $default(_that.room);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RoomDto room)  $default,) {final _that = this;
switch (_that) {
case _MatchmakingResponseDto():
return $default(_that.room);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RoomDto room)?  $default,) {final _that = this;
switch (_that) {
case _MatchmakingResponseDto() when $default != null:
return $default(_that.room);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchmakingResponseDto extends MatchmakingResponseDto {
  const _MatchmakingResponseDto({required this.room}): super._();
  factory _MatchmakingResponseDto.fromJson(Map<String, dynamic> json) => _$MatchmakingResponseDtoFromJson(json);

@override final  RoomDto room;

/// Create a copy of MatchmakingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchmakingResponseDtoCopyWith<_MatchmakingResponseDto> get copyWith => __$MatchmakingResponseDtoCopyWithImpl<_MatchmakingResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchmakingResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchmakingResponseDto&&(identical(other.room, room) || other.room == room));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,room);

@override
String toString() {
  return 'MatchmakingResponseDto(room: $room)';
}


}

/// @nodoc
abstract mixin class _$MatchmakingResponseDtoCopyWith<$Res> implements $MatchmakingResponseDtoCopyWith<$Res> {
  factory _$MatchmakingResponseDtoCopyWith(_MatchmakingResponseDto value, $Res Function(_MatchmakingResponseDto) _then) = __$MatchmakingResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 RoomDto room
});


@override $RoomDtoCopyWith<$Res> get room;

}
/// @nodoc
class __$MatchmakingResponseDtoCopyWithImpl<$Res>
    implements _$MatchmakingResponseDtoCopyWith<$Res> {
  __$MatchmakingResponseDtoCopyWithImpl(this._self, this._then);

  final _MatchmakingResponseDto _self;
  final $Res Function(_MatchmakingResponseDto) _then;

/// Create a copy of MatchmakingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? room = null,}) {
  return _then(_MatchmakingResponseDto(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as RoomDto,
  ));
}

/// Create a copy of MatchmakingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomDtoCopyWith<$Res> get room {
  
  return $RoomDtoCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

// dart format on
