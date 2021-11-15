import 'package:flutter/material.dart';
import 'package:git_mentalhealth/pages/auth/application/auth_controller.dart';
import 'package:git_mentalhealth/pages/auth/presentation/widgets/auth_form.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: const AuthForm(),
    );
  }
}
