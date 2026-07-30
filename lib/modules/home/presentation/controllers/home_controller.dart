import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';
import 'package:academia_treinos/modules/home/domain/usecases/get_workout_by_day.dart';
import 'package:flutter/foundation.dart';

class HomeController extends ChangeNotifier{
  HomeController(this._getWorkoutByDay);

  final GetWorkoutByDay _getWorkoutByDay;

  int selectedDay = 1;

  WorkoutDay? currentWorkout;

  bool isLoading = false;

  String? errorMessage;

  Future<void> getWorkoutByDay() async {
    await selectDay(selectedDay);
  }

  Future<void> selectDay(int day) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final workout = await _getWorkoutByDay(day);

      selectedDay = day;
      currentWorkout = workout;
      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      errorMessage = error.toString();
      notifyListeners();
    }
  }
}