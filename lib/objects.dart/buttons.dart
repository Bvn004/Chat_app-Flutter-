import 'package:flutter/material.dart';

class Button_text extends StatelessWidget {
  void Function()? onTap;
  Button_text({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 94, 94, 94),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        
        )),
      
        
      ),
    );
  }
}
