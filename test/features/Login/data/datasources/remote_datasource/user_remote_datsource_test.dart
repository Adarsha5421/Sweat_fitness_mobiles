import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_tracker_app/app/di/di.dart';
import 'package:gym_tracker_app/core/api_endpoints.dart';
import 'package:gym_tracker_app/core/error/failure.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/local_datasource/login_local_datasource.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/remote_datasource/user_remote_datsource.dart';
import 'package:gym_tracker_app/features/Login/data/models/login_modal.dart';
import 'package:gym_tracker_app/features/profile/domain/usecases/profile_usecase.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockDio extends Mock implements Dio {}

class MockTokenSharedPrefs extends Mock implements TokenSharedPrefs {}

void main() {
  late UserRemoteDataSource userRemoteDataSource;
  late MockDio mockDio;
  late MockTokenSharedPrefs mockTokenSharedPrefs;

  setUp(() {
    mockDio = MockDio();
    mockTokenSharedPrefs = MockTokenSharedPrefs();
    userRemoteDataSource = UserRemoteDataSource(dio: mockDio);

    // Register the mock TokenSharedPrefs in the dependency injection container
    getIt.registerSingleton<TokenSharedPrefs>(mockTokenSharedPrefs);
  });

  tearDown(() {
    getIt.unregister<TokenSharedPrefs>();
  });

  group('UserRemoteDataSource', () {
    const email = 'test@example.com';
    const password = 'password123';
    const name = 'Test User';
    const token = 'fake-token';

    const loginModal = LoginModal(
        // Add necessary fields for LoginModal
        );

    test('signUp should return LoginModal on successful signup', () async {
      // Arrange
      when(() => mockDio.post(
            APIEndPoints.signUpUrl,
            data: {'email': email, 'password': password, 'name': name},
          )).thenAnswer((_) async => Response(
            data: loginModal.toJson(),
            statusCode: 200,
            requestOptions: RequestOptions(path: APIEndPoints.signUpUrl),
          ));

      // Act
      final result = await userRemoteDataSource.signUp(email, password, name);

      // Assert
      expect(result, isA<LoginModal>());
      verify(() => mockDio.post(
            APIEndPoints.signUpUrl,
            data: {'email': email, 'password': password, 'name': name},
          )).called(1);
    });

    test('login should return LoginModal on successful login', () async {
      // Arrange
      when(() => mockDio.post(
            APIEndPoints.loginUrl,
            data: {'email': email, 'password': password},
          )).thenAnswer((_) async => Response(
            data: loginModal.toJson(),
            statusCode: 200,
            requestOptions: RequestOptions(path: APIEndPoints.loginUrl),
          ));

      // Act
      final result = await userRemoteDataSource.login(email, password);

      // Assert
      expect(result, isA<LoginModal>());
      verify(() => mockDio.post(
            APIEndPoints.loginUrl,
            data: {'email': email, 'password': password},
          )).called(1);
    });

    test('updateProfile should return LoginModal on successful update', () async {
      // Arrange
      const profileParams = ProfileParams(
        name: 'New Name',
        age: '21',
        height: '123',
        weight: '87',
        fitnessGoal: 'Lose Weight',
        profilePic: null,
      );

      when(() => mockTokenSharedPrefs.getToken()).thenAnswer((_) async => const Right(token));
      when(() => mockDio.put(
            APIEndPoints.editProfileUrl,
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).thenAnswer((_) async => Response(
            data: loginModal.toJson(),
            statusCode: 200,
            requestOptions: RequestOptions(path: APIEndPoints.editProfileUrl),
          ));

      // Act
      final result = await userRemoteDataSource.updateProfile(profileParams);

      // Assert
      expect(result, isA<LoginModal>());
      verify(() => mockTokenSharedPrefs.getToken()).called(1);
      verify(() => mockDio.put(
            APIEndPoints.editProfileUrl,
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).called(1);
    });

    test('updateProfile should throw an exception if token is missing', () async {
      // Arrange
      const profileParams = ProfileParams(
        name: 'New Name',
        age: '25',
        height: '180',
        weight: '75',
        fitnessGoal: 'Lose Weight',
        profilePic: null,
      );

      when(() => mockTokenSharedPrefs.getToken()).thenAnswer(
        (_) async => Left(ApiFailure(message: 'Token not found')),
      );

      // Act & Assert
      expect(() => userRemoteDataSource.updateProfile(profileParams), throwsException);
      verify(() => mockTokenSharedPrefs.getToken()).called(1);
    });

    test('updateProfile should throw an exception on Dio error', () async {
      // Arrange
      const profileParams = ProfileParams(
        name: 'New Name',
        age: "25",
        height: "180",
        weight: "75",
        fitnessGoal: 'Lose Weight',
        profilePic: null,
      );

      when(() => mockTokenSharedPrefs.getToken()).thenAnswer((_) async => const Right(token));
      when(() => mockDio.put(
            APIEndPoints.editProfileUrl,
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).thenThrow(DioException(
        requestOptions: RequestOptions(path: APIEndPoints.editProfileUrl),
        response: Response(
          data: {'error': 'Unauthorized'},
          statusCode: 401,
          requestOptions: RequestOptions(path: APIEndPoints.editProfileUrl),
        ),
      ));

      // Act & Assert
      expect(() => userRemoteDataSource.updateProfile(profileParams), throwsException);
      verify(() => mockTokenSharedPrefs.getToken()).called(1);
      verify(() => mockDio.put(
            APIEndPoints.editProfileUrl,
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).called(1);
    });
  });
}
