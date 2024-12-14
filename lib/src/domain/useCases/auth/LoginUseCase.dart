import 'package:safetrack/src/data/repository/AuthRepositoryImpl.dart';
import 'package:safetrack/src/domain/repository/AuthRepository.dart';

class LoginUseCase {
  Authrepository repository;
  LoginUseCase(this.repository);
  run(String email, String password) => repository.login(email, password);
}
