import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gym_tracker_app/common/app_theme/snackbar.dart';
import 'package:gym_tracker_app/core/navigation_services.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/local_datasource/login_local_datasource.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';
import 'package:gym_tracker_app/features/Login/domain/usecases/login_usecase.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_state.dart';
import 'package:gym_tracker_app/features/Login/presentation/pages/login_screen.dart';
import 'package:gym_tracker_app/features/dashboard/presentation/pages/dashboad_screen.dart';
import 'package:gym_tracker_app/features/profile/domain/usecases/profile_usecase.dart';
import 'package:gym_tracker_app/features/signup/domain/usecases/sign_up_usecase.dart';

// part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUserUsecase loginUserUsecase;
  final SignUpUsecase signUpUsecase;
  final ProfileUsecase profileUsecase;
  final UserSharedPrefs userSharedPrefs;
  final TokenSharedPrefs tokenSharedPrefs;

  LoginCubit({
    required this.loginUserUsecase,
    required this.signUpUsecase,
    required this.userSharedPrefs,
    required this.tokenSharedPrefs,
    required this.profileUsecase,
  }) : super(LoginState.initially());

  loginFx(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isLoadingState: true));
    final response = await loginUserUsecase.call(LoginUserParams(email: email, password: password));
    response.fold((error) {
      showMySnackBar(context, message: error.message, color: Colors.red);
    }, (success) {
      emit(state.copyWith(isLoadingState: false, userData: success.user));
      userSharedPrefs.setUserData(success.user ?? const UserEntity());
      tokenSharedPrefs.saveToken(success.token ?? '');
      navigateAndPushReplacement(context: context, screen: const MyDashboardScreen());
      showMySnackBar(context, message: 'Login Successful');
    });
  }

  signUpFx(
    BuildContext context, {
    required String email,
    required String password,
    required String name,
  }) async {
    emit(state.copyWith(isLoadingState: true));
    final response = await signUpUsecase.call(SignUpUserParams(email: email, password: password, name: name));
    response.fold((error) {
      showMySnackBar(context, message: error.message, color: Colors.red);
    }, (success) {
      emit(state.copyWith(isLoadingState: false, userData: success.user));
      userSharedPrefs.setUserData(success.user ?? const UserEntity());
      tokenSharedPrefs.saveToken(success.token ?? '');
      navigateAndPushReplacement(context: context, screen: const MyDashboardScreen());
      showMySnackBar(context, message: 'SignUp Successful');
    });
  }

  updateProfile(BuildContext context, {required String name, required String age, required String weight, required String height, required String fitnessGoal, required File? profilepic}) async {
    final response = await profileUsecase.call(ProfileParams(weight: weight, height: height, fitnessGoal: fitnessGoal, age: age, name: name, profilePic: profilepic));
    response.fold((error) {
      showMySnackBar(context, message: 'Something went wrong', color: Colors.red);
    }, (result) {
      emit(state.copyWith(isLoadingState: false, userData: result.user));
      showMySnackBar(context, message: 'Profile updated Successfully');
    });
  }

  setUser(UserEntity x) {
    emit(state.copyWith(userData: x));
    print('qwe${state.userData}');
  }

  logOut(BuildContext c) {
    emit(state.copyWith(token: null, userData: null));
    tokenSharedPrefs.clearToken();
    userSharedPrefs.clear();
    navigateAndPushReplacement(context: c, screen: const LoginScreen());
  }
}
