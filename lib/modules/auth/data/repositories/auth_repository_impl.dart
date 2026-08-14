import 'package:academia_treinos/modules/auth/data/datasources/auth_remote_datasource.dart';
import 'package:academia_treinos/modules/auth/data/models/session_dto.dart';
import 'package:academia_treinos/modules/auth/domain/entities/session.dart';
import 'package:academia_treinos/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._datasource);

  final AuthRemoteDatasource _datasource;

  @override
  Future<Session> login({
    required String email,
    required String password,
  }) async {
    try {
      final json = await _datasource.login(email: email, password: password);
      return SessionDto.fromJson(json).toEntity();
    } on DioException catch (error) {
      final message = error.response?.data is Map
          ? (error.response!.data as Map)['message'] as String?
          : null;
      throw Exception(message ?? 'Falha no login');
    }
  }
}
