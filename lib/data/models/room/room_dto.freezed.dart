// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomDto {

 String get id; RoomType get type; RoomStatus get status; int get maxMembers; List<RoomMemberDto> get members;
/// Create a copy of RoomDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomDtoCopyWith<RoomDto> get copyWith => _$RoomDtoCopyWithImpl<RoomDto>(this as RoomDto, _$identity);

  /// Serializes this RoomDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxMembers, maxMembers) || other.maxMembers == maxMembers)&&const DeepCollectionEquality().equals(other.members, members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,maxMembers,const DeepCollectionEquality().hash(members));

@override
String toString() {
  return 'RoomDto(id: $id, type: $type, status: $status, maxMembers: $maxMembers, members: $members)';
}


}

/// @nodoc
abstract mixin class $RoomDtoCopyWith<$Res>  {
  factory $RoomDtoCopyWith(RoomDto value, $Res Function(RoomDto) _then) = _$RoomDtoCopyWithImpl;
@useResult
$Res call({
 String id, RoomType type, RoomStatus status, int maxMembers, List<RoomMemberDto> members
});




}
/// @nodoc
class _$RoomDtoCopyWithImpl<$Res>
    implements $RoomDtoCopyWith<$Res> {
  _$RoomDtoCopyWithImpl(this._self, this._then);

  final RoomDto _self;
  final $Res Function(RoomDto) _then;

/// Create a copy of RoomDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? status = null,Object? maxMembers = null,Object? members = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RoomType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RoomStatus,maxMembers: null == maxMembers ? _self.maxMembers : maxMembers // ignore: cast_nullable_to_non_nullable
as int,members: null == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<RoomMemberDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomDto].
extension RoomDtoPatterns on RoomDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomDto value)  $default,){
final _that = this;
switch (_that) {
case _RoomDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomDto value)?  $default,){
final _that = this;
switch (_that) {
case _RoomDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  RoomType type,  RoomStatus status,  int maxMembers,  List<RoomMemberDto> members)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomDto() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.maxMembers,_that.members);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  RoomType type,  RoomStatus status,  int maxMembers,  List<RoomMemberDto> members)  $default,) {final _that = this;
switch (_that) {
case _RoomDto():
return $default(_that.id,_that.type,_that.status,_that.maxMembers,_that.members);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  RoomType type,  RoomStatus status,  int maxMembers,  List<RoomMemberDto> members)?  $default,) {final _that = this;
switch (_that) {
case _RoomDto() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.maxMembers,_that.members);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomDto extends RoomDto {
  const _RoomDto({required this.id, required this.type, required this.status, required this.maxMembers, final  List<RoomMemberDto> members = const []}): _members = members,super._();
  factory _RoomDto.fromJson(Map<String, dynamic> json) => _$RoomDtoFromJson(json);

@override final  String id;
@override final  RoomType type;
@override final  RoomStatus status;
@override final  int maxMembers;
 final  List<RoomMemberDto> _members;
@override@JsonKey() List<RoomMemberDto> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of RoomDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomDtoCopyWith<_RoomDto> get copyWith => __$RoomDtoCopyWithImpl<_RoomDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.maxMembers, maxMembers) || other.maxMembers == maxMembers)&&const DeepCollectionEquality().equals(other._members, _members));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,maxMembers,const DeepCollectionEquality().hash(_members));

@override
String toString() {
  return 'RoomDto(id: $id, type: $type, status: $status, maxMembers: $maxMembers, members: $members)';
}


}

/// @nodoc
abstract mixin class _$RoomDtoCopyWith<$Res> implements $RoomDtoCopyWith<$Res> {
  factory _$RoomDtoCopyWith(_RoomDto value, $Res Function(_RoomDto) _then) = __$RoomDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, RoomType type, RoomStatus status, int maxMembers, List<RoomMemberDto> members
});




}
/// @nodoc
class __$RoomDtoCopyWithImpl<$Res>
    implements _$RoomDtoCopyWith<$Res> {
  __$RoomDtoCopyWithImpl(this._self, this._then);

  final _RoomDto _self;
  final $Res Function(_RoomDto) _then;

/// Create a copy of RoomDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? status = null,Object? maxMembers = null,Object? members = null,}) {
  return _then(_RoomDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RoomType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RoomStatus,maxMembers: null == maxMembers ? _self.maxMembers : maxMembers // ignore: cast_nullable_to_non_nullable
as int,members: null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<RoomMemberDto>,
  ));
}


}

// dart format on
