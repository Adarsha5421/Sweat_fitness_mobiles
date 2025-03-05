import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_cubit.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_state.dart';
import 'package:gym_tracker_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockLoginCubit extends Mock implements LoginCubit {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockLoginCubit mockLoginCubit;

  setUp(() {
    mockLoginCubit = MockLoginCubit();
  });

  group('ProfileScreen', () {
    testWidgets('renders correctly in initial state', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const ProfileScreen(),
          ),
        ),
      );

      // Assert
      expect(find.text('Your Profile'), findsOneWidget); // AppBar title
      expect(find.byType(CircleAvatar), findsOneWidget); // Profile image
      expect(find.text('Sand'), findsOneWidget); // Username
      expect(find.byType(TextField), findsNWidgets(4)); // Username, Age, Weight, Height fields
      expect(find.byType(DropdownButtonFormField<String>), findsOneWidget); // Fitness goal dropdown
      expect(find.text('Update Profile'), findsOneWidget); // Update button
    });

    testWidgets('calls updateProfile when Update Profile button is pressed', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());
      when(() => mockLoginCubit.updateProfile(any(), name: 'Sand', age: '25', weight: '70', height: '180', fitnessGoal: 'Maintain', profilepic: null)).thenReturn(null);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const ProfileScreen(),
          ),
        ),
      );

      // Enter values in the text fields
      await tester.enterText(find.byType(TextField).at(1), '25'); // Age
      await tester.enterText(find.byType(TextField).at(2), '70'); // Weight
      await tester.enterText(find.byType(TextField).at(3), '180'); // Height

      // Tap the Update Profile button
      await tester.tap(find.text('Update Profile'));
      await tester.pump();

      // Assert
      verify(() => mockLoginCubit.updateProfile(
            any(),
            name: 'Sand',
            age: '25',
            weight: '70',
            height: '180',
            fitnessGoal: 'Maintain',
            profilepic: null,
          )).called(1);
    });

    testWidgets('shows SnackBar when fields are empty', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const ProfileScreen(),
          ),
        ),
      );

      // Tap the Update Profile button without entering any data
      await tester.tap(find.text('Update Profile'));
      await tester.pump();

      // Assert
      expect(find.text('Please fill all fields!'), findsOneWidget); // SnackBar message
    });

    testWidgets('updates profile image when image is picked', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const ProfileScreen(),
          ),
        ),
      );

      // Tap the profile image to pick a new image
      await tester.tap(find.byType(CircleAvatar));
      await tester.pump();

      // Assert
      // You can add more assertions here if you mock the image picker
    });
  });
}
