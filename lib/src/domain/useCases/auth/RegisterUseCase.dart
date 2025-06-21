import 'package:safetrack/src/domain/models/User.dart';
import 'package:safetrack/src/domain/repository/AuthRepository.dart';

class RegisterUseCase {
  AuthRepository authrepository;
  RegisterUseCase(this.authrepository);

  run(User user) => authrepository.register(user);

}