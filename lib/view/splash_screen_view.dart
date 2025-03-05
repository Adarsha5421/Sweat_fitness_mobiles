import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gym_tracker_app/app/di/di.dart';
import 'package:gym_tracker_app/core/navigation_services.dart';
import 'package:gym_tracker_app/features/Login/data/datasources/local_datasource/login_local_datasource.dart';
import 'package:gym_tracker_app/features/Login/domain/entities/login_entity.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_cubit.dart';
import 'package:gym_tracker_app/features/Login/presentation/pages/login_screen.dart'; // Assuming you have this import
import 'package:gym_tracker_app/features/dashboard/presentation/pages/dashboad_screen.dart';
import 'package:gym_tracker_app/features/onboarding/presentation/pages/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkTokenAndNavigate();
  }

//   Future<void> _checkTokenAndNavigate() async {
//     // Delay for splash screen display
//     await Future.delayed(const Duration(seconds: 3));

//     if (!mounted) return;

//     // Check token
//     var tokenResult = await getIt<TokenSharedPrefs>().getToken();

//     String? token;
//     tokenResult.fold(
//       (failure) {
//         // Handle token failure - navigating to login screen
//         navigateAndPushReplacement(context: context, screen: const LoginScreen());
//       },
//       (t) async {
//         token = t;
//         // Navigate based on token presence
//         if (token != null && token!.isNotEmpty) {
//     var user = await getIt<UserSharedPrefs>().getUserData();
// if(user!=null)
//           getIt<Dio>().options.headers['Authorization'] = token;

//           navigateAndPushReplacement(context: context, screen: const OnboardingScreen());
//         } else {
//           // No token, go to login
//           navigateAndPushReplacement(context: context, screen: const LoginScreen());
//         }
//       },
//     );
//   }
  Future<void> _checkTokenAndNavigate() async {
    // Delay for splash screen display
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    // Check token
    var tokenResult = await getIt<TokenSharedPrefs>().getToken();

    tokenResult.fold(
      (failure) {
        // Handle token failure - navigating to login screen
        navigateAndPushReplacement(context: context, screen: const LoginScreen());
      },
      (token) async {
        // Navigate based on token presence
        if (token.isNotEmpty) {
          // Check if user data exists
          var userResult = await getIt<UserSharedPrefs>().getUserData();

          userResult.fold((failure) {
            // User data not found, go to login
            navigateAndPushReplacement(context: context, screen: const LoginScreen());
          }, (user) {
            // Set auth header and navigate to onboarding
            getIt<Dio>().options.headers['Authorization'] = token;
            getIt<LoginCubit>().setUser(UserEntity(
              email: user.email,
              fitnessGoal: user.fitnessGoal,
              id: user.id,
              name: user.name,
              password: user.password,
              profilePic: user.profilePic,
              role: user.role,

            ));
            navigateAndPushReplacement(context: context, screen: const MyDashboardScreen());
          });
        } else {
          // No token, go to login
          navigateAndPushReplacement(context: context, screen: const LoginScreen());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo/gym_logo.png', height: 120),
            const SizedBox(height: 20),
            const Text(
              "Gym Tracker",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 225, 55, 0),
              ),
            ),
            const SizedBox(height: 30),
            const SpinKitThreeBounce(color: Colors.white, size: 30),
          ],
        ),
      ),
    );
  }
}
