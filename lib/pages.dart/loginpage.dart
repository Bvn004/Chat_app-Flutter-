import 'package:chatapp/auth_user.dart';
import 'package:chatapp/objects.dart/buttons.dart';
import 'package:chatapp/objects.dart/textfield.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key, required this.onTap});

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _paswordcontroller = TextEditingController();
  void Function()? onTap;

  void login(BuildContext context) async {
    final authservice = AuthUser();
    try {
      await authservice.SignInwithEmailPassword(
          _textEditingController.text, _paswordcontroller.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 60,
              ),
              Text(
                'you have been missed!',
              ),
              Textfieldd(
                Hinttext: "Email",
                obscuretext: false,
                controllerr: _textEditingController,
              ),
              Textfieldd(
                Hinttext: "password",
                obscuretext: true,
                controllerr: _paswordcontroller,
              ),
              Button_text(
                onTap: () => login(context),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member?"),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
