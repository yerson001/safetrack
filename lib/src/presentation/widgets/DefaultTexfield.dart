import 'package:flutter/material.dart';

class DefaultTexfield extends StatelessWidget {
  final String text;
  String? InitialValue; 
  final Function(String text) onChanged;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  String? Function(String?)? validator;
  final bool isPassword;
  Color background;

  DefaultTexfield(
      {super.key, required this.text,
      required this.icon,
      required this.onChanged,
      this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20),
      this.validator,
      this.isPassword = false,
      this.background=Colors.white,
      this.InitialValue
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: margin,
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
      child: TextFormField(
        onChanged: (text) {
          onChanged(text);
        },
        initialValue: InitialValue,
        validator: validator,
        obscureText: isPassword,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
            border: InputBorder.none,
            label: Text(text),
            labelStyle: TextStyle(fontSize: 12),
            prefixIcon: Container(
              margin: EdgeInsets.only(top: 10),
              child: Wrap(alignment: WrapAlignment.spaceEvenly, children: [
                Icon(icon),
                Container(
                  height: 20,
                  width: 1,
                  color: Colors.grey,
                )
              ]),
            )),
      ),
    );
  }
}
