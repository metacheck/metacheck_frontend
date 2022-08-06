import 'package:metacheck_frontend/movas/services/auth/auth_service.dart';
import 'package:metacheck_frontend/movas/services/auth/requests/login_request.dart';
import 'package:metacheck_frontend/movas/services/auth/requests/register_request.dart';
import 'package:movas/movas.dart';

class AuthAction {
  final AuthService authService;

  Future<void> login(LoginRequest request) async {
    await authService.login(request);
  }

  Future<void> register(RegisterRequest request) async {
    await authService.register(request);
  }

  Future<void> logout() async {
    await authService.logout();
  }

  AuthAction(this.authService);

  factory AuthAction.of(context) => AuthAction(StaticProvider.of(context));
}
