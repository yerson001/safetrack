import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/login/bloc/login_state.dart';
import 'package:safetrack/src/presentation/pages/auth/login/login_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Fondo del login
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              final response = state.response;
              if (response is ErrorData) {
                Fluttertoast.showToast(
                    msg: '${response.message}',
                    toastLength: Toast.LENGTH_SHORT);
              } else if (response is Success) {
                Fluttertoast.showToast(
                    msg: 'Exitoso', toastLength: Toast.LENGTH_SHORT);
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                final response = state.response;
                if (response is Loading) {
                  return Stack(
                    children: [
                      LoginContent(state),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
                return LoginContent(state);
              },
            ),
          ),
          // Flecha en la parte superior
          Positioned(
            top: 40, // Distancia desde la parte superior
            left: 10, // Distancia desde el borde izquierdo
            child: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Colors.white), // Flecha blanca
              onPressed: () {
                Navigator.pop(context); // Volver a la página anterior
              },
            ),
          ),
        ],
      ),
    );
  }
}
