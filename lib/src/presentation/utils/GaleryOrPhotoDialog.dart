import 'package:flutter/material.dart';

Future<void> GaleryOrphotoDialog(
    BuildContext context, Function() pickImage, Function() takePhoto) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Bordes menos redondeados
        ),
        title: Text(
          "Selecciona una opción",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildGradientButton(
              label: 'Galería',
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffb51837),
                  Color(0xff661c3a),
                  Color(0xff301939),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
                pickImage();
              },
            ),
            _buildGradientButton(
              label: 'Cámara',
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffb51837),
                  Color(0xff661c3a),
                  Color(0xff301939),
                ],
              ),
              onPressed: () {
                Navigator.pop(context);
                takePhoto();
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildGradientButton({
  required String label,
  required LinearGradient gradient,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(8), // Bordes menos redondeados
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
