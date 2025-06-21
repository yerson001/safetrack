import 'package:flutter/material.dart';

class DefaultTexfieldOutlined extends StatelessWidget {
  final String text;
  final IconData icon;
  final EdgeInsetsGeometry margin;
  final Function(String text) onChanged;
  String? Function(String?)? validator;

  DefaultTexfieldOutlined(
      {super.key, required this.text,
      required this.icon,
      required this.onChanged,
      this.margin = const EdgeInsets.only(top: 50, left: 20, right: 20),
      this.validator});

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: margin,
      decoration: BoxDecoration(),
      child: TextFormField(
        onChanged: (text) {
          onChanged(text);
        },
        validator: validator,
        style: TextStyle(fontSize: 12, color: Colors.white),
        decoration: InputDecoration(
            label: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 35, 161, 183), width: 1)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 239, 240, 241), width: 1)),
            labelStyle: TextStyle(fontSize: 12),
            prefixIcon: Container(
              margin: EdgeInsets.only(top: 10),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.white,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
