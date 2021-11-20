import 'package:flutter/material.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

///Enum for Chat options
enum ChatOption { therapist, friendsOrFam, listener, chatbot }

class ChatOptionColors {
  final ChatOption? chatOption;
  final Color? chatThemeColor;
  final IconData? themeIcon;

  const ChatOptionColors(
      {@required this.chatOption,
      @required this.chatThemeColor,
      @required this.themeIcon});
}

///Chat Option Color Themes
///THERAPIST
const ChatOptionColors therapist = ChatOptionColors(
    chatOption: ChatOption.therapist,
    chatThemeColor: kTherapist,
    themeIcon: Icons.local_hospital_rounded);

///FAM OR FRIENDS
const ChatOptionColors friendsAndFam = ChatOptionColors(
    chatOption: ChatOption.friendsOrFam,
    chatThemeColor: kFriendsAndFam,
    themeIcon: MdiIcons.homeHeart);

///LISTENERS
const ChatOptionColors listeners = ChatOptionColors(
    chatOption: ChatOption.listener,
    chatThemeColor: kListener,
    themeIcon: Icons.hearing_rounded);

///CHATBOT
const ChatOptionColors chatbot = ChatOptionColors(
    chatOption: ChatOption.chatbot,
    chatThemeColor: kChatBot,
    themeIcon: MdiIcons.robotHappy);
