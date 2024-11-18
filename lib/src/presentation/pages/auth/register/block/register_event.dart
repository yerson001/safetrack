import 'package:safetrack/src/presentation/utils/block_formitem.dart';

abstract class RegisterEvent {}

class RegisterInitEvent extends RegisterEvent {}

class NameChangedTextFiend extends RegisterEvent {
  final BlockFormItem name;
  NameChangedTextFiend({required this.name});
}

class LastNameChangedTextFiend extends RegisterEvent {
  final BlockFormItem lastName;
  LastNameChangedTextFiend({required this.lastName});
}

class EmailChangedTextFiend extends RegisterEvent {
  final BlockFormItem email;
  EmailChangedTextFiend({required this.email});
}

class PhoneChangedTextFiend extends RegisterEvent {
  final BlockFormItem phone;
  PhoneChangedTextFiend({required this.phone});
}

class PasswordChangedTextFiend extends RegisterEvent {
  final BlockFormItem password;
  PasswordChangedTextFiend({required this.password});
}

class ConfirmPasswordChangedTextFiend extends RegisterEvent {
  final BlockFormItem confirmPassword;
  ConfirmPasswordChangedTextFiend({required this.confirmPassword});
}

class FormSubmit extends RegisterEvent {}

class FormReset extends RegisterEvent {}
