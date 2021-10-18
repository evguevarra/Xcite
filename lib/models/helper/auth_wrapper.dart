import 'package:event_app/screens/home/homepage.dart';
import 'package:event_app/screens/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fireBaseUser = context.watch<User?>();

    if (fireBaseUser != null) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
