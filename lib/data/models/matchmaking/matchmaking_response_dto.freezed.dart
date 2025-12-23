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

 String get status;// "WAITING" or "MATCHED"
 String get message; MatchDataDto? get matchData;
/// Create a copy of MatchmakingResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchmakingResponseDtoCopyWith<MatchmakingResponseDto> get copyWith => _$MatchmakingResponseDtoCopyWithImpl<MatchmakingResponseDto>(this as MatchmakingResponseDto, _$identity);

  /// Serializes this MatchmakingResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchmakingResponseDto&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.matchData, matchData) || other.matchData == matchData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,matchData);

@override
String toString() {
  return 'MatchmakingResponseDto(status: $status, message: $message, matchData: $matchData)';
}


}

/// @nodoc
abstract mixin class $MatchmakingResponseDtoCopyWith<$Res>  {
  factory $MatchmakingResponseDtoCopyWith(MatchmakingResponseDto value, $Res Function(MatchmakingResponseDto) _then) = _$MatchmakingResponseDtoCopyWithImpl;
@useResult
$Res call({
 String status, String message, MatchDataDto? matchData
});


$MatchDataDtoCopyWith<$Res>? get matchData;

}
/// @nodoc
class _$MatchmakingResponseDtoCopyWithImpl<$Res>
    implements $MatchmakingResponseDtoCopyWith<$Res> {
  _$MatchmakingResponseDtoCopyWithImpl(this._self, this._then);

  final MatchmakingResponseDto _self;
  final $Res Function(MatchmakingResponseDto) _then;

/// Create a copy of MatchmakingResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? matchData = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,matchData: freezed == matchData ? _self.matchData : matchData // ignore: cast_nullable_to_non_nullable
as MatchDataDto?,
  ));
}
/// Create a copy of MatchmakingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchDataDtoCopyWith<$Res>? get matchData {
    if (_self.matchData == null) {
    return null;
  }

  return $MatchDataDtoCopyWith<$Res>(_self.matchData!, (value) {
    return _then(_self.copyWith(matchData: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String message,  MatchDataDto? matchData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchmakingResponseDto() when $default != null:
return $default(_that.status,_that.message,_that.matchData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String message,  MatchDataDto? matchData)  $default,) {final _that = this;
switch (_that) {
case _MatchmakingResponseDto():
return $default(_that.status,_that.message,_that.matchData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String message,  MatchDataDto? matchData)?  $default,) {final _that = this;
switch (_that) {
case _MatchmakingResponseDto() when $default != null:
return $default(_that.status,_that.message,_that.matchData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchmakingResponseDto implements MatchmakingResponseDto {
  const _MatchmakingResponseDto({required this.status, required this.message, this.matchData});
  factory _MatchmakingResponseDto.fromJson(Map<String, dynamic> json) => _$MatchmakingResponseDtoFromJson(json);

@override final  String status;
// "WAITING" or "MATCHED"
@override final  String message;
@override final  MatchDataDto? matchData;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchmakingResponseDto&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.matchData, matchData) || other.matchData == matchData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,matchData);

@override
String toString() {
  return 'MatchmakingResponseDto(status: $status, message: $message, matchData: $matchData)';
}


}

/// @nodoc
abstract mixin class _$MatchmakingResponseDtoCopyWith<$Res> implements $MatchmakingResponseDtoCopyWith<$Res> {
  factory _$MatchmakingResponseDtoCopyWith(_MatchmakingResponseDto value, $Res Function(_MatchmakingResponseDto) _then) = __$MatchmakingResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String status, String message, MatchDataDto? matchData
});


@override $MatchDataDtoCopyWith<$Res>? get matchData;

}
/// @nodoc
class __$MatchmakingResponseDtoCopyWithImpl<$Res>
    implements _$MatchmakingResponseDtoCopyWith<$Res> {
  __$MatchmakingResponseDtoCopyWithImpl(this._self, this._then);

  final _MatchmakingResponseDto _self;
  final $Res Function(_MatchmakingResponseDto) _then;

/// Create a copy of MatchmakingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? matchData = freezed,}) {
  return _then(_MatchmakingResponseDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,matchData: freezed == matchData ? _self.matchData : matchData // ignore: cast_nullable_to_non_nullable
as MatchDataDto?,
  ));
}

/// Create a copy of MatchmakingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchDataDtoCopyWith<$Res>? get matchData {
    if (_self.matchData == null) {
    return null;
  }

  return $MatchDataDtoCopyWith<$Res>(_self.matchData!, (value) {
    return _then(_self.copyWith(matchData: value));
  });
}
}


/// @nodoc
mixin _$MatchDataDto {

 String get roomId; String get opponentId; String? get opponentName;
/// Create a copy of MatchDataDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchDataDtoCopyWith<MatchDataDto> get copyWith => _$MatchDataDtoCopyWithImpl<MatchDataDto>(this as MatchDataDto, _$identity);

  /// Serializes this MatchDataDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchDataDto&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.opponentId, opponentId) || other.opponentId == opponentId)&&(identical(other.opponentName, opponentName) || other.opponentName == opponentName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,opponentId,opponentName);

@override
String toString() {
  return 'MatchDataDto(roomId: $roomId, opponentId: $opponentId, opponentName: $opponentName)';
}


}

/// @nodoc
abstract mixin class $MatchDataDtoCopyWith<$Res>  {
  factory $MatchDataDtoCopyWith(MatchDataDto value, $Res Function(MatchDataDto) _then) = _$MatchDataDtoCopyWithImpl;
@useResult
$Res call({
 String roomId, String opponentId, String? opponentName
});




}
/// @nodoc
class _$MatchDataDtoCopyWithImpl<$Res>
    implements $MatchDataDtoCopyWith<$Res> {
  _$MatchDataDtoCopyWithImpl(this._self, this._then);

  final MatchDataDto _self;
  final $Res Function(MatchDataDto) _then;

/// Create a copy of MatchDataDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = null,Object? opponentId = null,Object? opponentName = freezed,}) {
  return _then(_self.copyWith(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,opponentId: null == opponentId ? _self.opponentId : opponentId // ignore: cast_nullable_to_non_nullable
as String,opponentName: freezed == opponentName ? _self.opponentName : opponentName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchDataDto].
extension MatchDataDtoPatterns on MatchDataDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchDataDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchDataDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchDataDto value)  $default,){
final _that = this;
switch (_that) {
case _MatchDataDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchDataDto value)?  $default,){
final _that = this;
switch (_that) {
case _MatchDataDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roomId,  String opponentId,  String? opponentName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchDataDto() when $default != null:
return $default(_that.roomId,_that.opponentId,_that.opponentName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roomId,  String opponentId,  String? opponentName)  $default,) {final _that = this;
switch (_that) {
case _MatchDataDto():
return $default(_that.roomId,_that.opponentId,_that.opponentName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roomId,  String opponentId,  String? opponentName)?  $default,) {final _that = this;
switch (_that) {
case _MatchDataDto() when $default != null:
return $default(_that.roomId,_that.opponentId,_that.opponentName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchDataDto implements MatchDataDto {
  const _MatchDataDto({required this.roomId, required this.opponentId, this.opponentName});
  factory _MatchDataDto.fromJson(Map<String, dynamic> json) => _$MatchDataDtoFromJson(json);

@override final  String roomId;
@override final  String opponentId;
@override final  String? opponentName;

/// Create a copy of MatchDataDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchDataDtoCopyWith<_MatchDataDto> get copyWith => __$MatchDataDtoCopyWithImpl<_MatchDataDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchDataDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchDataDto&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.opponentId, opponentId) || other.opponentId == opponentId)&&(identical(other.opponentName, opponentName) || other.opponentName == opponentName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomId,opponentId,opponentName);

@override
String toString() {
  return 'MatchDataDto(roomId: $roomId, opponentId: $opponentId, opponentName: $opponentName)';
}


}

/// @nodoc
abstract mixin class _$MatchDataDtoCopyWith<$Res> implements $MatchDataDtoCopyWith<$Res> {
  factory _$MatchDataDtoCopyWith(_MatchDataDto value, $Res Function(_MatchDataDto) _then) = __$MatchDataDtoCopyWithImpl;
@override @useResult
$Res call({
 String roomId, String opponentId, String? opponentName
});




}
/// @nodoc
class __$MatchDataDtoCopyWithImpl<$Res>
    implements _$MatchDataDtoCopyWith<$Res> {
  __$MatchDataDtoCopyWithImpl(this._self, this._then);

  final _MatchDataDto _self;
  final $Res Function(_MatchDataDto) _then;

/// Create a copy of MatchDataDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? opponentId = null,Object? opponentName = freezed,}) {
  return _then(_MatchDataDto(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,opponentId: null == opponentId ? _self.opponentId : opponentId // ignore: cast_nullable_to_non_nullable
as String,opponentName: freezed == opponentName ? _self.opponentName : opponentName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
