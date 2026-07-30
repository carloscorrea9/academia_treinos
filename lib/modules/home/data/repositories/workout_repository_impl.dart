import 'package:academia_treinos/modules/home/data/datasources/workout_local_datasource.dart';
import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';
import 'package:academia_treinos/modules/home/domain/repositories/workout_repository.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  WorkoutRepositoryImpl(this._localDatasource);

  final WorkoutLocalDatasource _localDatasource;

  @override
  Future<WorkoutDay> getByDay(int day) async {
    return _localDatasource.getByDay(day);
  }
}