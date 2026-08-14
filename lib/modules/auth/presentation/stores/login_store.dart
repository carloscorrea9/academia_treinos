import 'package:academia_treinos/modules/auth/domain/repositories/auth_repository.dart';
import 'package:academia_treinos/core/storage/session_storage.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  LoginStoreBase(this._authRepository, this._sessionStorage);

  final AuthRepository _authRepository;
  final SessionStorage _sessionStorage;

  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @observable
  String? userName;

  @observable
  String? errorMessage;

  @action
  void restoreSession() {
    if (_sessionStorage.hasSession) {
      isLoggedIn = true;
      userName = _sessionStorage.name;
    }
  }

  @action
  Future<void> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;

    try {
      final session = await _authRepository.login(
        email: email,
        password: password,
      );
      await _sessionStorage.save(
        token: session.token,
        email: session.email,
        name: session.name,
      );
      userName = session.name;
      isLoggedIn = true;
    } catch (error) {
      isLoggedIn = false;
      errorMessage = error.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> logout() async {
    await _sessionStorage.clear();
    isLoggedIn = false;
    userName = null;
    errorMessage = null;
  }
}
