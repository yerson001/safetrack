import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';

abstract class Authrepository {
  Future<Resource<AuthResponse>> login(String email, String password);
}
