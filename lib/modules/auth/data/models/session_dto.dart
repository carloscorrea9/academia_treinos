import 'package:academia_treinos/modules/auth/domain/entities/session.dart';

class SessionDto {
  const SessionDto({
    required this.token,
    required this.name,
    required this.email,
  });

  final String token;
  final String name;
  final String email;

  factory SessionDto.fromJson(Map<String, dynamic> json) {
    final user = Map<String, dynamic>.from(json['user'] as Map);
    return SessionDto(
      token: json['token'] as String,
      name: user['name'] as String,
      email: user['email'] as String,
    );
  }

  Session toEntity() {
    return Session(token: token, name: name, email: email);
  }
}
