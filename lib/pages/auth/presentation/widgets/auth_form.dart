import 'package:flutter/material.dart';
import 'package:git_mentalhealth/pages/auth/application/auth_controller.dart';
import 'package:git_mentalhealth/pages/auth/presentation/widgets/user_image_picker.dart';
import 'package:get/get.dart';

class AuthForm extends GetView<AuthController> {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Obx(
                    () => !controller.isLogin.value
                        ? UserImagePicker(
                            imagePickFn: controller.pickedImg,
                          )
                        : Container(),
                  ),
                  //email
                  TextFormField(
                    key: const ValueKey('email'),
                    onSaved: (email) {
                      controller.userEmail = email?.trim();
                    },
                    validator: (email) {
                      email = email?.trim();
                      if ((email != null &&
                              (!(email.isEmail) || (email.isEmpty))) ||
                          email == null) {
                        return 'Kindly enter a valid email address';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                    ),
                  ),
                  //username
                  Obx(
                    () => !controller.isLogin.value
                        ? TextFormField(
                            key: const ValueKey('username'),
                            onSaved: (name) {
                              controller.userName = name;
                            },
                            validator: (username) {
                              if ((username != null &&
                                      (username.length < 4 ||
                                          (username.isEmpty))) ||
                                  username == null) {
                                return 'Kindly enter a valid username of atleast 4 charectars';
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: 'User Name',
                            ),
                          )
                        : Container(),
                  ),
                  //password
                  TextFormField(
                    key: const ValueKey('password'),
                    onSaved: (pwd) {
                      controller.userPassword = pwd;
                    },
                    validator: (pwd) {
                      if ((pwd != null &&
                              ((pwd.length < 7) || (pwd.isEmpty))) ||
                          pwd == null) {
                        return 'Password must be at least 7 charectars long';
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Obx(() => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: controller.trySubmit,
                          child: Text(
                              controller.isLogin.value ? 'Login' : 'Sign Up'),
                        )),
                  Obx(() => controller.isLoading.value
                      ? Container()
                      : TextButton(
                          onPressed: () {
                            FocusManager().primaryFocus?.unfocus();
                            controller.isLogin(!controller.isLogin.value);
                            controller.update();
                          },
                          child: Text(
                            controller.isLogin.value
                                ? 'Create New Account'
                                : 'I already have an account',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
