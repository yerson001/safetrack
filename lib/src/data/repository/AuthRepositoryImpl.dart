import 'package:safetrack/src/data/dataSource/local/SharePref.dart';
import 'package:safetrack/src/data/dataSource/remote/service/AuthService.dart';
import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/domain/models/User.dart';
import 'package:safetrack/src/domain/repository/AuthRepository.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  Authservice authService;
  SharePref sharePref;

  AuthRepositoryImpl(this.authService, this.sharePref);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authService.register(user);
  }

  
  @override
  Future<AuthResponse?> getUserSesion() async {
    final data = await sharePref.read('user');
    if(data!=null){
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharePref.save('user', authResponse.toJson());
  }
  
  @override
  Future<bool> logout() async{
    return await sharePref.remove('user');
  }
}
