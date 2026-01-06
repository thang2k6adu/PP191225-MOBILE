// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_call_token_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoCallTokenDto {

 String get token; String get url; String get roomId;
/// Create a copy of VideoCallTokenDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoCallTokenDtoCopyWith<VideoCallTokenDto> get copyWith => _$VideoCallTokenDtoCopyWithImpl<VideoCallTokenDto>(this as VideoCallTokenDto, _$identity);

  /// Serializes this VideoCallTokenDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoCallTokenDto&&(identical(other.token, token) || other.token == token)&&(identical(other.url, url) || other.url == url)&&(identical(other.roomId, roomId) || other.roomId == roomId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,url,roomId);

@override
String toString() {
  return 'VideoCallTokenDto(token: $token, url: $url, roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class $VideoCallTokenDtoCopyWith<$Res>  {
  factory $VideoCallTokenDtoCopyWith(VideoCallTokenDto value, $Res Function(VideoCallTokenDto) _then) = _$VideoCallTokenDtoCopyWithImpl;
@useResult
$Res call({
 String token, String url, String roomId
});




}
/// @nodoc
class _$VideoCallTokenDtoCopyWithImpl<$Res>
    implements $VideoCallTokenDtoCopyWith<$Res> {
  _$VideoCallTokenDtoCopyWithImpl(this._self, this._then);

  final VideoCallTokenDto _self;
  final $Res Function(VideoCallTokenDto) _then;

/// Create a copy of VideoCallTokenDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? url = null,Object? roomId = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoCallTokenDto].
extension VideoCallTokenDtoPatterns on VideoCallTokenDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoCallTokenDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoCallTokenDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoCallTokenDto value)  $default,){
final _that = this;
switch (_that) {
case _VideoCallTokenDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoCallTokenDto value)?  $default,){
final _that = this;
switch (_that) {
case _VideoCallTokenDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  String url,  String roomId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoCallTokenDto() when $default != null:
return $default(_that.token,_that.url,_that.roomId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  String url,  String roomId)  $default,) {final _that = this;
switch (_that) {
case _VideoCallTokenDto():
return $default(_that.token,_that.url,_that.roomId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  String url,  String roomId)?  $default,) {final _that = this;
switch (_that) {
case _VideoCallTokenDto() when $default != null:
return $default(_that.token,_that.url,_that.roomId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoCallTokenDto extends VideoCallTokenDto {
  const _VideoCallTokenDto({required this.token, required this.url, required this.roomId}): super._();
  factory _VideoCallTokenDto.fromJson(Map<String, dynamic> json) => _$VideoCallTokenDtoFromJson(json);

@override final  String token;
@override final  String url;
@override final  String roomId;

/// Create a copy of VideoCallTokenDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoCallTokenDtoCopyWith<_VideoCallTokenDto> get copyWith => __$VideoCallTokenDtoCopyWithImpl<_VideoCallTokenDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoCallTokenDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoCallTokenDto&&(identical(other.token, token) || other.token == token)&&(identical(other.url, url) || other.url == url)&&(identical(other.roomId, roomId) || other.roomId == roomId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,url,roomId);

@override
String toString() {
  return 'VideoCallTokenDto(token: $token, url: $url, roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class _$VideoCallTokenDtoCopyWith<$Res> implements $VideoCallTokenDtoCopyWith<$Res> {
  factory _$VideoCallTokenDtoCopyWith(_VideoCallTokenDto value, $Res Function(_VideoCallTokenDto) _then) = __$VideoCallTokenDtoCopyWithImpl;
@override @useResult
$Res call({
 String token, String url, String roomId
});




}
/// @nodoc
class __$VideoCallTokenDtoCopyWithImpl<$Res>
    implements _$VideoCallTokenDtoCopyWith<$Res> {
  __$VideoCallTokenDtoCopyWithImpl(this._self, this._then);

  final _VideoCallTokenDto _self;
  final $Res Function(_VideoCallTokenDto) _then;

/// Create a copy of VideoCallTokenDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? url = null,Object? roomId = null,}) {
  return _then(_VideoCallTokenDto(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
