// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:safetrack/src/data/dataSource/remote/service/AuthService.dart'
    as _i285;
import 'package:safetrack/src/di/AppModule.dart' as _i1036;
import 'package:safetrack/src/domain/repository/AuthRepository.dart' as _i1022;
import 'package:safetrack/src/domain/useCases/auth/AuthUseCases.dart' as _i699;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appmodule = _$Appmodule();
    gh.factory<_i285.Authservice>(() => appmodule.authService);
    gh.factory<_i1022.Authrepository>(() => appmodule.authRepository);
    gh.factory<_i699.AuthUseCases>(() => appmodule.authUseCaases);
    return this;
  }
}

class _$Appmodule extends _i1036.Appmodule {}
