import 'package:flutter/material.dart';
import 'package:safetrack/src/presentation/pages/auth/onboard/onboard_content.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Contenido de la página de Onboarding
          OnboardContent(),

          // Texto "V1.00023.2" en la parte superior izquierda
          Positioned(
            top: 40, // Distancia desde la parte superior
            left: 240, // Distancia desde la parte izquierda
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.black
                  .withOpacity(0), // Fondo semi-transparente para el texto
              child: Text(
                'V1.00024.2',
                style: TextStyle(
                  color: Colors.white, // Color blanco
                  fontSize: 15, // Tamaño de la fuente
                  fontWeight: FontWeight.normal, // Negrita
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
