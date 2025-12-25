// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_session_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackingSessionDto {

 String get id; String get taskId; String get userId; DateTime get startTime; DateTime? get endTime; int get duration; String get status;// 'active', 'paused', 'stopped'
 int get expEarned; int? get currentDuration;// For paused sessions - current elapsed time
 DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TrackingSessionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingSessionDtoCopyWith<TrackingSessionDto> get copyWith => _$TrackingSessionDtoCopyWithImpl<TrackingSessionDto>(this as TrackingSessionDto, _$identity);

  /// Serializes this TrackingSessionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingSessionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.status, status) || other.status == status)&&(identical(other.expEarned, expEarned) || other.expEarned == expEarned)&&(identical(other.currentDuration, currentDuration) || other.currentDuration == currentDuration)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,userId,startTime,endTime,duration,status,expEarned,currentDuration,createdAt,updatedAt);

@override
String toString() {
  return 'TrackingSessionDto(id: $id, taskId: $taskId, userId: $userId, startTime: $startTime, endTime: $endTime, duration: $duration, status: $status, expEarned: $expEarned, currentDuration: $currentDuration, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TrackingSessionDtoCopyWith<$Res>  {
  factory $TrackingSessionDtoCopyWith(TrackingSessionDto value, $Res Function(TrackingSessionDto) _then) = _$TrackingSessionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String taskId, String userId, DateTime startTime, DateTime? endTime, int duration, String status, int expEarned, int? currentDuration, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TrackingSessionDtoCopyWithImpl<$Res>
    implements $TrackingSessionDtoCopyWith<$Res> {
  _$TrackingSessionDtoCopyWithImpl(this._self, this._then);

  final TrackingSessionDto _self;
  final $Res Function(TrackingSessionDto) _then;

/// Create a copy of TrackingSessionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? userId = null,Object? startTime = null,Object? endTime = freezed,Object? duration = null,Object? status = null,Object? expEarned = null,Object? currentDuration = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expEarned: null == expEarned ? _self.expEarned : expEarned // ignore: cast_nullable_to_non_nullable
as int,currentDuration: freezed == currentDuration ? _self.currentDuration : currentDuration // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingSessionDto].
extension TrackingSessionDtoPatterns on TrackingSessionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingSessionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingSessionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingSessionDto value)  $default,){
final _that = this;
switch (_that) {
case _TrackingSessionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingSessionDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingSessionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String taskId,  String userId,  DateTime startTime,  DateTime? endTime,  int duration,  String status,  int expEarned,  int? currentDuration,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingSessionDto() when $default != null:
return $default(_that.id,_that.taskId,_that.userId,_that.startTime,_that.endTime,_that.duration,_that.status,_that.expEarned,_that.currentDuration,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String taskId,  String userId,  DateTime startTime,  DateTime? endTime,  int duration,  String status,  int expEarned,  int? currentDuration,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TrackingSessionDto():
return $default(_that.id,_that.taskId,_that.userId,_that.startTime,_that.endTime,_that.duration,_that.status,_that.expEarned,_that.currentDuration,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String taskId,  String userId,  DateTime startTime,  DateTime? endTime,  int duration,  String status,  int expEarned,  int? currentDuration,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TrackingSessionDto() when $default != null:
return $default(_that.id,_that.taskId,_that.userId,_that.startTime,_that.endTime,_that.duration,_that.status,_that.expEarned,_that.currentDuration,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingSessionDto extends TrackingSessionDto {
  const _TrackingSessionDto({required this.id, required this.taskId, required this.userId, required this.startTime, this.endTime, this.duration = 0, required this.status, this.expEarned = 0, this.currentDuration, required this.createdAt, required this.updatedAt}): super._();
  factory _TrackingSessionDto.fromJson(Map<String, dynamic> json) => _$TrackingSessionDtoFromJson(json);

@override final  String id;
@override final  String taskId;
@override final  String userId;
@override final  DateTime startTime;
@override final  DateTime? endTime;
@override@JsonKey() final  int duration;
@override final  String status;
// 'active', 'paused', 'stopped'
@override@JsonKey() final  int expEarned;
@override final  int? currentDuration;
// For paused sessions - current elapsed time
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TrackingSessionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingSessionDtoCopyWith<_TrackingSessionDto> get copyWith => __$TrackingSessionDtoCopyWithImpl<_TrackingSessionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingSessionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingSessionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.status, status) || other.status == status)&&(identical(other.expEarned, expEarned) || other.expEarned == expEarned)&&(identical(other.currentDuration, currentDuration) || other.currentDuration == currentDuration)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,userId,startTime,endTime,duration,status,expEarned,currentDuration,createdAt,updatedAt);

@override
String toString() {
  return 'TrackingSessionDto(id: $id, taskId: $taskId, userId: $userId, startTime: $startTime, endTime: $endTime, duration: $duration, status: $status, expEarned: $expEarned, currentDuration: $currentDuration, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TrackingSessionDtoCopyWith<$Res> implements $TrackingSessionDtoCopyWith<$Res> {
  factory _$TrackingSessionDtoCopyWith(_TrackingSessionDto value, $Res Function(_TrackingSessionDto) _then) = __$TrackingSessionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String taskId, String userId, DateTime startTime, DateTime? endTime, int duration, String status, int expEarned, int? currentDuration, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TrackingSessionDtoCopyWithImpl<$Res>
    implements _$TrackingSessionDtoCopyWith<$Res> {
  __$TrackingSessionDtoCopyWithImpl(this._self, this._then);

  final _TrackingSessionDto _self;
  final $Res Function(_TrackingSessionDto) _then;

/// Create a copy of TrackingSessionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? userId = null,Object? startTime = null,Object? endTime = freezed,Object? duration = null,Object? status = null,Object? expEarned = null,Object? currentDuration = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TrackingSessionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expEarned: null == expEarned ? _self.expEarned : expEarned // ignore: cast_nullable_to_non_nullable
as int,currentDuration: freezed == currentDuration ? _self.currentDuration : currentDuration // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
