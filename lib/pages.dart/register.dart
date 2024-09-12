import 'package:chatapp/auth_user.dart';
import 'package:chatapp/objects.dart/buttons.dart';
import 'package:chatapp/objects.dart/textfield.dart';
import 'package:flutter/material.dart';

class Registerpage extends StatelessWidget {
  Registerpage({super.key, required this.onTap});

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _paswordcontroller = TextEditingController();
  final TextEditingController _confirmpaswordcontroller =
      TextEditingController();
  void Function()? onTap;

  void register(BuildContext context) {
    AuthUser _register = AuthUser();
    if (_paswordcontroller.text == _confirmpaswordcontroller.text) {
      try {
        _register.SignUpwithEmailandpwd(
            _textEditingController.text, _confirmpaswordcontroller.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
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
                'Register Here!',
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
              Textfieldd(
                Hinttext: " confirm password",
                obscuretext: true,
                controllerr: _confirmpaswordcontroller,
              ),
              Button_text(
                onTap: () => register(context),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a member?"),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login now",
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
