import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:git_mentalhealth/pages/auth/presentation/auth_page.dart';
import 'package:git_mentalhealth/pages/home_page/homepage.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          return const MyHomePage();
        }
        {
          return const AuthPage();
        }
      },
    );
  }
}
