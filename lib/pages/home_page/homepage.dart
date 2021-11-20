import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mentalhealth/common/notification/notification.dart';
import 'package:git_mentalhealth/common/style/text.dart';
import 'package:git_mentalhealth/common/widgets/nav_bar.dart';
import 'package:git_mentalhealth/pages/auth/application/auth_controller.dart';
import 'package:git_mentalhealth/pages/community_page/community_page.dart';
import 'package:git_mentalhealth/utils/color_constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final FirebaseMessaging fbm = FirebaseMessaging.instance;
  final PageController _pageController =
      PageController(initialPage: 1, keepPage: true);
  int _selectedPageIndex = 1;

  void _onNavBarChanged(newSelectedIndex) {
    setState(() {
      _selectedPageIndex = newSelectedIndex;
    });

    _pageController.jumpToPage(newSelectedIndex);
  }

  Future<void> permissionCheck() async {
    fbm.requestPermission().then((notificationSettings) {
      if (notificationSettings.authorizationStatus !=
          AuthorizationStatus.authorized) {
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(8.0),
              content: const Text('Permission not granted'),
              backgroundColor: Theme.of(context).errorColor,
            ),
          );
        });
      }
    });
    AwesomeNotifications().isNotificationAllowed().then(
          (isAllowed) => {
            if (!isAllowed)
              {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      "Allow notifications",
                    ),
                    content: const Text(
                      "Our app would like to send you notifications",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Don't allow",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          AwesomeNotifications()
                              .requestPermissionToSendNotifications()
                              .then((isAccepted) {
                            if (isAccepted) {
                              Navigator.of(context).pop();
                            } else {}
                          });
                        },
                        child: const Text(
                          "Allow",
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              }
          },
        );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    //check for firebase as well as awesome notification settings
    permissionCheck();

    createScheduledNotification();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        await createMarketingNotification(
          context: context,
          message: message.notification?.body,
          title: message.notification?.title,
        );
      }
    });

    //runs when Firebase notification is tapped when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        debugPrint(
            'A new onMessageOpenedApp event was published! ${message.notification?.title} ${message.notification?.body}');
      },
      onDone: () {},
    );

    AwesomeNotifications().actionStream.listen((recievedAction) {
      if (recievedAction.channelKey == 'high_importance_channel') {
        if (Platform.isIOS) {
          AwesomeNotifications().getGlobalBadgeCounter().then((badgeCount) =>
              AwesomeNotifications().setGlobalBadgeCounter(badgeCount - 1));
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(8.0),
            content: Text(
                "Action taken on Notification from ${recievedAction.channelKey ?? ""} channel"),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
    });

    AwesomeNotifications().createdStream.listen((recievedNotif) {
      if (recievedNotif.channelKey == 'high_importance_channel') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(8.0),
            content:
                Text('Chat Notification sent on ${recievedNotif.createdDate}'),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(8.0),
            content: Text(
                'Marketing Notification sent on ${recievedNotif.createdDate}'),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
    AwesomeNotifications().dismissedSink.close();
    AwesomeNotifications().displayedSink.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        permissionCheck();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            reverse: true,
            children: [
              ListTile(
                title: Text(
                  'Logout',
                  style: appTextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onTap: () {
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
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('GIT Mental Health App'),
        centerTitle: true,
        elevation: _selectedPageIndex == 1 ? 0.0 : null,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'HomePage placeholder',
                ),
              ],
            ),
          ),
          const CommunityPage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'SOS placeholder',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
          height: 95,
          child: BottomNavBar.iconData(
            indicatorSides: 5,
            activeIndex: 1,
            onTap: _onNavBarChanged,
            animationCurve: Curves.easeOut,
            animationType: AnimationType.roll,
            baseAnimationSpeed: 200,
            navBarDecoration: const BoxDecoration(
                color: kBackgroundColor,
                shape: BoxShape.rectangle,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(15.0))),
            iconData: const <IconData>[
              Icons.home,
              Icons.chat_rounded,
              Icons.help_outline_sharp,
            ],
            indicatorColors: <Color>[
              Theme.of(context).colorScheme.secondary,
              darken(Theme.of(context).colorScheme.secondary, 0.2),
              darken(Theme.of(context).colorScheme.secondary, 0.3),
            ],
          )),
    );
  }

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}
