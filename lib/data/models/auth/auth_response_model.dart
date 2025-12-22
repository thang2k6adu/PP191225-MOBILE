import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/auth/token_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

/// Auth response model for login/register
@freezed
abstract class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required UserModel user,
    required TokenModel tokens,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, Object?> json) =>
      _$AuthResponseModelFromJson(json);
}
