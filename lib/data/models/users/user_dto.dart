import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pp191225/domain/entities/users/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/// User Data Transfer Object
/// Used for JSON serialization/deserialization
@freezed
abstract class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    required String id,
    required String email,
    required String firstName,
    String? lastName,
    String? avatar,
    @Default('USER') String role,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, Object?> json) =>
      _$UserDtoFromJson(json);

  /// Computed name from firstName and lastName
  String get name {
    if (lastName != null && lastName!.isNotEmpty) {
      return '$firstName $lastName';
    }
    return firstName;
  }

  /// Convert DTO to Domain Entity
  User toEntity() {
    return User(id: id, email: email, name: name, avatar: avatar, role: role);
  }
}

/// Extension to convert Domain Entity to DTO
extension UserToDto on User {
  UserDto toDto() {
    // Split name into firstName and lastName
    final nameParts = name.trim().split(' ');
    final firstName = nameParts.isNotEmpty ? nameParts.first : name;
    final lastName = nameParts.length > 1
        ? nameParts.sublist(1).join(' ')
        : null;

    return UserDto(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
      role: role,
    );
  }
}
