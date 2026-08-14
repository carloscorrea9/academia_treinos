class Session {
  const Session({
    required this.token,
    required this.name,
    required this.email,
  });

  final String token;
  final String name;
  final String email;
}
