import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.freezed.dart';
part 'login_entity.g.dart';

@freezed
class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    String? message,
    UserEntity? user,
    String? token,
  }) = _LoginEntity;

  factory LoginEntity.fromJson(Map<String, dynamic> json) => _$LoginEntityFromJson(json);
}

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    String? id,
    String? name,
    String? email,
    String? password,
    String? profilePic,
    String? role,
    String? fitnessGoal,
    String? resetPasswordToken,
    String? resetPasswordExpire,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
