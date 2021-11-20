import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mentalhealth/common/style/text.dart';
import 'package:git_mentalhealth/common/widgets/nav_bar.dart';
import 'package:git_mentalhealth/common/widgets/spaces.dart';
import 'package:git_mentalhealth/common/widgets/user_image.dart';
import 'package:git_mentalhealth/pages/chat_page/chat_page_arguments.dart';
import 'package:git_mentalhealth/pages/community_page/utils/community_constants.dart';
import 'package:git_mentalhealth/routes/app_routes.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';

class YourChats extends StatelessWidget {
  const YourChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your Chats",
            style: appTextStyle(
              weight: FONTWEIGHT.medium,
              type: "h4",
              color: kCoral100,
            )),
        kVerticalSpace(height: 10.0),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 10),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRouteConstants.chatPage,
                    arguments: const ChatPageArguments(isCommunity: true));
              },
              child: chatWidget(
                  index: i, isCommunity: false, chatTheme: listeners),
            );
          },
          separatorBuilder: (context, i) {
            return kVerticalSpace(height: 30.0);
          },
          itemCount: 10,
        )
      ],
    );
  }
}

Widget chatWidget(
    {int? index,
    ChatOptionColors? chatTheme,
    bool? isCommunity = true,
    bool isNotification = false}) {
  return Dismissible(
    key: ObjectKey(index), //TODO: Change it to userId
    onDismissed: (dismissedDirection) {
      //TODO: add call functionality using Agora, refer https://github.com/Meherdeep/agora-videocall-demo/blob/master/pubspec.yaml
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: isNotification
              ? lighten(color: chatTheme?.chatThemeColor, amount: 0.55)
              : null,
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          UserImage(
            key: ObjectKey(index),
            isTyping: false,
            chatTheme: chatTheme,
          ),
          kHorizontalSpace(width: 15.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Frank Joseph',
                  style: appTextStyle(
                      color: chatTheme?.chatThemeColor ?? kFriendsAndFam,
                      weight: FONTWEIGHT.bold,
                      type: "B2"),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "Dummy Text data. Will add more data as required, but this sounds fun. Let's keep doing this. What will happen if I increase the tet by this much?? Let's see",
                  softWrap: true,
                  style: appTextStyle(
                      color: Colors.black,
                      weight: FONTWEIGHT.regular,
                      type: "CAPTION"),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          kHorizontalSpace(width: 8.0),
          Column(
            children: [
              Icon(
                chatTheme?.themeIcon,
                color: chatTheme?.chatThemeColor,
              ),
              Badge(
                alignment: Alignment.centerRight,
                animationType: BadgeAnimationType.scale,
                animationDuration: const Duration(milliseconds: 30),
                badgeColor: chatTheme?.chatThemeColor ?? kFriendsAndFam,
                badgeContent: Text(
                  '2',
                  style: appTextStyle(
                      color: Colors.white,
                      weight: FONTWEIGHT.regular,
                      type: "CAPTION"),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
