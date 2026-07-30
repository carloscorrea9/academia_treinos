import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';

abstract class WorkoutRepository {
  Future<WorkoutDay> getByDay(int day);
}