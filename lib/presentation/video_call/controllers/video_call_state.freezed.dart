// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_call_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VideoCallState {

// WebSocket connection state
 bool get isWebSocketConnected; bool get isConnectingWebSocket;// Matchmaking state
 bool get isSearchingMatch; bool get isMatchFound; MatchFoundEvent? get matchFoundEvent;// Video call state
 bool get isInVideoCall; bool get isConnectingToCall;// Camera/Microphone state
 bool get isCameraEnabled; bool get isMicrophoneEnabled;// Error state
 String? get error;// Opponent info
 String? get opponentName; String? get roomId;
/// Create a copy of VideoCallState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoCallStateCopyWith<VideoCallState> get copyWith => _$VideoCallStateCopyWithImpl<VideoCallState>(this as VideoCallState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoCallState&&(identical(other.isWebSocketConnected, isWebSocketConnected) || other.isWebSocketConnected == isWebSocketConnected)&&(identical(other.isConnectingWebSocket, isConnectingWebSocket) || other.isConnectingWebSocket == isConnectingWebSocket)&&(identical(other.isSearchingMatch, isSearchingMatch) || other.isSearchingMatch == isSearchingMatch)&&(identical(other.isMatchFound, isMatchFound) || other.isMatchFound == isMatchFound)&&(identical(other.matchFoundEvent, matchFoundEvent) || other.matchFoundEvent == matchFoundEvent)&&(identical(other.isInVideoCall, isInVideoCall) || other.isInVideoCall == isInVideoCall)&&(identical(other.isConnectingToCall, isConnectingToCall) || other.isConnectingToCall == isConnectingToCall)&&(identical(other.isCameraEnabled, isCameraEnabled) || other.isCameraEnabled == isCameraEnabled)&&(identical(other.isMicrophoneEnabled, isMicrophoneEnabled) || other.isMicrophoneEnabled == isMicrophoneEnabled)&&(identical(other.error, error) || other.error == error)&&(identical(other.opponentName, opponentName) || other.opponentName == opponentName)&&(identical(other.roomId, roomId) || other.roomId == roomId));
}


@override
int get hashCode => Object.hash(runtimeType,isWebSocketConnected,isConnectingWebSocket,isSearchingMatch,isMatchFound,matchFoundEvent,isInVideoCall,isConnectingToCall,isCameraEnabled,isMicrophoneEnabled,error,opponentName,roomId);

@override
String toString() {
  return 'VideoCallState(isWebSocketConnected: $isWebSocketConnected, isConnectingWebSocket: $isConnectingWebSocket, isSearchingMatch: $isSearchingMatch, isMatchFound: $isMatchFound, matchFoundEvent: $matchFoundEvent, isInVideoCall: $isInVideoCall, isConnectingToCall: $isConnectingToCall, isCameraEnabled: $isCameraEnabled, isMicrophoneEnabled: $isMicrophoneEnabled, error: $error, opponentName: $opponentName, roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class $VideoCallStateCopyWith<$Res>  {
  factory $VideoCallStateCopyWith(VideoCallState value, $Res Function(VideoCallState) _then) = _$VideoCallStateCopyWithImpl;
@useResult
$Res call({
 bool isWebSocketConnected, bool isConnectingWebSocket, bool isSearchingMatch, bool isMatchFound, MatchFoundEvent? matchFoundEvent, bool isInVideoCall, bool isConnectingToCall, bool isCameraEnabled, bool isMicrophoneEnabled, String? error, String? opponentName, String? roomId
});




}
/// @nodoc
class _$VideoCallStateCopyWithImpl<$Res>
    implements $VideoCallStateCopyWith<$Res> {
  _$VideoCallStateCopyWithImpl(this._self, this._then);

  final VideoCallState _self;
  final $Res Function(VideoCallState) _then;

/// Create a copy of VideoCallState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isWebSocketConnected = null,Object? isConnectingWebSocket = null,Object? isSearchingMatch = null,Object? isMatchFound = null,Object? matchFoundEvent = freezed,Object? isInVideoCall = null,Object? isConnectingToCall = null,Object? isCameraEnabled = null,Object? isMicrophoneEnabled = null,Object? error = freezed,Object? opponentName = freezed,Object? roomId = freezed,}) {
  return _then(_self.copyWith(
isWebSocketConnected: null == isWebSocketConnected ? _self.isWebSocketConnected : isWebSocketConnected // ignore: cast_nullable_to_non_nullable
as bool,isConnectingWebSocket: null == isConnectingWebSocket ? _self.isConnectingWebSocket : isConnectingWebSocket // ignore: cast_nullable_to_non_nullable
as bool,isSearchingMatch: null == isSearchingMatch ? _self.isSearchingMatch : isSearchingMatch // ignore: cast_nullable_to_non_nullable
as bool,isMatchFound: null == isMatchFound ? _self.isMatchFound : isMatchFound // ignore: cast_nullable_to_non_nullable
as bool,matchFoundEvent: freezed == matchFoundEvent ? _self.matchFoundEvent : matchFoundEvent // ignore: cast_nullable_to_non_nullable
as MatchFoundEvent?,isInVideoCall: null == isInVideoCall ? _self.isInVideoCall : isInVideoCall // ignore: cast_nullable_to_non_nullable
as bool,isConnectingToCall: null == isConnectingToCall ? _self.isConnectingToCall : isConnectingToCall // ignore: cast_nullable_to_non_nullable
as bool,isCameraEnabled: null == isCameraEnabled ? _self.isCameraEnabled : isCameraEnabled // ignore: cast_nullable_to_non_nullable
as bool,isMicrophoneEnabled: null == isMicrophoneEnabled ? _self.isMicrophoneEnabled : isMicrophoneEnabled // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,opponentName: freezed == opponentName ? _self.opponentName : opponentName // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoCallState].
extension VideoCallStatePatterns on VideoCallState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoCallState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoCallState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoCallState value)  $default,){
final _that = this;
switch (_that) {
case _VideoCallState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoCallState value)?  $default,){
final _that = this;
switch (_that) {
case _VideoCallState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isWebSocketConnected,  bool isConnectingWebSocket,  bool isSearchingMatch,  bool isMatchFound,  MatchFoundEvent? matchFoundEvent,  bool isInVideoCall,  bool isConnectingToCall,  bool isCameraEnabled,  bool isMicrophoneEnabled,  String? error,  String? opponentName,  String? roomId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoCallState() when $default != null:
return $default(_that.isWebSocketConnected,_that.isConnectingWebSocket,_that.isSearchingMatch,_that.isMatchFound,_that.matchFoundEvent,_that.isInVideoCall,_that.isConnectingToCall,_that.isCameraEnabled,_that.isMicrophoneEnabled,_that.error,_that.opponentName,_that.roomId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isWebSocketConnected,  bool isConnectingWebSocket,  bool isSearchingMatch,  bool isMatchFound,  MatchFoundEvent? matchFoundEvent,  bool isInVideoCall,  bool isConnectingToCall,  bool isCameraEnabled,  bool isMicrophoneEnabled,  String? error,  String? opponentName,  String? roomId)  $default,) {final _that = this;
switch (_that) {
case _VideoCallState():
return $default(_that.isWebSocketConnected,_that.isConnectingWebSocket,_that.isSearchingMatch,_that.isMatchFound,_that.matchFoundEvent,_that.isInVideoCall,_that.isConnectingToCall,_that.isCameraEnabled,_that.isMicrophoneEnabled,_that.error,_that.opponentName,_that.roomId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isWebSocketConnected,  bool isConnectingWebSocket,  bool isSearchingMatch,  bool isMatchFound,  MatchFoundEvent? matchFoundEvent,  bool isInVideoCall,  bool isConnectingToCall,  bool isCameraEnabled,  bool isMicrophoneEnabled,  String? error,  String? opponentName,  String? roomId)?  $default,) {final _that = this;
switch (_that) {
case _VideoCallState() when $default != null:
return $default(_that.isWebSocketConnected,_that.isConnectingWebSocket,_that.isSearchingMatch,_that.isMatchFound,_that.matchFoundEvent,_that.isInVideoCall,_that.isConnectingToCall,_that.isCameraEnabled,_that.isMicrophoneEnabled,_that.error,_that.opponentName,_that.roomId);case _:
  return null;

}
}

}

/// @nodoc


class _VideoCallState implements VideoCallState {
  const _VideoCallState({this.isWebSocketConnected = false, this.isConnectingWebSocket = false, this.isSearchingMatch = false, this.isMatchFound = false, this.matchFoundEvent, this.isInVideoCall = false, this.isConnectingToCall = false, this.isCameraEnabled = true, this.isMicrophoneEnabled = true, this.error, this.opponentName, this.roomId});
  

// WebSocket connection state
@override@JsonKey() final  bool isWebSocketConnected;
@override@JsonKey() final  bool isConnectingWebSocket;
// Matchmaking state
@override@JsonKey() final  bool isSearchingMatch;
@override@JsonKey() final  bool isMatchFound;
@override final  MatchFoundEvent? matchFoundEvent;
// Video call state
@override@JsonKey() final  bool isInVideoCall;
@override@JsonKey() final  bool isConnectingToCall;
// Camera/Microphone state
@override@JsonKey() final  bool isCameraEnabled;
@override@JsonKey() final  bool isMicrophoneEnabled;
// Error state
@override final  String? error;
// Opponent info
@override final  String? opponentName;
@override final  String? roomId;

/// Create a copy of VideoCallState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoCallStateCopyWith<_VideoCallState> get copyWith => __$VideoCallStateCopyWithImpl<_VideoCallState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoCallState&&(identical(other.isWebSocketConnected, isWebSocketConnected) || other.isWebSocketConnected == isWebSocketConnected)&&(identical(other.isConnectingWebSocket, isConnectingWebSocket) || other.isConnectingWebSocket == isConnectingWebSocket)&&(identical(other.isSearchingMatch, isSearchingMatch) || other.isSearchingMatch == isSearchingMatch)&&(identical(other.isMatchFound, isMatchFound) || other.isMatchFound == isMatchFound)&&(identical(other.matchFoundEvent, matchFoundEvent) || other.matchFoundEvent == matchFoundEvent)&&(identical(other.isInVideoCall, isInVideoCall) || other.isInVideoCall == isInVideoCall)&&(identical(other.isConnectingToCall, isConnectingToCall) || other.isConnectingToCall == isConnectingToCall)&&(identical(other.isCameraEnabled, isCameraEnabled) || other.isCameraEnabled == isCameraEnabled)&&(identical(other.isMicrophoneEnabled, isMicrophoneEnabled) || other.isMicrophoneEnabled == isMicrophoneEnabled)&&(identical(other.error, error) || other.error == error)&&(identical(other.opponentName, opponentName) || other.opponentName == opponentName)&&(identical(other.roomId, roomId) || other.roomId == roomId));
}


@override
int get hashCode => Object.hash(runtimeType,isWebSocketConnected,isConnectingWebSocket,isSearchingMatch,isMatchFound,matchFoundEvent,isInVideoCall,isConnectingToCall,isCameraEnabled,isMicrophoneEnabled,error,opponentName,roomId);

@override
String toString() {
  return 'VideoCallState(isWebSocketConnected: $isWebSocketConnected, isConnectingWebSocket: $isConnectingWebSocket, isSearchingMatch: $isSearchingMatch, isMatchFound: $isMatchFound, matchFoundEvent: $matchFoundEvent, isInVideoCall: $isInVideoCall, isConnectingToCall: $isConnectingToCall, isCameraEnabled: $isCameraEnabled, isMicrophoneEnabled: $isMicrophoneEnabled, error: $error, opponentName: $opponentName, roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class _$VideoCallStateCopyWith<$Res> implements $VideoCallStateCopyWith<$Res> {
  factory _$VideoCallStateCopyWith(_VideoCallState value, $Res Function(_VideoCallState) _then) = __$VideoCallStateCopyWithImpl;
@override @useResult
$Res call({
 bool isWebSocketConnected, bool isConnectingWebSocket, bool isSearchingMatch, bool isMatchFound, MatchFoundEvent? matchFoundEvent, bool isInVideoCall, bool isConnectingToCall, bool isCameraEnabled, bool isMicrophoneEnabled, String? error, String? opponentName, String? roomId
});




}
/// @nodoc
class __$VideoCallStateCopyWithImpl<$Res>
    implements _$VideoCallStateCopyWith<$Res> {
  __$VideoCallStateCopyWithImpl(this._self, this._then);

  final _VideoCallState _self;
  final $Res Function(_VideoCallState) _then;

/// Create a copy of VideoCallState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isWebSocketConnected = null,Object? isConnectingWebSocket = null,Object? isSearchingMatch = null,Object? isMatchFound = null,Object? matchFoundEvent = freezed,Object? isInVideoCall = null,Object? isConnectingToCall = null,Object? isCameraEnabled = null,Object? isMicrophoneEnabled = null,Object? error = freezed,Object? opponentName = freezed,Object? roomId = freezed,}) {
  return _then(_VideoCallState(
isWebSocketConnected: null == isWebSocketConnected ? _self.isWebSocketConnected : isWebSocketConnected // ignore: cast_nullable_to_non_nullable
as bool,isConnectingWebSocket: null == isConnectingWebSocket ? _self.isConnectingWebSocket : isConnectingWebSocket // ignore: cast_nullable_to_non_nullable
as bool,isSearchingMatch: null == isSearchingMatch ? _self.isSearchingMatch : isSearchingMatch // ignore: cast_nullable_to_non_nullable
as bool,isMatchFound: null == isMatchFound ? _self.isMatchFound : isMatchFound // ignore: cast_nullable_to_non_nullable
as bool,matchFoundEvent: freezed == matchFoundEvent ? _self.matchFoundEvent : matchFoundEvent // ignore: cast_nullable_to_non_nullable
as MatchFoundEvent?,isInVideoCall: null == isInVideoCall ? _self.isInVideoCall : isInVideoCall // ignore: cast_nullable_to_non_nullable
as bool,isConnectingToCall: null == isConnectingToCall ? _self.isConnectingToCall : isConnectingToCall // ignore: cast_nullable_to_non_nullable
as bool,isCameraEnabled: null == isCameraEnabled ? _self.isCameraEnabled : isCameraEnabled // ignore: cast_nullable_to_non_nullable
as bool,isMicrophoneEnabled: null == isMicrophoneEnabled ? _self.isMicrophoneEnabled : isMicrophoneEnabled // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,opponentName: freezed == opponentName ? _self.opponentName : opponentName // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
