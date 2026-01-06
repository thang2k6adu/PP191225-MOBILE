// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_found_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchFoundDto {

 String get roomId; String get opponentId; String? get opponentName; String get message; String get livekitToken; String get livekitUrl;
/// Create a copy of MatchFoundDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchFoundDtoCopyWith<MatchFoundDto> get copyWith => _$MatchFoundDtoCopyWithImpl<MatchFoundDto>(this as MatchFoundDto, _$identity);

  /// Serializes this MatchFoundDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchFoundDto&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.opponentId, opponentId) || other.opponentId == opponentId)&&(identical(other.opponentName, opponentName) || other.opponentName == opponentName)&&(identical(other.message, message) || other.message == message)&&(identical(other.livekitToken, livekitToken) || other.livekitToken == livekitToken)&&(identical(other.livekitUrl, livekitUrl) || other.livekitUrl == livekitUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,opponentId,opponentName,message,livekitToken,livekitUrl);

@override
String toString() {
  return 'MatchFoundDto(roomId: $roomId, opponentId: $opponentId, opponentName: $opponentName, message: $message, livekitToken: $livekitToken, livekitUrl: $livekitUrl)';
}


}

/// @nodoc
abstract mixin class $MatchFoundDtoCopyWith<$Res>  {
  factory $MatchFoundDtoCopyWith(MatchFoundDto value, $Res Function(MatchFoundDto) _then) = _$MatchFoundDtoCopyWithImpl;
@useResult
$Res call({
 String roomId, String opponentId, String? opponentName, String message, String livekitToken, String livekitUrl
});




}
/// @nodoc
class _$MatchFoundDtoCopyWithImpl<$Res>
    implements $MatchFoundDtoCopyWith<$Res> {
  _$MatchFoundDtoCopyWithImpl(this._self, this._then);

  final MatchFoundDto _self;
  final $Res Function(MatchFoundDto) _then;

/// Create a copy of MatchFoundDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = null,Object? opponentId = null,Object? opponentName = freezed,Object? message = null,Object? livekitToken = null,Object? livekitUrl = null,}) {
  return _then(_self.copyWith(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,opponentId: null == opponentId ? _self.opponentId : opponentId // ignore: cast_nullable_to_non_nullable
as String,opponentName: freezed == opponentName ? _self.opponentName : opponentName // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,livekitToken: null == livekitToken ? _self.livekitToken : livekitToken // ignore: cast_nullable_to_non_nullable
as String,livekitUrl: null == livekitUrl ? _self.livekitUrl : livekitUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchFoundDto].
extension MatchFoundDtoPatterns on MatchFoundDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchFoundDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchFoundDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchFoundDto value)  $default,){
final _that = this;
switch (_that) {
case _MatchFoundDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchFoundDto value)?  $default,){
final _that = this;
switch (_that) {
case _MatchFoundDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roomId,  String opponentId,  String? opponentName,  String message,  String livekitToken,  String livekitUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchFoundDto() when $default != null:
return $default(_that.roomId,_that.opponentId,_that.opponentName,_that.message,_that.livekitToken,_that.livekitUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roomId,  String opponentId,  String? opponentName,  String message,  String livekitToken,  String livekitUrl)  $default,) {final _that = this;
switch (_that) {
case _MatchFoundDto():
return $default(_that.roomId,_that.opponentId,_that.opponentName,_that.message,_that.livekitToken,_that.livekitUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roomId,  String opponentId,  String? opponentName,  String message,  String livekitToken,  String livekitUrl)?  $default,) {final _that = this;
switch (_that) {
case _MatchFoundDto() when $default != null:
return $default(_that.roomId,_that.opponentId,_that.opponentName,_that.message,_that.livekitToken,_that.livekitUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchFoundDto implements MatchFoundDto {
  const _MatchFoundDto({required this.roomId, required this.opponentId, this.opponentName, required this.message, required this.livekitToken, required this.livekitUrl});
  factory _MatchFoundDto.fromJson(Map<String, dynamic> json) => _$MatchFoundDtoFromJson(json);

@override final  String roomId;
@override final  String opponentId;
@override final  String? opponentName;
@override final  String message;
@override final  String livekitToken;
@override final  String livekitUrl;

/// Create a copy of MatchFoundDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchFoundDtoCopyWith<_MatchFoundDto> get copyWith => __$MatchFoundDtoCopyWithImpl<_MatchFoundDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchFoundDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchFoundDto&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.opponentId, opponentId) || other.opponentId == opponentId)&&(identical(other.opponentName, opponentName) || other.opponentName == opponentName)&&(identical(other.message, message) || other.message == message)&&(identical(other.livekitToken, livekitToken) || other.livekitToken == livekitToken)&&(identical(other.livekitUrl, livekitUrl) || other.livekitUrl == livekitUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,opponentId,opponentName,message,livekitToken,livekitUrl);

@override
String toString() {
  return 'MatchFoundDto(roomId: $roomId, opponentId: $opponentId, opponentName: $opponentName, message: $message, livekitToken: $livekitToken, livekitUrl: $livekitUrl)';
}


}

/// @nodoc
abstract mixin class _$MatchFoundDtoCopyWith<$Res> implements $MatchFoundDtoCopyWith<$Res> {
  factory _$MatchFoundDtoCopyWith(_MatchFoundDto value, $Res Function(_MatchFoundDto) _then) = __$MatchFoundDtoCopyWithImpl;
@override @useResult
$Res call({
 String roomId, String opponentId, String? opponentName, String message, String livekitToken, String livekitUrl
});




}
/// @nodoc
class __$MatchFoundDtoCopyWithImpl<$Res>
    implements _$MatchFoundDtoCopyWith<$Res> {
  __$MatchFoundDtoCopyWithImpl(this._self, this._then);

  final _MatchFoundDto _self;
  final $Res Function(_MatchFoundDto) _then;

/// Create a copy of MatchFoundDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? opponentId = null,Object? opponentName = freezed,Object? message = null,Object? livekitToken = null,Object? livekitUrl = null,}) {
  return _then(_MatchFoundDto(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,opponentId: null == opponentId ? _self.opponentId : opponentId // ignore: cast_nullable_to_non_nullable
as String,opponentName: freezed == opponentName ? _self.opponentName : opponentName // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,livekitToken: null == livekitToken ? _self.livekitToken : livekitToken // ignore: cast_nullable_to_non_nullable
as String,livekitUrl: null == livekitUrl ? _self.livekitUrl : livekitUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
