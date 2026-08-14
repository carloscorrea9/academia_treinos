import 'package:get_storage/get_storage.dart';

class SessionStorage {
  SessionStorage(this._box);

  final GetStorage _box;

  static const _tokenKey = 'session_token';
  static const _emailKey = 'session_email';
  static const _nameKey = 'session_name';

  String? get token => _box.read<String>(_tokenKey);
  String? get email => _box.read<String>(_emailKey);
  String? get name => _box.read<String>(_nameKey);

  bool get hasSession => token != null && token!.isNotEmpty;

  Future<void> save({
    required String token,
    required String email,
    required String name,
  }) async {
    await _box.write(_tokenKey, token);
    await _box.write(_emailKey, email);
    await _box.write(_nameKey, name);
  }

  Future<void> clear() async {
    await _box.remove(_tokenKey);
    await _box.remove(_emailKey);
    await _box.remove(_nameKey);
  }
}
