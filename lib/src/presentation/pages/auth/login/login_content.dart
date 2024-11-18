import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_event.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:safetrack/src/presentation/utils/block_formitem.dart';
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
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: const [
                    Color.fromARGB(255, 12, 38, 145),
                    Color.fromARGB(255, 34, 156, 249)
                  ]),
            ),
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _loginTextRotate(),
                SizedBox(
                  height: 50,
                ),
                _textRegisterRotate(context),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(left: 60, bottom: 60),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const [
                      Color.fromARGB(255, 14, 29, 166),
                      Color.fromARGB(255, 30, 112, 227)
                    ]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(35))),
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    _textTitle('Welcome'),
                    _textTitle('back ...'),
                    _setImage(),
                    _textLogin(),
                    DefaultTexfield(
                      onChanged: (text) {
                        context.read<LoginBloc>().add(
                            EmailChanged(email: BlockFormItem(value: text)));
                      },
                      validator: (value) {
                        return state?.email.error;
                      },
                      text: 'Email',
                      icon: Icons.lock_outline,
                    ),
                    DefaultTexfield(
                        onChanged: (text) {
                          context.read<LoginBloc>().add(PasswordChange(
                              password: BlockFormItem(value: text)));
                        },
                        validator: (value) {
                          return state?.password.error;
                        },
                        text: 'Password',
                        icon: Icons.key_outlined,
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    DefaultButton(
                      text: "Iniciar Sesión",
                      onPressed: () {
                        final formKey = state?.formkey;

                        if (formKey != null &&
                            formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(FormSubmit());
                        } else {
                          print("El formulario no es válido");
                        }
                      },
                      textColor: Colors.black,
                    ),
                    _separatorOR(),
                    _separatorText(context),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
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
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _setImage() {
    return Container(
      alignment: Alignment.centerRight,
      child: Image.asset(
        'assets/img/car.png',
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _textLogin() {
    return Text(
      "Log in",
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _separatorOR() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          "O",
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          width: 20,
          height: 1,
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
            color: Colors.grey[100],
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
            "registrate",
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _loginTextRotate() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        "Login",
        style: TextStyle(
            color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
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
          "Registro",
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
    );
  }
}
