import 'package:academia_treinos/modules/home/domain/entities/exercise.dart';
import 'package:academia_treinos/modules/home/domain/entities/muscle.dart';

class WorkoutDay {
  const WorkoutDay({
    required this.day,
    required this.durationMin,
    required this.gymName,
    required this.muscles,
    required this.exercises,
  });

  final int day;
  final int durationMin;
  final String gymName;
  final List<Muscle> muscles;
  final List<Exercise> exercises;

  int get muscleCount => muscles.length;
  int get exerciseCount => exercises.length;
  }

 