import 'package:safetrack/src/data/dataSource/remote/service/AuthService.dart';
import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/domain/repository/AuthRepository.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';

class Authrepositoryimpl implements Authrepository {
  Authservice authService;

  Authrepositoryimpl(this.authService);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }
}
