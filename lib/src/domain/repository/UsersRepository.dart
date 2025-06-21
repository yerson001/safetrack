import 'dart:io';

import 'package:safetrack/src/domain/models/User.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';

abstract class UsersRepository {
  Future<Resource<User>> update(int id,User user, File? file);
  
}