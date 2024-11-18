import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final EdgeInsetsGeometry margin;

  const DefaultButton(
      {required this.text,
      required this.onPressed,
      this.color = Colors.white,
      this.textColor = Colors.white,
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
