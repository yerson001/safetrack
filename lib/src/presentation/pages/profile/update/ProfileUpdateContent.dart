import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/bloc_providers.dart';
import 'package:safetrack/src/domain/models/User.dart';
import 'package:safetrack/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:safetrack/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:safetrack/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:safetrack/src/presentation/utils/GaleryOrPhotoDialog.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';
import 'package:safetrack/src/presentation/widgets/DefaultIconBack.dart';
import 'package:safetrack/src/presentation/widgets/DefaultTexfield.dart';

class ProfileUpdateContent extends StatelessWidget {
  User? user;
  ProfileUpdateState state;

  ProfileUpdateContent(this.state, this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Column(
            children: [
              _headerProfile(context),
              Spacer(),
              _actionProfile(context, "ACTUALIZAR USUARIO", Icons.check),
              SizedBox(height: 40),
            ],
          ),
          _cardUserInfo(context),
          Defaulticonback(
            margin: EdgeInsets.only(top: 60, left: 30),
          )
        ],
      ),
    );
  }

  Widget _actionProfile(BuildContext context, String opcion, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (state.formKey!.currentState != null) {
          if (state.formKey!.currentState!.validate()) {
            context.read<ProfileUpdateBloc>().add(FormSutmit());
          }
        } else {
          context.read<ProfileUpdateBloc>().add(FormSutmit());
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListTile(
          title: Text(
            opcion,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: const [
                        Color(0xffb51837),
                        Color(0xff661c3a),
                        Color(0xff301939),
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Icon(
                icon,
                color: Colors.white,
              )),
        ),
      ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GaleryOrphotoDialog(
            context,
            () => {context.read<ProfileUpdateBloc>().add(PickImage())},
            () => {context.read<ProfileUpdateBloc>().add(TakePhoto())});
      },
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        width: 100,
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipOval(
            child: state.image != null
                ? Image.file(state.image!, fit: BoxFit.cover)
                : FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    //image:'https://res.cloudinary.com/du1fmj8le/image/upload/v1732832398/dbgzrshrmofjjtyalkay.jpg',
                    image: user!.image!,
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _cardUserInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 150),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            _imageUser(context),
            DefaultTexfield(
              text: 'Nombre',
              InitialValue: user?.name,
              isPassword: false,
              icon: Icons.person,
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              background: Colors.grey[200]!,
              onChanged: (text) {
                context
                    .read<ProfileUpdateBloc>()
                    .add(NameChanged(name: BlockFormItem(value: text)));
              },
              validator: (value) {
                return state.name.error;
              },
            ),
            DefaultTexfield(
              text: 'Apellido',
              InitialValue: user?.lastname,
              isPassword: false,
              icon: Icons.person_outline,
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              background: Colors.grey[200]!,
              onChanged: (text) {
                context
                    .read<ProfileUpdateBloc>()
                    .add(LastNameChanged(lastName: BlockFormItem(value: text)));
              },
              validator: (value) {
                return state.lastName.error;
              },
            ),
            DefaultTexfield(
              onChanged: (text) {
                context
                    .read<ProfileUpdateBloc>()
                    .add(PhoneChanged(phone: BlockFormItem(value: text)));
              },
              validator: (value) {
                return state.phone.error;
              },
              text: 'Teléfono',
              InitialValue: user?.phone,
              isPassword: false,
              icon: Icons.phone,
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              background: Colors.grey[200]!,
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerProfile(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 70),
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [
            Color(0xffb51837),
            Color(0xff661c3a),
            Color(0xff301939),
          ])),
      child: Text(
        "ACTUALIZAR PERFIL",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
