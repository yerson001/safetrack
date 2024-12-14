import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:safetrack/src/data/dataSource/remote/service/AuthService.dart';
import 'package:safetrack/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:safetrack/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();

  //Authservice authservice = Authservice();

  AuthUseCases authUseCases;

  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formkey: formKey));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlockFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? 'Ingrese el Email' : null),
          formkey: formKey));
    });

    on<PasswordChange>((event, emit) {
      emit(state.copyWith(
          password: BlockFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? 'Ingresa el Password'
                  : event.password.value.length < 6
                      ? 'Minimo 6 caracteres'
                      : null),
          formkey: formKey));
    });
    on<FormSubmit>((event, emit) async {
      print('Email: ${state.email.value}');
      print('Password: ${state.password.value}');

      emit(state.copyWith(response: Loading(), formkey: formKey));
      //await Future.delayed(Duration(seconds: 3));
      Resource response =
          await authUseCases.login.run(state.email.value, state.password.value);
      emit(state.copyWith(response: response, formkey: formKey));
    });
  }
}
