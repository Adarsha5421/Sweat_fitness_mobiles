import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_tracker_app/core/navigation_services.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_cubit.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_state.dart';
import 'package:gym_tracker_app/features/workout/presentation/pages/sign_up_screen.dart';
import 'package:sensors_plus/sensors_plus.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late AnimationController _controller;
  late Animation<Offset> _logoAnimation;
  bool _isPasswordVisible = false;
  double _lastX = 0.0;
  double _lastY = 0.0;
  double _lastZ = 0.0;
  final double _shakeThreshold = 2.7; // Adjust this value to change sensitivity
  DateTime? _lastShakeTime;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    _controller.forward();

    // Start listening to accelerometer events
    accelerometerEvents.listen((AccelerometerEvent event) {
      _handleShake(event);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  // Handle shake event
  void _handleShake(AccelerometerEvent event) {
    final double x = event.x;
    final double y = event.y;
    final double z = event.z;

    final double deltaX = (x - _lastX).abs();
    final double deltaY = (y - _lastY).abs();
    final double deltaZ = (z - _lastZ).abs();

    if (deltaX > _shakeThreshold || deltaY > _shakeThreshold || deltaZ > _shakeThreshold) {
      final now = DateTime.now();
      if (_lastShakeTime == null || now.difference(_lastShakeTime!) > const Duration(seconds: 1)) {
        _lastShakeTime = now;
        _onShake();
      }
    }

    _lastX = x;
    _lastY = y;
    _lastZ = z;
  }

  // Function to call when shake is detected
  void _onShake() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().loginFx(
            context,
            email: _emailController.text,
            password: _passwordController.text,
          );
      // Uncomment when ready to implement:
      // navigateAndPushReplacement(context: context, screen: const MyDashboardScreen());
    }
  }

  // Email validation
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validation
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 4) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              // Gradient Background
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 10, 10, 10), Color.fromARGB(255, 17, 17, 17)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // Logo
              Positioned(
                top: 120,
                left: 140,
                child: SlideTransition(
                  position: _logoAnimation,
                  child: Image.asset('assets/logo/gym_logo.png', height: 100),
                ),
              ),
              // Login Card
              Center(
                child: SingleChildScrollView(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Title
                            const Text(
                              'Welcome Back',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 55, 0),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Email Input with validation
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Color.fromARGB(255, 255, 55, 0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: _validateEmail,
                            ),
                            const SizedBox(height: 16),
                            // Password Input with validation
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(255, 255, 55, 0),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              obscureText: !_isPasswordVisible,
                              validator: _validatePassword,
                            ),
                            const SizedBox(height: 24),
                            // Login Button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: const Color.fromARGB(255, 255, 55, 0),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().loginFx(
                                        context,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                  // Uncomment when ready to implement:
                                  // navigateAndPushReplacement(context: context, screen: const MyDashboardScreen());
                                }
                              },
                              child: const Text(
                                'Log In',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Error message from state
                            // if (state is LoginFailureState)
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 8.0),
                            //   child: Text(
                            //     state.errorMessage,
                            //     style: const TextStyle(
                            //       color: Colors.red,
                            //       fontSize: 14,
                            //     ),
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),
                            const SizedBox(height: 16),
                            // Signup Link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account?"),
                                TextButton(
                                  onPressed: () => navigateTo(context: context, screen: const SignupScreen()),
                                  child: const Text('Sign Up',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 255, 55, 0),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
