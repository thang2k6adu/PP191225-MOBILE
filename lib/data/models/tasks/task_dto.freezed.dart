// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskDto {

 String get id; String get name;@JsonKey(name: 'estimateHours', fromJson: _toDouble) double get estimateHours; DateTime get deadline; String get status;// PLANNED, ACTIVE, DONE
@JsonKey(name: 'isActive') bool get isActive;@JsonKey(name: 'progress', defaultValue: 0.0) double get progress;// 0-100%
@JsonKey(name: 'totalTimeSpent', defaultValue: 0) int get totalTimeSpent;// Total seconds spent
@JsonKey(name: 'userId') String get userId;@JsonKey(name: 'createdAt') DateTime get createdAt;@JsonKey(name: 'updatedAt') DateTime get updatedAt;
/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDtoCopyWith<TaskDto> get copyWith => _$TaskDtoCopyWithImpl<TaskDto>(this as TaskDto, _$identity);

  /// Serializes this TaskDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.estimateHours, estimateHours) || other.estimateHours == estimateHours)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.status, status) || other.status == status)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.totalTimeSpent, totalTimeSpent) || other.totalTimeSpent == totalTimeSpent)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,estimateHours,deadline,status,isActive,progress,totalTimeSpent,userId,createdAt,updatedAt);

@override
String toString() {
  return 'TaskDto(id: $id, name: $name, estimateHours: $estimateHours, deadline: $deadline, status: $status, isActive: $isActive, progress: $progress, totalTimeSpent: $totalTimeSpent, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TaskDtoCopyWith<$Res>  {
  factory $TaskDtoCopyWith(TaskDto value, $Res Function(TaskDto) _then) = _$TaskDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'estimateHours', fromJson: _toDouble) double estimateHours, DateTime deadline, String status,@JsonKey(name: 'isActive') bool isActive,@JsonKey(name: 'progress', defaultValue: 0.0) double progress,@JsonKey(name: 'totalTimeSpent', defaultValue: 0) int totalTimeSpent,@JsonKey(name: 'userId') String userId,@JsonKey(name: 'createdAt') DateTime createdAt,@JsonKey(name: 'updatedAt') DateTime updatedAt
});




}
/// @nodoc
class _$TaskDtoCopyWithImpl<$Res>
    implements $TaskDtoCopyWith<$Res> {
  _$TaskDtoCopyWithImpl(this._self, this._then);

  final TaskDto _self;
  final $Res Function(TaskDto) _then;

/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? estimateHours = null,Object? deadline = null,Object? status = null,Object? isActive = null,Object? progress = null,Object? totalTimeSpent = null,Object? userId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,estimateHours: null == estimateHours ? _self.estimateHours : estimateHours // ignore: cast_nullable_to_non_nullable
as double,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,totalTimeSpent: null == totalTimeSpent ? _self.totalTimeSpent : totalTimeSpent // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskDto].
extension TaskDtoPatterns on TaskDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskDto value)  $default,){
final _that = this;
switch (_that) {
case _TaskDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskDto value)?  $default,){
final _that = this;
switch (_that) {
case _TaskDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'estimateHours', fromJson: _toDouble)  double estimateHours,  DateTime deadline,  String status, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'progress', defaultValue: 0.0)  double progress, @JsonKey(name: 'totalTimeSpent', defaultValue: 0)  int totalTimeSpent, @JsonKey(name: 'userId')  String userId, @JsonKey(name: 'createdAt')  DateTime createdAt, @JsonKey(name: 'updatedAt')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskDto() when $default != null:
return $default(_that.id,_that.name,_that.estimateHours,_that.deadline,_that.status,_that.isActive,_that.progress,_that.totalTimeSpent,_that.userId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'estimateHours', fromJson: _toDouble)  double estimateHours,  DateTime deadline,  String status, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'progress', defaultValue: 0.0)  double progress, @JsonKey(name: 'totalTimeSpent', defaultValue: 0)  int totalTimeSpent, @JsonKey(name: 'userId')  String userId, @JsonKey(name: 'createdAt')  DateTime createdAt, @JsonKey(name: 'updatedAt')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TaskDto():
return $default(_that.id,_that.name,_that.estimateHours,_that.deadline,_that.status,_that.isActive,_that.progress,_that.totalTimeSpent,_that.userId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'estimateHours', fromJson: _toDouble)  double estimateHours,  DateTime deadline,  String status, @JsonKey(name: 'isActive')  bool isActive, @JsonKey(name: 'progress', defaultValue: 0.0)  double progress, @JsonKey(name: 'totalTimeSpent', defaultValue: 0)  int totalTimeSpent, @JsonKey(name: 'userId')  String userId, @JsonKey(name: 'createdAt')  DateTime createdAt, @JsonKey(name: 'updatedAt')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskDto() when $default != null:
return $default(_that.id,_that.name,_that.estimateHours,_that.deadline,_that.status,_that.isActive,_that.progress,_that.totalTimeSpent,_that.userId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskDto extends TaskDto {
  const _TaskDto({required this.id, required this.name, @JsonKey(name: 'estimateHours', fromJson: _toDouble) required this.estimateHours, required this.deadline, required this.status, @JsonKey(name: 'isActive') this.isActive = false, @JsonKey(name: 'progress', defaultValue: 0.0) this.progress = 0.0, @JsonKey(name: 'totalTimeSpent', defaultValue: 0) this.totalTimeSpent = 0, @JsonKey(name: 'userId') required this.userId, @JsonKey(name: 'createdAt') required this.createdAt, @JsonKey(name: 'updatedAt') required this.updatedAt}): super._();
  factory _TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'estimateHours', fromJson: _toDouble) final  double estimateHours;
@override final  DateTime deadline;
@override final  String status;
// PLANNED, ACTIVE, DONE
@override@JsonKey(name: 'isActive') final  bool isActive;
@override@JsonKey(name: 'progress', defaultValue: 0.0) final  double progress;
// 0-100%
@override@JsonKey(name: 'totalTimeSpent', defaultValue: 0) final  int totalTimeSpent;
// Total seconds spent
@override@JsonKey(name: 'userId') final  String userId;
@override@JsonKey(name: 'createdAt') final  DateTime createdAt;
@override@JsonKey(name: 'updatedAt') final  DateTime updatedAt;

/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskDtoCopyWith<_TaskDto> get copyWith => __$TaskDtoCopyWithImpl<_TaskDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.estimateHours, estimateHours) || other.estimateHours == estimateHours)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.status, status) || other.status == status)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.totalTimeSpent, totalTimeSpent) || other.totalTimeSpent == totalTimeSpent)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,estimateHours,deadline,status,isActive,progress,totalTimeSpent,userId,createdAt,updatedAt);

@override
String toString() {
  return 'TaskDto(id: $id, name: $name, estimateHours: $estimateHours, deadline: $deadline, status: $status, isActive: $isActive, progress: $progress, totalTimeSpent: $totalTimeSpent, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskDtoCopyWith<$Res> implements $TaskDtoCopyWith<$Res> {
  factory _$TaskDtoCopyWith(_TaskDto value, $Res Function(_TaskDto) _then) = __$TaskDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'estimateHours', fromJson: _toDouble) double estimateHours, DateTime deadline, String status,@JsonKey(name: 'isActive') bool isActive,@JsonKey(name: 'progress', defaultValue: 0.0) double progress,@JsonKey(name: 'totalTimeSpent', defaultValue: 0) int totalTimeSpent,@JsonKey(name: 'userId') String userId,@JsonKey(name: 'createdAt') DateTime createdAt,@JsonKey(name: 'updatedAt') DateTime updatedAt
});




}
/// @nodoc
class __$TaskDtoCopyWithImpl<$Res>
    implements _$TaskDtoCopyWith<$Res> {
  __$TaskDtoCopyWithImpl(this._self, this._then);

  final _TaskDto _self;
  final $Res Function(_TaskDto) _then;

/// Create a copy of TaskDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? estimateHours = null,Object? deadline = null,Object? status = null,Object? isActive = null,Object? progress = null,Object? totalTimeSpent = null,Object? userId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TaskDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,estimateHours: null == estimateHours ? _self.estimateHours : estimateHours // ignore: cast_nullable_to_non_nullable
as double,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,totalTimeSpent: null == totalTimeSpent ? _self.totalTimeSpent : totalTimeSpent // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
