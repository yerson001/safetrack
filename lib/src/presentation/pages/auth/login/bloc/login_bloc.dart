import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/src/domain/models/AuthResponse.dart';
//import 'package:safetrack/src/data/dataSource/remote/service/AuthService.dart';
import 'package:safetrack/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();

  //Authservice authservice = Authservice();

  AuthUseCases authUseCases;

  LoginBloc(this.authUseCases) : super(LoginState()) {
    
    on<LoginInitEvent>((event, emit) async{
       AuthResponse? authResponse = await authUseCases.getUserSession.run();
       print('GET USER DATA ${authResponse?.toJson()}');
      emit(state.copyWith(formkey: formKey));
     if(authResponse!=null){
        emit(
          state.copyWith(
            response: Success(authResponse),
            formkey: formKey
          )
        );
     }
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlockFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? ' Ingrese el Email' : null),
          formkey: formKey));
    });

    on<PasswordChange>((event, emit) {
      emit(state.copyWith(
          password: BlockFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? ' Ingresa el Password'
                  : event.password.value.length < 6
                      ? ' Mínimo 6 Caracteres'
                      : null),
          formkey: formKey));
    });


    on<SaveUserSession>((event, emit) async{
      await authUseCases.saveUserSession.run(event.authResponse);
    });

    on<FormSubmit>((event, emit) async {
      print('DATA Email: ${state.email.value}');
      print('DATA Password: ${state.password.value}');

      emit(state.copyWith(response: Loading(), formkey: formKey));
      Resource response =
          await authUseCases.login.run(state.email.value, state.password.value);
      emit(state.copyWith(response: response, formkey: formKey));
      
    });
  }
}
