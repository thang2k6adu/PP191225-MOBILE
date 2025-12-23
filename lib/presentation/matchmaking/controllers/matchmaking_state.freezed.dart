// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matchmaking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MatchmakingUIState {

 MatchmakingState get state; bool get isLoading; bool get isConnecting; String? get error; String? get message; MatchData? get matchData; bool get isConnected;
/// Create a copy of MatchmakingUIState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchmakingUIStateCopyWith<MatchmakingUIState> get copyWith => _$MatchmakingUIStateCopyWithImpl<MatchmakingUIState>(this as MatchmakingUIState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchmakingUIState&&(identical(other.state, state) || other.state == state)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isConnecting, isConnecting) || other.isConnecting == isConnecting)&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.matchData, matchData) || other.matchData == matchData)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,state,isLoading,isConnecting,error,message,matchData,isConnected);

@override
String toString() {
  return 'MatchmakingUIState(state: $state, isLoading: $isLoading, isConnecting: $isConnecting, error: $error, message: $message, matchData: $matchData, isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class $MatchmakingUIStateCopyWith<$Res>  {
  factory $MatchmakingUIStateCopyWith(MatchmakingUIState value, $Res Function(MatchmakingUIState) _then) = _$MatchmakingUIStateCopyWithImpl;
@useResult
$Res call({
 MatchmakingState state, bool isLoading, bool isConnecting, String? error, String? message, MatchData? matchData, bool isConnected
});




}
/// @nodoc
class _$MatchmakingUIStateCopyWithImpl<$Res>
    implements $MatchmakingUIStateCopyWith<$Res> {
  _$MatchmakingUIStateCopyWithImpl(this._self, this._then);

  final MatchmakingUIState _self;
  final $Res Function(MatchmakingUIState) _then;

/// Create a copy of MatchmakingUIState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? isLoading = null,Object? isConnecting = null,Object? error = freezed,Object? message = freezed,Object? matchData = freezed,Object? isConnected = null,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as MatchmakingState,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isConnecting: null == isConnecting ? _self.isConnecting : isConnecting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,matchData: freezed == matchData ? _self.matchData : matchData // ignore: cast_nullable_to_non_nullable
as MatchData?,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchmakingUIState].
extension MatchmakingUIStatePatterns on MatchmakingUIState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchmakingUIState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchmakingUIState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchmakingUIState value)  $default,){
final _that = this;
switch (_that) {
case _MatchmakingUIState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchmakingUIState value)?  $default,){
final _that = this;
switch (_that) {
case _MatchmakingUIState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MatchmakingState state,  bool isLoading,  bool isConnecting,  String? error,  String? message,  MatchData? matchData,  bool isConnected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchmakingUIState() when $default != null:
return $default(_that.state,_that.isLoading,_that.isConnecting,_that.error,_that.message,_that.matchData,_that.isConnected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MatchmakingState state,  bool isLoading,  bool isConnecting,  String? error,  String? message,  MatchData? matchData,  bool isConnected)  $default,) {final _that = this;
switch (_that) {
case _MatchmakingUIState():
return $default(_that.state,_that.isLoading,_that.isConnecting,_that.error,_that.message,_that.matchData,_that.isConnected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MatchmakingState state,  bool isLoading,  bool isConnecting,  String? error,  String? message,  MatchData? matchData,  bool isConnected)?  $default,) {final _that = this;
switch (_that) {
case _MatchmakingUIState() when $default != null:
return $default(_that.state,_that.isLoading,_that.isConnecting,_that.error,_that.message,_that.matchData,_that.isConnected);case _:
  return null;

}
}

}

/// @nodoc


class _MatchmakingUIState implements MatchmakingUIState {
  const _MatchmakingUIState({this.state = MatchmakingState.idle, this.isLoading = false, this.isConnecting = false, this.error, this.message, this.matchData, this.isConnected = false});
  

@override@JsonKey() final  MatchmakingState state;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isConnecting;
@override final  String? error;
@override final  String? message;
@override final  MatchData? matchData;
@override@JsonKey() final  bool isConnected;

/// Create a copy of MatchmakingUIState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchmakingUIStateCopyWith<_MatchmakingUIState> get copyWith => __$MatchmakingUIStateCopyWithImpl<_MatchmakingUIState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchmakingUIState&&(identical(other.state, state) || other.state == state)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isConnecting, isConnecting) || other.isConnecting == isConnecting)&&(identical(other.error, error) || other.error == error)&&(identical(other.message, message) || other.message == message)&&(identical(other.matchData, matchData) || other.matchData == matchData)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,state,isLoading,isConnecting,error,message,matchData,isConnected);

@override
String toString() {
  return 'MatchmakingUIState(state: $state, isLoading: $isLoading, isConnecting: $isConnecting, error: $error, message: $message, matchData: $matchData, isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class _$MatchmakingUIStateCopyWith<$Res> implements $MatchmakingUIStateCopyWith<$Res> {
  factory _$MatchmakingUIStateCopyWith(_MatchmakingUIState value, $Res Function(_MatchmakingUIState) _then) = __$MatchmakingUIStateCopyWithImpl;
@override @useResult
$Res call({
 MatchmakingState state, bool isLoading, bool isConnecting, String? error, String? message, MatchData? matchData, bool isConnected
});




}
/// @nodoc
class __$MatchmakingUIStateCopyWithImpl<$Res>
    implements _$MatchmakingUIStateCopyWith<$Res> {
  __$MatchmakingUIStateCopyWithImpl(this._self, this._then);

  final _MatchmakingUIState _self;
  final $Res Function(_MatchmakingUIState) _then;

/// Create a copy of MatchmakingUIState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? isLoading = null,Object? isConnecting = null,Object? error = freezed,Object? message = freezed,Object? matchData = freezed,Object? isConnected = null,}) {
  return _then(_MatchmakingUIState(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as MatchmakingState,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isConnecting: null == isConnecting ? _self.isConnecting : isConnecting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,matchData: freezed == matchData ? _self.matchData : matchData // ignore: cast_nullable_to_non_nullable
as MatchData?,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
