import 'package:flutter/material.dart';
import 'package:git_mentalhealth/common/widgets/spaces.dart';
import 'package:git_mentalhealth/pages/community_page/widgets/recent_chats.dart';
import 'package:git_mentalhealth/pages/community_page/widgets/app_bar.dart';
import 'package:git_mentalhealth/pages/community_page/widgets/your_chats.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CommunityAppBar(),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              kVerticalSpace(height: 16.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: RecentChats(),
              ),
              kVerticalSpace(height: 16.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: YourChats(),
              ),
            ],
          ),
        )
      ],
      scrollDirection: Axis.vertical,
    );
  }
}
