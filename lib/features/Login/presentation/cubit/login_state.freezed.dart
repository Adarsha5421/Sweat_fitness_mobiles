// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
// General states
  bool get isLoadingState => throw _privateConstructorUsedError;
  bool get isSuccessState => throw _privateConstructorUsedError;
  String? get errorState => throw _privateConstructorUsedError; // Login data
  UserEntity? get userData => throw _privateConstructorUsedError;
  LoginEntity? get loginData => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError; // Form states
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  bool get rememberMe =>
      throw _privateConstructorUsedError; // Validation states
  bool get isEmailValid => throw _privateConstructorUsedError;
  bool get isPasswordValid => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      String? errorState,
      UserEntity? userData,
      LoginEntity? loginData,
      String? token,
      String email,
      String password,
      bool isPasswordVisible,
      bool rememberMe,
      bool isEmailValid,
      bool isPasswordValid,
      bool isFormValid});

  $UserEntityCopyWith<$Res>? get userData;
  $LoginEntityCopyWith<$Res>? get loginData;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? userData = freezed,
    Object? loginData = freezed,
    Object? token = freezed,
    Object? email = null,
    Object? password = null,
    Object? isPasswordVisible = null,
    Object? rememberMe = null,
    Object? isEmailValid = null,
    Object? isPasswordValid = null,
    Object? isFormValid = null,
  }) {
    return _then(_value.copyWith(
      isLoadingState: null == isLoadingState
          ? _value.isLoadingState
          : isLoadingState // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessState: null == isSuccessState
          ? _value.isSuccessState
          : isSuccessState // ignore: cast_nullable_to_non_nullable
              as bool,
      errorState: freezed == errorState
          ? _value.errorState
          : errorState // ignore: cast_nullable_to_non_nullable
              as String?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      loginData: freezed == loginData
          ? _value.loginData
          : loginData // ignore: cast_nullable_to_non_nullable
              as LoginEntity?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailValid: null == isEmailValid
          ? _value.isEmailValid
          : isEmailValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordValid: null == isPasswordValid
          ? _value.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get userData {
    if (_value.userData == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.userData!, (value) {
      return _then(_value.copyWith(userData: value) as $Val);
    });
  }

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginEntityCopyWith<$Res>? get loginData {
    if (_value.loginData == null) {
      return null;
    }

    return $LoginEntityCopyWith<$Res>(_value.loginData!, (value) {
      return _then(_value.copyWith(loginData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingState,
      bool isSuccessState,
      String? errorState,
      UserEntity? userData,
      LoginEntity? loginData,
      String? token,
      String email,
      String password,
      bool isPasswordVisible,
      bool rememberMe,
      bool isEmailValid,
      bool isPasswordValid,
      bool isFormValid});

  @override
  $UserEntityCopyWith<$Res>? get userData;
  @override
  $LoginEntityCopyWith<$Res>? get loginData;
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingState = null,
    Object? isSuccessState = null,
    Object? errorState = freezed,
    Object? userData = freezed,
    Object? loginData = freezed,
    Object? token = freezed,
    Object? email = null,
    Object? password = null,
    Object? isPasswordVisible = null,
    Object? rememberMe = null,
    Object? isEmailValid = null,
    Object? isPasswordValid = null,
    Object? isFormValid = null,
  }) {
    return _then(_$LoginStateImpl(
      isLoadingState: null == isLoadingState
          ? _value.isLoadingState
          : isLoadingState // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccessState: null == isSuccessState
          ? _value.isSuccessState
          : isSuccessState // ignore: cast_nullable_to_non_nullable
              as bool,
      errorState: freezed == errorState
          ? _value.errorState
          : errorState // ignore: cast_nullable_to_non_nullable
              as String?,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      loginData: freezed == loginData
          ? _value.loginData
          : loginData // ignore: cast_nullable_to_non_nullable
              as LoginEntity?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      rememberMe: null == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailValid: null == isEmailValid
          ? _value.isEmailValid
          : isEmailValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordValid: null == isPasswordValid
          ? _value.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl(
      {this.isLoadingState = false,
      this.isSuccessState = false,
      this.errorState,
      this.userData,
      this.loginData,
      this.token,
      this.email = '',
      this.password = '',
      this.isPasswordVisible = false,
      this.rememberMe = false,
      this.isEmailValid = false,
      this.isPasswordValid = false,
      this.isFormValid = false});

// General states
  @override
  @JsonKey()
  final bool isLoadingState;
  @override
  @JsonKey()
  final bool isSuccessState;
  @override
  final String? errorState;
// Login data
  @override
  final UserEntity? userData;
  @override
  final LoginEntity? loginData;
  @override
  final String? token;
// Form states
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final bool isPasswordVisible;
  @override
  @JsonKey()
  final bool rememberMe;
// Validation states
  @override
  @JsonKey()
  final bool isEmailValid;
  @override
  @JsonKey()
  final bool isPasswordValid;
  @override
  @JsonKey()
  final bool isFormValid;

  @override
  String toString() {
    return 'LoginState(isLoadingState: $isLoadingState, isSuccessState: $isSuccessState, errorState: $errorState, userData: $userData, loginData: $loginData, token: $token, email: $email, password: $password, isPasswordVisible: $isPasswordVisible, rememberMe: $rememberMe, isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isFormValid: $isFormValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.isLoadingState, isLoadingState) ||
                other.isLoadingState == isLoadingState) &&
            (identical(other.isSuccessState, isSuccessState) ||
                other.isSuccessState == isSuccessState) &&
            (identical(other.errorState, errorState) ||
                other.errorState == errorState) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.loginData, loginData) ||
                other.loginData == loginData) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(other.rememberMe, rememberMe) ||
                other.rememberMe == rememberMe) &&
            (identical(other.isEmailValid, isEmailValid) ||
                other.isEmailValid == isEmailValid) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                other.isPasswordValid == isPasswordValid) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingState,
      isSuccessState,
      errorState,
      userData,
      loginData,
      token,
      email,
      password,
      isPasswordVisible,
      rememberMe,
      isEmailValid,
      isPasswordValid,
      isFormValid);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {final bool isLoadingState,
      final bool isSuccessState,
      final String? errorState,
      final UserEntity? userData,
      final LoginEntity? loginData,
      final String? token,
      final String email,
      final String password,
      final bool isPasswordVisible,
      final bool rememberMe,
      final bool isEmailValid,
      final bool isPasswordValid,
      final bool isFormValid}) = _$LoginStateImpl;

// General states
  @override
  bool get isLoadingState;
  @override
  bool get isSuccessState;
  @override
  String? get errorState; // Login data
  @override
  UserEntity? get userData;
  @override
  LoginEntity? get loginData;
  @override
  String? get token; // Form states
  @override
  String get email;
  @override
  String get password;
  @override
  bool get isPasswordVisible;
  @override
  bool get rememberMe; // Validation states
  @override
  bool get isEmailValid;
  @override
  bool get isPasswordValid;
  @override
  bool get isFormValid;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
