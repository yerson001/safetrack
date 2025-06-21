import 'package:safetrack/src/domain/repository/AuthRepository.dart';

class LogoutUseCase {
  AuthRepository authrepository;
  LogoutUseCase(this.authrepository);

  run()=> authrepository.logout();
}