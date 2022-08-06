import 'package:metacheck_frontend/movas/models/user/user.dart';
import 'package:metacheck_frontend/movas/services/auth/auth_service.dart';
import 'package:movas/movas.dart';

bool initialized = false;

class SplashAction {
  final AuthService authService;

  SplashAction(this.authService);

  factory SplashAction.of(context) => SplashAction(StaticProvider.of(context));

  Future<bool> init() async {
    initialized = true;
    final x = await authService.isLoggedIn();
    return x != null;
  }
}
