import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_tracker_app/core/error/failure.dart';
import 'package:gym_tracker_app/features/workout/data/datasources/work_out_remote_datasource.dart';
import 'package:gym_tracker_app/features/workout/data/models/work_out_model.dart';
import 'package:gym_tracker_app/features/workout/data/repositories/work_out_rep_impl.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockWorkOutRemoteDatasource extends Mock implements WorkOutRemoteDatasource {}

void main() {
  late WorkOutRepImpl workOutRepImpl;
  late MockWorkOutRemoteDatasource mockWorkOutRemoteDatasource;

  setUp(() {
    mockWorkOutRemoteDatasource = MockWorkOutRemoteDatasource();
    workOutRepImpl = WorkOutRepImpl(workOutRemoteDatasource: mockWorkOutRemoteDatasource);
  });

  group('WorkOutRepImpl', () {
    final workOutModels = [
      const WorkOutModel(
        id: '1',
        name: 'Workout 1',
        // description: 'Description 1',
        // Add other necessary fields for WorkOutModel
      ),
      const WorkOutModel(
        id: '2',
        name: 'Workout 2',
        // description: 'Description 2',
        // Add other necessary fields for WorkOutModel
      ),
    ];

    final workOutEntities = workOutModels.map((e) => e.toEntity()).toList();

    test('should return a list of WorkOutEntity when getWorkOuts is called', () async {
      // Arrange
      when(() => mockWorkOutRemoteDatasource.workOuts()).thenAnswer((_) async => workOutModels);

      // Act
      final result = await workOutRepImpl.getWorkOuts();

      // Assert
      expect(result, Right(workOutEntities));
      verify(() => mockWorkOutRemoteDatasource.workOuts()).called(1);
    });

    test('should return ApiFailure when an exception occurs', () async {
      // Arrange
      when(() => mockWorkOutRemoteDatasource.workOuts()).thenThrow(Exception('Failed to fetch workouts'));

      // Act
      final result = await workOutRepImpl.getWorkOuts();

      // Assert
      expect(result, Left(ApiFailure(message: 'Failed to fetch workouts')));
      verify(() => mockWorkOutRemoteDatasource.workOuts()).called(1);
    });
  });
}
