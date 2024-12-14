import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';
import 'package:safetrack/src/presentation/widgets/defauld_onboard_button.dart';
import 'package:safetrack/src/presentation/widgets/defauld_textfield.dart';
import 'package:safetrack/src/presentation/widgets/defauls_button.dart';

class LoginContent extends StatelessWidget {
  LoginState? state;

  LoginContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state?.formkey,
      child: Stack(
        children: [
          // Imagen de fondo
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color(0xffb51837),
                  Color(0xff661c3a),
                  Color(0xff301939),
                ])),
          ),
          // Gradiente en la parte superior e inferior
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(255, 91, 13, 47),
                    Color.fromARGB(255, 91, 13, 47),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter, // Comienza desde arriba
                  end: Alignment.bottomCenter, // Termina abajo
                  stops: [
                    0.0,
                    0.3,
                    0.7,
                    1.0
                  ], // Controla dónde inicia y termina el gradiente
                ),
              ),
            ),
          ),
          // Contenido del Card con formulario de login
          Center(
            child: Card(
              elevation: 10, // Eleva el Card para destacarlo
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Bordes redondeados
              ),
              color: const Color.fromARGB(73, 255, 255, 255)
                  .withOpacity(0.3), // Fondo semi-transparente para el Card
              margin: EdgeInsets.symmetric(
                  horizontal: 20), // Margen para que no toque los bordes
              child: Container(
                padding: EdgeInsets.all(20), // Espacio dentro del Card
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _setImage(), // Banner
                      _textLogin(), // Texto de login
                      DefaultTexfield(
                        onChanged: (text) {
                          context.read<LoginBloc>().add(
                              EmailChanged(email: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state?.email.error;
                        },
                        text: 'Correo electrónico',
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                      ),
                      DefaultTexfield(
                        onChanged: (text) {
                          context.read<LoginBloc>().add(PasswordChange(
                              password: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state?.password.error;
                        },
                        text: 'Contraseña',
                        isPassword: true,
                        icon: Icons.key_outlined,
                        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                      ),
                      SizedBox(height: 30),
                      DefauldOnboardButton(
                        text: "Iniciar Sesión",
                        color: Color(0xffb51837),
                        onPressed: () {
                          final formKey = state?.formkey;
                          if (formKey != null &&
                              formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(FormSubmit());
                          } else {
                            print("El formulario no es válido");
                          }
                        },
                        textColor: const Color.fromARGB(255, 243, 241, 241),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Separadores fuera del Card y en la parte inferior
          Positioned(
            bottom: 30, // Ajusta la posición vertical
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  _separatorOR(), // Separador OR
                  SizedBox(
                    height: 30,
                  ),
                  _separatorText(context), // Separador de texto
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textTitle(text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _setImage() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/safe.png',
        width: 250,
        height: 100,
      ),
    );
  }

  Widget _textLogin() {
    return Text(
      "Ingrese sus Datos",
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 238, 234, 234)),
    );
  }

  Widget _separatorOR() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 2,
          color: Colors.white,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          "O",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          width: 20,
          height: 2,
          color: Colors.white,
          margin: EdgeInsets.only(left: 5),
        ),
      ],
    );
  }

  Widget _separatorText(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "¿Si no tienes cuenta?",
          style: TextStyle(
            fontSize: 15,
            color: const Color.fromARGB(255, 7, 98, 143),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'register');
          },
          child: Text(
            "Registrate",
            style: TextStyle(
                fontSize: 15,
                color: const Color.fromARGB(255, 235, 240, 240),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _loginTextRotate() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        "Registrarse",
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _textRegisterRotate(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'register');
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          "Crear Cuenta",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
