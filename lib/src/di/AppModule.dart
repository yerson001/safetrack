import 'package:injectable/injectable.dart';
import 'package:safetrack/src/data/dataSource/remote/service/AuthService.dart';
import 'package:safetrack/src/data/repository/AuthRepositoryImpl.dart';
import 'package:safetrack/src/domain/repository/AuthRepository.dart';
import 'package:safetrack/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:safetrack/src/domain/useCases/auth/LoginUseCase.dart';

@module
abstract class Appmodule {
  @injectable
  Authservice get authService => Authservice();

  @injectable
  Authrepository get authRepository => Authrepositoryimpl(authService);

  @injectable
  AuthUseCases get authUseCaases =>
      AuthUseCases(login: LoginUseCase(authRepository));
}
