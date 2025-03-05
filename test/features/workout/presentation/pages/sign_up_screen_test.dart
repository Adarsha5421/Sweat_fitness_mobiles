import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_cubit.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_state.dart';
import 'package:gym_tracker_app/features/workout/presentation/pages/sign_up_screen.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockLoginCubit extends Mock implements LoginCubit {}

void main() {
  late MockLoginCubit mockLoginCubit;

  setUp(() {
    mockLoginCubit = MockLoginCubit();
  });

  group('SignupScreen', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const SignupScreen(),
          ),
        ),
      );

      // Assert
      expect(find.text('Create Account'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(3)); // Name, Email, Password
      expect(find.text('Sign Up'), findsOneWidget);
      expect(find.text("Already have an account?"), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('shows validation errors for empty fields', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const SignupScreen(),
          ),
        ),
      );

      // Tap the signup button without entering any data
      await tester.tap(find.text('Sign Up'));
      await tester.pump();

      // Assert
      expect(find.text('Please enter your name'), findsOneWidget);
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter a password'), findsOneWidget);
    });

    testWidgets('shows validation error for invalid email', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const SignupScreen(),
          ),
        ),
      );

      // Enter invalid email
      await tester.enterText(find.byType(TextFormField).at(1), 'invalid-email');
      await tester.tap(find.text('Sign Up'));
      await tester.pump();

      // Assert
      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('shows validation error for short password', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const SignupScreen(),
          ),
        ),
      );

      // Enter short password
      await tester.enterText(find.byType(TextFormField).at(2), '123');
      await tester.tap(find.text('Sign Up'));
      await tester.pump();

      // Assert
      expect(find.text('Password must be at least 4 characters'), findsOneWidget);
    });

    testWidgets('calls signUpFx when form is valid', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());
      when(() => mockLoginCubit.signUpFx(any(), email: 'test@example.com', password: 'password123', name: 'Test User')).thenReturn(null);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const SignupScreen(),
          ),
        ),
      );

      // Enter valid name, email, and password
      await tester.enterText(find.byType(TextFormField).at(0), 'Test User');
      await tester.enterText(find.byType(TextFormField).at(1), 'test@example.com');
      await tester.enterText(find.byType(TextFormField).at(2), 'password123');
      await tester.tap(find.text('Sign Up'));
      await tester.pump();

      // Assert
      verify(() => mockLoginCubit.signUpFx(
            any(),
            email: 'test@example.com',
            password: 'password123',
            name: 'Test User',
          )).called(1);
    });

    testWidgets('toggles password visibility', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const SignupScreen(),
          ),
        ),
      );

      // Tap the visibility icon
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // Assert
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });
  });
}
