import 'package:academia_treinos/modules/home/data/models/exercise_dto.dart';
import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';

class WorkoutDayDto {
  const WorkoutDayDto({
    required this.day,
    required this.durationMin,
    required this.gymName,
    required this.targetExerciseCount,
    required this.exercises,
    this.selectedExerciseIds = const [],
  });

  final int day;
  final int durationMin;
  final String gymName;
  final int targetExerciseCount;
  final List<ExerciseDto> exercises;
  final List<String> selectedExerciseIds;

  factory WorkoutDayDto.fromJson(Map<String, dynamic> json) {
    final exercises = (json['exercises'] as List)
        .map((item) => ExerciseDto.fromJson(Map<String, dynamic>.from(item as Map)))
        .toList();
    return WorkoutDayDto(
      day: json['day'] as int,
      durationMin: json['durationMin'] as int,
      gymName: json['gymName'] as String,
      targetExerciseCount: json['targetExerciseCount'] as int? ??
          exercises.length.clamp(
            WorkoutDay.minExerciseCount,
            WorkoutDay.maxExerciseCount,
          ),
      exercises: exercises,
      selectedExerciseIds: (json['selectedExerciseIds'] as List?)
              ?.map((item) => item as String)
              .toList() ??
          const [],
    );
  }

  factory WorkoutDayDto.fromEntity(WorkoutDay entity) {
    return WorkoutDayDto(
      day: entity.day,
      durationMin: entity.durationMin,
      gymName: entity.gymName,
      targetExerciseCount: entity.targetExerciseCount,
      exercises: entity.exercises.map(ExerciseDto.fromEntity).toList(),
      selectedExerciseIds: entity.selectedExerciseIds,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'durationMin': durationMin,
      'gymName': gymName,
      'targetExerciseCount': targetExerciseCount,
      'selectedExerciseIds': selectedExerciseIds,
      'exercises': exercises.map((item) => item.toJson()).toList(),
    };
  }

  WorkoutDay toEntity() {
    return WorkoutDay(
      day: day,
      durationMin: durationMin,
      gymName: gymName,
      targetExerciseCount: targetExerciseCount,
      exercises: exercises.map((item) => item.toEntity()).toList(),
      selectedExerciseIds: selectedExerciseIds,
    );
  }
}
