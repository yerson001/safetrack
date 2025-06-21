import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:safetrack/src/domain/models/User.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';

class ProfileUpdateState extends Equatable {
  final int id;
  final BlockFormItem name;
  final BlockFormItem lastName;
  final BlockFormItem phone;
  final Resource? response;
  final File? image;
  final GlobalKey<FormState>? formKey;

  const ProfileUpdateState(
      {this.id = 0,
      this.name = const BlockFormItem(error: 'Ingrese el Nombre'),
      this.lastName = const BlockFormItem(error: 'Ingrese el Apellido'),
      this.phone = const BlockFormItem(error: 'Ingrese su Teléfono'),
      this.response,
      this.image,
      this.formKey});

  ProfileUpdateState copyWith({
    int? id,
    BlockFormItem? name,
    BlockFormItem? lastName,
    BlockFormItem? phone,
    Resource? response,
    File? image,
    GlobalKey<FormState>? formKey,
    res,
  }) {
    return ProfileUpdateState(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        image: image??this.image,
        formKey: formKey,
        response: response);
  }

  toUser() =>
      User(name: name.value, lastname: lastName.value, phone: phone.value);

  @override
  List<Object?> get props => [id, name, lastName, phone, response,image];
}
