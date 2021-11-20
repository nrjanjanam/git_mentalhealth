import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mentalhealth/pages/auth/application/auth_controller.dart';
import 'package:git_mentalhealth/pages/chat_page/widgets/messages.dart';
import 'package:git_mentalhealth/pages/chat_page/widgets/new_message.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GIT Mental Health App'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [
          DropdownButton<String>(
            dropdownColor: Theme.of(context).colorScheme.background,
            elevation: 1,
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      width: 10.0,
                    )
                  ],
                ),
              )
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Get.find<AuthController>().isLoading(false);
                                FirebaseAuth.instance.signOut();
                                Get.back();
                              },
                              child: const Text('Yes',
                                  style: TextStyle(color: kRedColor))),
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('No',
                                  style: TextStyle(
                                    color: kGreen,
                                  ))),
                        ],
                      );
                    });
              }
            },
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(child: Messages()),
          NewMessage(),
        ],
      ),
    );
  }
}
