import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/domain/repository/AuthRepository.dart';

class SaveUserUessionUseCase {
  AuthRepository authRespository;
  SaveUserUessionUseCase(this.authRespository);

  run(AuthResponse authResponse) => authRespository.saveUserSession(authResponse);
}