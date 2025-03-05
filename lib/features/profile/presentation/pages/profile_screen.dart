import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_tracker_app/app/di/di.dart';
import 'package:gym_tracker_app/core/api_endpoints.dart';
import 'package:gym_tracker_app/features/Login/presentation/cubit/login_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController usernameController = TextEditingController(text: "Sand");
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String selectedGoal = "Maintain";
  File? profileImage;
  String? apiImage;

  Future<void> pickImage() async {
    final status = await Permission.photos.request();
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        profileImage = File(image.path);
      });
    }
  }

  void updateProfile() {
    final String username = usernameController.text;
    final String age = ageController.text;
    final String weight = weightController.text;
    final String height = heightController.text;

    if (username.isEmpty || age.isEmpty || weight.isEmpty || height.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields!")),
      );
      return;
    }

    context.read<LoginCubit>().updateProfile(
          context,
          name: username,
          age: age,
          weight: weight,
          height: height,
          fitnessGoal: selectedGoal,
          profilepic: profileImage,
        );
  }

  @override
  void initState() {
    super.initState();
    // var user = context.read<LoginCubit>().state.userData;
    var user = getIt<LoginCubit>().state.userData;
    usernameController.text = user?.name ?? '';
    selectedGoal = user?.fitnessGoal ?? 'Maintain';
    apiImage = user?.profilePic ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.brightness == Brightness.dark ? Colors.redAccent : Colors.red;
    final fieldColor = theme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white;
    final textColor = theme.brightness == Brightness.dark ? Colors.yellowAccent : Colors.yellow;

    return Scaffold(
      backgroundColor: theme.brightness == Brightness.dark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text("Your Profile"),
        backgroundColor: primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              child: const Icon(Icons.logout),
              onTap: () => context.read<LoginCubit>().logOut(context),
            ),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // GestureDetector(
              //   onTap: pickImage,
              //   child: CircleAvatar(
              //     radius: 40,
              //     backgroundColor: Colors.grey[200],
              //     backgroundImage: profileImage != null ? FileImage(profileImage!) : (apiImage != null && apiImage!.isNotEmpty ? NetworkImage('${APIEndPoints.mediaUrl}$apiImage') : null),
              //     child: (profileImage == null && (apiImage == null || apiImage!.isEmpty)) ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey) : null,
              //   ),
              // ),
              GestureDetector(
                onTap: pickImage,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[100],
                  backgroundImage: profileImage != null
                      ? FileImage(profileImage!) // If local profile image is picked
                      : (apiImage != null && apiImage!.isNotEmpty
                          ? NetworkImage('${APIEndPoints.mediaUrl}$apiImage') // If API image is available
                          : null),
                  child: (profileImage == null && (apiImage == null || apiImage!.isEmpty))
                      ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey) // Default camera icon
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              Text(usernameController.text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),

              const SizedBox(height: 20),
              _buildTextField("Username", usernameController, isNumber: false), // Ensure username is text
              _buildTextField("Age", ageController, isNumber: true),
              _buildTextField("Weight (kg)", weightController, isNumber: true),
              _buildTextField("Height (cm)", heightController, isNumber: true),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DropdownButtonFormField<String>(
                  value: selectedGoal,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: fieldColor,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  items: ["", "Lose Weight", "Gain Muscle", "Maintain"].map((goal) {
                    return DropdownMenuItem(value: goal, child: Text(goal));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedGoal = value);
                    }
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: updateProfile,
                  child: const Text("Update Profile", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
