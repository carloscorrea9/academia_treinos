sealed class HomeEvent {
  const HomeEvent();
}

final class HomeStarted extends HomeEvent {
  const HomeStarted({this.day = 1});

  final int day;
}

final class HomeDaySelected extends HomeEvent {
  const HomeDaySelected(this.day);

  final int day;
}

final class HomeDurationChanged extends HomeEvent {
  const HomeDurationChanged(this.minutes);

  final int minutes;
}

final class HomeExerciseCountChanged extends HomeEvent {
  const HomeExerciseCountChanged(this.count);

  final int count;
}

final class HomeExerciseUpdated extends HomeEvent {
  const HomeExerciseUpdated({
    required this.exerciseId,
    required this.sets,
    required this.reps,
    required this.weightKg,
  });

  final String exerciseId;
  final int sets;
  final int reps;
  final double weightKg;
}
