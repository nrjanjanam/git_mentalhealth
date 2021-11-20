import 'package:get/get.dart';
import 'package:git_mentalhealth/pages/chat_page/chat_page.dart';
import 'package:git_mentalhealth/pages/home_page/homepage.dart';
import 'package:git_mentalhealth/pages/launch_page/launch_page.dart';
import 'package:git_mentalhealth/pages/spash/application/splash_binding.dart';
import 'package:git_mentalhealth/pages/spash/presentation/spash_page.dart';

part 'app_route_constants.dart';

class AppPages {
  static final List<GetPage> allRoutes = [
    GetPage(
      name: AppRouteConstants.splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRouteConstants.homePage,
      page: () => const MyHomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRouteConstants.launchPage,
      page: () => const LaunchPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRouteConstants.chatPage,
      page: () => const ChatPage(),
      transition: Transition.fadeIn,
    )
  ];
}
