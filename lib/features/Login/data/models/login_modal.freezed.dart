// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_modal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginModal _$LoginModalFromJson(Map<String, dynamic> json) {
  return _LoginModal.fromJson(json);
}

/// @nodoc
mixin _$LoginModal {
  String? get message => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  /// Serializes this LoginModal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginModal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginModalCopyWith<LoginModal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginModalCopyWith<$Res> {
  factory $LoginModalCopyWith(
          LoginModal value, $Res Function(LoginModal) then) =
      _$LoginModalCopyWithImpl<$Res, LoginModal>;
  @useResult
  $Res call({String? message, User? user, String? token});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$LoginModalCopyWithImpl<$Res, $Val extends LoginModal>
    implements $LoginModalCopyWith<$Res> {
  _$LoginModalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginModal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of LoginModal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginModalImplCopyWith<$Res>
    implements $LoginModalCopyWith<$Res> {
  factory _$$LoginModalImplCopyWith(
          _$LoginModalImpl value, $Res Function(_$LoginModalImpl) then) =
      __$$LoginModalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, User? user, String? token});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$LoginModalImplCopyWithImpl<$Res>
    extends _$LoginModalCopyWithImpl<$Res, _$LoginModalImpl>
    implements _$$LoginModalImplCopyWith<$Res> {
  __$$LoginModalImplCopyWithImpl(
      _$LoginModalImpl _value, $Res Function(_$LoginModalImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginModal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_$LoginModalImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginModalImpl implements _LoginModal {
  const _$LoginModalImpl({this.message, this.user, this.token});

  factory _$LoginModalImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginModalImplFromJson(json);

  @override
  final String? message;
  @override
  final User? user;
  @override
  final String? token;

  @override
  String toString() {
    return 'LoginModal(message: $message, user: $user, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginModalImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, user, token);

  /// Create a copy of LoginModal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginModalImplCopyWith<_$LoginModalImpl> get copyWith =>
      __$$LoginModalImplCopyWithImpl<_$LoginModalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginModalImplToJson(
      this,
    );
  }
}

abstract class _LoginModal implements LoginModal {
  const factory _LoginModal(
      {final String? message,
      final User? user,
      final String? token}) = _$LoginModalImpl;

  factory _LoginModal.fromJson(Map<String, dynamic> json) =
      _$LoginModalImpl.fromJson;

  @override
  String? get message;
  @override
  User? get user;
  @override
  String? get token;

  /// Create a copy of LoginModal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginModalImplCopyWith<_$LoginModalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get profilePic => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get fitnessGoal => throw _privateConstructorUsedError;
  String? get resetPasswordToken => throw _privateConstructorUsedError;
  String? get resetPasswordExpire => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  int? get v => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String? id,
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
      int? v});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? profilePic = freezed,
    Object? role = freezed,
    Object? fitnessGoal = freezed,
    Object? resetPasswordToken = freezed,
    Object? resetPasswordExpire = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      fitnessGoal: freezed == fitnessGoal
          ? _value.fitnessGoal
          : fitnessGoal // ignore: cast_nullable_to_non_nullable
              as String?,
      resetPasswordToken: freezed == resetPasswordToken
          ? _value.resetPasswordToken
          : resetPasswordToken // ignore: cast_nullable_to_non_nullable
              as String?,
      resetPasswordExpire: freezed == resetPasswordExpire
          ? _value.resetPasswordExpire
          : resetPasswordExpire // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
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
      int? v});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? profilePic = freezed,
    Object? role = freezed,
    Object? fitnessGoal = freezed,
    Object? resetPasswordToken = freezed,
    Object? resetPasswordExpire = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? v = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      fitnessGoal: freezed == fitnessGoal
          ? _value.fitnessGoal
          : fitnessGoal // ignore: cast_nullable_to_non_nullable
              as String?,
      resetPasswordToken: freezed == resetPasswordToken
          ? _value.resetPasswordToken
          : resetPasswordToken // ignore: cast_nullable_to_non_nullable
              as String?,
      resetPasswordExpire: freezed == resetPasswordExpire
          ? _value.resetPasswordExpire
          : resetPasswordExpire // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.profilePic,
      this.role,
      this.fitnessGoal,
      this.resetPasswordToken,
      this.resetPasswordExpire,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? profilePic;
  @override
  final String? role;
  @override
  final String? fitnessGoal;
  @override
  final String? resetPasswordToken;
  @override
  final String? resetPasswordExpire;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? v;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, profilePic: $profilePic, role: $role, fitnessGoal: $fitnessGoal, resetPasswordToken: $resetPasswordToken, resetPasswordExpire: $resetPasswordExpire, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.fitnessGoal, fitnessGoal) ||
                other.fitnessGoal == fitnessGoal) &&
            (identical(other.resetPasswordToken, resetPasswordToken) ||
                other.resetPasswordToken == resetPasswordToken) &&
            (identical(other.resetPasswordExpire, resetPasswordExpire) ||
                other.resetPasswordExpire == resetPasswordExpire) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      password,
      profilePic,
      role,
      fitnessGoal,
      resetPasswordToken,
      resetPasswordExpire,
      createdAt,
      updatedAt,
      v);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final String? id,
      final String? name,
      final String? email,
      final String? password,
      final String? profilePic,
      final String? role,
      final String? fitnessGoal,
      final String? resetPasswordToken,
      final String? resetPasswordExpire,
      final String? createdAt,
      final String? updatedAt,
      final int? v}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get profilePic;
  @override
  String? get role;
  @override
  String? get fitnessGoal;
  @override
  String? get resetPasswordToken;
  @override
  String? get resetPasswordExpire;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  int? get v;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
