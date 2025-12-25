// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgressResponseDto {

 double get progress;// 0-100%
 int get totalTimeSpent;// Total seconds
 int get estimateSeconds;// Estimate in seconds
 int get expEarned;// Total EXP earned
 List<TrackingSessionDto> get sessions; TrackingSessionDto? get currentSession;
/// Create a copy of ProgressResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressResponseDtoCopyWith<ProgressResponseDto> get copyWith => _$ProgressResponseDtoCopyWithImpl<ProgressResponseDto>(this as ProgressResponseDto, _$identity);

  /// Serializes this ProgressResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressResponseDto&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.totalTimeSpent, totalTimeSpent) || other.totalTimeSpent == totalTimeSpent)&&(identical(other.estimateSeconds, estimateSeconds) || other.estimateSeconds == estimateSeconds)&&(identical(other.expEarned, expEarned) || other.expEarned == expEarned)&&const DeepCollectionEquality().equals(other.sessions, sessions)&&(identical(other.currentSession, currentSession) || other.currentSession == currentSession));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progress,totalTimeSpent,estimateSeconds,expEarned,const DeepCollectionEquality().hash(sessions),currentSession);

@override
String toString() {
  return 'ProgressResponseDto(progress: $progress, totalTimeSpent: $totalTimeSpent, estimateSeconds: $estimateSeconds, expEarned: $expEarned, sessions: $sessions, currentSession: $currentSession)';
}


}

/// @nodoc
abstract mixin class $ProgressResponseDtoCopyWith<$Res>  {
  factory $ProgressResponseDtoCopyWith(ProgressResponseDto value, $Res Function(ProgressResponseDto) _then) = _$ProgressResponseDtoCopyWithImpl;
@useResult
$Res call({
 double progress, int totalTimeSpent, int estimateSeconds, int expEarned, List<TrackingSessionDto> sessions, TrackingSessionDto? currentSession
});


$TrackingSessionDtoCopyWith<$Res>? get currentSession;

}
/// @nodoc
class _$ProgressResponseDtoCopyWithImpl<$Res>
    implements $ProgressResponseDtoCopyWith<$Res> {
  _$ProgressResponseDtoCopyWithImpl(this._self, this._then);

  final ProgressResponseDto _self;
  final $Res Function(ProgressResponseDto) _then;

/// Create a copy of ProgressResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? progress = null,Object? totalTimeSpent = null,Object? estimateSeconds = null,Object? expEarned = null,Object? sessions = null,Object? currentSession = freezed,}) {
  return _then(_self.copyWith(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,totalTimeSpent: null == totalTimeSpent ? _self.totalTimeSpent : totalTimeSpent // ignore: cast_nullable_to_non_nullable
as int,estimateSeconds: null == estimateSeconds ? _self.estimateSeconds : estimateSeconds // ignore: cast_nullable_to_non_nullable
as int,expEarned: null == expEarned ? _self.expEarned : expEarned // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<TrackingSessionDto>,currentSession: freezed == currentSession ? _self.currentSession : currentSession // ignore: cast_nullable_to_non_nullable
as TrackingSessionDto?,
  ));
}
/// Create a copy of ProgressResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackingSessionDtoCopyWith<$Res>? get currentSession {
    if (_self.currentSession == null) {
    return null;
  }

  return $TrackingSessionDtoCopyWith<$Res>(_self.currentSession!, (value) {
    return _then(_self.copyWith(currentSession: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProgressResponseDto].
extension ProgressResponseDtoPatterns on ProgressResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ProgressResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double progress,  int totalTimeSpent,  int estimateSeconds,  int expEarned,  List<TrackingSessionDto> sessions,  TrackingSessionDto? currentSession)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressResponseDto() when $default != null:
return $default(_that.progress,_that.totalTimeSpent,_that.estimateSeconds,_that.expEarned,_that.sessions,_that.currentSession);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double progress,  int totalTimeSpent,  int estimateSeconds,  int expEarned,  List<TrackingSessionDto> sessions,  TrackingSessionDto? currentSession)  $default,) {final _that = this;
switch (_that) {
case _ProgressResponseDto():
return $default(_that.progress,_that.totalTimeSpent,_that.estimateSeconds,_that.expEarned,_that.sessions,_that.currentSession);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double progress,  int totalTimeSpent,  int estimateSeconds,  int expEarned,  List<TrackingSessionDto> sessions,  TrackingSessionDto? currentSession)?  $default,) {final _that = this;
switch (_that) {
case _ProgressResponseDto() when $default != null:
return $default(_that.progress,_that.totalTimeSpent,_that.estimateSeconds,_that.expEarned,_that.sessions,_that.currentSession);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgressResponseDto extends ProgressResponseDto {
  const _ProgressResponseDto({required this.progress, required this.totalTimeSpent, required this.estimateSeconds, required this.expEarned, final  List<TrackingSessionDto> sessions = const [], this.currentSession}): _sessions = sessions,super._();
  factory _ProgressResponseDto.fromJson(Map<String, dynamic> json) => _$ProgressResponseDtoFromJson(json);

@override final  double progress;
// 0-100%
@override final  int totalTimeSpent;
// Total seconds
@override final  int estimateSeconds;
// Estimate in seconds
@override final  int expEarned;
// Total EXP earned
 final  List<TrackingSessionDto> _sessions;
// Total EXP earned
@override@JsonKey() List<TrackingSessionDto> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

@override final  TrackingSessionDto? currentSession;

/// Create a copy of ProgressResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressResponseDtoCopyWith<_ProgressResponseDto> get copyWith => __$ProgressResponseDtoCopyWithImpl<_ProgressResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressResponseDto&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.totalTimeSpent, totalTimeSpent) || other.totalTimeSpent == totalTimeSpent)&&(identical(other.estimateSeconds, estimateSeconds) || other.estimateSeconds == estimateSeconds)&&(identical(other.expEarned, expEarned) || other.expEarned == expEarned)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.currentSession, currentSession) || other.currentSession == currentSession));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,progress,totalTimeSpent,estimateSeconds,expEarned,const DeepCollectionEquality().hash(_sessions),currentSession);

@override
String toString() {
  return 'ProgressResponseDto(progress: $progress, totalTimeSpent: $totalTimeSpent, estimateSeconds: $estimateSeconds, expEarned: $expEarned, sessions: $sessions, currentSession: $currentSession)';
}


}

/// @nodoc
abstract mixin class _$ProgressResponseDtoCopyWith<$Res> implements $ProgressResponseDtoCopyWith<$Res> {
  factory _$ProgressResponseDtoCopyWith(_ProgressResponseDto value, $Res Function(_ProgressResponseDto) _then) = __$ProgressResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 double progress, int totalTimeSpent, int estimateSeconds, int expEarned, List<TrackingSessionDto> sessions, TrackingSessionDto? currentSession
});


@override $TrackingSessionDtoCopyWith<$Res>? get currentSession;

}
/// @nodoc
class __$ProgressResponseDtoCopyWithImpl<$Res>
    implements _$ProgressResponseDtoCopyWith<$Res> {
  __$ProgressResponseDtoCopyWithImpl(this._self, this._then);

  final _ProgressResponseDto _self;
  final $Res Function(_ProgressResponseDto) _then;

/// Create a copy of ProgressResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? progress = null,Object? totalTimeSpent = null,Object? estimateSeconds = null,Object? expEarned = null,Object? sessions = null,Object? currentSession = freezed,}) {
  return _then(_ProgressResponseDto(
progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,totalTimeSpent: null == totalTimeSpent ? _self.totalTimeSpent : totalTimeSpent // ignore: cast_nullable_to_non_nullable
as int,estimateSeconds: null == estimateSeconds ? _self.estimateSeconds : estimateSeconds // ignore: cast_nullable_to_non_nullable
as int,expEarned: null == expEarned ? _self.expEarned : expEarned // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<TrackingSessionDto>,currentSession: freezed == currentSession ? _self.currentSession : currentSession // ignore: cast_nullable_to_non_nullable
as TrackingSessionDto?,
  ));
}

/// Create a copy of ProgressResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackingSessionDtoCopyWith<$Res>? get currentSession {
    if (_self.currentSession == null) {
    return null;
  }

  return $TrackingSessionDtoCopyWith<$Res>(_self.currentSession!, (value) {
    return _then(_self.copyWith(currentSession: value));
  });
}
}

// dart format on
