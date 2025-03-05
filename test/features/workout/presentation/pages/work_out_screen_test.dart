import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_tracker_app/features/workout/domain/entities/work_out_entity.dart';
import 'package:gym_tracker_app/features/workout/presentation/cubit/workout_cubit.dart';
import 'package:gym_tracker_app/features/workout/presentation/cubit/workout_state.dart';
import 'package:gym_tracker_app/features/workout/presentation/pages/work_out_screen.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockWorkoutCubit extends Mock implements WorkoutCubit {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockWorkoutCubit mockWorkoutCubit;

  setUp(() {
    mockWorkoutCubit = MockWorkoutCubit();
  });

  group('WorkOutScreen', () {
    testWidgets('renders correctly in initial state', (WidgetTester tester) async {
      // Arrange
      when(() => mockWorkoutCubit.state).thenReturn(WorkOutState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<WorkoutCubit>.value(
            value: mockWorkoutCubit,
            child: const WorkOutScreen(),
          ),
        ),
      );

      // Assert
      expect(find.text('Workouts'), findsOneWidget); // AppBar title
      expect(find.byType(CircularProgressIndicator), findsOneWidget); // Loading state
    });

    testWidgets('renders workout cards when data is loaded', (WidgetTester tester) async {
      // Arrange
      final workOutEntities = [
        const WorkOutEntity(
          id: '1',
          name: 'Workout 1',
          bodyPart: 'Chest',
          difficulty: 'Beginner',
          videoUrl: 'https://example.com/video1',
          instructions: 'Instructions 1',
        ),
        const WorkOutEntity(
          id: '2',
          name: 'Workout 2',
          bodyPart: 'Legs',
          difficulty: 'Intermediate',
          videoUrl: 'https://example.com/video2',
          instructions: 'Instructions 2',
        ),
      ];

      when(() => mockWorkoutCubit.state).thenReturn(
        WorkOutState.initially().copyWith(
          isLoadingState: false,
          workOutList: workOutEntities,
          workOutListIntial: workOutEntities,
          workOutBodyPartsList: ['ALL', 'Chest', 'Legs'],
          workOutLevelsList: ['ALL', 'Beginner', 'Intermediate'],
        ),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<WorkoutCubit>.value(
            value: mockWorkoutCubit,
            child: const WorkOutScreen(),
          ),
        ),
      );

      // Assert
      expect(find.text('Workout 1'), findsOneWidget);
      expect(find.text('Workout 2'), findsOneWidget);
      expect(find.text('Chest'), findsNWidgets(1));
      expect(find.text('Legs'), findsNWidgets(1));
      expect(find.text('Beginner'), findsNWidgets(1));
      expect(find.text('Intermediate'), findsNWidgets(1));
    });

    testWidgets('shows "No Data" when workout list is empty', (WidgetTester tester) async {
      // Arrange
      when(() => mockWorkoutCubit.state).thenReturn(
        WorkOutState.initially().copyWith(
          isLoadingState: false,
          workOutList: [],
          workOutListIntial: [],
        ),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<WorkoutCubit>.value(
            value: mockWorkoutCubit,
            child: const WorkOutScreen(),
          ),
        ),
      );

      // Assert
      expect(find.text('No Data'), findsOneWidget);
    });

    testWidgets('calls fetchWorkList on initState', (WidgetTester tester) async {
      // Arrange
      when(() => mockWorkoutCubit.state).thenReturn(WorkOutState.initially());
      when(() => mockWorkoutCubit.fetchWorkList(any())).thenReturn(null);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<WorkoutCubit>.value(
            value: mockWorkoutCubit,
            child: const WorkOutScreen(),
          ),
        ),
      );

      // Assert
      verify(() => mockWorkoutCubit.fetchWorkList(any())).called(1);
    });
  });
}
