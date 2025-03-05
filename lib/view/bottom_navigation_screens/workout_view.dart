import 'package:flutter/material.dart';

class GymScreen extends StatelessWidget {
  const GymScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use Scaffold for proper structure
      appBar: AppBar(
        title: const Text('Workouts'), // More descriptive title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // Use ListView for scrollable content
          children: [
            _buildWorkoutCard(
                title: 'Full Body Workout',
                duration: '45 mins',
                difficulty: 'Intermediate',
                imageUrl:
                    'https://t3.ftcdn.net/jpg/02/64/92/22/240_F_264922200_3DF1Ag5YlncHFuVbwWfN0qqNDxZlgJ8a.jpg'),
            const SizedBox(height: 16),
            _buildWorkoutCard(
                title: 'Leg Day',
                duration: '60 mins',
                difficulty: 'Advanced',
                imageUrl:
                    'https://t4.ftcdn.net/jpg/06/49/97/19/240_F_649971988_xiNrvJRzhAKTJqvJ1sB275cJIxYi88Lh.jpg'),
            const SizedBox(height: 16),
            _buildWorkoutCard(
                title: 'Cardio Blast',
                duration: '30 mins',
                difficulty: 'Beginner',
                imageUrl:
                    'https://t4.ftcdn.net/jpg/09/47/89/43/240_F_947894331_TQ45pVZnr8vubV8hCd3FLjjXZgrDN1wK.jpg'),
            const SizedBox(height: 16),
            _buildWorkoutCard(
                title: 'Abs Workout',
                duration: '20 mins',
                difficulty: 'Intermediate',
                imageUrl:
                    'https://t3.ftcdn.net/jpg/02/65/14/72/240_F_265147280_Nsyy1fuLd9hPAea25iTI7BT6bYAmlUVy.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutCard({
    required String title,
    required String duration,
    required String difficulty,
    required String imageUrl,
  }) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 200, // Fixed height for consistent image size
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, object, stackTrace) =>
                const Center(child: Text("Error Loading Image")),
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
                    const Icon(Icons.timer, size: 16),
                    const SizedBox(width: 4),
                    Text(duration),
                    const SizedBox(width: 16),
                    const Icon(Icons.fitness_center, size: 16),
                    const SizedBox(width: 4),
                    Text(difficulty),
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
