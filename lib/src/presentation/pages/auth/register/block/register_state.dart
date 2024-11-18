import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';

class RegisterState extends Equatable {
  final BlockFormItem name;
  final BlockFormItem lastName;
  final BlockFormItem email;
  final BlockFormItem phone;
  final BlockFormItem password;
  final BlockFormItem confirmPassword;
  final GlobalKey<FormState>? formkey;

  const RegisterState({
    this.name = const BlockFormItem(error: 'Ingrese el Nombre'),
    this.lastName = const BlockFormItem(error: 'Ingrese el Apellido'),
    this.email = const BlockFormItem(error: 'Ingrese el Email'),
    this.phone = const BlockFormItem(error: 'Ingrese el Telefono'),
    this.password = const BlockFormItem(error: 'Ingrese el Contraseña'),
    this.confirmPassword = const BlockFormItem(error: 'Confirmar Contraseña'),
    this.formkey,
  });

  RegisterState copyWith({
    BlockFormItem? name,
    BlockFormItem? lastName,
    BlockFormItem? email,
    BlockFormItem? phone,
    BlockFormItem? password,
    BlockFormItem? confirmPassword,
    GlobalKey<FormState>? formkey,
  }) {
    return RegisterState(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        formkey: formkey);
  }

  @override
  List<Object?> get props =>
      [name, lastName, email, phone, password, confirmPassword];
}
