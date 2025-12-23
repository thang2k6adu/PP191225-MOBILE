// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opponent_event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpponentEventDto {

 String get message; String? get roomId;
/// Create a copy of OpponentEventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpponentEventDtoCopyWith<OpponentEventDto> get copyWith => _$OpponentEventDtoCopyWithImpl<OpponentEventDto>(this as OpponentEventDto, _$identity);

  /// Serializes this OpponentEventDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpponentEventDto&&(identical(other.message, message) || other.message == message)&&(identical(other.roomId, roomId) || other.roomId == roomId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,roomId);

@override
String toString() {
  return 'OpponentEventDto(message: $message, roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class $OpponentEventDtoCopyWith<$Res>  {
  factory $OpponentEventDtoCopyWith(OpponentEventDto value, $Res Function(OpponentEventDto) _then) = _$OpponentEventDtoCopyWithImpl;
@useResult
$Res call({
 String message, String? roomId
});




}
/// @nodoc
class _$OpponentEventDtoCopyWithImpl<$Res>
    implements $OpponentEventDtoCopyWith<$Res> {
  _$OpponentEventDtoCopyWithImpl(this._self, this._then);

  final OpponentEventDto _self;
  final $Res Function(OpponentEventDto) _then;

/// Create a copy of OpponentEventDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? roomId = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OpponentEventDto].
extension OpponentEventDtoPatterns on OpponentEventDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpponentEventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpponentEventDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpponentEventDto value)  $default,){
final _that = this;
switch (_that) {
case _OpponentEventDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpponentEventDto value)?  $default,){
final _that = this;
switch (_that) {
case _OpponentEventDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  String? roomId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpponentEventDto() when $default != null:
return $default(_that.message,_that.roomId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  String? roomId)  $default,) {final _that = this;
switch (_that) {
case _OpponentEventDto():
return $default(_that.message,_that.roomId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  String? roomId)?  $default,) {final _that = this;
switch (_that) {
case _OpponentEventDto() when $default != null:
return $default(_that.message,_that.roomId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpponentEventDto implements OpponentEventDto {
  const _OpponentEventDto({required this.message, this.roomId});
  factory _OpponentEventDto.fromJson(Map<String, dynamic> json) => _$OpponentEventDtoFromJson(json);

@override final  String message;
@override final  String? roomId;

/// Create a copy of OpponentEventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpponentEventDtoCopyWith<_OpponentEventDto> get copyWith => __$OpponentEventDtoCopyWithImpl<_OpponentEventDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpponentEventDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpponentEventDto&&(identical(other.message, message) || other.message == message)&&(identical(other.roomId, roomId) || other.roomId == roomId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,roomId);

@override
String toString() {
  return 'OpponentEventDto(message: $message, roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class _$OpponentEventDtoCopyWith<$Res> implements $OpponentEventDtoCopyWith<$Res> {
  factory _$OpponentEventDtoCopyWith(_OpponentEventDto value, $Res Function(_OpponentEventDto) _then) = __$OpponentEventDtoCopyWithImpl;
@override @useResult
$Res call({
 String message, String? roomId
});




}
/// @nodoc
class __$OpponentEventDtoCopyWithImpl<$Res>
    implements _$OpponentEventDtoCopyWith<$Res> {
  __$OpponentEventDtoCopyWithImpl(this._self, this._then);

  final _OpponentEventDto _self;
  final $Res Function(_OpponentEventDto) _then;

/// Create a copy of OpponentEventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? roomId = freezed,}) {
  return _then(_OpponentEventDto(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
