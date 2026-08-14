import 'package:academia_treinos/modules/auth/domain/entities/session.dart';

abstract class AuthRepository {
  Future<Session> login({required String email, required String password});
}
