import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';

part 'login_modal.freezed.dart';
part 'login_modal.g.dart';

@freezed
class LoginModal with _$LoginModal {
  const factory LoginModal({
    String? message,
    User? user,
    String? token,
  }) = _LoginModal;

  factory LoginModal.fromJson(Map<String, dynamic> json) => _$LoginModalFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
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
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension LoginModalConversion on LoginEntity {
  LoginModal toModel() => LoginModal(
        message: message,
        user: user?.toModel(),
        token: token,
      );
}

extension LoginEntityConversion on LoginModal {
  LoginEntity toEntity() => LoginEntity(
        message: message,
        user: user?.toEntity(),
        token: token,
      );
}

extension UserModalConversion on UserEntity {
  User toModel() => User(
        id: id,
        name: name,
        email: email,
        password: password,
        profilePic: profilePic,
        role: role,
        fitnessGoal: fitnessGoal,
        resetPasswordToken: resetPasswordToken,
        resetPasswordExpire: resetPasswordExpire,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
      );
}

extension UserEntityConversion on User {
  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        email: email,
        password: password,
        profilePic: profilePic,
        role: role,
        fitnessGoal: fitnessGoal,
        resetPasswordToken: resetPasswordToken,
        resetPasswordExpire: resetPasswordExpire,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
      );
}
