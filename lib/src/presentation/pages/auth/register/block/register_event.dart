import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';

abstract class RegisterEvent {}

class RegisterInitEvent extends RegisterEvent {}

class NameChangedTextFiend extends RegisterInitEvent {
  final BlockFormItem name;
  NameChangedTextFiend({required this.name});
}

class LastNameChangedTextFiend extends RegisterInitEvent {
  final BlockFormItem lastName;
  LastNameChangedTextFiend({required this.lastName});
}

class EmailChangedTextFiend extends RegisterInitEvent {
  final BlockFormItem email;
  EmailChangedTextFiend({required this.email});
}

class PhoneChangedTextFiend extends RegisterInitEvent {
  final BlockFormItem phone;
  PhoneChangedTextFiend({required this.phone});
}

class PasswordChangedTextFiend extends RegisterInitEvent {
  final BlockFormItem password;
  PasswordChangedTextFiend({required this.password});
}

class ConfirmPasswordChangedTextFiend extends RegisterInitEvent {
  final BlockFormItem confirmPassword;
  ConfirmPasswordChangedTextFiend({required this.confirmPassword});
}

class SaveUserSession extends RegisterInitEvent{
  final AuthResponse authResponse;
  SaveUserSession({required this.authResponse});
}

class FormSubmit extends RegisterInitEvent {}

class FormReset extends RegisterInitEvent {}
