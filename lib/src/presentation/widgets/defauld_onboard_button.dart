import 'package:flutter/material.dart';

class DefauldOnboardButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  final Color textColor;
  final EdgeInsetsGeometry margin;

  final double cBorder;
  DefauldOnboardButton(
      {required this.text,
      required this.color,
      required this.textColor,
      required this.onPressed,
      this.cBorder = 1,
      this.margin = const EdgeInsets.only(top: 20, left: 20, right: 20)});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: margin,
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
              side: cBorder > 0
                  ? BorderSide(color: Colors.white, width: cBorder)
                  : BorderSide.none,
              minimumSize: Size(200, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: color),
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ));
  }
}
