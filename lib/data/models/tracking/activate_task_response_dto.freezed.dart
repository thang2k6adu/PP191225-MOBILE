// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activate_task_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivateTaskResponseDto {

 TaskDto get task; TrackingSessionDto get session;
/// Create a copy of ActivateTaskResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivateTaskResponseDtoCopyWith<ActivateTaskResponseDto> get copyWith => _$ActivateTaskResponseDtoCopyWithImpl<ActivateTaskResponseDto>(this as ActivateTaskResponseDto, _$identity);

  /// Serializes this ActivateTaskResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivateTaskResponseDto&&(identical(other.task, task) || other.task == task)&&(identical(other.session, session) || other.session == session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,task,session);

@override
String toString() {
  return 'ActivateTaskResponseDto(task: $task, session: $session)';
}


}

/// @nodoc
abstract mixin class $ActivateTaskResponseDtoCopyWith<$Res>  {
  factory $ActivateTaskResponseDtoCopyWith(ActivateTaskResponseDto value, $Res Function(ActivateTaskResponseDto) _then) = _$ActivateTaskResponseDtoCopyWithImpl;
@useResult
$Res call({
 TaskDto task, TrackingSessionDto session
});


$TaskDtoCopyWith<$Res> get task;$TrackingSessionDtoCopyWith<$Res> get session;

}
/// @nodoc
class _$ActivateTaskResponseDtoCopyWithImpl<$Res>
    implements $ActivateTaskResponseDtoCopyWith<$Res> {
  _$ActivateTaskResponseDtoCopyWithImpl(this._self, this._then);

  final ActivateTaskResponseDto _self;
  final $Res Function(ActivateTaskResponseDto) _then;

/// Create a copy of ActivateTaskResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? task = null,Object? session = null,}) {
  return _then(_self.copyWith(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskDto,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as TrackingSessionDto,
  ));
}
/// Create a copy of ActivateTaskResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskDtoCopyWith<$Res> get task {
  
  return $TaskDtoCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}/// Create a copy of ActivateTaskResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackingSessionDtoCopyWith<$Res> get session {
  
  return $TrackingSessionDtoCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActivateTaskResponseDto].
extension ActivateTaskResponseDtoPatterns on ActivateTaskResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivateTaskResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivateTaskResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivateTaskResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ActivateTaskResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivateTaskResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ActivateTaskResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TaskDto task,  TrackingSessionDto session)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivateTaskResponseDto() when $default != null:
return $default(_that.task,_that.session);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TaskDto task,  TrackingSessionDto session)  $default,) {final _that = this;
switch (_that) {
case _ActivateTaskResponseDto():
return $default(_that.task,_that.session);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TaskDto task,  TrackingSessionDto session)?  $default,) {final _that = this;
switch (_that) {
case _ActivateTaskResponseDto() when $default != null:
return $default(_that.task,_that.session);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivateTaskResponseDto extends ActivateTaskResponseDto {
  const _ActivateTaskResponseDto({required this.task, required this.session}): super._();
  factory _ActivateTaskResponseDto.fromJson(Map<String, dynamic> json) => _$ActivateTaskResponseDtoFromJson(json);

@override final  TaskDto task;
@override final  TrackingSessionDto session;

/// Create a copy of ActivateTaskResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivateTaskResponseDtoCopyWith<_ActivateTaskResponseDto> get copyWith => __$ActivateTaskResponseDtoCopyWithImpl<_ActivateTaskResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivateTaskResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivateTaskResponseDto&&(identical(other.task, task) || other.task == task)&&(identical(other.session, session) || other.session == session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,task,session);

@override
String toString() {
  return 'ActivateTaskResponseDto(task: $task, session: $session)';
}


}

/// @nodoc
abstract mixin class _$ActivateTaskResponseDtoCopyWith<$Res> implements $ActivateTaskResponseDtoCopyWith<$Res> {
  factory _$ActivateTaskResponseDtoCopyWith(_ActivateTaskResponseDto value, $Res Function(_ActivateTaskResponseDto) _then) = __$ActivateTaskResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 TaskDto task, TrackingSessionDto session
});


@override $TaskDtoCopyWith<$Res> get task;@override $TrackingSessionDtoCopyWith<$Res> get session;

}
/// @nodoc
class __$ActivateTaskResponseDtoCopyWithImpl<$Res>
    implements _$ActivateTaskResponseDtoCopyWith<$Res> {
  __$ActivateTaskResponseDtoCopyWithImpl(this._self, this._then);

  final _ActivateTaskResponseDto _self;
  final $Res Function(_ActivateTaskResponseDto) _then;

/// Create a copy of ActivateTaskResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? task = null,Object? session = null,}) {
  return _then(_ActivateTaskResponseDto(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as TaskDto,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as TrackingSessionDto,
  ));
}

/// Create a copy of ActivateTaskResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskDtoCopyWith<$Res> get task {
  
  return $TaskDtoCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}/// Create a copy of ActivateTaskResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackingSessionDtoCopyWith<$Res> get session {
  
  return $TrackingSessionDtoCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
