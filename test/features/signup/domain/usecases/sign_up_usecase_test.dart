import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_tracker_app/app/di/di.dart';
import 'package:gym_tracker_app/core/error/failure.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/local_datasource/login_local_datasource.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';
import 'package:gym_tracker_app/features/Login/domain/repositories/login_repository.dart';
import 'package:gym_tracker_app/features/signup/domain/usecases/sign_up_usecase.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockIUserRepository extends Mock implements IUserRepository {}

class MockUserSharedPrefs extends Mock implements UserSharedPrefs {}

void main() {
  late SignUpUsecase signUpUsecase;
  late MockIUserRepository mockUserRepository;
  late MockUserSharedPrefs mockUserSharedPrefs;

  setUp(() {
    mockUserRepository = MockIUserRepository();
    mockUserSharedPrefs = MockUserSharedPrefs();
    signUpUsecase = SignUpUsecase(
      userRepository: mockUserRepository,
      userSharedPrefs: mockUserSharedPrefs,
    );

    // Register the mock Dio in the dependency injection container
    getIt.registerSingleton<Dio>(Dio());
  });

  tearDown(() {
    getIt.unregister<Dio>();
  });

  group('SignUpUsecase', () {
    const email = 'test@example.com';
    const password = 'password123';
    const name = 'Test User';
    const signUpUserParams = SignUpUserParams(email: email, password: password, name: name);

    const loginEntity = LoginEntity(
      token: 'fake-token',
      user: UserEntity(
        id: '1',
        name: name,
        email: email,
        // Add other necessary fields for UserEntity
      ),
    );

    test('should return LoginEntity on successful signup', () async {
      // Arrange
      when(() => mockUserRepository.signUp(email, password, name)).thenAnswer((_) async => const Right(loginEntity));

      when(() => mockUserSharedPrefs.setUserData(any())).thenAnswer((_) async {
        return Left(ApiFailure(message: ''));
      });

      // Act
      final result = await signUpUsecase(signUpUserParams);

      // Assert
      expect(result, const Right(loginEntity));
      verify(() => mockUserRepository.signUp(email, password, name)).called(1);
      verify(() => mockUserSharedPrefs.setUserData(loginEntity.user!)).called(1);
      verify(() => getIt<Dio>().options.headers['Authorization'] = loginEntity.token).called(1);
    });

    test('should return Failure when repository returns Failure', () async {
      // Arrange
      var failure = ApiFailure(message: 'Signup failed');
      when(() => mockUserRepository.signUp(email, password, name)).thenAnswer((_) async => Left(failure));

      // Act
      final result = await signUpUsecase(signUpUserParams);

      // Assert
      expect(result, Left(failure));
      verify(() => mockUserRepository.signUp(email, password, name)).called(1);
      verifyNever(() => mockUserSharedPrefs.setUserData(any()));
      verifyNever(() => getIt<Dio>().options.headers['Authorization'] = any());
    });

    test('should throw an exception when setting user data fails', () async {
      // Arrange
      when(() => mockUserRepository.signUp(email, password, name)).thenAnswer((_) async => const Right(loginEntity));

      when(() => mockUserSharedPrefs.setUserData(any())).thenThrow(Exception('Failed to save user data'));

      // Act & Assert
      expect(() => signUpUsecase(signUpUserParams), throwsException);
      verify(() => mockUserRepository.signUp(email, password, name)).called(1);
      verify(() => mockUserSharedPrefs.setUserData(loginEntity.user!)).called(1);
      verifyNever(() => getIt<Dio>().options.headers['Authorization'] = any());
    });
  });
}
