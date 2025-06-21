import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final EdgeInsetsGeometry margin;

  const DefaultButton(
      {super.key, required this.text,
      required this.onPressed,
      this.color = const Color(0xffb51837),
      this.textColor = const Color.fromARGB(255, 19, 168, 17),
      this.margin = const EdgeInsets.only(left: 50, right: 50, top: 15)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: margin,
      child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(backgroundColor: color),
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
          )),
    );
  }
}
