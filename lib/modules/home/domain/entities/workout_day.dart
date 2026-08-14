import 'dart:math';

import 'package:academia_treinos/modules/home/domain/entities/exercise.dart';

class WorkoutDay {
  const WorkoutDay({
    required this.day,
    required this.durationMin,
    required this.gymName,
    required this.targetExerciseCount,
    required this.exercises,
    this.selectedExerciseIds = const [],
  });

  static const int minDurationMin = 10;
  static const int maxDurationMin = 60;
  static const int minExerciseCount = 1;
  static const int maxExerciseCount = 7;

  final int day;
  final int durationMin;
  final String gymName;
  final int targetExerciseCount;
  final List<Exercise> exercises;
  final List<String> selectedExerciseIds;

  int get selectedCount => selectedExercises.length;

  List<Exercise> get selectedExercises {
    final byId = {for (final exercise in exercises) exercise.id: exercise};
    return [
      for (final id in selectedExerciseIds)
        if (byId[id] != null) byId[id]!,
    ];
  }

  bool get needsSelection {
    if (selectedExerciseIds.isEmpty) return true;
    return selectedExercises.length != _clampedCount;
  }

  int get _clampedCount {
    return targetExerciseCount
        .clamp(minExerciseCount, min(maxExerciseCount, exercises.length))
        .toInt();
  }

  WorkoutDay withRandomSelection([int? count, Random? random]) {
    final nextCount = (count ?? targetExerciseCount)
        .clamp(minExerciseCount, min(maxExerciseCount, exercises.length))
        .toInt();
    final pool = [...exercises]..shuffle(random ?? Random());
    final picked = pool.take(nextCount).map((e) => e.id).toList();
    return copyWith(
      targetExerciseCount: nextCount,
      selectedExerciseIds: picked,
    );
  }

  WorkoutDay ensureSelection([Random? random]) {
    if (!needsSelection) return this;
    return withRandomSelection(targetExerciseCount, random);
  }

  WorkoutDay copyWith({
    int? durationMin,
    int? targetExerciseCount,
    List<Exercise>? exercises,
    List<String>? selectedExerciseIds,
  }) {
    return WorkoutDay(
      day: day,
      durationMin: durationMin ?? this.durationMin,
      gymName: gymName,
      targetExerciseCount: targetExerciseCount ?? this.targetExerciseCount,
      exercises: exercises ?? this.exercises,
      selectedExerciseIds: selectedExerciseIds ?? this.selectedExerciseIds,
    );
  }
}
