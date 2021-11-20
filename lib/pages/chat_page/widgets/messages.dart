import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:git_mentalhealth/pages/chat_page/widgets/message_buble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ));
        } else if (chatSnapshot.hasData) {
          final List<QueryDocumentSnapshot<Map<String, dynamic>>>? messages =
              chatSnapshot.data?.docs;
          try {
            return ListView.builder(
              reverse: true,
              itemBuilder: (ctx, i) => MessageBubble(
                messageUserName: messages![i].data()['userName'],
                messageUserImage: messages[i].data()['userImage'],
                message: messages[i].data()['text'],
                isCurrentUser: messages[i].data()['userId'] ==
                    FirebaseAuth.instance.currentUser!.uid,
                key: ValueKey(messages[i].id),
              ),
              itemCount: messages?.length,
            );
          } catch (e) {
            return Text(e.toString());
          }
        } else {
          return Text(chatSnapshot.error.toString());
        }
      },
    );
  }
}
