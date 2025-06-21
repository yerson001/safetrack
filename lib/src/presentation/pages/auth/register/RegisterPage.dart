import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:safetrack/src/domain/models/AuthResponse.dart';
import 'package:safetrack/src/domain/utils/Resource.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_event.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_state.dart';
import 'package:safetrack/src/presentation/pages/auth/register/RegisterContent.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              final response = state.response;
              if (response is ErrorData) {
                Fluttertoast.showToast(
                    msg: response.message, toastLength: Toast.LENGTH_LONG);
              } else if (response is Success) {
                final authResponse = response.data as AuthResponse;
                context.read<RegisterBloc>().add(FormReset());
                context
                    .read<RegisterBloc>()
                    .add(SaveUserSession(authResponse: authResponse));

                Navigator.pushNamedAndRemoveUntil(
                    context, 'client/home', (route) => false);
              }
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return RegisterContent(state);
              },
            ),
          ),
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
