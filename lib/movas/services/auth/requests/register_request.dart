class RegisterRequest {
  final String email;
  final String password;

  const RegisterRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'password': this.password,
    };
  }

  factory RegisterRequest.fromMap(Map<String, dynamic> map) {
    return RegisterRequest(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
