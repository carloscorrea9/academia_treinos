import 'package:academia_treinos/core/constants/app_colors.dart';
import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/exercise_chip_card.dart';
import 'package:flutter/material.dart';

class SelectedExercisesStrip extends StatelessWidget {
  const SelectedExercisesStrip({super.key, required this.workout});

  final WorkoutDay workout;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Target Muscles',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final exercise in workout.selectedExercises) ...[
                ExerciseChipCard(
                  title: exercise.name,
                  imagePath: exercise.imagePath,
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
