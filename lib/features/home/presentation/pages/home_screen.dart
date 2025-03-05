import 'package:flutter/material.dart';
import 'package:gym_tracker_app/core/navigation_services.dart';
import 'package:gym_tracker_app/features/dashboard/presentation/pages/dashboad_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final primaryColor = theme.brightness == Brightness.dark ? Colors.redAccent : Colors.red;

    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text("Sweat"),
      //   backgroundColor: Colors.red,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome Back!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 10),
              const Text("Today's Workout: Chest and Triceps", style: TextStyle(color: Colors.white)),
              // const SizedBox(height: 20),
              // const Card(
              //   elevation: 4,
              //   child: Padding(
              //     padding: EdgeInsets.all(16.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text("Total Workouts", style: TextStyle(fontWeight: FontWeight.bold)),
              //             Text("123"),
              //           ],
              //         ),
              //         Icon(Icons.fitness_center, size: 40),
              //       ],
              //     ),
              //   ),
              // ),
              // SvgPicture.network('http://localhost:3000/static/media/muscle-map.8b054866254ba0850f3d50e8d59a501c.svg')
              Container(
                  // color: Colors.amber,
                  child: Image.asset(
                'assets/images/qqq.png',
                width: 500,
                height: 500,
                fit: BoxFit.fitWidth,
              )),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: () {
                    //naviagte to 2nd screen in out nav bar
                    navigateAndPushReplacement(
                        context: context,
                        screen: const MyDashboardScreen(
                          initialIndex: 1,
                        ));
                    //   final dashboardState = context.findAncestorStateOfType<_MyDashboardScreenState>();
                    // if (dashboardState != null) {
                    //   dashboardState.setIndex(1); // Change index to WorkOutScreen
                    // }
                  },
                  child: const Text("Explore  WorkOuts", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
