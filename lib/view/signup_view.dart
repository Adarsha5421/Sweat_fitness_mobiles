// import 'package:flutter/material.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _logoAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );

//     _logoAnimation = Tween<Offset>(
//       begin: const Offset(0, -1),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));

//     // Start the animation
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Gradient background
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 10, 10, 10),
//                   Color.fromARGB(255, 17, 17, 17)
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 80,
//             left: 140,
//             child: SlideTransition(
//               position: _logoAnimation,
//               child: Image.asset('assets/logo/gym_logo.png', height: 100),
//             ),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16.0),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 elevation: 8,
//                 margin: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       // Signup Title
//                       const Text(
//                         'Create Account',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(255, 255, 55, 0),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       // Name Input
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Name',
//                           prefixIcon: const Icon(
//                             Icons.person,
//                             color: Color.fromARGB(255, 255, 55, 0),
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       // Email Input
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           prefixIcon: const Icon(
//                             Icons.email,
//                             color: Color.fromARGB(255, 255, 55, 0),
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//                       const SizedBox(height: 16),
//                       // Password Input
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           prefixIcon: const Icon(
//                             Icons.lock,
//                             color: Color.fromARGB(255, 255, 55, 0),
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         obscureText: true,
//                       ),
//                       const SizedBox(height: 24),
//                       // Signup Button
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 40,
//                             vertical: 12,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           backgroundColor: const Color.fromARGB(
//                               255, 255, 55, 0), // Replace primary
//                           foregroundColor: Colors.white, // Replace onPrimary
//                         ),
//                         onPressed: () =>
//                             Navigator.pushReplacementNamed(context, '/login'),
//                         child: const Text(
//                           'Sign Up',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       // Login Link
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text("Already have an account?"),
//                           TextButton(
//                             onPressed: () => Navigator.pushReplacementNamed(
//                                 context, '/login'),
//                             child: const Text(
//                               'Login',
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 255, 55, 0)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//      ),
// );
// }
// }
