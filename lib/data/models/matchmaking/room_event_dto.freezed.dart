// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomEventDto {

 String? get roomId; String get message;
/// Create a copy of RoomEventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomEventDtoCopyWith<RoomEventDto> get copyWith => _$RoomEventDtoCopyWithImpl<RoomEventDto>(this as RoomEventDto, _$identity);

  /// Serializes this RoomEventDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomEventDto&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,message);

@override
String toString() {
  return 'RoomEventDto(roomId: $roomId, message: $message)';
}


}

/// @nodoc
abstract mixin class $RoomEventDtoCopyWith<$Res>  {
  factory $RoomEventDtoCopyWith(RoomEventDto value, $Res Function(RoomEventDto) _then) = _$RoomEventDtoCopyWithImpl;
@useResult
$Res call({
 String? roomId, String message
});




}
/// @nodoc
class _$RoomEventDtoCopyWithImpl<$Res>
    implements $RoomEventDtoCopyWith<$Res> {
  _$RoomEventDtoCopyWithImpl(this._self, this._then);

  final RoomEventDto _self;
  final $Res Function(RoomEventDto) _then;

/// Create a copy of RoomEventDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = freezed,Object? message = null,}) {
  return _then(_self.copyWith(
roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomEventDto].
extension RoomEventDtoPatterns on RoomEventDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomEventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomEventDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomEventDto value)  $default,){
final _that = this;
switch (_that) {
case _RoomEventDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomEventDto value)?  $default,){
final _that = this;
switch (_that) {
case _RoomEventDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? roomId,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomEventDto() when $default != null:
return $default(_that.roomId,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? roomId,  String message)  $default,) {final _that = this;
switch (_that) {
case _RoomEventDto():
return $default(_that.roomId,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? roomId,  String message)?  $default,) {final _that = this;
switch (_that) {
case _RoomEventDto() when $default != null:
return $default(_that.roomId,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomEventDto implements RoomEventDto {
  const _RoomEventDto({this.roomId, required this.message});
  factory _RoomEventDto.fromJson(Map<String, dynamic> json) => _$RoomEventDtoFromJson(json);

@override final  String? roomId;
@override final  String message;

/// Create a copy of RoomEventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomEventDtoCopyWith<_RoomEventDto> get copyWith => __$RoomEventDtoCopyWithImpl<_RoomEventDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomEventDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomEventDto&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,message);

@override
String toString() {
  return 'RoomEventDto(roomId: $roomId, message: $message)';
}


}

/// @nodoc
abstract mixin class _$RoomEventDtoCopyWith<$Res> implements $RoomEventDtoCopyWith<$Res> {
  factory _$RoomEventDtoCopyWith(_RoomEventDto value, $Res Function(_RoomEventDto) _then) = __$RoomEventDtoCopyWithImpl;
@override @useResult
$Res call({
 String? roomId, String message
});




}
/// @nodoc
class __$RoomEventDtoCopyWithImpl<$Res>
    implements _$RoomEventDtoCopyWith<$Res> {
  __$RoomEventDtoCopyWithImpl(this._self, this._then);

  final _RoomEventDto _self;
  final $Res Function(_RoomEventDto) _then;

/// Create a copy of RoomEventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = freezed,Object? message = null,}) {
  return _then(_RoomEventDto(
roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
