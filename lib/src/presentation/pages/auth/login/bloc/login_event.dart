import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';

abstract class LoginEvent {}

class LoginInitEvent extends LoginEvent {}

class EmailChanged extends LoginEvent {
  final BlockFormItem email;
  EmailChanged({required this.email});
}

class PasswordChange extends LoginEvent {
  final BlockFormItem password;
  PasswordChange({required this.password});
}

class SaveUserSession extends LoginEvent{
  final AuthResponse authResponse;
  SaveUserSession({required this.authResponse});
}

class FormSubmit extends LoginEvent {}
