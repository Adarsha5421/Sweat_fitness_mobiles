// import 'package:flutter/material.dart';
// import 'package:gym_tracker_app/core/navigation_services.dart';
// import 'package:gym_tracker_app/features/dashboard/presentation/pages/dashboad_screen.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _logoAnimation;

//   // Form key and controllers
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   // Validation error messages
//   String? _emailError;
//   String? _passwordError;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     );

//     _fadeAnimation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );

//     _logoAnimation = Tween<Offset>(
//       begin: const Offset(0, -0.2), // Slightly above the original position
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.elasticOut, // Bouncing effect for the logo
//     ));

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   // Validate email
//   bool _validateEmail(String email) {
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (email.isEmpty) {
//       setState(() => _emailError = 'Email is required');
//       return false;
//     } else if (!emailRegex.hasMatch(email)) {
//       setState(() => _emailError = 'Enter a valid email address');
//       return false;
//     }
//     setState(() => _emailError = null);
//     return true;
//   }

//   // Validate password
//   bool _validatePassword(String password) {
//     if (password.isEmpty) {
//       setState(() => _passwordError = 'Password is required');
//       return false;
//     } else if (password.length < 6) {
//       setState(() => _passwordError = 'Password must be at least 6 characters');
//       return false;
//     }
//     setState(() => _passwordError = null);
//     return true;
//   }

//   // Validate form and submit
//   void _submit() {
//     final isEmailValid = _validateEmail(_emailController.text);
//     final isPasswordValid = _validatePassword(_passwordController.text);

//     if (isEmailValid && isPasswordValid) {
//       // navigateTo(context: context, screen: const MyDashboardScreen());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Animated Gradient Background
//           AnimatedContainer(
//             duration: const Duration(seconds: 2),
//             curve: Curves.easeInOut,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color.fromARGB(255, 10, 10, 10), Color.fromARGB(255, 17, 17, 17)],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 120,
//             left: 140,
//             child: SlideTransition(
//               position: _logoAnimation,
//               child: Image.asset('assets/logo/gym_logo.png', height: 100),
//             ),
//           ),
//           Center(
//             child: FadeTransition(
//               opacity: _fadeAnimation,
//               child: SingleChildScrollView(
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   elevation: 8,
//                   margin: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Padding(
//                     padding: const EdgeInsets.all(24.0),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           // Animated Title
//                           ScaleTransition(
//                             scale: _fadeAnimation,
//                             child: const Text(
//                               'Welcome Back',
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 255, 55, 0),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           // Animated Email Input
//                           SlideTransition(
//                             position: Tween<Offset>(
//                               begin: const Offset(-1, 0),
//                               end: Offset.zero,
//                             ).animate(_fadeAnimation),
//                             child: TextField(
//                               controller: _emailController,
//                               decoration: InputDecoration(
//                                 labelText: 'Email',
//                                 prefixIcon: const Icon(
//                                   Icons.email,
//                                   color: Color.fromARGB(255, 255, 55, 0),
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 errorText: _emailError,
//                               ),
//                               keyboardType: TextInputType.emailAddress,
//                               onChanged: (_) => _emailError != null ? _validateEmail(_emailController.text) : null,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           // Animated Password Input
//                           SlideTransition(
//                             position: Tween<Offset>(
//                               begin: const Offset(1, 0),
//                               end: Offset.zero,
//                             ).animate(_fadeAnimation),
//                             child: TextField(
//                               controller: _passwordController,
//                               decoration: InputDecoration(
//                                 labelText: 'Password',
//                                 prefixIcon: const Icon(
//                                   Icons.lock,
//                                   color: Color.fromARGB(255, 255, 55, 0),
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 errorText: _passwordError,
//                               ),
//                               obscureText: true,
//                               onChanged: (_) => _passwordError != null ? _validatePassword(_passwordController.text) : null,
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           // Animated Login Button with Scale Effect
//                           ScaleTransition(
//                             scale: _fadeAnimation,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 40,
//                                   vertical: 12,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 backgroundColor: const Color.fromARGB(255, 255, 55, 0),
//                                 foregroundColor: Colors.white,
//                               ),
//                               onPressed: _submit,
//                               child: const Text(
//                                 'Log In',
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           // Animated Signup Link
//                           FadeTransition(
//                             opacity: _fadeAnimation,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text("Don't have an account?"),
//                                 TextButton(
//                                   onPressed: () => Navigator.pushNamed(context, '/signup'),
//                                   child: const Text('Sign Up',
//                                       style: TextStyle(
//                                         color: Color.fromARGB(255, 255, 55, 0),
//                                       )),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
