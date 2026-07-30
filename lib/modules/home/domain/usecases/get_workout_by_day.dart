import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';
import 'package:academia_treinos/modules/home/domain/repositories/workout_repository.dart';

class GetWorkoutByDay {
  const GetWorkoutByDay(this._repository);

  final WorkoutRepository _repository;
  
  Future<WorkoutDay> call(int day) async {
    if (day < 1 || day > 5) {
      throw ArgumentError.value(day, 'day', 'Day must be between 1 and 5');
    }
    return _repository.getByDay(day);
  }
}