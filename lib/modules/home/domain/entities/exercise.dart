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
}