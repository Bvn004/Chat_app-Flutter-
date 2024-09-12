//checks if user is logged in or not and transports you to a new page like home page
import 'package:chatapp/pages.dart/Homepage.dart';
import 'package:chatapp/pages.dart/login_or_register.dart';
import 'package:chatapp/pages.dart/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Homepage();
            } else {
              return Togglepage();
            }
          }),
    );
  }
}
