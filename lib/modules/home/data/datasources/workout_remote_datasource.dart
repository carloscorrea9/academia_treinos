import 'package:dio/dio.dart';

class WorkoutRemoteDatasource {
  WorkoutRemoteDatasource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> getByDay(int day) async {
    final response = await _dio.get<Map<String, dynamic>>('/workouts/$day');
    return response.data!;
  }

  Future<Map<String, dynamic>> save(Map<String, dynamic> body) async {
    final day = body['day'];
    final response = await _dio.put<Map<String, dynamic>>(
      '/workouts/$day',
      data: body,
    );
    return response.data!;
  }
}
