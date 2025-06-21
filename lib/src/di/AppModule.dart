import 'package:injectable/injectable.dart';
import 'package:safetrack/src/data/dataSource/local/SharePref.dart';
import 'package:safetrack/src/data/dataSource/remote/service/AuthService.dart';
import 'package:safetrack/src/data/dataSource/remote/service/UsersService.dart';
import 'package:safetrack/src/data/repository/AuthRepositoryImpl.dart';
import 'package:safetrack/src/data/repository/GeolocatorRepositoryImpl.dart';
import 'package:safetrack/src/data/repository/UsersRepositoryImp.dart';
import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/domain/repository/AuthRepository.dart';
import 'package:safetrack/src/domain/repository/GeolocatorRepository.dart';
import 'package:safetrack/src/domain/repository/UsersRepository.dart';
import 'package:safetrack/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:safetrack/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:safetrack/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:safetrack/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:safetrack/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:safetrack/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:safetrack/src/domain/useCases/geolocator/CreateMarkerUseCase.dart';
import 'package:safetrack/src/domain/useCases/geolocator/FIndPositionUseCase.dart';
import 'package:safetrack/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:safetrack/src/domain/useCases/geolocator/GetMarkerUseCase.dart';
import 'package:safetrack/src/domain/useCases/users/UpdateUserUseCase.dart';
import 'package:safetrack/src/domain/useCases/users/UsersUseCases.dart';

@module
abstract class Appmodule {
  @injectable
  SharePref get sharePref => SharePref();

  @injectable
  Future<String> get token async {
    String token = '';
    final userSession = await sharePref.read('user');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }
    return token;
  }

  @injectable
  Authservice get authService => Authservice();

  @injectable
  UsersService get userService => UsersService(token);

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService, sharePref);

  @injectable
  UsersRepository get userRepository => UsersRepositoryImp(userService);

  @injectable
  GeolocatorRepository get geolocatorRepository => GeolocatorRepositoryImpl();

  @injectable
  GeolocatorUseCases get geolocatorUseCases => GeolocatorUseCases(
      findPosition: FindPositionUseCase(geolocatorRepository),
      markerUseCase: CreateMarkerUseCase(geolocatorRepository),
      getMarker: GetMarkerUseCase(geolocatorRepository));

  @injectable
  UsersUseCases get userUseCases =>
      UsersUseCases(update: UpdateUserUseCase(userRepository));

  @injectable
  AuthUseCases get authUseCaases => AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
        saveUserSession: SaveUserUessionUseCase(authRepository),
        getUserSession: GetUserSessionUseCase(authRepository),
        logout: LogoutUseCase(authRepository),
      );
}
