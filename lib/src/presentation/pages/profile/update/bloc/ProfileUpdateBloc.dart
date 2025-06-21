import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:safetrack/src/domain/useCases/users/UsersUseCases.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';
import 'package:safetrack/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:safetrack/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  final formKey = GlobalKey<FormState>();
  UsersUseCases usersUseCases;
  AuthUseCases authUseCases;

  ProfileUpdateBloc(this.usersUseCases, this.authUseCases)
      : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>((event, emit) {
      emit(state.copyWith(
          id: event.user?.id,
          name: BlockFormItem(value: event.user?.name ?? ''),
          lastName: BlockFormItem(value: event.user?.lastname ?? ''),
          phone: BlockFormItem(value: event.user?.phone ?? ''),
          formKey: formKey));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(
          name: BlockFormItem(
              value: event.name.value,
              error: event.name.value.isEmpty ? 'Ingrese el Nombre' : null),
          formKey: formKey));
    });

    on<LastNameChanged>((event, emit) {
      emit(state.copyWith(
          lastName: BlockFormItem(
              value: event.lastName.value,
              error:
                  event.lastName.value.isEmpty ? 'Ingrese el Apellido' : null),
          formKey: formKey));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(
          phone: BlockFormItem(
              value: event.phone.value,
              error: event.phone.value.isEmpty ? 'Ingrese el Teléfono' : null),
          formKey: formKey));
    });

    on<PickImage>((event, emit) async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        emit(state.copyWith(image: File(image.path), formKey: formKey));
      }
    });

    on<TakePhoto>((event, emit) async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        emit(state.copyWith(image: File(image.path), formKey: formKey));
      }
    });

    on<UpdateUserSession>((event, emit) async {
      AuthResponse authResponse = await authUseCases.getUserSession.run();
      authResponse.user.name = event.user.name;
      authResponse.user.lastname = event.user.lastname;
      authResponse.user.phone = event.user.phone;
      authResponse.user.image = event.user.image;
      await authUseCases.saveUserSession.run(authResponse);
    });

    on<FormSutmit>((event, emit) async {
      print('Name ${state.name.value}');
      print('LastName ${state.lastName.value}');
      print('Phone ${state.phone.value}');

      emit(state.copyWith(response: Loading(), formKey: formKey));
      Resource response =
          await usersUseCases.update.run(state.id, state.toUser(), state.image);
      emit(state.copyWith(response: response, formKey: formKey));
    });
  }
}
