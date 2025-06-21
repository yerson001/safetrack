import 'dart:io';

import 'package:safetrack/src/data/dataSource/remote/service/UsersService.dart';
import 'package:safetrack/src/domain/models/User.dart';
import 'package:safetrack/src/domain/repository/UsersRepository.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';

class UsersRepositoryImp implements UsersRepository {
  UsersService usersService;
  UsersRepositoryImp(this.usersService);

  @override
  Future<Resource<User>> update(int id, User user, File? file) {
    if (file == null) {
      return usersService.update(id, user);
    } else {
      return usersService.updateImage(id, user, file);
    }
  }
}
