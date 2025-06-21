import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/domain/models/User.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User user);
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<AuthResponse?> getUserSesion();
  Future<bool> logout();
}
