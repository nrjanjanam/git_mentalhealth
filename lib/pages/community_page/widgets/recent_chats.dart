import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mentalhealth/common/style/text.dart';
import 'package:git_mentalhealth/common/widgets/spaces.dart';
import 'package:git_mentalhealth/common/widgets/user_image.dart';
import 'package:git_mentalhealth/routes/app_routes.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';

class RecentChats extends StatefulWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Recent Chats",
              style: appTextStyle(
                weight: FONTWEIGHT.medium,
                type: "h3",
                color: kCoral100,
              )),
          kVerticalSpace(height: 2.0),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 10),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouteConstants.chatPage);
                  },
                  child: Column(
                    children: [
                      UserImage(
                        isTyping: true,
                        key: ObjectKey(i),
                      ),
                      kVerticalSpace(height: 4.0),
                      Text(
                        'Frank',
                        style: appTextStyle(
                            weight: FONTWEIGHT.medium,
                            color: kCoral100,
                            type: "CAPTION"),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, i) {
                return kHorizontalSpace(width: 25.0);
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
