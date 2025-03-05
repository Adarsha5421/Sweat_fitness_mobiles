import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_tracker_app/app/di/di.dart';
import 'package:gym_tracker_app/common/app_theme/app_theme.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_cubit.dart';
import 'package:gym_tracker_app/features/workout/presentation/cubit/workout_cubit.dart';
import 'package:gym_tracker_app/view/splash_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LoginCubit>(
      create: (BuildContext context) => LoginCubit(loginUserUsecase: getIt(), tokenSharedPrefs: getIt(), signUpUsecase: getIt(), userSharedPrefs: getIt(), profileUsecase: getIt()),
    ),
    BlocProvider<WorkoutCubit>(
      create: (BuildContext context) => WorkoutCubit(
        workOutUsecase: getIt(),
      )..fetchWorkList(context),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      // home: const MyDashboardScreen(),
      home: const SplashScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/onboarding': (context) => const OnboardingScreen(),
      //   '/signup': (context) => const SignupPage(),
      //   '/login': (context) => const LoginPage(),
      //   '/home': (context) => const MyDashboardView(),
      // },
    );
  }
}
