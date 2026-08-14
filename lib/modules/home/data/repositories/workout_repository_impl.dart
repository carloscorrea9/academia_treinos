import 'package:academia_treinos/modules/home/data/datasources/workout_remote_datasource.dart';
import 'package:academia_treinos/modules/home/data/models/workout_day_dto.dart';
import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';
import 'package:academia_treinos/modules/home/domain/repositories/workout_repository.dart';
import 'package:dio/dio.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  WorkoutRepositoryImpl(this._datasource);

  final WorkoutRemoteDatasource _datasource;

  @override
  Future<WorkoutDay> getByDay(int day) async {
    try {
      final json = await _datasource.getByDay(day);
      return WorkoutDayDto.fromJson(json).toEntity();
    } on DioException catch (error) {
      throw Exception(_message(error, 'Falha ao carregar o treino'));
    }
  }

  @override
  Future<WorkoutDay> save(WorkoutDay workout) async {
    try {
      final json = await _datasource.save(WorkoutDayDto.fromEntity(workout).toJson());
      return WorkoutDayDto.fromJson(json).toEntity();
    } on DioException catch (error) {
      throw Exception(_message(error, 'Falha ao salvar o treino'));
    }
  }

  String _message(DioException error, String fallback) {
    final data = error.response?.data;
    if (data is Map && data['message'] is String) {
      return data['message'] as String;
    }
    return fallback;
  }
}
