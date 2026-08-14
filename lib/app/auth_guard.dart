import 'package:academia_treinos/modules/auth/presentation/stores/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login');

  @override
  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final store = Modular.get<LoginStore>();
    store.restoreSession();
    return store.isLoggedIn;
  }
}
