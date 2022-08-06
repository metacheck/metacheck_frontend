import 'package:metacheck_frontend/movas/models/user/user.dart';
import 'package:metacheck_frontend/movas/services/auth/firebase_auth_service.dart';
import 'package:metacheck_frontend/movas/services/auth/requests/login_request.dart';
import 'package:metacheck_frontend/movas/services/auth/requests/register_request.dart';

abstract class AuthService {
  Future<void> login(LoginRequest request);
  Future<UserE?> isLoggedIn();
  Future<void> register(RegisterRequest request);
  Future<UserE> createUser(CreateUserReq user);
  Future<UserE> getUser(CreateUserReq uid);
  Future<void> logout();
}
