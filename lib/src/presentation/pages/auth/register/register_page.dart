import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_bloc.dart';
import 'package:safetrack/src/presentation/pages/auth/register/block/register_state.dart';
import 'package:safetrack/src/presentation/pages/auth/register/register_content.dart';

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
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return RegisterContent(state);
            },
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
