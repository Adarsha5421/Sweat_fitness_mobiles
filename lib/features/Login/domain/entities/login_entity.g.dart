// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginEntityImpl _$$LoginEntityImplFromJson(Map<String, dynamic> json) =>
    _$LoginEntityImpl(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$LoginEntityImplToJson(_$LoginEntityImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      profilePic: json['profilePic'] as String?,
      role: json['role'] as String?,
      fitnessGoal: json['fitnessGoal'] as String?,
      resetPasswordToken: json['resetPasswordToken'] as String?,
      resetPasswordExpire: json['resetPasswordExpire'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: (json['v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'profilePic': instance.profilePic,
      'role': instance.role,
      'fitnessGoal': instance.fitnessGoal,
      'resetPasswordToken': instance.resetPasswordToken,
      'resetPasswordExpire': instance.resetPasswordExpire,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
