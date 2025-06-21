
import 'package:safetrack/src/domain/repository/AuthRepository.dart';

class GetUserSessionUseCase {
  AuthRepository authRespository;
  GetUserSessionUseCase(this.authRespository);

  run() => authRespository.getUserSesion();
}