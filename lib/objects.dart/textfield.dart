import 'package:flutter/material.dart';

class Textfieldd extends StatelessWidget {
  Textfieldd(
      {super.key,
      required this.Hinttext,
      required this.obscuretext,
      required this.controllerr});

  String Hinttext;
  bool obscuretext;
  TextEditingController controllerr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.white,
          filled: true,
          hintText: Hinttext,
        ),
        obscureText: obscuretext,
        controller: controllerr,
      ),
    );
  }
}
