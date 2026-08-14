class MockDatabase {
  MockDatabase._();

  static final MockDatabase instance = MockDatabase._();

  final Map<String, Map<String, dynamic>> workouts = {};

  void seed(Map<String, dynamic> json) {
    workouts
      ..clear()
      ..addEntries(
        json.entries.map(
          (entry) => MapEntry(
            entry.key,
            Map<String, dynamic>.from(entry.value as Map),
          ),
        ),
      );
  }

  Map<String, dynamic>? getWorkout(String day) {
    final workout = workouts[day];
    if (workout == null) return null;
    return Map<String, dynamic>.from(workout);
  }

  void putWorkout(String day, Map<String, dynamic> json) {
    workouts[day] = Map<String, dynamic>.from(json);
  }
}
