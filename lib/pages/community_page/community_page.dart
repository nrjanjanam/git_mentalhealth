import 'package:flutter/material.dart';
import 'package:git_mentalhealth/common/widgets/spaces.dart';
import 'package:git_mentalhealth/pages/community_page/widgets/events_and_festivals.dart';
import 'package:git_mentalhealth/pages/community_page/widgets/recent_chats.dart';
import 'package:git_mentalhealth/pages/community_page/widgets/search.dart';
import 'package:git_mentalhealth/pages/community_page/widgets/your_chats.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kVerticalSpace(height: 16.0),
          const SearchField(),
          kVerticalSpace(height: 16.0),
          const RecentChats(),
          kVerticalSpace(height: 16.0),
          const YourChats(),
          kVerticalSpace(height: 16.0),
          const EventsAndFestivals(),
        ],
      ),
    );
  }
}
