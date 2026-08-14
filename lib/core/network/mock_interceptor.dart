import 'package:academia_treinos/core/network/mock_database.dart';
import 'package:dio/dio.dart';

class MockInterceptor extends Interceptor {
  MockInterceptor(this._database);

  final MockDatabase _database;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final path = options.uri.path;
    final method = options.method.toUpperCase();

    if (method == 'POST' && path.endsWith('/auth/login')) {
      _login(options, handler);
      return;
    }

    final workoutMatch = RegExp(r'/workouts/(\d+)$').firstMatch(path);
    if (workoutMatch != null) {
      final day = workoutMatch.group(1)!;
      if (method == 'GET') {
        _getWorkout(options, handler, day);
        return;
      }
      if (method == 'PUT') {
        _putWorkout(options, handler, day);
        return;
      }
    }

    handler.reject(_error(options, 404, 'Rota mock não encontrada'));
  }

  void _login(RequestOptions options, RequestInterceptorHandler handler) {
    final body = Map<String, dynamic>.from(options.data as Map);
    final email = (body['email'] as String? ?? '').trim();
    final password = body['password'] as String? ?? '';

    if (email.isEmpty || !email.contains('@') || password.length < 4) {
      handler.reject(_error(options, 401, 'E-mail ou senha inválidos'));
      return;
    }

    final name = email.split('@').first;
    handler.resolve(
      Response<Map<String, dynamic>>(
        requestOptions: options,
        statusCode: 200,
        data: {
          'token': 'fake-jwt-$name',
          'user': {'name': name, 'email': email},
        },
      ),
    );
  }

  void _getWorkout(
    RequestOptions options,
    RequestInterceptorHandler handler,
    String day,
  ) {
    final workout = _database.getWorkout(day);
    if (workout == null) {
      handler.reject(_error(options, 404, 'Treino do dia $day não encontrado'));
      return;
    }
    handler.resolve(
      Response<Map<String, dynamic>>(
        requestOptions: options,
        statusCode: 200,
        data: workout,
      ),
    );
  }

  void _putWorkout(
    RequestOptions options,
    RequestInterceptorHandler handler,
    String day,
  ) {
    final body = Map<String, dynamic>.from(options.data as Map);
    _database.putWorkout(day, body);
    handler.resolve(
      Response<Map<String, dynamic>>(
        requestOptions: options,
        statusCode: 200,
        data: _database.getWorkout(day),
      ),
    );
  }

  DioException _error(RequestOptions options, int status, String message) {
    return DioException(
      requestOptions: options,
      type: DioExceptionType.badResponse,
      response: Response<Map<String, dynamic>>(
        requestOptions: options,
        statusCode: status,
        data: {'message': message},
      ),
    );
  }
}
