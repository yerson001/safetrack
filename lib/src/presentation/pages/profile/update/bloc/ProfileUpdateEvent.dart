import 'package:safetrack/src/domain/models/User.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';

abstract class ProfileUpdateEvent {}

class ProfileUpdateInitEvent extends ProfileUpdateEvent {
  final User? user;
  ProfileUpdateInitEvent({required this.user});
}


class NameChanged extends ProfileUpdateEvent{
  final BlockFormItem name;
  NameChanged({ required this.name});
}

class LastNameChanged extends ProfileUpdateEvent{
  final BlockFormItem lastName;
  LastNameChanged({ required this.lastName});
}

class PhoneChanged extends ProfileUpdateEvent{
  final BlockFormItem phone;
  PhoneChanged({ required this.phone});
}

class UpdateUserSession extends ProfileUpdateEvent{
  final User user;
  UpdateUserSession({required this.user});
}

class PickImage extends ProfileUpdateEvent{}

class TakePhoto extends ProfileUpdateEvent{}

class FormSutmit extends ProfileUpdateEvent{}