import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_tracker_app/core/error/failure.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/local_datasource/login_local_datasource.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';
import 'package:gym_tracker_app/features/Login/domain/usecases/login_usecase.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_cubit.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_state.dart';
import 'package:gym_tracker_app/features/profile/domain/usecases/profile_usecase.dart';
import 'package:gym_tracker_app/features/signup/domain/usecases/sign_up_usecase.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockLoginUserUsecase extends Mock implements LoginUserUsecase {}

class MockSignUpUsecase extends Mock implements SignUpUsecase {}

class MockProfileUsecase extends Mock implements ProfileUsecase {}

class MockUserSharedPrefs extends Mock implements UserSharedPrefs {}

class MockTokenSharedPrefs extends Mock implements TokenSharedPrefs {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late LoginCubit loginCubit;
  late MockLoginUserUsecase mockLoginUserUsecase;
  late MockSignUpUsecase mockSignUpUsecase;
  late MockProfileUsecase mockProfileUsecase;
  late MockUserSharedPrefs mockUserSharedPrefs;
  late MockTokenSharedPrefs mockTokenSharedPrefs;

  setUp(() {
    mockLoginUserUsecase = MockLoginUserUsecase();
    mockSignUpUsecase = MockSignUpUsecase();
    mockProfileUsecase = MockProfileUsecase();
    mockUserSharedPrefs = MockUserSharedPrefs();
    mockTokenSharedPrefs = MockTokenSharedPrefs();

    loginCubit = LoginCubit(
      loginUserUsecase: mockLoginUserUsecase,
      signUpUsecase: mockSignUpUsecase,
      profileUsecase: mockProfileUsecase,
      userSharedPrefs: mockUserSharedPrefs,
      tokenSharedPrefs: mockTokenSharedPrefs,
    );
  });

  tearDown(() {
    loginCubit.close();
  });

  group('LoginCubit', () {
    const email = 'test@example.com';
    const password = 'password123';
    const name = 'Test User';
    const token = 'fake-token';

    const loginEntity = LoginEntity(
      token: token,
      user: UserEntity(
        id: '1',
        name: name,
        email: email,
        // Add other necessary fields for UserEntity
      ),
    );

    test('initial state is LoginState.initially()', () {
      expect(loginCubit.state, LoginState.initially());
    });

    group('loginFx', () {
      test('should emit loading and success states on successful login', () async {
        // Arrange
        when(() => mockLoginUserUsecase.call(any())).thenAnswer((_) async => const Right(loginEntity));
        when(() => mockUserSharedPrefs.setUserData(any())).thenAnswer((_) async {
          return Left(ApiFailure(message: ''));
        });
        when(() => mockTokenSharedPrefs.saveToken(any())).thenAnswer((_) async {
          return Left(ApiFailure(message: ''));
        });

        // Act
        loginCubit.loginFx(
          MockBuildContext(), // Mock context
          email: email,
          password: password,
        );

        // Assert
        await expectLater(
          loginCubit.stream,
          emitsInOrder([
            LoginState.initially().copyWith(isLoadingState: true),
            LoginState.initially().copyWith(isLoadingState: false, userData: loginEntity.user),
          ]),
        );

        verify(() => mockLoginUserUsecase.call(const LoginUserParams(email: email, password: password))).called(1);
        verify(() => mockUserSharedPrefs.setUserData(loginEntity.user!)).called(1);
        verify(() => mockTokenSharedPrefs.saveToken(loginEntity.token!)).called(1);
      });

      test('should emit loading and error states on login failure', () async {
        // Arrange
        var failure = ApiFailure(message: 'Login failed');
        when(() => mockLoginUserUsecase.call(any())).thenAnswer((_) async => Left(failure));

        // Act
        loginCubit.loginFx(
          MockBuildContext(), // Mock context
          email: email,
          password: password,
        );

        // Assert
        await expectLater(
          loginCubit.stream,
          emitsInOrder([
            LoginState.initially().copyWith(isLoadingState: true),
            LoginState.initially().copyWith(isLoadingState: false),
          ]),
        );

        verify(() => mockLoginUserUsecase.call(const LoginUserParams(email: email, password: password))).called(1);
        verifyNever(() => mockUserSharedPrefs.setUserData(any()));
        verifyNever(() => mockTokenSharedPrefs.saveToken(any()));
      });
    });

    group('signUpFx', () {
      test('should emit loading and success states on successful signup', () async {
        // Arrange
        when(() => mockSignUpUsecase.call(any())).thenAnswer((_) async => const Right(loginEntity));
        when(() => mockUserSharedPrefs.setUserData(any())).thenAnswer((_) async {
          return Left(ApiFailure(message: ''));
        });
        when(() => mockTokenSharedPrefs.saveToken(any())).thenAnswer((_) async {
          return Left(ApiFailure(message: ''));
        });

        // Act
        loginCubit.signUpFx(
          MockBuildContext(), // Mock context
          email: email,
          password: password,
          name: name,
        );

        // Assert
        await expectLater(
          loginCubit.stream,
          emitsInOrder([
            LoginState.initially().copyWith(isLoadingState: true),
            LoginState.initially().copyWith(isLoadingState: false, userData: loginEntity.user),
          ]),
        );

        verify(() => mockSignUpUsecase.call(const SignUpUserParams(email: email, password: password, name: name))).called(1);
        verify(() => mockUserSharedPrefs.setUserData(loginEntity.user!)).called(1);
        verify(() => mockTokenSharedPrefs.saveToken(loginEntity.token!)).called(1);
      });

      test('should emit loading and error states on signup failure', () async {
        // Arrange
        var failure = ApiFailure(message: 'Signup failed');
        when(() => mockSignUpUsecase.call(any())).thenAnswer((_) async => Left(failure));

        // Act
        loginCubit.signUpFx(
          MockBuildContext(), // Mock context

          email: email,
          password: password,
          name: name,
        );

        // Assert
        await expectLater(
          loginCubit.stream,
          emitsInOrder([
            LoginState.initially().copyWith(isLoadingState: true),
            LoginState.initially().copyWith(isLoadingState: false),
          ]),
        );

        verify(() => mockSignUpUsecase.call(const SignUpUserParams(email: email, password: password, name: name))).called(1);
        verifyNever(() => mockUserSharedPrefs.setUserData(any()));
        verifyNever(() => mockTokenSharedPrefs.saveToken(any()));
      });
    });

    group('updateProfile', () {
      test('should emit success state on successful profile update', () async {
        // Arrange
        when(() => mockProfileUsecase.call(any())).thenAnswer((_) async => const Right(loginEntity));

        // Act
        loginCubit.updateProfile(
          MockBuildContext(), // Mock context

          name: name,
          age: '25',
          weight: '70',
          height: '180',
          fitnessGoal: 'Lose Weight',
          profilepic: null,
        );

        // Assert
        await expectLater(
          loginCubit.stream,
          emitsInOrder([
            LoginState.initially().copyWith(isLoadingState: false, userData: loginEntity.user),
          ]),
        );

        verify(() => mockProfileUsecase.call(any())).called(1);
      });

      test('should emit error state on profile update failure', () async {
        // Arrange
        var failure = ApiFailure(message: 'Profile update failed');
        when(() => mockProfileUsecase.call(any())).thenAnswer((_) async => Left(failure));

        // Act
        loginCubit.updateProfile(
          MockBuildContext(), // Mock context

          name: name,
          age: '25',
          weight: '70',
          height: '180',
          fitnessGoal: 'Lose Weight',
          profilepic: null,
        );

        // Assert
        await expectLater(
          loginCubit.stream,
          emitsInOrder([
            LoginState.initially().copyWith(isLoadingState: false),
          ]),
        );

        verify(() => mockProfileUsecase.call(any())).called(1);
      });
    });

    group('logOut', () {
      test('should clear user data and token on logout', () async {
        // Arrange
        when(() => mockTokenSharedPrefs.clearToken()).thenAnswer((_) async {
          return Left(ApiFailure(message: ''));
        });
        when(() => mockUserSharedPrefs.clear()).thenAnswer((_) async {
          return Left(ApiFailure(message: ''));
        });

        // Act
        loginCubit.logOut(
          MockBuildContext(), // Mock context
        ); // Mock context

        // Assert
        expect(loginCubit.state, LoginState.initially().copyWith(token: null, userData: null));
        verify(() => mockTokenSharedPrefs.clearToken()).called(1);
        verify(() => mockUserSharedPrefs.clear()).called(1);
      });
    });

    group('setUser', () {
      test('should update user data in state', () {
        // Arrange
        const user = UserEntity(
          id: '1',
          name: name,
          email: email,
          // Add other necessary fields for UserEntity
        );

        // Act
        loginCubit.setUser(user);

        // Assert
        expect(loginCubit.state.userData, user);
      });
    });
  });
}
