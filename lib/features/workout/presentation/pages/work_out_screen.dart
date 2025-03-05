import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_tracker_app/core/navigation_services.dart';
import 'package:gym_tracker_app/features/workout/presentation/cubit/workout_cubit.dart';
import 'package:gym_tracker_app/features/workout/presentation/cubit/workout_state.dart';
import 'package:gym_tracker_app/features/workout/presentation/widgets/body_part_dropdown.dart';
import 'package:gym_tracker_app/features/workout/presentation/widgets/youtube_player.dart';

class WorkOutScreen extends StatefulWidget {
  const WorkOutScreen({super.key});

  @override
  State<WorkOutScreen> createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WorkoutCubit>().fetchWorkList(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkOutState>(
      builder: (context, state) {
        return Scaffold(
          // Use Scaffold for proper structure
          appBar: AppBar(
            title: const Text('Workouts'), // More descriptive title
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                BodyPartDropdown(state: state),
                DifficultyDropdown(state: state),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: state.isLoadingState
                      ? const Center(child: CircularProgressIndicator.adaptive())
                      : (state.workOutList ?? []).isEmpty
                          ? const Center(
                              child: Text('No Data'),
                            )
                          : Expanded(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: (state.workOutList ?? []).length,

                                itemBuilder: (c, i) {
                                  var item = state.workOutList?[i];
                                  return GestureDetector(
                                    child: _buildWorkoutCard(
                                      title: item?.name ?? 'N/A',
                                      bodyPart: item?.bodyPart ?? 'N/A',
                                      difficulty: item?.difficulty ?? 'N/A',
                                      imageUrl: item?.videoUrl ?? 'N/A',
                                    ),
                                    onTap: () {
                                      navigateTo(
                                          context: context,
                                          screen: SimpleYoutubePlayer(
                                            youtubeUrl: item?.videoUrl ?? '',
                                            description: item?.instructions ?? 'N/A',
                                          ));
                                    },
                                  );
                                },
                                // Use ListView for scrollable content
                                // children: [
                                //   _buildWorkoutCard(
                                //       title: 'Full Body Workout', bodyPart: '45 mins', difficulty: 'Intermediate', imageUrl: 'https://t3.ftcdn.net/jpg/02/64/92/22/240_F_264922200_3DF1Ag5YlncHFuVbwWfN0qqNDxZlgJ8a.jpg'),
                                //   const SizedBox(height: 16),
                                //   _buildWorkoutCard(title: 'Leg Day', bodyPart: '60 mins', difficulty: 'Advanced', imageUrl: 'https://t4.ftcdn.net/jpg/06/49/97/19/240_F_649971988_xiNrvJRzhAKTJqvJ1sB275cJIxYi88Lh.jpg'),
                                //   const SizedBox(height: 16),
                                //   _buildWorkoutCard(
                                //       title: 'Cardio Blast', bodyPart: '30 mins', difficulty: 'Beginner', imageUrl: 'https://t4.ftcdn.net/jpg/09/47/89/43/240_F_947894331_TQ45pVZnr8vubV8hCd3FLjjXZgrDN1wK.jpg'),
                                //   const SizedBox(height: 16),
                                //   _buildWorkoutCard(
                                //       title: 'Abs Workout', bodyPart: '20 mins', difficulty: 'Intermediate', imageUrl: 'https://t3.ftcdn.net/jpg/02/65/14/72/240_F_265147280_Nsyy1fuLd9hPAea25iTI7BT6bYAmlUVy.jpg'),
                                // ],
                              ),
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWorkoutCard({
    required String title,
    required String bodyPart,
    required String difficulty,
    required String imageUrl,
  }) {
    var image = 'https://hips.hearstapps.com/hmg-prod/images/young-muscular-build-athlete-exercising-strength-in-royalty-free-image-1706546541.jpg?crop=1.00xw:0.752xh;0,0.142xh&resize=1200:*';
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            image,
            height: 200, // Fixed height for consistent image size
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                ),
              );
            },
            errorBuilder: (context, object, stackTrace) => const Center(child: Text("Error Loading Image")),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('Body Part - '),
                    const SizedBox(width: 4),
                    Text(bodyPart, style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(width: 16),
                    const Text('Difficulty - '),
                    const SizedBox(width: 4),
                    Text(
                      difficulty,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
