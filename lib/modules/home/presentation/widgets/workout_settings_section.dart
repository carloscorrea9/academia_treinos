import 'package:academia_treinos/core/constants/app_colors.dart';
import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_bloc.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutSettingsSection extends StatelessWidget {
  const WorkoutSettingsSection({super.key, required this.workout});

  final WorkoutDay workout;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'WORKOUT SETTINGS',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Text(
                  workout.gymName,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => _pickDuration(context),
                child: Row(
                  children: [
                    Text(
                      '${workout.durationMin} min',
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppColors.iconPrimary,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => _pickExerciseCount(context),
                child: Row(
                  children: [
                    Text(
                      '${workout.selectedCount} Exercises',
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppColors.iconPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _pickDuration(BuildContext context) {
    _showSheet(
      context: context,
      title: 'Duração do treino',
      values: [
        for (var minutes = WorkoutDay.minDurationMin;
            minutes <= WorkoutDay.maxDurationMin;
            minutes += 5)
          minutes,
      ],
      selected: workout.durationMin,
      label: (value) => '$value min',
      onSelected: (minutes) {
        BlocProvider.of<HomeBloc>(context).add(HomeDurationChanged(minutes));
      },
    );
  }

  void _pickExerciseCount(BuildContext context) {
    _showSheet(
      context: context,
      title: 'Quantos exercícios?',
      values: [
        for (var count = WorkoutDay.minExerciseCount;
            count <= WorkoutDay.maxExerciseCount;
            count++)
          count,
      ],
      selected: workout.targetExerciseCount,
      label: (value) => '$value exercício${value > 1 ? 's' : ''}',
      onSelected: (count) {
        BlocProvider.of<HomeBloc>(context).add(HomeExerciseCountChanged(count));
      },
    );
  }

  void _showSheet({
    required BuildContext context,
    required String title,
    required List<int> values,
    required int selected,
    required String Function(int) label,
    required ValueChanged<int> onSelected,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xff082D32),
      builder: (sheetContext) {
        return SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              for (final value in values)
                ListTile(
                  title: Text(label(value)),
                  trailing: value == selected
                      ? const Icon(Icons.check, color: Color(0xFF6DFF39))
                      : null,
                  onTap: () {
                    onSelected(value);
                    Navigator.pop(sheetContext);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
