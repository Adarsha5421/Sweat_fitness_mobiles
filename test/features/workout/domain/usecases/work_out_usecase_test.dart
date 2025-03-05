import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_tracker_app/core/error/failure.dart';
import 'package:gym_tracker_app/features/workout/domain/entities/work_out_entity.dart';
import 'package:gym_tracker_app/features/workout/domain/repositories/work_out_rep.dart';
import 'package:gym_tracker_app/features/workout/domain/usecases/work_out_usecase.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockWorkOutRep extends Mock implements WorkOutRep {}

void main() {
  late WorkOutUsecase workOutUsecase;
  late MockWorkOutRep mockWorkOutRep;

  setUp(() {
    mockWorkOutRep = MockWorkOutRep();
    workOutUsecase = WorkOutUsecase(workOutRep: mockWorkOutRep);
  });

  group('WorkOutUsecase', () {
    final workOutEntities = [
      const WorkOutEntity(
        id: '1',
        name: 'Workout 1',
        // description: 'Description 1',
        // Add other necessary fields for WorkOutEntity
      ),
      const WorkOutEntity(
        id: '2',
        name: 'Workout 2',
        // description: 'Description 2',
        // Add other necessary fields for WorkOutEntity
      ),
    ];

    test('should return a list of WorkOutEntity when call is successful', () async {
      // Arrange
      when(() => mockWorkOutRep.getWorkOuts()).thenAnswer((_) async => Right(workOutEntities));

      // Act
      final result = await workOutUsecase(null);

      // Assert
      expect(result, Right(workOutEntities));
      verify(() => mockWorkOutRep.getWorkOuts()).called(1);
    });

    test('should return Failure when repository returns Failure', () async {
      // Arrange
      var failure = ApiFailure(message: 'Failed to fetch workouts');
      when(() => mockWorkOutRep.getWorkOuts()).thenAnswer((_) async => Left(failure));

      // Act
      final result = await workOutUsecase(null);

      // Assert
      expect(result, Left(failure));
      verify(() => mockWorkOutRep.getWorkOuts()).called(1);
    });
  });
}
