import 'package:flutter/material.dart';
import 'package:safetrack/src/presentation/widgets/DefaultOnboardButton.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo con imagen
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/bg1.jpg'), // Ruta de tu imagen
              fit: BoxFit.fill,
            ),
          ),
        ),
        // Gradiente radial sobre el fondo (dejando el centro libre)
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center, // Gradiente centrado
              radius:
                  0.9, // Define el radio del gradiente (ajústalo para que cubra los bordes)
              colors: const [
                Colors.transparent, // Centro sin degradado (transparente)
                Color.fromARGB(
                    255, 91, 13, 47), // Color del borde con el gradiente
              ],
              stops: const [0.0, 1.0], // Define dónde empieza y termina el gradiente
            ),
          ),
        ),
        // Contenido principal (botones y demás)
        Positioned(
          bottom: 30, // Ajusta la distancia desde el fondo
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Alinea todo el contenido a la izquierda
              children: [
                // Espacio entre el texto y el banner
                SizedBox(height: 20),

                // El banner de la imagen
                _imageBanner(),

                // Espacio adicional
                SizedBox(height: 130),

                // Botón de "Iniciar Sesión"
                DefauldOnboardButton(
                  text: "INICIAR SESIÓN",
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                ),

                SizedBox(height: 10),

                // Botón de "Crear Cuenta"
                DefauldOnboardButton(
                  text: "CREAR UNA CUENTA",
                  color: Colors.transparent,
                  textColor: const Color.fromARGB(255, 247, 245, 245),
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  cBorder: 1,
                ),

                SizedBox(height: 20),

                // Separador
                _separator(context),

                SizedBox(height: 20),

                // Botón de "Invitado"
                DefauldOnboardButton(
                  text: "COMPRAR SAFETRACK HOY!",
                  color: const Color.fromARGB(255, 24, 22, 22),
                  textColor: const Color.fromARGB(255, 243, 241, 241),
                  onPressed: () {},
                  cBorder: 0,
                ),
              ],
            ),
          ),
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
        width: 350,
        height: 350,
      ),
    );
  }

  Widget _separator(context) {
    return Row(
      children: const [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'O',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
