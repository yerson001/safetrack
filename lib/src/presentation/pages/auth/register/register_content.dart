import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/main.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_event.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_state.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';
import 'package:safetrack/src/presentation/widgets/defauld_textfield_outlined.dart';
import 'package:safetrack/src/presentation/widgets/defauls_button.dart';

class RegisterContent extends StatelessWidget {
  RegisterState? state;

  RegisterContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state?.formkey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: const [
                    Color.fromARGB(255, 12, 38, 145),
                    Color.fromARGB(255, 34, 156, 249)
                  ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textLoginRotate(context),
                SizedBox(
                  height: 100,
                ),
                _textRegisterRotate(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(35)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 46, 107, 222),
                      Color.fromARGB(255, 27, 48, 134),
                    ])),
            child: Stack(
              children: [
                _imageBackground(context),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      _imageBanner(),
                      DefaultTexfieldOutlined(
                        text: 'Nombres',
                        icon: Icons.person_outline,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(NameChangedTextFiend(
                              name: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state?.name.error;
                        },
                      ),
                      DefaultTexfieldOutlined(
                        text: 'Apellido',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              LastNameChangedTextFiend(
                                  lastName: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state?.lastName.error;
                        },
                      ),
                      DefaultTexfieldOutlined(
                        text: 'Email',
                        icon: Icons.email_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              EmailChangedTextFiend(
                                  email: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state?.email.error;
                        },
                      ),
                      DefaultTexfieldOutlined(
                        text: 'Telefono',
                        icon: Icons.phone_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              PhoneChangedTextFiend(
                                  phone: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state?.phone.error;
                        },
                      ),
                      DefaultTexfieldOutlined(
                        text: 'Contraseña',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              PasswordChangedTextFiend(
                                  password: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state?.password.error;
                        },
                      ),
                      DefaultTexfieldOutlined(
                        text: 'Confirma Contraseña',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              ConfirmPasswordChangedTextFiend(
                                  confirmPassword: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state?.confirmPassword.error;
                        },
                      ),
                      DefaultButton(
                        onPressed: () {
                          final formKey = state?.formkey;
                          if (formKey != null &&
                              formKey.currentState!.validate()) {
                            context.read<RegisterBloc>().add(FormSubmit());
                            context.read<RegisterBloc>().add(FormReset());
                          } else {}
                        },
                        text: 'Crear usuario',
                        color: Colors.white,
                        textColor: Colors.black,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      _separatorOr(),
                      SizedBox(
                        height: 10,
                      ),
                      _textReadyHaveAccount(context)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageBackground(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        'assets/img/destination.png',
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.4,
        opacity: AlwaysStoppedAnimation(0.3),
      ),
    );
  }

  Widget _textReadyHaveAccount(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ya tienes cuenta?',
          style: TextStyle(color: const Color.fromARGB(255, 109, 106, 106)),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'login');
          },
          child: Text(
            'Inicia Sesion',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _separatorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          height: 1,
          color: Colors.black,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          'O',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Container(
          width: 25,
          height: 1,
          color: Colors.black,
          margin: EdgeInsets.only(left: 5),
        ),
      ],
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/delivery.png',
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _textRegisterRotate() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Register',
        style: TextStyle(
            fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textLoginRotate(context) {
    return RotatedBox(
      quarterTurns: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'login');
        },
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
