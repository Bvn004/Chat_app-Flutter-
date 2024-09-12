import 'package:chatapp/pages.dart/loginpage.dart';
import 'package:chatapp/pages.dart/register.dart';
import 'package:flutter/material.dart';



class Togglepage extends StatefulWidget {
  const Togglepage({super.key});

  @override
  State<Togglepage> createState() => _TogglepageState();
}

class _TogglepageState extends State<Togglepage> {
  bool togpage = true;
  void showpage() {
    setState(() {
      togpage = !togpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (togpage) {
      return Loginpage(
        onTap: showpage,
      );
    } else {
      return Registerpage(
        onTap: showpage,
      );
    }
  }
}
