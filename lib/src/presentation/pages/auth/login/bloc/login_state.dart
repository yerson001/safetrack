import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';

class LoginState extends Equatable {
  final BlockFormItem email;
  final BlockFormItem password;
  final GlobalKey<FormState>? formkey;
  final Resource? response;

  const LoginState(
      {this.email = const BlockFormItem(error: 'Ingresa el Email'),
      this.password = const BlockFormItem(error: 'Ingresa el password'),
      this.formkey,
      this.response});

  LoginState copyWith({
    BlockFormItem? email,
    BlockFormItem? password,
    Resource? response,
    GlobalKey<FormState>? formkey,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        response: response,
        formkey: formkey);
  }

  @override
  List<Object?> get props => [email, password, response];
}
