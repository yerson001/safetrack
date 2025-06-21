import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_event.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_state.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';
import 'package:safetrack/src/presentation/widgets/DefaultOnboardButton.dart';
import 'package:safetrack/src/presentation/widgets/DefaultTexfieldOutlined.dart';

class RegisterContent extends StatelessWidget {
  RegisterState state;

  RegisterContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formkey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
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
                        margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(NameChangedTextFiend(
                              name: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.name.error;
                        },
                      ),
                      DefaultTexfieldOutlined(
                        text: 'Apellido',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              LastNameChangedTextFiend(
                                  lastName: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.lastName.error;
                        },
                      ),
                      DefaultTexfieldOutlined(
                        text: 'Email',
                        icon: Icons.email_outlined,
                        margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              EmailChangedTextFiend(
                                  email: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.email.error;
                        },
                      ),
                      DefaultTexfieldOutlined(
                        text: 'Telefono',
                        icon: Icons.phone_outlined,
                        margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              PhoneChangedTextFiend(
                                  phone: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.phone.error;
                        },
                      ),
                      DefaultTexfieldOutlined(
                        text: 'Contraseña',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              PasswordChangedTextFiend(
                                  password: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.password.error;
                        },
                      ),
                      DefaultTexfieldOutlined(
                        text: 'Confirma Contraseña',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              ConfirmPasswordChangedTextFiend(
                                  confirmPassword: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.confirmPassword.error;
                        },
                      ),
                      DefauldOnboardButton(
                        text: "CREAR USUARIO",
                        color: Color(0xffb51837),
                        onPressed: () {
                          print("Valores actuales:");
                          print(
                              "Nombre: ${state.name.value}, Error: ${state.name.error}");
                          print(
                              "Apellido: ${state.lastName.value}, Error: ${state.lastName.error}");

                          if (state.formkey!.currentState!.validate()) {
                            context.read<RegisterBloc>().add(FormSubmit());
                            context.read<RegisterBloc>().add(FormReset());
                          } else {
                            print("Formulario no válido");
                          }
                        },
                        textColor: const Color.fromARGB(255, 243, 241, 241),
                        margin: EdgeInsets.only(top: 60, left: 30, right: 30),
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
      margin: EdgeInsets.only(bottom: 35),
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
          style: TextStyle(color: const Color.fromARGB(255, 41, 167, 240)),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Inicia Sesion',
            style: TextStyle(
                color: const Color.fromARGB(255, 234, 233, 233),
                fontWeight: FontWeight.bold),
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
          color: const Color.fromARGB(255, 233, 231, 231),
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          'O',
          style: TextStyle(
              color: const Color.fromARGB(255, 243, 241, 241),
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        Container(
          width: 25,
          height: 1,
          color: const Color.fromARGB(255, 243, 240, 240),
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
        'assets/img/safe.png',
        width: 300,
        height: 150,
      ),
    );
  }

  Widget _textRegisterRotate() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Crear Cuenta',
        style: TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textLoginRotate(context) {
    return RotatedBox(
      quarterTurns: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Text(
          'Registrarse',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
