class Exercise {
  const Exercise({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.sets,
    required this.reps,
    required this.weightKg,
  });

  final String id;
  final String name;
  final String imagePath;
  final int sets;
  final int reps;
  final double weightKg;

  Exercise copyWith({
    int? sets,
    int? reps,
    double? weightKg,
  }) {
    return Exercise(
      id: id,
      name: name,
      imagePath: imagePath,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      weightKg: weightKg ?? this.weightKg,
    );
  }
}
