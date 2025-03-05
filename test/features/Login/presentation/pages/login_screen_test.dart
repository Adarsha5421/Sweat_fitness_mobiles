import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_cubit.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_state.dart';
import 'package:gym_tracker_app/features/Login/presentation/pages/login_screen.dart';

// Mock classes
class MockLoginCubit extends Mock implements LoginCubit {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockLoginCubit mockLoginCubit;

  setUp(() {
    mockLoginCubit = MockLoginCubit();
  });

  group('LoginScreen', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const LoginScreen(),
          ),
        ),
      );

      // Assert
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.text('Log In'), findsOneWidget);
      expect(find.text("Don't have an account?"), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);
    });

    testWidgets('shows validation errors for empty email and password', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const LoginScreen(),
          ),
        ),
      );

      // Tap the login button without entering any data
      await tester.tap(find.text('Log In'));
      await tester.pump();

      // Assert
      expect(find.text('Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);
    });

    testWidgets('shows validation error for invalid email', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const LoginScreen(),
          ),
        ),
      );

      // Enter invalid email
      await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
      await tester.tap(find.text('Log In'));
      await tester.pump();

      // Assert
      expect(find.text('Please enter a valid email address'), findsOneWidget);
    });

    testWidgets('shows validation error for short password', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const LoginScreen(),
          ),
        ),
      );

      // Enter short password
      await tester.enterText(find.byType(TextFormField).last, '123');
      await tester.tap(find.text('Log In'));
      await tester.pump();

      // Assert
      expect(find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    testWidgets('calls loginFx when form is valid', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());
      when(() => mockLoginCubit.loginFx(any(), email: 'test@example.com', password: 'password123')).thenReturn(null);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const LoginScreen(),
          ),
        ),
      );

      // Enter valid email and password
      await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('Log In'));
      await tester.pump();

      // Assert
      verify(() => mockLoginCubit.loginFx(any(), email: 'test@example.com', password: 'password123')).called(1);
    });

    testWidgets('toggles password visibility', (WidgetTester tester) async {
      // Arrange
      when(() => mockLoginCubit.state).thenReturn(LoginState.initially());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<LoginCubit>.value(
            value: mockLoginCubit,
            child: const LoginScreen(),
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
