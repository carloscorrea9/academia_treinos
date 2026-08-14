import 'package:academia_treinos/core/constants/app_colors.dart';
import 'package:academia_treinos/core/constants/app_icons.dart';
import 'package:academia_treinos/modules/home/domain/entities/exercise.dart';
import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_bloc.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_event.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/exercise_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExercisesSection extends StatelessWidget {
  const ExercisesSection({super.key, required this.workout});

  final WorkoutDay workout;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('${workout.selectedCount} Exercises'),
            const Spacer(),
          ],
        ),
        for (final exercise in workout.selectedExercises) ...[
          ExerciseTile(
            title: exercise.name,
            imagePath: exercise.imagePath,
            subtitle:
                '${exercise.sets} sets • ${exercise.reps} reps • ${exercise.weightKg} kg',
            onTap: () => _editExercise(context, exercise),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }

  Future<void> _editExercise(BuildContext context, Exercise exercise) async {
    final result = await showDialog<_ExerciseEditResult>(
      context: context,
      builder: (_) => _EditExerciseDialog(exercise: exercise),
    );
    if (result == null || !context.mounted) return;

    BlocProvider.of<HomeBloc>(context).add(
      HomeExerciseUpdated(
        exerciseId: exercise.id,
        sets: result.sets,
        reps: result.reps,
        weightKg: result.weightKg,
      ),
    );
  }
}

typedef _ExerciseEditResult = ({int sets, int reps, double weightKg});

class _EditExerciseDialog extends StatefulWidget {
  const _EditExerciseDialog({required this.exercise});

  final Exercise exercise;

  @override
  State<_EditExerciseDialog> createState() => _EditExerciseDialogState();
}

class _EditExerciseDialogState extends State<_EditExerciseDialog> {
  late final TextEditingController _setsController;
  late final TextEditingController _repsController;
  late final TextEditingController _weightController;

  @override
  void initState() {
    super.initState();
    final exercise = widget.exercise;
    _setsController = TextEditingController(text: '${exercise.sets}');
    _repsController = TextEditingController(text: '${exercise.reps}');
    _weightController = TextEditingController(text: '${exercise.weightKg}');
  }

  @override
  void dispose() {
    _setsController.dispose();
    _repsController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _save() {
    final exercise = widget.exercise;
    Navigator.pop<_ExerciseEditResult>(
      context,
      (
        sets: int.tryParse(_setsController.text) ?? exercise.sets,
        reps: int.tryParse(_repsController.text) ?? exercise.reps,
        weightKg: double.tryParse(
              _weightController.text.replaceAll(',', '.'),
            ) ??
            exercise.weightKg,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF082D32),
      title: Text(widget.exercise.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _setsController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Séries'),
          ),
          TextField(
            controller: _repsController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Repetições'),
          ),
          TextField(
            controller: _weightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Carga (kg)'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancelar',
            style: TextStyle(color: AppColors.textPrimary),
          ),
        ),
        TextButton(
          onPressed: _save,
          child: const Text(
            'Salvar',
            style: TextStyle(color: AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}
