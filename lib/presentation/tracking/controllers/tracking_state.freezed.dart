// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrackingState {

 TrackingSession? get currentSession; Task? get activeTask; int get currentTime;// Current elapsed time in seconds
 bool get isLoading; String? get error; ProgressResponse? get progressData;
/// Create a copy of TrackingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingStateCopyWith<TrackingState> get copyWith => _$TrackingStateCopyWithImpl<TrackingState>(this as TrackingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingState&&(identical(other.currentSession, currentSession) || other.currentSession == currentSession)&&(identical(other.activeTask, activeTask) || other.activeTask == activeTask)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.progressData, progressData) || other.progressData == progressData));
}


@override
int get hashCode => Object.hash(runtimeType,currentSession,activeTask,currentTime,isLoading,error,progressData);

@override
String toString() {
  return 'TrackingState(currentSession: $currentSession, activeTask: $activeTask, currentTime: $currentTime, isLoading: $isLoading, error: $error, progressData: $progressData)';
}


}

/// @nodoc
abstract mixin class $TrackingStateCopyWith<$Res>  {
  factory $TrackingStateCopyWith(TrackingState value, $Res Function(TrackingState) _then) = _$TrackingStateCopyWithImpl;
@useResult
$Res call({
 TrackingSession? currentSession, Task? activeTask, int currentTime, bool isLoading, String? error, ProgressResponse? progressData
});




}
/// @nodoc
class _$TrackingStateCopyWithImpl<$Res>
    implements $TrackingStateCopyWith<$Res> {
  _$TrackingStateCopyWithImpl(this._self, this._then);

  final TrackingState _self;
  final $Res Function(TrackingState) _then;

/// Create a copy of TrackingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentSession = freezed,Object? activeTask = freezed,Object? currentTime = null,Object? isLoading = null,Object? error = freezed,Object? progressData = freezed,}) {
  return _then(_self.copyWith(
currentSession: freezed == currentSession ? _self.currentSession : currentSession // ignore: cast_nullable_to_non_nullable
as TrackingSession?,activeTask: freezed == activeTask ? _self.activeTask : activeTask // ignore: cast_nullable_to_non_nullable
as Task?,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,progressData: freezed == progressData ? _self.progressData : progressData // ignore: cast_nullable_to_non_nullable
as ProgressResponse?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingState].
extension TrackingStatePatterns on TrackingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingState value)  $default,){
final _that = this;
switch (_that) {
case _TrackingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingState value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TrackingSession? currentSession,  Task? activeTask,  int currentTime,  bool isLoading,  String? error,  ProgressResponse? progressData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingState() when $default != null:
return $default(_that.currentSession,_that.activeTask,_that.currentTime,_that.isLoading,_that.error,_that.progressData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TrackingSession? currentSession,  Task? activeTask,  int currentTime,  bool isLoading,  String? error,  ProgressResponse? progressData)  $default,) {final _that = this;
switch (_that) {
case _TrackingState():
return $default(_that.currentSession,_that.activeTask,_that.currentTime,_that.isLoading,_that.error,_that.progressData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TrackingSession? currentSession,  Task? activeTask,  int currentTime,  bool isLoading,  String? error,  ProgressResponse? progressData)?  $default,) {final _that = this;
switch (_that) {
case _TrackingState() when $default != null:
return $default(_that.currentSession,_that.activeTask,_that.currentTime,_that.isLoading,_that.error,_that.progressData);case _:
  return null;

}
}

}

/// @nodoc


class _TrackingState implements TrackingState {
  const _TrackingState({this.currentSession, this.activeTask, this.currentTime = 0, this.isLoading = false, this.error, this.progressData});
  

@override final  TrackingSession? currentSession;
@override final  Task? activeTask;
@override@JsonKey() final  int currentTime;
// Current elapsed time in seconds
@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override final  ProgressResponse? progressData;

/// Create a copy of TrackingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingStateCopyWith<_TrackingState> get copyWith => __$TrackingStateCopyWithImpl<_TrackingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingState&&(identical(other.currentSession, currentSession) || other.currentSession == currentSession)&&(identical(other.activeTask, activeTask) || other.activeTask == activeTask)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.progressData, progressData) || other.progressData == progressData));
}


@override
int get hashCode => Object.hash(runtimeType,currentSession,activeTask,currentTime,isLoading,error,progressData);

@override
String toString() {
  return 'TrackingState(currentSession: $currentSession, activeTask: $activeTask, currentTime: $currentTime, isLoading: $isLoading, error: $error, progressData: $progressData)';
}


}

/// @nodoc
abstract mixin class _$TrackingStateCopyWith<$Res> implements $TrackingStateCopyWith<$Res> {
  factory _$TrackingStateCopyWith(_TrackingState value, $Res Function(_TrackingState) _then) = __$TrackingStateCopyWithImpl;
@override @useResult
$Res call({
 TrackingSession? currentSession, Task? activeTask, int currentTime, bool isLoading, String? error, ProgressResponse? progressData
});




}
/// @nodoc
class __$TrackingStateCopyWithImpl<$Res>
    implements _$TrackingStateCopyWith<$Res> {
  __$TrackingStateCopyWithImpl(this._self, this._then);

  final _TrackingState _self;
  final $Res Function(_TrackingState) _then;

/// Create a copy of TrackingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentSession = freezed,Object? activeTask = freezed,Object? currentTime = null,Object? isLoading = null,Object? error = freezed,Object? progressData = freezed,}) {
  return _then(_TrackingState(
currentSession: freezed == currentSession ? _self.currentSession : currentSession // ignore: cast_nullable_to_non_nullable
as TrackingSession?,activeTask: freezed == activeTask ? _self.activeTask : activeTask // ignore: cast_nullable_to_non_nullable
as Task?,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,progressData: freezed == progressData ? _self.progressData : progressData // ignore: cast_nullable_to_non_nullable
as ProgressResponse?,
  ));
}


}

// dart format on
