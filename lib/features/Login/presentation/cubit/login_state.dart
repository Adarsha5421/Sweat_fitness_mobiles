import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:gym_tracker_app/core/error/app_error_handler.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    // General states
    @Default(false) bool isLoadingState,
    @Default(false) bool isSuccessState,
    String? errorState,

    // Login data
    UserEntity? userData,
    LoginEntity? loginData,
    String? token,

    // Form states
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool rememberMe,

    // Validation states
    @Default(false) bool isEmailValid,
    @Default(false) bool isPasswordValid,
    @Default(false) bool isFormValid,
  }) = _LoginState;

  factory LoginState.initially() => const LoginState();
}
