// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RoomState {

 Room? get currentRoom; bool get isLoading; bool get isJoining; bool get isLeaving; String? get error;
/// Create a copy of RoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomStateCopyWith<RoomState> get copyWith => _$RoomStateCopyWithImpl<RoomState>(this as RoomState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomState&&(identical(other.currentRoom, currentRoom) || other.currentRoom == currentRoom)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isJoining, isJoining) || other.isJoining == isJoining)&&(identical(other.isLeaving, isLeaving) || other.isLeaving == isLeaving)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,currentRoom,isLoading,isJoining,isLeaving,error);

@override
String toString() {
  return 'RoomState(currentRoom: $currentRoom, isLoading: $isLoading, isJoining: $isJoining, isLeaving: $isLeaving, error: $error)';
}


}

/// @nodoc
abstract mixin class $RoomStateCopyWith<$Res>  {
  factory $RoomStateCopyWith(RoomState value, $Res Function(RoomState) _then) = _$RoomStateCopyWithImpl;
@useResult
$Res call({
 Room? currentRoom, bool isLoading, bool isJoining, bool isLeaving, String? error
});




}
/// @nodoc
class _$RoomStateCopyWithImpl<$Res>
    implements $RoomStateCopyWith<$Res> {
  _$RoomStateCopyWithImpl(this._self, this._then);

  final RoomState _self;
  final $Res Function(RoomState) _then;

/// Create a copy of RoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentRoom = freezed,Object? isLoading = null,Object? isJoining = null,Object? isLeaving = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
currentRoom: freezed == currentRoom ? _self.currentRoom : currentRoom // ignore: cast_nullable_to_non_nullable
as Room?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isJoining: null == isJoining ? _self.isJoining : isJoining // ignore: cast_nullable_to_non_nullable
as bool,isLeaving: null == isLeaving ? _self.isLeaving : isLeaving // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomState].
extension RoomStatePatterns on RoomState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomState value)  $default,){
final _that = this;
switch (_that) {
case _RoomState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomState value)?  $default,){
final _that = this;
switch (_that) {
case _RoomState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Room? currentRoom,  bool isLoading,  bool isJoining,  bool isLeaving,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomState() when $default != null:
return $default(_that.currentRoom,_that.isLoading,_that.isJoining,_that.isLeaving,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Room? currentRoom,  bool isLoading,  bool isJoining,  bool isLeaving,  String? error)  $default,) {final _that = this;
switch (_that) {
case _RoomState():
return $default(_that.currentRoom,_that.isLoading,_that.isJoining,_that.isLeaving,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Room? currentRoom,  bool isLoading,  bool isJoining,  bool isLeaving,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _RoomState() when $default != null:
return $default(_that.currentRoom,_that.isLoading,_that.isJoining,_that.isLeaving,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _RoomState implements RoomState {
  const _RoomState({this.currentRoom, this.isLoading = false, this.isJoining = false, this.isLeaving = false, this.error});
  

@override final  Room? currentRoom;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isJoining;
@override@JsonKey() final  bool isLeaving;
@override final  String? error;

/// Create a copy of RoomState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomStateCopyWith<_RoomState> get copyWith => __$RoomStateCopyWithImpl<_RoomState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomState&&(identical(other.currentRoom, currentRoom) || other.currentRoom == currentRoom)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isJoining, isJoining) || other.isJoining == isJoining)&&(identical(other.isLeaving, isLeaving) || other.isLeaving == isLeaving)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,currentRoom,isLoading,isJoining,isLeaving,error);

@override
String toString() {
  return 'RoomState(currentRoom: $currentRoom, isLoading: $isLoading, isJoining: $isJoining, isLeaving: $isLeaving, error: $error)';
}


}

/// @nodoc
abstract mixin class _$RoomStateCopyWith<$Res> implements $RoomStateCopyWith<$Res> {
  factory _$RoomStateCopyWith(_RoomState value, $Res Function(_RoomState) _then) = __$RoomStateCopyWithImpl;
@override @useResult
$Res call({
 Room? currentRoom, bool isLoading, bool isJoining, bool isLeaving, String? error
});




}
/// @nodoc
class __$RoomStateCopyWithImpl<$Res>
    implements _$RoomStateCopyWith<$Res> {
  __$RoomStateCopyWithImpl(this._self, this._then);

  final _RoomState _self;
  final $Res Function(_RoomState) _then;

/// Create a copy of RoomState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentRoom = freezed,Object? isLoading = null,Object? isJoining = null,Object? isLeaving = null,Object? error = freezed,}) {
  return _then(_RoomState(
currentRoom: freezed == currentRoom ? _self.currentRoom : currentRoom // ignore: cast_nullable_to_non_nullable
as Room?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isJoining: null == isJoining ? _self.isJoining : isJoining // ignore: cast_nullable_to_non_nullable
as bool,isLeaving: null == isLeaving ? _self.isLeaving : isLeaving // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
