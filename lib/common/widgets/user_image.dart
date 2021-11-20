import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:git_mentalhealth/pages/community_page/utils/community_constants.dart';
import 'package:git_mentalhealth/pages/community_page/widgets/jumping_dots.dart';

class UserImage extends StatelessWidget {
  final bool isTyping;
  final ChatOptionColors? chatTheme;
  const UserImage(
      {Key? key, this.isTyping = false, this.chatTheme = friendsAndFam})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 31,
          // backgroundImage: NetworkImage(messageUserImage!),
          backgroundColor: chatTheme?.chatThemeColor,
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://image.shutterstock.com/image-vector/avatar-man-icon-profile-placeholder-260nw-1229859850.jpg"),
          ),
        ),
        if (isTyping)
          BadgePositioned(
            position: BadgePosition.bottomEnd(),
            child: Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: JumpingDots(
                key: key,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightGreen,
              ),
            ),
          ),
      ],
    );
  }
}
