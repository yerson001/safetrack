import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_event.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_state.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final formkey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterState()) {
    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith(formkey: formkey));
    });

    on<NameChangedTextFiend>((event, emit) {
      emit(state.copyWith(
          name: BlockFormItem(
              value: event.name.value,
              error: event.name.value.isEmpty ? 'Ingrese Nombre' : null),
          formkey: formkey));
    });

    on<LastNameChangedTextFiend>((event, emit) {
      emit(state.copyWith(
          name: BlockFormItem(
              value: event.lastName.value,
              error: event.lastName.value.isEmpty ? 'Ingrese Apellido' : null),
          formkey: formkey));
    });

    on<EmailChangedTextFiend>((event, emit) {
      emit(state.copyWith(
          name: BlockFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? 'Ingrese Email' : null),
          formkey: formkey));
    });

    on<PhoneChangedTextFiend>((event, emit) {
      emit(state.copyWith(
          name: BlockFormItem(
              value: event.phone.value,
              error: event.phone.value.isEmpty ? 'Ingrese Telefono' : null),
          formkey: formkey));
    });

    on<PasswordChangedTextFiend>((event, emit) {
      emit(state.copyWith(
          name: BlockFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? 'Ingrese Contraseña'
                  : event.password.value.length < 6
                      ? 'Mas de 6 caracteres'
                      : null),
          formkey: formkey));
    });

    on<ConfirmPasswordChangedTextFiend>((event, emit) {
      emit(state.copyWith(
          name: BlockFormItem(
              value: event.confirmPassword.value,
              error: event.confirmPassword.value.isEmpty
                  ? 'Ingrese Contraseña'
                  : event.confirmPassword.value.length < 6
                      ? 'Mas de 6 caracteres'
                      : event.confirmPassword.value != state.password.value
                          ? 'Las campos no coinciden'
                          : null),
          formkey: formkey));
    });

    on<FormSubmit>((event, emit) {
      print('name: ${state.name}');
      print('lastname: ${state.lastName}');
      print('email: ${state.email}');
      print('phone: ${state.phone}');
      print('password: ${state.password}');
      print('confirmpassword: ${state.confirmPassword}');
    });

    on<FormReset>((event, emit) {
      state.formkey?.currentState?.reset();
    });
  }
}
