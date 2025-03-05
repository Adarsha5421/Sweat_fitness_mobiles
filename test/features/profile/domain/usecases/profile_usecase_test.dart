import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_tracker_app/core/error/failure.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/local_datasource/login_local_datasource.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';
import 'package:gym_tracker_app/features/Login/domain/repositories/login_repository.dart';
import 'package:gym_tracker_app/features/profile/domain/usecases/profile_usecase.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockIUserRepository extends Mock implements IUserRepository {}

class MockUserSharedPrefs extends Mock implements UserSharedPrefs {}

void main() {
  late ProfileUsecase profileUsecase;
  late MockIUserRepository mockUserRepository;
  late MockUserSharedPrefs mockUserSharedPrefs;

  setUp(() {
    mockUserRepository = MockIUserRepository();
    mockUserSharedPrefs = MockUserSharedPrefs();
    profileUsecase = ProfileUsecase(
      userRepository: mockUserRepository,
      userSharedPrefs: mockUserSharedPrefs,
    );
  });

  group('ProfileUsecase', () {
    const loginEntity = LoginEntity(
      token: 'fake-token',
      user: UserEntity(
        id: '1',
        name: 'Test User',
        email: 'test@example.com',
        // Add other necessary fields for UserEntity
      ),
    );

    final profileParams = ProfileParams(
      weight: '70',
      height: '180',
      fitnessGoal: 'Lose Weight',
      age: '25',
      name: 'Test User',
      profilePic: File('fake_path'),
    );

    test('should return LoginEntity on successful profile update', () async {
      // Arrange
      when(() => mockUserRepository.editProfile(profileParams)).thenAnswer((_) async => const Right(loginEntity));

      // Act
      final result = await profileUsecase(profileParams);

      // Assert
      expect(result, const Right(loginEntity));
      verify(() => mockUserRepository.editProfile(profileParams)).called(1);
    });

    test('should return Failure when repository returns Failure', () async {
      // Arrange
      var failure = ApiFailure(message: 'Profile update failed');
      when(() => mockUserRepository.editProfile(profileParams)).thenAnswer((_) async => Left(failure));

      // Act
      final result = await profileUsecase(profileParams);

      // Assert
      expect(result, Left(failure));
      verify(() => mockUserRepository.editProfile(profileParams)).called(1);
    });

    test('should throw an exception when an error occurs', () async {
      // Arrange
      when(() => mockUserRepository.editProfile(profileParams)).thenThrow(Exception('Failed to update profile'));

      // Act & Assert
      expect(() => profileUsecase(profileParams), throwsException);
      verify(() => mockUserRepository.editProfile(profileParams)).called(1);
    });
  });
}
