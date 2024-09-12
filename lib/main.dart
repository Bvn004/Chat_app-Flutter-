import 'package:chatapp/pages.dart/auth_gate.dart';
import 'package:chatapp/pages.dart/login_or_register.dart';
import 'package:chatapp/pages.dart/loginpage.dart';
import 'package:chatapp/pages.dart/register.dart';
import 'package:chatapp/themes/Lighttheme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthGate(),
      theme: lightmode,
      debugShowCheckedModeBanner: false,
    );
  }
}
