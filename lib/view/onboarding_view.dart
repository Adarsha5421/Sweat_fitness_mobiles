// import 'package:flutter/material.dart';
// import 'package:gym_tracker_app/core/navigation_services.dart';
// import 'package:gym_tracker_app/features/workout/presentation/pages/sign_up_screen.dart';
// import 'package:gym_tracker_app/view/signup_view.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     PageController controller = PageController();

//     return Scaffold(
//       body: Container(
//         color: Colors.black,
//         child: PageView(
//           controller: controller,
//           children: const [
//             OnboardingPage(
//               imagePath: 'assets/logo/gym_logo.png',
//               title: "Track Your Workouts",
//               description: "Monitor your exercises and improve your fitness journey.",
//             ),
//             OnboardingPage(
//               imagePath: 'assets/logo/gym_logo.png',
//               title: "Set Your Goals Here!",
//               description: "Define fitness goals and achieve them step by step.",
//             ),
//             OnboardingPage(
//               imagePath: 'assets/logo/gym_logo.png',
//               title: "Analyze Your Progress",
//               description: "Visualize your performance and stay motivated.",
//             ),
//           ],
//         ),
//       ),
//       bottomSheet: OnboardingNavigation(
//         controller: controller,
//         totalPages: 3,
//         onDone: () => navigateAndPushReplacement(context: context, screen: const SignupScreen()),
//         // onDone: () => Navigator.pushReplacementNamed(context, '/signup'),
//       ),
//     );
//   }
// }

// class OnboardingPage extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String description;

//   const OnboardingPage({
//     super.key,
//     required this.imagePath,
//     required this.title,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(imagePath, height: 200),
//           const SizedBox(height: 24),
//           Text(
//             title,
//             style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(223, 214, 89, 27)),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             description,
//             style: const TextStyle(
//               fontSize: 16,
//               color: Color.fromARGB(225, 225, 55, 0),
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OnboardingNavigation extends StatelessWidget {
//   final PageController controller;
//   final int totalPages;
//   final VoidCallback onDone;

//   const OnboardingNavigation({
//     super.key,
//     required this.controller,
//     required this.totalPages,
//     required this.onDone,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       color: Colors.black,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           TextButton(
//             onPressed: () => onDone(),
//             child: const Text(
//               "Skip",
//               style: TextStyle(
//                 color: Color.fromARGB(225, 225, 55, 0),
//               ),
//             ),
//           ),
//           SmoothPageIndicator(
//             controller: controller,
//             count: totalPages,
//             effect: WormEffect(
//               activeDotColor: Theme.of(context).secondaryHeaderColor,
//               dotHeight: 8,
//               dotWidth: 8,
//             ),
//           ),
//           TextButton(
//             onPressed: () async {
//               if (controller.page!.toInt() == totalPages - 1) {
//                 onDone();
//               } else {
//                 controller.nextPage(
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                 );
//               }
//             },
//             child: const Text(
//               "Next",
//               style: TextStyle(
//                 color: Color.fromARGB(225, 225, 55, 0),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
