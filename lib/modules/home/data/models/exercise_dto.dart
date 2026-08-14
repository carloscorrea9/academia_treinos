import 'package:academia_treinos/core/constants/app_assets.dart';
import 'package:academia_treinos/modules/home/domain/entities/exercise.dart';

class ExerciseDto {
  const ExerciseDto({
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

  factory ExerciseDto.fromJson(Map<String, dynamic> json) {
    return ExerciseDto(
      id: json['id'] as String,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String? ?? AppAssets.appIcon,
      sets: json['sets'] as int,
      reps: json['reps'] as int,
      weightKg: (json['weightKg'] as num).toDouble(),
    );
  }

  factory ExerciseDto.fromEntity(Exercise entity) {
    return ExerciseDto(
      id: entity.id,
      name: entity.name,
      imagePath: entity.imagePath,
      sets: entity.sets,
      reps: entity.reps,
      weightKg: entity.weightKg,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'sets': sets,
      'reps': reps,
      'weightKg': weightKg,
    };
  }

  Exercise toEntity() {
    return Exercise(
      id: id,
      name: name,
      imagePath: imagePath,
      sets: sets,
      reps: reps,
      weightKg: weightKg,
    );
  }
}
