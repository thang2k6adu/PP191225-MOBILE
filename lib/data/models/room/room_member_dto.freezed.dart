// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_member_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomMemberDto {

 String get userId; RoomMemberStatus get status;
/// Create a copy of RoomMemberDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomMemberDtoCopyWith<RoomMemberDto> get copyWith => _$RoomMemberDtoCopyWithImpl<RoomMemberDto>(this as RoomMemberDto, _$identity);

  /// Serializes this RoomMemberDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomMemberDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,status);

@override
String toString() {
  return 'RoomMemberDto(userId: $userId, status: $status)';
}


}

/// @nodoc
abstract mixin class $RoomMemberDtoCopyWith<$Res>  {
  factory $RoomMemberDtoCopyWith(RoomMemberDto value, $Res Function(RoomMemberDto) _then) = _$RoomMemberDtoCopyWithImpl;
@useResult
$Res call({
 String userId, RoomMemberStatus status
});




}
/// @nodoc
class _$RoomMemberDtoCopyWithImpl<$Res>
    implements $RoomMemberDtoCopyWith<$Res> {
  _$RoomMemberDtoCopyWithImpl(this._self, this._then);

  final RoomMemberDto _self;
  final $Res Function(RoomMemberDto) _then;

/// Create a copy of RoomMemberDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? status = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RoomMemberStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomMemberDto].
extension RoomMemberDtoPatterns on RoomMemberDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomMemberDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomMemberDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomMemberDto value)  $default,){
final _that = this;
switch (_that) {
case _RoomMemberDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomMemberDto value)?  $default,){
final _that = this;
switch (_that) {
case _RoomMemberDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  RoomMemberStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomMemberDto() when $default != null:
return $default(_that.userId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  RoomMemberStatus status)  $default,) {final _that = this;
switch (_that) {
case _RoomMemberDto():
return $default(_that.userId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  RoomMemberStatus status)?  $default,) {final _that = this;
switch (_that) {
case _RoomMemberDto() when $default != null:
return $default(_that.userId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomMemberDto extends RoomMemberDto {
  const _RoomMemberDto({required this.userId, required this.status}): super._();
  factory _RoomMemberDto.fromJson(Map<String, dynamic> json) => _$RoomMemberDtoFromJson(json);

@override final  String userId;
@override final  RoomMemberStatus status;

/// Create a copy of RoomMemberDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomMemberDtoCopyWith<_RoomMemberDto> get copyWith => __$RoomMemberDtoCopyWithImpl<_RoomMemberDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomMemberDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomMemberDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,status);

@override
String toString() {
  return 'RoomMemberDto(userId: $userId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RoomMemberDtoCopyWith<$Res> implements $RoomMemberDtoCopyWith<$Res> {
  factory _$RoomMemberDtoCopyWith(_RoomMemberDto value, $Res Function(_RoomMemberDto) _then) = __$RoomMemberDtoCopyWithImpl;
@override @useResult
$Res call({
 String userId, RoomMemberStatus status
});




}
/// @nodoc
class __$RoomMemberDtoCopyWithImpl<$Res>
    implements _$RoomMemberDtoCopyWith<$Res> {
  __$RoomMemberDtoCopyWithImpl(this._self, this._then);

  final _RoomMemberDto _self;
  final $Res Function(_RoomMemberDto) _then;

/// Create a copy of RoomMemberDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? status = null,}) {
  return _then(_RoomMemberDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RoomMemberStatus,
  ));
}


}

// dart format on
